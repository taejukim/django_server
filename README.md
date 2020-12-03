# Django Server

## Description
* Login 폼 기능을 제공하는 Django 서버 입니다.
* Python/Django, Nginx를 사용하고 DB는 sqlite3를 사용합니다.
* API 요청에의한 응답 관련 기능도 확장 될 예정입니다.

## How to use
* `Docker`와 `docker-compose`를 설치 합니다.
* 해당 저장소를 Clone 합니다.
* `docker-compose up --build -d`를 Clone 한 폴더에서 실행 합니다.
* `127.0.0.1`이나 서버 IP의 80번 포트를 사용해 진입 합니다.

## Form element selector
* Username form

    `#id_username`

* password form

    `#id_password`

* submit button

    `#login-form > div.submit-row > input[type=submit]`

## Configuration
* 기본 계정 정보는 아래와 같습니다.
    > id : toast
    >
    > password : test1234
    >
    > email : toast@nhntoast.com
* 만약 다른 계정을 사용해야 한다면,`docker-compose.yml` file을 수정하세요
    ```yaml
    ...
    environment: 
        - DJANGO_SU_NAME=toast
        - DJANGO_SU_EMAIL=toast@nhntoast.com
        - DJANGO_SU_PASSWORD=test1234
    ...
    ```
@author taeju.kim@nhntoast.com
