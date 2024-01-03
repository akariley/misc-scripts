#!/usr/bin/env bash
# check if we're running today.
# https://stackoverflow.com/questions/24777597/value-too-great-for-base-error-token-is-08

# do maint tasks.

find ~/rust/serverfiles/oxide/logs/ -type f -iname '*.txt' -mtime +28 -delete >/dev/null 2>&1
find ~/rust/serverfiles/oxide/logs/ -type d -mtime +28 -empty -delete >/dev/null 2>&1
