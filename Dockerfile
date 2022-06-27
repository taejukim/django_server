FROM python:3.9-slim-buster

RUN apt-get update && \
    apt-get install python3-dev default-libmysqlclient-dev build-essential -y

RUN mkdir /django_server
WORKDIR /django_server

# pip upgrade and install poetry
RUN pip install --upgrade pip
RUN pip install poetry

# install packages via poetry
COPY poetry.lock /django_server/poetry.lock
COPY pyproject.toml /django_server/pyproject.toml
RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction


ADD . /django_server

CMD [ "sh", "docker-entrypoint.sh" ]
