#!/usr/bin/env sh
set -e

if [ $# -gt 0 ]
then
    exec "$@"
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
