function generateKamailioConfig {
    # copy of template kamailio configuration to dsiprouter system config dir
    cp -f ${DSIP_KAMAILIO_CONFIG_DIR}/kamailio_dsiprouter.cfg ${DSIP_KAMAILIO_CONFIG_FILE}
    cp -f ${DSIP_KAMAILIO_CONFIG_DIR}/tls_dsiprouter.cfg ${DSIP_KAMAILIO_TLS_CONFIG_FILE}

    # version specific settings
    if (( ${KAM_VERSION} >= 52 )); then
        sed -i -r -e 's~#+(modparam\(["'"'"']htable["'"'"'], ?["'"'"']dmq_init_sync["'"'"'], ?[0-9]\))~\1~g' ${DSIP_KAMAILIO_CONFIG_FILE}
    fi

    # Fix the mpath
    fixMPATH

    # Enable SERVERNAT
    if [ "$SERVERNAT" == "1" ]; then
        enableSERVERNAT
    fi

    if (( ${WITH_LCR} == 1 )); then
        enableKamailioConfigAttrib 'WITH_LCR' ${DSIP_KAMAILIO_CONFIG_FILE}
    else
        disableKamailioConfigAttrib 'WITH_LCR' ${DSIP_KAMAILIO_CONFIG_FILE}
    fi

    # Backup kamcfg and link the dsiprouter kamcfg
    cp -f ${SYSTEM_KAMAILIO_CONFIG_FILE} ${SYSTEM_KAMAILIO_CONFIG_FILE}.$(date +%Y%m%d_%H%M%S)
    cp -f ${SYSTEM_KAMAILIO_TLS_CONFIG_FILE} ${SYSTEM_KAMAILIO_TLS_CONFIG_FILE}.$(date +%Y%m%d_%H%M%S)
    rm -f ${SYSTEM_KAMAILIO_CONFIG_FILE}
    rm -f ${SYSTEM_KAMAILIO_TLS_CONFIG_FILE}
    ln -sf ${DSIP_KAMAILIO_CONFIG_FILE} ${SYSTEM_KAMAILIO_CONFIG_FILE}
    ln -sf ${DSIP_KAMAILIO_TLS_CONFIG_FILE} ${SYSTEM_KAMAILIO_TLS_CONFIG_FILE}

    # kamcfg will contain plaintext passwords / tokens
    # make sure we give it reasonable permissions
    chown root:kamailio ${DSIP_KAMAILIO_CONFIG_FILE}
    chmod 0640 ${DSIP_KAMAILIO_CONFIG_FILE}
}

function configureKamailio {
    # make sure kamailio user and privileges exist
    mysql --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $MYSQL_ROOT_DATABASE \
        -e "CREATE USER IF NOT EXISTS '$KAM_DB_USER'@'localhost' IDENTIFIED BY '$KAM_DB_PASS';" \
        -e "CREATE USER IF NOT EXISTS '$KAM_DB_USER'@'%' IDENTIFIED BY '$KAM_DB_PASS';"
    mysql --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $MYSQL_ROOT_DATABASE \
        -e "GRANT ALL PRIVILEGES ON $KAM_DB_NAME.* TO '$KAM_DB_USER'@'localhost';" \
        -e "GRANT ALL PRIVILEGES ON $KAM_DB_NAME.* TO '$KAM_DB_USER'@'%';" \
        -e "FLUSH PRIVILEGES;"

    # Install schema for drouting module
    mysql --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}"  $KAM_DB_NAME \
        -e "delete from version where table_name in ('dr_gateways','dr_groups','dr_gw_lists','dr_custom_rules','dr_rules')"
    mysql --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
        -e "drop table if exists dr_gateways,dr_groups,dr_gw_lists,dr_custom_rules,dr_rules"
    if [ -e  /usr/share/kamailio/mysql/drouting-create.sql ]; then
        mysql --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
            < /usr/share/kamailio/mysql/drouting-create.sql
    else
        sqlscript=$(find / -name '*drouting-create.sql' | grep 'mysql' | head -1)
        mysql --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
            < $sqlscript
    fi

    # Update schema for dr_gateways table
    mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
        -e 'ALTER TABLE dr_gateways MODIFY pri_prefix varchar(64) NOT NULL DEFAULT "", MODIFY attrs varchar(255) NOT NULL DEFAULT "";'

    # Update schema for subscribers table
    mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
        -e 'ALTER TABLE subscriber ADD email_address varchar(128) NOT NULL DEFAULT "", ADD rpid varchar(128) NOT NULL DEFAULT "";'

    # Install schema for custom LCR logic
    mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
        < ${DSIP_DEFAULTS_DIR}/dsip_lcr.sql

    # Install schema for custom MaintMode logic
    mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
        < ${DSIP_DEFAULTS_DIR}/dsip_maintmode.sql

    # Install schema for Call Limit
    mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
        < ${DSIP_DEFAULTS_DIR}/dsip_calllimit.sql

    # Install schema for Notifications
    mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
        < ${DSIP_DEFAULTS_DIR}/dsip_notification.sql

    # Install schema for gw2gwgroup
    mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
        < ${DSIP_DEFAULTS_DIR}/dsip_gw2gwgroup.sql

    # Install schema for dsip_cdrinfo
    mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" $KAM_DB_NAME --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" \
        < ${DSIP_DEFAULTS_DIR}/dsip_cdrinfo.sql

    # Install schema for dsip_settings
    envsubst < ${DSIP_DEFAULTS_DIR}/dsip_settings.sql |
        mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" $KAM_DB_NAME --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}"

    # Install schema for dsip_hardfwd and dsip_failfwd and dsip_prefix_mapping
    sed -e "s|FLT_INBOUND_REPLACE|${FLT_INBOUND}|g" ${DSIP_DEFAULTS_DIR}/dsip_forwarding.sql |
        mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME

    # Install schema for custom dr_gateways logic
    mysql -s -N --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
        < ${DSIP_DEFAULTS_DIR}/dr_gateways.sql

    # TODO: we need to test and re-implement this.
