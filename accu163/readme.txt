Asible roles for and CI\CD pipeline:
1 LB (nginx) (centos)
2 APP Django app server (ubuntu)
3 DB Mysql (ubuntu)

playbook should run with additional variables: (--extra-vars)

mysql_root_password=
new_mysql_db_name=
new_mysql_user_name=
new_mysql_user_pass=
db_server_ip=
django_app_ip_port= 
