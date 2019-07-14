#!/bin/bash

source "`dirname $0`/env-vars.sh"

# Create installation directory
if [ ! -d "$HA_INSTALL_DIR" ]; then
  echo Home Assistant installation not found: $HA_INSTALL_DIR
  exit 1
fi

sudo -u $HA_USER -H -s "`dirname $0`/update-as-ha.sh"
