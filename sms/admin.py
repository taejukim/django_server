from django.contrib import admin
from sms.models import Messages

class MessagesAdmin(admin.ModelAdmin):
    list_display = ('message_type', 'env', 'app_key', 'send_no', 'receipent_no', 'test_name','created')

admin.site.register(Messages, MessagesAdmin)