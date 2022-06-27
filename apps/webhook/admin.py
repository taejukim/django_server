from django.contrib import admin
from apps.webhook.models import Hooks

class HooksAdmin(admin.ModelAdmin):
    list_display = ('product_name', 'signature', 'hooks_id', 'app_key', 'event','created')

admin.site.register(Hooks, HooksAdmin)