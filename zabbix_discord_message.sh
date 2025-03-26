#!/bin/bash

webhookUrlTesting="https://discord.com/api/webhooks/t0k3n?thread_id=42069101" #testing
webhookUrl="https://discord.com/api/webhooks/867530911037" #admins
params="$1"
discordUsername="Server alerts"
discordContentJson='"content": "'${params}'"'
discordUsernameJson='"username": "'${discordUsername}'"'
discordAvatar="https://akariley.net/files/icons/NoobNavy.png"
discordAvatarJson='"avatar_url": "'${discordAvatar}'"'
curlHeaders="Content-Type: application/json"

payload="{${discordUsernameJson},${discordContentJson},${discordAvatarJson}}"

if [[ "$1" =~ PVE[1-2] ]]
then
  /usr/bin/curl -H "${curlHeaders}" -X POST -d "${payload}" "${webhookUrl}"
else
  /usr/bin/curl -H "${curlHeaders}" -X POST -d "${payload}" "${webhookUrlTesting}"
fi
