FROM python:2.7 

WORKDIR /usr/src

RUN git clone -b accu154 https://github.com/TerebDan/DevOps-Trainee.git django_app

RUN pip install django==1.4 \ 
    mysqlclient

CMD [ "python", "./django_app/manage.py", "runserver", "0.0.0.0:8000" ]
