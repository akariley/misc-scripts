#!/bin/bash
if [[ $1 == '--dry-run' ]]
then
rsync --dry-run --ignore-existing -vPe 'ssh -i /root/freenas -p2200' --files-from=<(ssh -i /root/freenas -p2200 root@gameserver.noobcake.net find /game-backups/ -mtime -7 2>/dev/null) root@gameserver.noobcake.net:/ /mnt/storage-01/Mediatemp/backups/game-backups/
else
rsync --ignore-existing -vPe 'ssh -i /root/freenas -p2200' --files-from=<(ssh -i /root/freenas -p2200 root@gameserver.noobcake.net find /game-backups/ -mtime -7 2>/dev/null) root@gameserver.noobcake.net:/ /mnt/storage-01/Mediatemp/backups/game-backups/
fi
