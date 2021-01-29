# Don't renew if a default cert was uploaded
    default_cert_uploaded=$(mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" $KAM_DB_NAME -e "select count(*) from dsip_certificates where domain='default'" 2> /dev/null)
    if (( $default_cert_uploaded == 1 )); then
	    return
    fi
    certbot certificates
    if (( $? == 0 )); then
    	certbot renew
    	if (( $? == 0 )); then
        	rm -f ${DSIP_CERTS_DIR}/dsiprouter*
        	cp -f /etc/letsencrypt/live/${EXTERNAL_FQDN}/fullchain.pem ${DSIP_SSL_CERT}
       		cp -f /etc/letsencrypt/live/${EXTERNAL_FQDN}/privkey.pem ${DSIP_SSL_KEY}
       		chown root:kamailio ${DSIP_CERTS_DIR}/dsiprouter*
        	chmod g=+r ${DSIP_CERTS_DIR}/dsiprouter*
		    kamcmd tls.reload
     	fi
    else
        printwarn "Failed Renewing Cert for ${EXTERNAL_FQDN} using LetsEncrypt"
    fi
