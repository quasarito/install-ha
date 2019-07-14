#!/bin/bash

source "`dirname $0`/env-vars.sh"

# Check if ha is still running
ps -C hass
if [ "$?" = "0" ]; then
  echo "Home Assistant needs to be stopped first"
  exit 1
fi

cd "$HA_INSTALL_DIR"
python3 -m venv .
source bin/activate
python3 -m pip install wheel
pip3 install --upgrade homeassistant
echo "To restart Home Assistant, run:"
echo " sudo systemctl start home-assistant@"$HA_USER
