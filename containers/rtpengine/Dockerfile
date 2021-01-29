MAINTAINER Richard Bolaji <richard@goflyball.com>

# debian rtpengine build stage
FROM debian:buster AS rtpengine

#Install process
local RTP_UPDATE_OPTS=""

    cd ${DSIP_PROJECT_DIR}

    if [ -f "${DSIP_SYSTEM_CONFIG_DIR}/.rtpengineinstalled" ]; then
        printwarn "RTPEngine is already installed"
        return
    fi

    printdbg "Attempting to install RTPEngine..."
    ./rtpengine/${DISTRO}/install.sh install
    ret=$?
    if [ $ret -eq 0 ]; then
        printdbg "configuring RTPEngine service"
    elif [ $ret -eq 2 ]; then
        printwarn "RTPEngine install waiting on reboot"
        cleanupAndExit 0
    else
        printerr "RTPEngine install failed"
        cleanupAndExit 1
    fi

    # update rtpengine configs on reboot
    if (( ${SERVERNAT} == 1 )); then
        RTP_UPDATE_OPTS="-servernat"
    fi
    addInitCmd "${DSIP_PROJECT_DIR}/dsiprouter.sh updatertpconfig $RTP_UPDATE_OPTS"
    addDependsOnInit "rtpengine.service"

    # Restart RTPEngine with the new configurations
    systemctl restart rtpengine
    if systemctl is-active --quiet rtpengine; then
        touch ${DSIP_SYSTEM_CONFIG_DIR}/.rtpengineinstalled
        printdbg "------------------------------------"
        pprint "RTPEngine Installation is complete!"
        printdbg "------------------------------------"
    else
        printerr "RTPEngine install failed"
        cleanupAndExit 1
    fi

ENV RTP_PORT_MIN='10000'
ENV RTP_PORT_MAX='20000'

EXPOSE ${RTP_PORT_MIN}-${RTP_PORT_MAX}:${RTP_PORT_MIN}-${RTP_PORT_MAX}

CMD systemctl daemon-reload && \
    systemctl enable rtpengine && \
    systemctl start rtpengine
