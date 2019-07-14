#!/bin/bash

source "`dirname $0`/env-vars.sh"

# Install dependencies
apt-get install python3 python3-venv python3-pip libffi-dev libssl-dev

# Create HA user
useradd -rm $HA_USER -G $HA_USER_GROUPS

# Create installation directory
if [ ! -d "$HA_INSTALL_DIR" ]; then
  mkdir -p "$HA_INSTALL_DIR"
  chown $HA_USER:$HA_USER "$HA_INSTALL_DIR"
else
  echo "Installation directory already exists: $HA_INSTALL_DIR"
fi

sudo -u $HA_USER -H -s "`dirname $0`/install-as-ha.sh"
