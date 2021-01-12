from django.shortcuts import render
from django.http.response import JsonResponse
from datetime import datetime

# Create your views here.
def method_test(request):
    now = datetime.now().isoformat()
    retv = {
        'method':request.method,
        'time_stamp':now
    }
    return JsonResponse(retv)