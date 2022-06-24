from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    id = models.BigAutoField(primary_key=True)
    pw = models.CharField(max_length=255, blank=True, null=True, verbose_name="비밀번호")
    desc = models.CharField(max_length=255, blank=True, null=True, verbose_name="비고")
