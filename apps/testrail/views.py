from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from apps.testrail.models import RequestInfo

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
    data = {
        "trackers": [
            {
                "id": 1,
                "name": "결함",
                "default_status": {
                    "id": 1,
                    "name": "신규"
                },
                "description": None,
                "enabled_standard_fields": [
                    "assigned_to_id",
                    "category_id",
                    "fixed_version_id",
                    "parent_issue_id",
                    "start_date",
                    "due_date",
                    "estimated_hours",
                    "done_ratio",
                    "description"
                ]
            },
            {
                "id": 2,
                "name": "새기능",
                "default_status": {
                    "id": 1,
                    "name": "신규"
                },
                "description": None,
                "enabled_standard_fields": [
                    "assigned_to_id",
                    "category_id",
                    "fixed_version_id",
                    "parent_issue_id",
                    "start_date",
                    "due_date",
                    "estimated_hours",
                    "done_ratio",
                    "description"
                ]
            },
            {
                "id": 3,
                "name": "지원",
                "default_status": {
                    "id": 1,
                    "name": "신규"
                },
                "description": None,
                "enabled_standard_fields": [
                    "assigned_to_id",
                    "category_id",
                    "fixed_version_id",
                    "parent_issue_id",
                    "start_date",
                    "due_date",
                    "estimated_hours",
                    "done_ratio",
                    "description"
                ]
            }
        ]
    }
    return JsonResponse(data)