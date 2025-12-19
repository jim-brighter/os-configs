#!/bin/bash

set -ex

export XDG_RUNTIME_DIR="/run/user/$UID"
export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"

cd /home/vhserver

mkdir -p ./backups/archives

systemctl --user stop valheim

tar -czvf ./backups/archives/valheim-data-$(date +"%Y-%m-%d_%H%M%S_%Z").tar.gz ./valheim_server/valheim_data

systemctl --user start valheim

/usr/local/bin/aws s3 sync --delete --no-paginate ./backups/archives/ s3://<bucket>
