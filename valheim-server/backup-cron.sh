#!/bin/bash

LOGFILE=/home/vhserver/backups/logs/backup-output-$(date +"%Y-%m-%d_%H%M%S_%Z").log
/home/vhserver/backups/backup.sh > $LOGFILE 2>&1

ls -1t /home/vhserver/backups/logs/backup-output-*.log | tail -n +8 | xargs rm
