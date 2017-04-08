FROM mysql:5.7
MAINTAINER Montana Mendy <montana@getprowl.com>
COPY ./mysqlconf/ /etc/mysql/
VOLUME /var/log/mysql/
