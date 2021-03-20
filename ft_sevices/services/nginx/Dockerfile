FROM alpine:3.12
RUN apk update
RUN apk add supervisor
RUN apk add nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY ./sources/nginx.conf /etc/nginx/
COPY ./sources/supervisord.conf /etc/
RUN mkdir /run/nginx
EXPOSE 80
CMD /usr/bin/supervisord -c /etc/supervisord.conf
