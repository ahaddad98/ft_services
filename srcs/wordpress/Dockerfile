FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories
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
RUN wget http://wordpress.org/latest.tar.gz
RUN mkdir /run/nginx
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
COPY ./sources/supervisord.conf /etc/
COPY ./sources/wp-config.php /www/wordpress/
COPY ./sources/stop-supervisor.sh /tmp/
RUN chmod +x /tmp/stop-supervisor.sh
EXPOSE 5050
CMD /usr/bin/supervisord -c /etc/supervisord.conf
