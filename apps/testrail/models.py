from django.db import models

# Create your models here.
class RequestInfo(models.Model):
    url = models.CharField(max_length=255)
    body = models.TextField()
    create_at = models.DateTimeField(auto_now_add=True)
