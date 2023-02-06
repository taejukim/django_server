from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from apps.testrail.models import RequestInfo
import os
from django_server import settings

@csrf_exempt
def request_info(request, url_path=None):
    path = request.path
    new_req = RequestInfo(
        url = path,
        body = request.body.decode()
    )
    new_req.save()
    return HttpResponse(url_path)

def trackers(request):
    backup_path = './apps/testrail/trackers.json'
    return HttpResponse(open(backup_path, 'r'),content_type = 'application/json; charset=utf8')
    