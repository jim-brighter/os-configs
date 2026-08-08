#!/bin/bash

current_ip_address=$(curl -s ipv4.icanhazip.com)

last_ip_address=$(cat /home/vhserver/ip-address.txt)

if [[ "$current_ip_address" == "$last_ip_address" ]]; then
  echo "IP address unchanged"
  exit 0
fi

echo $current_ip_address > /home/vhserver/ip-address.txt

curl \
-H "Authorization: Bot $TOKEN" \
-H 'User-Agent: DiscordBot (bot, 0.1.0)' \
-H 'Content-Type: application/json' \
-X POST \
"https://discord.com/api/channels/$CHANNEL/messages" \
-d '{
  "content": "**Valheim Server Address Changed**\n```'"$current_ip_address:$PORT"'```",
  "tts": false
}'
