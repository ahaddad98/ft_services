FROM alpine:3.12
RUN echo http://dl-3.alpinelinux.org/alpine/edge/community  >> /etc/apk/repositories
RUN apk update
RUN apk add telegraf
COPY ./sources/telegraf.conf /etc/
RUN apk add supervisor
RUN apk add nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN apk add openssl
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY ./sources/nginx.conf /etc/nginx/
COPY ./sources/supervisord.conf /etc/
COPY ./sources/index.html /www
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
RUN mkdir /run/nginx
COPY ./sources/stop-supervisor.sh /tmp/
RUN chmod +x /tmp/stop-supervisor.sh
EXPOSE 80
CMD /usr/bin/supervisord -c /etc/supervisord.conf
