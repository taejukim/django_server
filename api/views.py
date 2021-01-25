from django.shortcuts import render
from django.http.response import HttpResponse, JsonResponse
from datetime import datetime
from django.views.decorators.csrf import csrf_exempt
import time
import xmltodict
from api.references import status_code, html


@csrf_exempt
def method_test(request, url_path=None):
    retv = {
        'header': {
            'resultCode': 0,
            'resultMessage': 'SUCCESS',
            'isSuccessful': True
        },
        'title': '{} Method TEST'.format(request.method),
        'body': 'HTTP {} Method Test page'.format(request.method),
        'testDate':datetime.now().isoformat()
    }
    if url_path or 'path' in request.path:
        retv['path'] = request.path
        retv['title'] = "API URL Path Test"
        retv['body'] = "API URL Path Test Page"
    return JsonResponse(retv)

def retv(isSuccessful, title, code=None):
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
    return retv

def status_test(request):
    code = request.GET.get('code')
    if code:
        resp = JsonResponse(retv(True, status_code.get(code), code))
        resp.status_code = int(code)
        return resp 
    return JsonResponse(retv(False, 'Status Code를 확인해주세요.'))

def delay_test(request):
    second = request.GET.get('second')
    if second:
        time.sleep(float(second))
        resp = JsonResponse(retv(True, f'Delay {second} Second(s)', 200))
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
