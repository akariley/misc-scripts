#!/bin/bash
/usr/bin/certbot -n renew
touch /home/rust-pve/.restart.filebrowser
chown rust-pve:rust-pve /home/rust-pve/.restart.filebrowser
touch /home/rust-pve-2/.restart.filebrowser
chown rust-pve-2:rust-pve-2 /home/rust-pve-2/.restart.filebrowser
