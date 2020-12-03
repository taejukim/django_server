FROM python:3.9-slim-buster

RUN apt-get update && \
    apt-get install python3-dev default-libmysqlclient-dev build-essential -y

RUN pip install --upgrade pip
RUN pip install pipenv

RUN mkdir /django_server
WORKDIR /django_server

COPY Pipfile /django_server/Pipfile
COPY Pipfile.lock /django_server/Pipfile.lock

RUN pipenv install --system

ADD . /django_server

CMD [ "sh", "docker-entrypoint.sh" ]
