MAINTAINER Richard Bolaji <richard@goflyball.com>

# debian rtpengine build stage
FROM debian:buster AS rtpengine

ENV RTP_PORT_MIN='10000'
ENV RTP_PORT_MAX='20000'

EXPOSE ${RTP_PORT_MIN}-${RTP_PORT_MAX}:${RTP_PORT_MIN}-${RTP_PORT_MAX}

CMD systemctl daemon-reload && \
    systemctl enable rtpengine && \
    systemctl start rtpengine
