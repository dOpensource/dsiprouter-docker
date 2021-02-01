MAINTAINER Richard Bolaji <richard@goflyball.com>

# debian nginx build stage
FROM nginx AS nginx

RUN systemctl enable nginx && \
    systemctl start nginx

# debian dsiprouter build stage
FROM python:3.8-buster AS dsiprouter

ENV DSIP_ID='1'
ENV DSIP_CLUSTER_ID='1'
ENV DSIP_CLUSTER_SYNC='False'
ENV DSIP_PORT='5000'
ENV DSIP_USERNAME='admin'
ENV DSIP_PASSWORD='admin'
ENV DSIP_API_PORT='5000'
ENV DSIP_API_TOKEN='admin'
ENV DSIP_IPC_PASS='admin'
ENV KAM_DB_HOST='localhost'
ENV KAM_DB_PORT='3306'
ENV KAM_DB_NAME='kamailio'
ENV KAM_DB_USER='kamailio'
ENV KAM_DB_PASS='kamailiorw'
ENV TELEBLOCK_GW_ENABLED='0'
ENV TELEBLOCK_GW_IP='62.34.24.22'
ENV TELEBLOCK_GW_PORT='5066'
ENV TELEBLOCK_MEDIA_IP=''
ENV TELEBLOCK_MEDIA_PORT=''
ENV FLOWROUTE_ACCESS_KEY=''
ENV FLOWROUTE_SECRET_KEY=''
ENV MAIL_SERVER='smtp.gmail.com'
ENV MAIL_PORT='587'
ENV MAIL_USE_TLS='True'
ENV MAIL_USERNAME=''
ENV MAIL_PASSWORD=''
ENV ROOT_DB_USER='root'
ENV ROOT_DB_PASS=''
ENV ROOT_DB_NAME='mysql'
ENV LOAD_SETTINGS_FROM='file'

COPY ../../  /opt/dsiprouter/
COPY ./resources/ /opt/resources/
RUN mkdir /etc/dsiprouter
COPY ../../gui/privkey /etc/dsiprouter/privkey
RUN pip install -r /opt/dsiprouter/gui/requirements.txt

export DSIP_CONFIG_FILE="./gui/settings.py"
setConfigAttrib 'KAM_KAMCMD_PATH' "$(type -p kamcmd)" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'KAM_CFG_PATH' "$SYSTEM_KAMAILIO_CONFIG_FILE" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'RTP_CFG_PATH' "$SYSTEM_KAMAILIO_CONFIG_FILE" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_PROTO' "$DSIP_PROTO" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_UNIX_SOCK' "$DSIP_UNIX_SOCK" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_PORT' "$DSIP_PORT" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_PRIV_KEY' "$DSIP_PRIV_KEY" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_SSL_KEY' "$DSIP_SSL_KEY" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_SSL_CERT' "$DSIP_SSL_CERT" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_SSL_EMAIL' "$DSIP_SSL_EMAIL" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_API_PROTO' "$DSIP_API_PROTO" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'CLOUD_PLATFORM' "$CLOUD_PLATFORM" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'BACKUP_FOLDER' "$BACKUPS_DIR" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_PROJECT_DIR' "$DSIP_PROJECT_DIR" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_DOCS_DIR' "$DSIP_DOCS_DIR" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'DSIP_CERTS_DIR' "$DSIP_CERTS_DIR" ${DSIP_CONFIG_FILE} -q
setConfigAttrib 'KAM_TLSCFG_PATH' "$SYSTEM_KAMAILIO_TLS_CONFIG_FILE" ${DSIP_CONFIG_FILE} -q

EXPOSE ${DSIP_PORT}:${DSIP_PORT}
EXPOSE ${DSIP_API_PORT}:${DSIP_API_PORT}

CMD systemctl daemon-reload && \
    systemctl enable dsiprouter && \
    systemctl start dsiprouter
