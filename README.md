# Django Login web service

## Description
* This is given only login form and authentication.
* It made by django/python web framework
* You can execution by just only 1 line command.

## How to use
* Install docker and docker compose.
* Clone this repository
* Run `docker-compose up --build -d` in console.
* Enter `127.0.0.1` or server's ip address to enter.

## Form element selector
* Username form

    `#id_username`

* password form

    `#id_password`

* submit button

    `#login-form > div.submit-row > input[type=submit]`

## Configuration
* Defualt account is like a below.
    > id : toast
    > password : test1234
    > email : toast@nhntoast.com
* if you need to another account, modify `docker-compose.yml` file.
    ```yaml
    ...
    environment: 
            - DJANGO_SU_NAME=toast
            - DJANGO_SU_EMAIL=toast@nhntoast.com
            - DJANGO_SU_PASSWORD=test1234
    ...
    ```
@author taeju.kim@nhntoast.com