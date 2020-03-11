#!/bin/sh

# 到app路径下
cd /app
# 数据库映射
python manage.py migrate
# 手机静态资源
python manage.py collectstatic --noinput
python manage.py initgroup
# 启动服务
gunicorn xfzProject.wsgi:application -w 4 -k gthread -b 0.0.0.0:8000 --chdir=/app
# uwsgi --ini xfz_wsgi.ini
