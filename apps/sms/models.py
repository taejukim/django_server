from inspect import signature
from django.db import models

# Create your models here.
class Messages(models.Model):
    id = models.BigAutoField(primary_key=True)
    signature = models.CharField(max_length=100, blank=True, null=True)
    app_key = models.CharField(max_length=50, blank=True, null=True)
    send_no = models.CharField(max_length=100, blank=True, null=True)
    receipent_no = models.CharField(max_length=100, blank=True, null=True)
    test_name = models.CharField(max_length=255, blank=True, null=True)
    message_type = models.CharField(max_length=10, blank=True, null=True)
    message = models.TextField()
    env = models.CharField(max_length=50, blank=True, null=True)
    created = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return '{}-{}'.format(self.id, self.signature)

'''    

POST / HTTP/1.1
Host: sms.requestcatcher.com
Accept-Encoding: gzip
Connection: Keep-Alive
Content-Length: 124
Content-Type: application/x-www-form-urlencoded; charset=UTF-8
User-Agent: Dalvik/2.1.0 (Linux; U; Android 12; SM-F711N Build/SP1A.210812.016)

msg=01030742720-%5BWeb%EB%B0%9C%EC%8B%A0%5D%0An%3A+sms-real_number_test-real%0Ak%3A+o3jvpBmw0Y24uQFx%0As%3A+06231703FDLmRSb&

[Web발신]
n: {msg_type}-{test_name}-{env}
k: {appkey}
s: {signature}

'''