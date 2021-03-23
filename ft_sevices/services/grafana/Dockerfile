FROM alpine:3.12
RUN apk update
RUN apk add supervisor
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.5.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.4.5.linux-amd64.tar.gz
RUN mv grafana-7.4.5 grafana
RUN rm grafana-7.4.5.linux-amd64.tar.gz
RUN apk add --update binutils
RUN apk add libc6-compat
COPY ./sources/supervisord.conf /etc/
WORKDIR /grafana
EXPOSE 3000
CMD /usr/bin/supervisord -c /etc/supervisord.conf
