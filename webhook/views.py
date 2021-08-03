from django.http.response import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from webhook.models import Hooks
from django.forms.models import model_to_dict
from django.db.models import Q

import json

@csrf_exempt
def hooks(request):
    '''
    웹훅을 저장, 조회
    GET Method 조회 시 필요 Parameter
        appKey : Project의 appKey
        signature : web hook 설정 시 설정한 서명
        productName : 서비스 이름 (SMS, Kakaotalk Bizmessage, ..)
    '''
    if request.method == 'GET':
        get_data = request.GET
        app_key = get_data.get('appKey')
        signature = get_data.get('signature')
        product_name = get_data.get('productName')
        return get_hooks(app_key, signature, product_name)

    if request.method == 'POST':
        return HttpResponse(put_hooks(request))

def get_hooks(app_key, signature, product_name):
    # 웹훅 조회
    try:
        hook = Hooks.objects.filter(
                Q(app_key = app_key)&\
                Q(signature = signature)&\
                Q(product_name = product_name)
            ).last()    
        resp = model_to_dict(hook)
        resp.pop('id')
        hook.delete()
        return JsonResponse(response_formatter(resp))
    except:
        resp = {
            'app_key':app_key,
            'signature':signature,
            'product_name':product_name,
            'messages':'Can not find webhook request.'
        }
        return JsonResponse(response_formatter(resp, False))

def put_hooks(request):
    # 웹훅 저장
    headers = dict(request.headers)
    signature = headers.get('X-Toast-Webhook-Signature')
    if not signature:
        signature = headers.get('X-Nhn-Webhook-Signature')
    body = json.loads(request.body)   
    
    new_hook = Hooks(
        headers = headers,
        signature = signature,
        body = body,
        hooks_id = body.get('hooksId'),
        product_name = body.get('productName'),
        app_key =body.get('appKey'),
        event = body.get('event'),
        web_hook_config_id = body.get('webhookConfigId'),
    )
    new_hook.save()
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
    response['webhookResult'] = resp
    return response
    