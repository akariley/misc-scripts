#!/bin/bash

# This script watches for a touch file and if found, restarts the filebrowser.
# Intended to be run in a screen.

touchFile=/home/rust-pve/.restart.filebrowser
while [[ 1 -eq 1 ]]
do
  if [[ -e ${touchFile} ]]
  then
    #echo "Found a touch file, killing existing session."
    _fsPid=$(ps -u | awk '/filebrowse[r]/ {print $2}') #TODO: add check for more than 1.
    kill -9 ${_fsPid}
    # Just in case...
    sleep 2
    echo "Launch the process!"
    sleep 5
    /usr/local/bin/filebrowser -d /home/rust-pve/filebrowser.db -r /home/rust-pve/rust/serverfiles/oxide/logs -p 65004 -a 170.249.192.26 -k /etc/letsencrypt/live/gameserver.noobcake.net/privkey.pem -t /etc/letsencrypt/live/gameserver.noobcake.net/cert.pem &
    rm -vf ${touchFile}
  else
    # No touchfile found...
    echo ""
    sleep 600
  fi
done
