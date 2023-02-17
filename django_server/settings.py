"""
Django settings for django_server project.

Generated by 'django-admin startproject' using Django 3.1.2.

For more information on this file, see
https://docs.djangoproject.com/en/3.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.1/ref/settings/
"""

from pathlib import Path
import os, json

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/3.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '4-*=ebve7bl38hygj&i2w12sv!g6uspcs0s8$k75!2hqcnvuks'

# SECURITY WARNING: don't run with debug turned on in production!

DEBUG = json.loads(os.environ.get('DEBUG').lower()) \
        if os.environ.get('DEBUG') else True

ALLOWED_HOSTS = ['localhost', 'web', '*']

# Application definition

INSTALLED_APPS = [
    'django_light',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django_extensions',
    'log_viewer',
    'account',
    'apps.api',
    'apps.webhook',
    'apps.sms',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'request_logging.middleware.LoggingMiddleware',
]

ROOT_URLCONF = 'django_server.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
                BASE_DIR / 'templates',
            ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'django_server.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}


# Password validation
# https://docs.djangoproject.com/en/3.1/ref/settings/#auth-password-validators

AUTH_USER_MODEL = 'account.User'

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.1/topics/i18n/

LANGUAGE_CODE = 'ko-kr'

TIME_ZONE = 'Asia/Seoul'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/3.1/howto/static-files/

STATIC_URL = 'static/'
STATIC_ROOT = 'static/'

MAX_UPLOAD_SIZE = 1024 * 1024 * 50 # 10MB
DATA_UPLOAD_MAX_MEMORY_SIZE = None
FILE_UPLOAD_MAX_MEMORY_SIZE = 1024 * 1024 * 50 # 10MB
DATA_UPLOAD_MAX_NUMBER_FIELDS = None


MAX_UPLOAD_SIZE = 1024 * 1024 * 50 # 10MB
DATA_UPLOAD_MAX_MEMORY_SIZE = None
FILE_UPLOAD_MAX_MEMORY_SIZE = 1024 * 1024 * 50 # 10MB
DATA_UPLOAD_MAX_NUMBER_FIELDS = None


REQUEST_LOGGING_ENABLE_COLORIZE=False

LOG_VIEWER_FILES_DIR = 'logs/'
LOG_VIEWER_PAGE_LENGTH = 25
LOG_VIEWER_PATTERNS = ['[INFO]', '[DEBUG]', '[WARNING]', '[ERROR]', '[CRITICAL]']

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,

    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse',
        },
        'require_debug_true': {
            '()': 'django.utils.log.RequireDebugTrue',
        },
    },

    'formatters': {
        'logfile': {
            'format': '[%(levelname)s] [%(asctime)s] [%(name)s] %(message)s',
            'datefmt': '%Y/%m/%d %H:%M:%S'
        },

        'django.server': {
            '()': 'django.utils.log.ServerFormatter',
            'format': '[{server_time}] {message}',
            'style': '{',
        },

        'standard': {
            'format': '%(asctime)s [%(levelname)s] %(name)s: %(message)s'
        },
    },

    'handlers': {
        
        'console': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
        },
        'django.server': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
            'formatter': 'django.server',
        },
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        },
        'file': {
            'level': 'INFO',
            'encoding': 'utf-8',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': BASE_DIR / 'logs/request.log',
            'maxBytes': 1024*1024*5,  # 5 MB
            'backupCount': 10,
            'formatter': 'logfile',
        },
    },
    # 로거
    # 로그 레코드 저장소
    # 로거를 이름별로 정의
    'loggers': {
        'django': {
           'handlers': ['console', 'file'],
           'level':'INFO',  
        },

        'django.server': {
            'handlers': ['django.server'],
            'level': 'INFO',
            'propagate': False,
        },

        'django.request': {
            'handlers': ['console', 'file'],
            'level':'INFO',
            'propagate': False,
        }
    },
}