import hashlib
from django.http.response import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponseRedirect
from django.urls import reverse
from django.forms.models import model_to_dict
from hmac import HMAC
import requests
import json
from base64 import b64encode
from datetime import datetime, timedelta
from apps.api.models import ServerStatus
from apps.api import references

def hmac_client(request):
    template_name = 'hmac_client.html'
    if request.method == 'POST':
        post_data = request.POST
        url = post_data.get('url')
        secret_key = post_data.get('secret_key')
        algorithm_name = post_data.get('algorithm_name')
        time_skew = post_data.get('time_skew')
        method = post_data.get('method')
        headers = post_data.get('headers')
        if headers:
            _headers = json.loads(headers)
        else:
            _headers = ''
        header, path, sign_string = get_headers(method, url, secret_key, _headers, time_skew, algorithm_name)
        r = getattr(requests, method.lower())(url, headers=header)
        resp = r.text
        resp = resp.replace('\\"',"'")
        context = {
            'timestamp':datetime.now().isoformat(),
            'response':resp,
            'url':url,
            'secret_key':secret_key,
            'algorithm_name':algorithm_name,
            'time_skew':time_skew,
            'headers':headers,
            'header':header,
            'method':method,
            'path':path,
            'sign_string':sign_string.replace('\n', '</br>'),
        }
    else:
        context = {
            
        }
    return render(request, template_name, context)
 
def get_credential(secret_key, sign_string, algorithm_name):
    algorithm = getattr(hashlib, algorithm_name.lower())
    hm = HMAC(secret_key.encode(), sign_string.encode(), algorithm)
    return b64encode(hm.digest())

def get_headers(method: str, url: str, secret_key: str, headers: dict, timeskew: int, algorithm_name: str):
    now = (datetime.utcnow()+timedelta(seconds=int(timeskew))).replace(microsecond=0).isoformat() + 'Z'
    method = method.upper()
    splited_url = url.split('/',3)
    path = '/'+ splited_url[-1]
    host = splited_url[2]

    sign_string = f'{method}\n{path}\n{now}'
    for header in headers:
        value = headers.get(header)
        sign_string +=f'\n{header}:{value}'
    signature = get_credential(secret_key, sign_string, algorithm_name).decode('utf-8')
    algorithm_name = algorithm_name.upper()
    if headers:
        headers_key = ','.join(dict(headers).keys())
        auth_header = {
        'Authorization':f'hmac algorithm="Hmac{algorithm_name}", headers="{headers_key}", signature="{signature}"',
        'x-nhn-date':now
        }
        auth_header.update(headers)
        headers = auth_header
    else:
        headers = {
        'Authorization':f'hmac algorithm="Hmac{algorithm_name}", signature="{signature}"',
        'x-nhn-date':now
        }
    return headers, path, sign_string
    

def server_health_adjust(request):
    status = ServerStatus.objects.get(id=1)
    if request.method == 'POST':
        post_data = request.POST
        types = post_data.get('types')
        status_code = post_data.get('status_code')
        delay_time = post_data.get('delay_time')
        status.types = types
        status.delay_time = delay_time
        status.status_code = status_code
        status.save()
        return HttpResponseRedirect(reverse('adjust'))
    
    context = {
        'types':status.types,
        'status_code':status.status_code,
        'delay_time':status.delay_time
        }
    return render(request, "adjust.html", context)

@csrf_exempt
def server_health_api(request):
    status = ServerStatus.objects.get(id=1)
    retv = {
        'header': {
            'resultCode': 0,
            'resultMessage': 'SUCCESS',
            'isSuccessful': True,
        }
    }
    if request.method == 'POST':
        try:
            req_data = json.loads(request.body)
            current_status = model_to_dict(status)
            for key in req_data.keys():
                if key not in current_status.keys():
                    retv['header'] = {
                    'resultCode':4, 
                    'resultMessage':'Field is invalid', 
                    'isSucessful':False
                    }
                    retv['result'] = '{} is not in status'.format(key)
                    return JsonResponse(retv)
            current_status.update(req_data)
            types = current_status.get('types')
            if types not in ['status_code', 'delay_time']:
                retv['header'] = {
                'resultCode':1, 
                'resultMessage':'Type is invalide', 
                'isSucessful':False
                }
                retv['result'] = 'Types should be status_code or delay_time!'
                return JsonResponse(retv)
            status_code = current_status.get('status_code')
            if status_code not in references.status_code.keys():
                retv['header'] = {
                'resultCode':2, 
                'resultMessage':'Status code is invalid', 
                'isSucessful':False
                }
                retv['result'] = '{} is not HTTP Status code! '.format(status_code)
                return JsonResponse(retv)
            delay_time = current_status.get('delay_time')
            if not str(delay_time).isnumeric():
                retv['header'] = {
                'resultCode':3, 
                'resultMessage':'Delay time is invalid', 
                'isSucessful':False
                }
                retv['result'] = 'delay time should be positive integer'
                return JsonResponse(retv)

            status.types = types
            status.delay_time = delay_time
            status.status_code = status_code
            status.save()
            retv['result'] = model_to_dict(status)
        except Exception as e:
            retv['header'] = {
                'resultCode':9, 
                'resultMessage':'FAIL', 
                'isSucessful':False
                }
            retv['result'] = ' '.join(e.args)
        return JsonResponse(retv)
    
    retv['result'] = model_to_dict(status)
    return JsonResponse(retv)
