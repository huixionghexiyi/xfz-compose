FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1
# 修改源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# pillow dependences and mysqlclient dependences
RUN  apk update \
   && apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev\
   && apk add --update --no-cache mariadb-connector-c-dev uwsgi\
   && apk add --no-cache --virtual .build-deps \ 
   mariadb-dev \
   gcc \
   musl-dev
WORKDIR /app

# install project dependences
# COPY ./xfzProject .
COPY django/Pipfile /app
COPY django/Pipfile.lock /app
RUN pip install pipenv gunicorn pipenv -i https://pypi.douban.com/simple
RUN pipenv install --system --deploy --ignore-pipfile
RUN apk del .build-deps
COPY ./django/start.sh /start.sh
# 如果Docker安装早window下需要下面这个命令
# RUN sed -i 's/\r//' /start.sh
# 给脚本赋予可执行的权限
RUN chmod +x /start.sh