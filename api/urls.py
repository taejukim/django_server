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
from django.views.generic import TemplateView
from api.apis import contents_type_test, delay_test,\
             method_path_test, status_test, multi_path_test
from api.views import hmac_client

urlpatterns = [
    path('', TemplateView.as_view(template_name='index.html')),
    path('method/', method_path_test), # api/method
    path('path/<path:url_path>', method_path_test), # api/path/path/to/test/any/path
    path('path/', method_path_test), # api/path
    path('status/', status_test), # api/status
    path('delay/', delay_test), # api/delay
    path('contents/', contents_type_test), # api/contents
    path('path2/', multi_path_test), # api/contents
    path('path2/<path:url_path>', multi_path_test), # api/contents
    path('hmac/', hmac_client), # api/hmac
]
