"""django_server URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls.static import static
from django.conf import settings
from django.views.generic import TemplateView
from apps.api.apis import contents_type_test, delay_test,\
             method_path_test, status_test, multi_path_test, api_history, \
             server_failure, status_test_path, big_body, file_upload, big_body_url_path
from apps.api.views import hmac_client, server_health_adjust, server_health_api


urlpatterns = [
    path('', TemplateView.as_view(template_name='index.html')),
    path('method', method_path_test), # api/method
    path('method/', method_path_test), # api/method
    path('history', api_history), # api/history
    path('path/<path:url_path>', method_path_test), # api/path/path/to/test/any/path
    path('path', method_path_test), # api/path
    path('status', status_test), # api/status
    path('status/<int:code>', status_test_path), # api/contents
    path('delay', delay_test), # api/delay
    path('contents', contents_type_test), # api/contents
    path('path2', multi_path_test), # api/contents
    path('path2/<path:url_path>', multi_path_test), # api/contents
    path('hmac', hmac_client), # api/hmac
    path('server_failure', server_failure, name="server_failure"), # api/hmac
    path('server_failure/adjust', server_health_adjust, name="adjust"), # api/hmac
    path('server_failure/adjust/api', server_health_api, name="adjust_api"), # api/hmac
    path('bigbody', big_body, name="bigbody"), # api/bigbody
    path('bigbody/<int:size>', big_body_url_path, name="bigbody"), # api/bigbody
    path('file-upload', file_upload, name="fileupload"), # api/file-upload
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) 
