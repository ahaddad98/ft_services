FROM alpine:3.12
RUN apk update
RUN	apk add supervisor
RUN apk add nginx
RUN apk add phpmyadmin
RUN apk add php7-fpm
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY ./sources/nginx.conf /etc/nginx/
RUN apk add wget
WORKDIR /www
RUN wget http://wordpress.org/latest.tar.gz
RUN mkdir /run/nginx
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
COPY ./sources/supervisord.conf /etc/
CMD /usr/bin/supervisord -c /etc/supervisord.conf
