FROM alpine:3.12
RUN echo http://dl-3.alpinelinux.org/alpine/edge/community  >> /etc/apk/repositories
RUN apk update
RUN apk add telegraf
COPY ./sources/telegraf.conf /etc/
RUN apk add mysql mysql-client
RUN apk add supervisor
COPY ./sources/script.sh .
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel
COPY ./sources/wordpress.sql .
COPY ./sources/supervisord.conf /etc/
COPY ./sources/stop-supervisor.sh /tmp/
RUN chmod +x /tmp/stop-supervisor.sh
ENTRYPOINT sh ./script.sh
