FROM alpine:3.12
RUN echo http://dl-3.alpinelinux.org/alpine/edge/community  >> /etc/apk/repositories
RUN apk update
RUN apk add telegraf
COPY ./sources/telegraf.conf /etc/
RUN apk add vsftpd
RUN apk add supervisor
RUN apk add openssl
COPY ./sources/vsftpd.conf ./etc/vsftpd/vsftpd.conf
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
COPY ./sources/supervisord.conf /etc/
RUN echo -e "123123123\n123123123" | adduser amine
RUN echo "amine" | tee -a /etc/vsftpd.userlist
COPY ./sources/stop-supervisor.sh /tmp/
RUN chmod +x /tmp/stop-supervisor.sh
CMD /usr/bin/supervisord -c /etc/supervisord.conf
