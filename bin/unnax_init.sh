#!/bin/bash

WORK_PATH=${HOME}/Documentos/Trabajo/unnax
VENV_PATH=/opt/venv

# Paths
BANSUKAI_PATH=${WORK_PATH}/bansukai
BANSUKAI_VENV=${VENV_PATH}/bansukai

PUSHER_PATH=${WORK_PATH}/pusher
PUSHER_VENV=${VENV_PATH}/pusher

SARAH_PATH=${WORK_PATH}/sarah
SARAH_VENV=${VENV_PATH}/sarah

# Start containers
docker start beanstalkd redis mysql

# Created with:
# docker run -d --name beanstalkd -p 11300:11300 schickling/beanstalkd
# docker run --name redis -p 6379:6379 -d redis redis-server --appendonly yes
# docker run --name mysql -e MYSQL_USER=dev -e MYSQL_PASSWORD=devdev -e MYSQL_DATABASE=unnax_dev -e MYSQL_ROOT_PASSWORD=devdev -p 3306:3306 -d mariadb:10.0.24

# Start bansukai
lxterm -e "cd $BANSUKAI_PATH && DJANGO_SETTINGS_MODULE=unnax.settings.local_mysql ${BANSUKAI_VENV}/bin/python manage.py runserver; bash" &

# Start sarah
lxterm -e "cd $SARAH_PATH && SARAH_SETTINGS_MODULE=sarah.conf.local ${SARAH_VENV}/bin/python main.py; bash" &
lxterm -e "cd $SARAH_PATH && SARAH_SETTINGS_MODULE=sarah.conf.local ${SARAH_VENV}/bin/python cersei_main.py; bash" &

# Start pusher
lxterm -e "cd $PUSHER_PATH && ${PUSHER_VENV}/bin/python main.py; bash" &

# Start fitnance
lxterm -e "cd $BANSUKAI_PATH && DJANGO_SETTINGS_MODULE=fitnance_cooker.settings.local ${BANSUKAI_VENV}/bin/python manage.py run_fitnance_cooker; bash" &
