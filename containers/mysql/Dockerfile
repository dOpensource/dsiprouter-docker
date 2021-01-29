MAINTAINER Richard Bolaji <richard@goflyball.com>

# debian mysql build stage
FROM mariadb:latest AS mysql

ENV KAM_DB_HOST='localhost'
ENV KAM_DB_PORT='3306'
ENV KAM_DB_NAME='kamailio'
ENV KAM_DB_USER='kamailio'
ENV KAM_DB_PASS='kamailiorw'
ENV ROOT_DB_USER='root'
ENV ROOT_DB_PASS=''
ENV ROOT_DB_NAME='mysql'

COPY ./resources/ /opt/resources/

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y perl && \
    perl -i -pe 's%(bind-address[ \t]*\=[ \t]*).*%${1}0.0.0.0%' /etc/mysql/mariadb.conf.d/50-server.cnf && \
    mysql --user="${ROOT_DB_USER}" --password="${ROOT_DB_PASS}" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" ${ROOT_DB_NAME} \
        -e "CREATE USER IF NOT EXISTS '$KAM_DB_USER'@'localhost' IDENTIFIED BY '$KAM_DB_PASS';" \
        -e "CREATE USER IF NOT EXISTS '$KAM_DB_USER'@'%' IDENTIFIED BY '$KAM_DB_PASS';" \
        -e "GRANT ALL PRIVILEGES ON $KAM_DB_NAME.* TO '$KAM_DB_USER'@'localhost';" \
        -e "GRANT ALL PRIVILEGES ON $KAM_DB_NAME.* TO '$KAM_DB_USER'@'%';" \
        -e "FLUSH PRIVILEGES;" && \
    mysql < /opt/resources/dump.sql

EXPOSE ${KAM_DB_PORT}:${KAM_DB_PORT}

CMD systemctl restart mysql
