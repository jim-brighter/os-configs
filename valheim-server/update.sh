#!/bin/bash

set -ex

cd /home/vhserver

localversion=$(grep buildid ./valheim_server/steamapps/appmanifest_896660.acf | tr '[:blank:]"' ' ' | tr -s ' ' | cut -d\  -f3)
newestversion=$(./steamcmd/steamcmd.sh +login anonymous +app_info_request 896660 +login anonymous +app_info_update 1 +app_info_print 896660 +quit | grep -m 1 buildid | tr '[:blank:]"' ' ' | tr -s ' ' | cut -d\  -f3)

if [ -z "$newestversion" ] || [ "$newestversion" == "null" ]; then
    echo "Failed to retrieve newest version from SteamCMD"
    exit 0
fi

if [ "$localversion" -lt "$newestversion" ]; then
    echo "Updating Valheim server from version $localversion to $newestversion"

    systemctl --user stop valheim

    ./steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType linux +login anonymous +force_install_dir ./valheim_server +app_update 896660 +quit

    systemctl --user start valheim
else
    echo "Valheim server is up to date (version $localversion)"
fi
