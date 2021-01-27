import hashlib
from hmac import HMAC
from base64 import b64encode
from django.shortcuts import render
from datetime import datetime, timedelta
import requests
import json

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
        try:
            resp = json.loads(r.text)
        except:
            resp = r.text
        context = {
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
        headers = {
        'Authorization':f'hmac algorithm="Hmac{algorithm_name}", headers="{headers_key}", signature="{signature}"',
        'x-nhn-date':now
        }
    else:
        headers = {
        'Authorization':f'hmac algorithm="Hmac{algorithm_name}", signature="{signature}"',
        'x-nhn-date':now
        }
    return headers, path, sign_string
    