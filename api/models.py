from django.db import models

# Create your models here.
class ServerStatus(models.Model):
    id = models.BigAutoField(primary_key=True)
    types = models.CharField(max_length=100, blank=True, null=True)
    status_code = models.CharField(max_length=100, blank=True, null=True)
    delay_time = models.IntegerField(blank=True, null=True)

class APIHistory(models.Model):
    id = models.BigAutoField(primary_key=True)
    headers = models.CharField(max_length=100, blank=True, null=True)
    body = models.CharField(max_length=100, blank=True, null=True)
    url = models.CharField(max_length=100, blank=True, null=True)
    created = models.DateTimeField(auto_now=True)