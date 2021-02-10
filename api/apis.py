from django.shortcuts import render
from django.http.response import HttpResponse, JsonResponse
from datetime import datetime
from django.views.decorators.csrf import csrf_exempt
import os
import time
import xmltodict
from api.references import status_code, html
from api.models import ServerStatus
from datetime import datetime

@csrf_exempt
def method_path_test(request, url_path=None):
    retv = {
        'header': {
            'resultCode': 0,
            'resultMessage': 'SUCCESS',
            'isSuccessful': True,
            'requestHeaders':dict(request.headers),
        },
        'title': '{} Method TEST'.format(request.method),
        'method': '{}'.format(request.method),
        'body': 'HTTP {} Method Test page'.format(request.method),
        'testDate':datetime.now().isoformat()
    }
    if url_path or 'path' in request.path:
        retv['path'] = request.path
        retv['title'] = "API URL Path Test"
        retv['body'] = "API URL Path Test Page"
    resp = JsonResponse(retv)
    retv['header']['responseHeaders'] = dict(resp._headers)
    return JsonResponse(retv)

@csrf_exempt
def multi_path_test(request, url_path=None):
    return method_path_test(request, url_path)

def retv(isSuccessful, title, code=None, **kwargs):
    header = {
            'resultCode': 1,
            'resultMessage': 'FAIL',
            'isSuccessful': False
        }
    if isSuccessful == True:
        header['resultCode']=0
        header['resultMessage']='SUCCESS'
        header['isSuccessful']=isSuccessful
    retv = {
        'header':header,
        'title':title,
        'body':'Contents of body',
        'testDate':datetime.now().isoformat()
    }
    retv.update(kwargs)
    return retv

def status_test(request):
    code = request.GET.get('code')
    if code:
        resp = JsonResponse(
            retv(True, str(code) + " " + status_code.get(code), code)
            )
        resp.status_code = int(code)
        return resp 
    return JsonResponse(retv(False, 'Status Code를 확인해주세요.'))

@csrf_exempt
def status_test_path(request, code):
    if code:
        resp = JsonResponse(
            retv(True, str(code) + " " + status_code.get(str(code)), str(code))
            )
        resp.status_code = int(code)
        return resp
    return JsonResponse(retv(False, 'Status Code를 확인해주세요.'))

def delay_test(request):
    second = request.GET.get('second')
    if second:
        request_time = datetime.now().isoformat()
        time.sleep(float(second))
        response_time = datetime.now().isoformat()
        resp = JsonResponse(retv(True, f'Delay {second} Second(s)', 200, 
            request_time=request_time,
            response_time=response_time,
            ))
        return resp 
    return JsonResponse(retv(False, 'Second를 확인해주세요.'))

def contents_type_test(request):
    contents_type = request.GET.get('type')
    if contents_type:
        if contents_type == 'html':
            return HttpResponse(html.format(datetime.now().isoformat()),
                                content_type='text/html')

        elif contents_type == 'json':
            return JsonResponse(retv(True, 'JSON Format Response Test', 200))

        elif contents_type == 'xml':
            json_retv = {'response':retv(True, 'XML Format Response Test', 200)}
            return HttpResponse(xmltodict.unparse(json_retv, pretty=True),
                                content_type='application/xml')       

    return JsonResponse(retv(False, 'Contents Type을 확인해주세요.'))

def server_failure(request):
    status = ServerStatus.objects.get(id=1) 
    types = status.types
    delay_time = status.delay_time
    code = status.status_code

    if types == 'status_code':
        resp = JsonResponse(retv(True, str(code) + " " + status_code.get(code), code))
        resp.status_code = int(code)
        return resp 

    if types == 'delay_time':
        request_time = datetime.now().isoformat()
        time.sleep(float(delay_time))
        response_time = datetime.now().isoformat()
        resp = JsonResponse(retv(True, f'Delay {delay_time} Second(s)', 200, 
            request_time=request_time,
            response_time=response_time,
            ))
        return resp  

    return JsonResponse(retv(False, '서버 장애 내용을 확인해주세요.'))

def big_body(request):
    try:
        size = int(request.GET.get('bytes'))
        binaries = os.urandom(size)
        return JsonResponse(retv(True, 'Big Size Response body Test', None,
            body=binaries.decode('utf-16-le', errors='ignore'),
            bytes='{:,} bytes'.format(size)
            ))
    except:
        return JsonResponse(retv(False, 'Body Size(Bytes)를 확인해주세요.'))
