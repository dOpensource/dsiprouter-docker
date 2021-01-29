FROM mariadb:latest

MAINTAINER Richard Bolaji <richard@goflyball.com>

RUN apt-get update -y && \
    apt-get upgrade -y

ADD ../resources/ /opt/resources/
WORKDIR /opt/resources/
RUN mysql < /opt/resources/tmp.sql
EXPOSE 3306:3306
