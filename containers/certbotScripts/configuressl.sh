# Check if certificates already exists.  If so, use them and exit
    if [ -f "${DSIP_SSL_CERT}" -a -f "${DSIP_SSL_KEY}" ]; then
        printwarn "Certificate found in ${DSIP_CERTS_DIR} - using it"
        chown root:kamailio ${DSIP_CERTS_DIR}/dsiprouter*
        chmod g=+r ${DSIP_CERTS_DIR}/dsiprouter*
        return
    fi

    # Try to create cert using LetsEncrypt's first
    #if (( ${TEAMS_ENABLED} == 1 )); then
    # Open port 80 for hostname validation
    firewall-cmd --zone=public --add-port=80/tcp --permanent
    firewall-cmd --reload
    printdbg "Generating Certs for ${EXTERNAL_FQDN} using LetsEncrypt"
    certbot certonly --standalone --non-interactive --agree-tos -d ${EXTERNAL_FQDN} -m ${DSIP_SSL_EMAIL}
    if (( $? == 0 )); then
        rm -f ${DSIP_CERTS_DIR}/dsiprouter*
        cp -f /etc/letsencrypt/live/${EXTERNAL_FQDN}/fullchain.pem ${DSIP_SSL_CERT}
        cp -f /etc/letsencrypt/live/${EXTERNAL_FQDN}/privkey.pem ${DSIP_SSL_KEY}
        chown root:kamailio ${DSIP_CERTS_DIR}/*
        chmod g=+r ${DSIP_CERTS_DIR}/*
        # Add Nightly Cronjob to renew certs
        cronAppend "0 0 * * * ${DSIP_PROJECT_DIR}/dsiprouter.sh renewsslcert"
    else
        printwarn "Failed Generating Certs for ${EXTERNAL_FQDN} using LetsEncrypt"

        # Worst case, generate a Self-Signed Certificate
        printdbg "Generating dSIPRouter Self-Signed Certificates"
        openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out ${DSIP_SSL_CERT} -keyout ${DSIP_SSL_KEY} -subj "/C=US/ST=MI/L=Detroit/O=dSIPRouter/CN=${EXTERNAL_FQDN}"
        chown root:kamailio ${DSIP_CERTS_DIR}/*
        chmod g=+r ${DSIP_CERTS_DIR}/*
    fi
    firewall-cmd --zone=public --remove-port=80/tcp --permanent
    firewall-cmd --reload
    #fi
