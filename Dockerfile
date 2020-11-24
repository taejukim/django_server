FROM python:3.8-slim-buster

RUN pip install pipenv

RUN mkdir /sm
WORKDIR /sm

COPY Pipfile /sm/Pipfile
COPY Pipfile.lock /sm/Pipfile.lock

RUN pipenv install --system

ADD . /sm

CMD [ "sh", "docker-entrypoint.sh" ]
