#!/bin/bash

LOGFILE=/var/log/pihole-update-$(date +"%Y-%m-%d_%H%M%S_%Z").log

/usr/local/bin/pihole -up > $LOGFILE 2>&1

ls -1t /var/log/pihole-update-*.log | tail -n +8 | xargs rm
