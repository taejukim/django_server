from django.db import models

# Create your models here.
class Hooks(models.Model):
    id = models.BigAutoField(primary_key=True)
    product_name = models.CharField(max_length=100, blank=True, null=True)
    signature = models.CharField(max_length=100, blank=True, null=True)
    hooks_id = models.CharField(max_length=255, blank=True, null=True)
    app_key = models.CharField(max_length=50, blank=True, null=True)
    event = models.CharField(max_length=100, blank=True, null=True)
    web_hook_config_id = models.CharField(max_length=255, blank=True, null=True)
    headers = models.JSONField()
    body = models.JSONField()
    created = models.DateTimeField(auto_now=True)

'''    
POST / HTTP/1.1
Host: ktb.requestcatcher.com
Accept: */*
Accept-Encoding: gzip
Content-Length: 355
Content-Type: application/json
User-Agent: ReactorNetty/0.9.8.RELEASE
X-Toast-Webhook-Signature: test123

{
    "hooksId": "20210602082501kwczUfhySS0",
    "productName": "SMS",
    "appKey": "TwQT7aIIoyXr090e",
    "event": "UNSUBSCRIBE",
    "webhookConfigId": "20210602082348aL3RbEGwOQ0",
    "hooks": [{
        "unsubscribeNo": "0808022503",
        "enterpriseName": "엔에이치엔토스트",
        "recipientNo": "01092803010",
        "createdDateTime": "2021-06-02T08:30:11.000+09:00",
        "hookId": "202106020825005EyoNLLt2X0"
    }]
}
'''