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
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mkdir /run/nginx
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin
COPY ./sources/supervisord.conf /etc/
CMD /usr/bin/supervisord -c /etc/supervisord.conf
