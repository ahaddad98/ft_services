FROM alpine:3.12
RUN echo http://dl-3.alpinelinux.org/alpine/edge/community  >> /etc/apk/repositories
RUN apk update
RUN apk add telegraf
COPY ./sources/telegraf.conf /etc/
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
RUN rm /www/phpmyadmin/config.sample.inc.php
COPY ./sources/supervisord.conf /etc/
COPY ./sources/stop-supervisor.sh /tmp/
RUN chmod +x /tmp/stop-supervisor.sh
COPY ./sources/config.inc.php /www/phpmyadmin/
EXPOSE 5000
CMD /usr/bin/supervisord -c /etc/supervisord.conf
