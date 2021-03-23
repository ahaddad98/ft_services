FROM alpine:3.12
RUN apk update
RUN apk add influxdb
RUN apk add supervisor
COPY ./sources/supervisord.conf /etc/
EXPOSE 8086
CMD /usr/bin/supervisord -c /etc/supervisord.conf
