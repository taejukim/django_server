#!/bin/bash
echo ":::::::Makemigragions"
python manage.py makemigrations
python manage.py migrate

echo ":::::::Collect static files"
python manage.py collectstatic --noinput

echo ":::::::Create supser user"
echo "from django.contrib.auth.models import User;\
      User.objects.create_superuser('$DJANGO_SU_NAME', \
      '$DJANGO_SU_EMAIL', '$DJANGO_SU_PASSWORD')" | python manage.py shell
      
echo ":::::::Run gunicorn"
gunicorn -b 0:4000 -w 2 django_server.wsgi:application --timeout=300

