#!/bin/sh

if [ -e /etc/init.d/zram-ha ]; then
  echo "File /etc/init.d/zram-ha already exists. Skipped."
  exit 1
fi

cp zram-ha /etc/init.d
update-rc.d zram-ha defaults