#    # required if tables exist and we are updating
#    function resetIncrementers {
#        SQL_TABLES=$(
#            (for t in "$@"; do printf ",'$t'"; done) | cut -d ',' -f '2-'
#        )
#
#        # reset auto increment for related tables to max btwn the related tables
#        INCREMENT=$(
#            mysql --skip-column-names --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $MYSQL_ROOT_DATABASE \ -e "\
#                SELECT MAX(AUTO_INCREMENT) FROM INFORMATION_SCHEMA.TABLES \
#                WHERE TABLE_SCHEMA = '$KAM_DB_NAME' \
#                AND TABLE_NAME IN($SQL_TABLES);"
#        )
#        for t in "$@"; do
#            mysql --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" $KAM_DB_NAME \
#                -e "ALTER TABLE $t AUTO_INCREMENT=$INCREMENT"
#        done
#    }
#
#    # reset auto incrementers for related tables
#    resetIncrementers "dr_gw_lists"
#    resetIncrementers "uacreg"

    # Import Default Carriers
    if cmdExists 'mysqlimport'; then
        mysql --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" $KAM_DB_NAME \
            -e "delete from address where grp=$FLT_CARRIER"

        # use a tmp dir so we don't have to change repo
        mkdir -p /tmp/defaults

        # copy over default gateway lists
        cp -f ${DSIP_DEFAULTS_DIR}/dr_gw_lists.csv /tmp/defaults/dr_gw_lists.csv

        # sub in dynamic values
        sed "s/FLT_CARRIER/$FLT_CARRIER/g" \
            ${DSIP_DEFAULTS_DIR}/address.csv > /tmp/defaults/address_carrier.csv
        sed "s/FLT_MSTEAMS/$FLT_MSTEAMS/g" \
            /tmp/defaults/address_carrier.csv  > /tmp/defaults/address.csv
        sed "s/FLT_CARRIER/$FLT_CARRIER/g" \
            ${DSIP_DEFAULTS_DIR}/dr_gateways.csv > /tmp/defaults/dr_gateways.csv
        sed "s/FLT_OUTBOUND/$FLT_OUTBOUND/g; s/FLT_INBOUND/$FLT_INBOUND/g" \
            ${DSIP_DEFAULTS_DIR}/dr_rules.csv > /tmp/defaults/dr_rules.csv

        # import default carriers
        mysqlimport --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" \
            --fields-terminated-by=';' --ignore-lines=0  -L $KAM_DB_NAME /tmp/defaults/address.csv
        mysqlimport --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" \
            --fields-terminated-by=';' --ignore-lines=0  -L $KAM_DB_NAME ${DSIP_DEFAULTS_DIR}/dr_gw_lists.csv
        mysqlimport --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" \
            --fields-terminated-by=';' --ignore-lines=0  -L $KAM_DB_NAME /tmp/defaults/dr_gateways.csv
        mysqlimport --user="$MYSQL_ROOT_USERNAME" --password="$MYSQL_ROOT_PASSWORD" --host="${KAM_DB_HOST}" --port="${KAM_DB_PORT}" \
            --fields-terminated-by=';' --ignore-lines=0  -L $KAM_DB_NAME /tmp/defaults/dr_rules.csv

        rm -rf /tmp/defaults
    fi

    generateKamailioConfig
}
