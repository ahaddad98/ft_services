FROM alpine:3.12
RUN echo http://nl.alpinelinux.org/alpine/edge/community >> etc/apk/repositories
RUN apk update
RUN apk add telegraf
COPY ./sources/telegraf.conf /etc/
RUN apk add influxdb
RUN apk add supervisor
COPY ./sources/supervisord.conf /etc/
COPY ./sources/stop-supervisor.sh /tmp/
RUN chmod +x /tmp/stop-supervisor.sh
EXPOSE 8086
CMD /usr/bin/supervisord -c /etc/supervisord.conf
