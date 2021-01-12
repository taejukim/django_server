from django.shortcuts import render
from django.http.response import JsonResponse
from datetime import datetime
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def method_test(request):
    now = datetime.now().isoformat()
    retv = {
        'method':request.method,
        'time_stamp':now
    }
    return JsonResponse(retv)
