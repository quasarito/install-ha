#!/bin/bash

source "`dirname $0`/env-vars.sh"

cd "$HA_INSTALL_DIR"
python3 -m venv .
source bin/activate
python3 -m pip install wheel
pip3 install homeassistant
