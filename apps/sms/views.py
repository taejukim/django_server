from django.http.response import HttpResponse, JsonResponse

from django.views.decorators.csrf import csrf_exempt
from apps.sms.models import Messages
from django.forms.models import model_to_dict
from django.db.models import Q
import urllib
from datetime import timedelta, timezone
import yaml

@csrf_exempt
def messages(request):
    '''
    포워딩된 SMS 메시지를 저장, 조회
    GET Method 조회 시 필요 Parameter
        appKey : Project의 appKey
        signature : 메시지에 포함된 signature
    '''
    if request.method == 'GET':
        get_data = request.GET
        app_key = get_data.get('appKey')
        signature = get_data.get('signature')
        return get_messages(app_key, signature)

    if request.method == 'POST':
        return HttpResponse(put_messages(request))

def get_messages(app_key, signature):
    # 메시지 조회
    try:
        message = Messages.objects.filter(
                Q(app_key = app_key)&\
                Q(signature = signature)
            ).last()    
        resp = model_to_dict(message)
        resp.pop('id')
        timezone_kst = timezone(timedelta(hours=9))
        message.created.astimezone(timezone_kst)
        resp['created'] = message.created.astimezone(timezone_kst).isoformat()
        return JsonResponse(response_formatter(resp))
    except:
        resp = {
            'app_key':app_key,
            'signature':signature,
            'messages':'Can not find received message'
        }
        return JsonResponse(response_formatter(resp, False))

def put_messages(request):
    '''
    메시지 저장
    # n: {msg_type}-{test_name}-{env}
    # k: {appkey}
    # s: {signature}-{receipent_no}
    # signature : mmddHHMMss{randomString(3)}-receipent_no(without 010)
    '''
    request_body = urllib.parse.unquote(request.body)
    raw_msg = request_body.split('-', 1)[1].replace('+', ' ').replace('&', '')
    msg_header = raw_msg.split("\n", 1)[0]
    msg_body = raw_msg.split("\n", 1)[1]
    send_no = request_body.split('-', 1)[0]
    msg = yaml.safe_load(msg_body)
    
    signature = msg.get('s')
    name = msg.get('n').split('-')
    message_type = name[0]
    test_name = name[1]
    env = name[2]
    app_key =msg.get('k')
    receipent_no = signature.split('-')[1]
    if receipent_no[:3] != '010':
        receipent_no = '010' + receipent_no
        
    new_msg = Messages(
        signature = signature,
        app_key = app_key,
        send_no = ''.join(filter(str.isdigit, send_no)),
        receipent_no = receipent_no,
        test_name = test_name,
        message_type = message_type,
        message = raw_msg,
        env=env
        )
    new_msg.save()
    return signature

def response_formatter(resp:dict, status=True):
    header = {
        'resultCode': 0 if status else 1,
        'resultMessage': 'SUCCESS' if status else 'FAIL',
        'isSuccessful': status,
        }
    response = {
        'header':header,   
    }
    response['data'] = resp
    return response
    