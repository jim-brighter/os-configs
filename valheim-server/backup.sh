#!/bin/bash

set -ex

cd /home/vhserver

mkdir -p ./backups/archives

systemctl --user stop valheim

tar -czvf ./backups/archives/valheim-data-$(date +"%Y-%m-%d_%H%M%S_%Z").tar.gz ./valheim_server/valheim_data

systemctl --user start valheim

aws s3 sync --delete --no-paginate ./backups/archives/ s3://<bucket>
