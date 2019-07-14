# User account that will run homeassistant
HA_USER=homeassistant
# Groups that HA_USER will be associated
HA_USER_GROUPS=dialout
if [ $(getent group gpio) ]; then
  HA_USER_GROUPS=$HA_USER_GROUPS,gpio
fi
# Installation directory of homeassistant
HA_INSTALL_DIR=/srv/homeassistant
