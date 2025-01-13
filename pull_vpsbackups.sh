#!/bin/bash
if [[ $1 == '--dry-run' ]]
then
rsync --dry-run --ignore-existing -vPe 'ssh -i freenas -p2200' --files-from=<(ssh -i ~/freenas -p2200 vpsbackups@gameserver.noobcake.net find ./backups -mtime -14 2>/dev/null) vpsbackups@gameserver.noobcake.net: /mnt/storage-01/Mediatemp/backups/vpsbackups/
else
rsync --ignore-existing -vPe 'ssh -i freenas -p2200' --files-from=<(ssh -i ~/freenas -p2200 vpsbackups@gameserver.noobcake.net find ./backups -mtime -14 2>/dev/null) vpsbackups@gameserver.noobcake.net: /mnt/storage-01/Mediatemp/backups/vpsbackups/
fi
