MAINTAINER Richard Bolaji <richard@goflyball.com>

# debian mysql build stage
FROM mariadb:latest AS mysql

COPY ./resources/ /opt/resources/

RUN apt-get update -y && \
    apt-get upgrade -y && \
    mysql < /opt/resources/tmp.sql

EXPOSE 3306:3306

CMD systemctl restart kamailio
