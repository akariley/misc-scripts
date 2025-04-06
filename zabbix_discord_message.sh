#!/bin/bash

webhookUrlTesting="" #testing
webhookUrlAdmins="" #admins
webhookUrlPVE1="" #pve1-relay
webhookUrlPVE2="" #pve2-relay
webhookUrlServerStatus="" #server-status
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
  # it's related to the server so send to #admins and the relay.
  #/usr/bin/curl -H "${curlHeaders}" -X POST -d "${payload}" "${webhookUrlAdmins}"
  if [[ "$1" =~ PVE1 ]]
  then
    /usr/bin/curl -H "${curlHeaders}" -X POST -d "${payload}" "${webhookUrlPVE1}"
  else
    /usr/bin/curl -H "${curlHeaders}" -X POST -d "${payload}" "${webhookUrlPVE2}"
  fi # end servername check
  /usr/bin/curl -H "${curlHeaders}" -X POST -d "${payload}" "${webhookUrlServerStatus}"
  /usr/bin/curl -H "${curlHeaders}" -X POST -d "${payload}" "${webhookUrlAdmins}"
else  # Test message.
  /usr/bin/curl -H "${curlHeaders}" -X POST -d "${payload}" "${webhookUrlTesting}"
fi
