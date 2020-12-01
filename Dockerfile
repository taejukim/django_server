FROM python:3.9-slim-buster

RUN apt-get update && \
    aptget install python3-dev default-libmysqlclient-dev build-essential -y

RUN pip install --upgrade pip
RUN pip install pipenv

RUN mkdir /django_login
WORKDIR /django_login

COPY Pipfile /django_login/Pipfile
COPY Pipfile.lock /django_login/Pipfile.lock

RUN pipenv install --system

ADD . /django_login

CMD [ "sh", "docker-entrypoint.sh" ]
