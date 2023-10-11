#!/usr/bin/env sh
set -e

if [ $# -gt 0 ]
then
    if [ "$1" = "rcon" ]; then
        # Extract RCON Port
        RCON_PORT=$(grep "^RCONPort=" /root/Zomboid/Server/${SERVER_NAME}.ini | cut -d'=' -f2)

        # Extract RCON Password
        RCON_PASSWORD=$(grep "^RCONPassword=" /root/Zomboid/Server/${SERVER_NAME}.ini | cut -d'=' -f2)

        # Run RCON
        ${RCON_PATH}/rcon --address 127.0.0.1:${RCON_PORT} --password ${RCON_PASSWORD}
    else
        # Execute what user wants
        exec "$@"
    fi
else
    # Every time the server starts try to update the Project Zomboid Server
    steamcmd +login anonymous +force_install_dir /root/ProjectZomboidServer +app_update 380870 validate +quit

    # Change server allowed ram usage
    sed -i "s|-Xmx[0-9]*g|-Xmx${ALLOWED_RAM_IN_GB}g|g" /root/ProjectZomboidServer/ProjectZomboid64.json

    # Change garbage collector to another type
    sed -i "s|UseZGC|UseG1GC|g" /root/ProjectZomboidServer/ProjectZomboid64.json

    # Start the server
    /root/ProjectZomboidServer/start-server.sh -servername ${SERVER_NAME} -adminpassword ${ADMIN_PASSWORD} -steamport1 8766 -steamport2 8767
fi
