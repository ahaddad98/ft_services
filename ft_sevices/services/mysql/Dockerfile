FROM alpine:3.12
RUN apk update
RUN apk add mysql mysql-client
RUN apk add openrc
RUN openrc
RUN touch /run/openrc/softlevel
RUN /etc/init.d/mariadb setup
RUN /etc/init.d/mariadb start
RUN mysql -u root -e "CREATE DATABASE wordpress; CREATE USER 'ahaddad'@'%' IDENTIFIED BY 'ahaddad';GRANT ALL PRIVILEGES ON *.* TO 'ahaddad'@'%';"

