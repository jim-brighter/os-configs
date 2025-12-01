#!/bin/bash

set -ex

cd /home/vhserver

./vhserver stop
./vhserver backup
./vhserver start

# requires s3cmd installed and configured: https://docs.digitalocean.com/products/spaces/reference/s3cmd/
./s3cmd-2.4.0/s3cmd sync --delete-removed lgsm/backup/ s3://<bucket>
