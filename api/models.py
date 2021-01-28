from django.db import models

# Create your models here.
class ServerStatus(models.Model):
    types = models.CharField(max_length=100, blank=True, null=True)
    status_code = models.CharField(max_length=100, blank=True, null=True)
    delay_time = models.IntegerField(blank=True, null=True)

    