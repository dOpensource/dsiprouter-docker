MAINTAINER Richard Bolaji <richard@goflyball.com>

# debian kamailio build stage
FROM kamailio/kamailio:5.3.8-trusty AS kamailio

ENV KAM_DB_HOST='localhost'
ENV KAM_DB_PORT='3306'
ENV KAM_DB_NAME='kamailio'
ENV KAM_DB_USER='kamailio'
ENV KAM_DB_PASS='kamailiorw'
ENV SIP_PORT='5060'
ENV SIPS_PORT='5061'
ENV DMQ_PORT='5090'
ENV WSS_PORT='4443'

COPY ./resources/ /opt/resources/
COPY ../../ /opt/dsiprouter/
COPY kamailio_dsiprouter.cfg /etc/kamailio

EXPOSE ${SIP_PORT}:${SIP_PORT}
EXPOSE ${SIPS_PORT}:${SIPS_PORT}
EXPOSE ${DMQ_PORT}:${DMQ_PORT}
EXPOSE ${WSS_PORT}:${WSS_PORT}

CMD systemctl daemon-reload && \
    systemctl enable kamailio && \
    systemctl start kamailio
