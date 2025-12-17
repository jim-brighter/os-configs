#!/bin/bash

LOGFILE=/home/vhserver/updates/logs/update-output-$(date +"%Y-%m-%d_%H%M%S_%Z").log
/home/vhserver/updates/update.sh > $LOGFILE 2>&1

ls -1t /home/vhserver/updates/logs/*.log | tail -n +25 | xargs rm
