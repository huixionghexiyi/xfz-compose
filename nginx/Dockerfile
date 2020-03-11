FROM nginx

# 替换为国内源
COPY ./nginx/sources.list /etc/apt/
# 
RUN apt-get update &&\
    apt-get install -y --allow-unauthenticated certbot python-certbot-nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/xfz.conf /etc/nginx/conf.d/xfz.conf