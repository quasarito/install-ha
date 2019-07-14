#!/bin/bash

source "`dirname $0`/env-vars.sh"

SERVICE_FILE=/etc/systemd/system/home-assistant@$HA_USER.service
if [ -e $SERVICE_FILE ]; then
  echo "systemd service file already exists: $SERVICE_FILE"
  exit
fi

echo "Creating $SERVICE_FILE"
echo "[Unit]" > $SERVICE_FILE
echo "Description=Home Assistant" >> $SERVICE_FILE
echo "After=network-online.target" >> $SERVICE_FILE
echo "[Service]" >> $SERVICE_FILE
echo "Type=simple" >> $SERVICE_FILE
echo "User=%i" >> $SERVICE_FILE
echo "ExecStart=/srv/homeassistant/bin/hass -c \"/home/$HA_USER/.homeassistant\"" >> $SERVICE_FILE
echo "[Install]" >> $SERVICE_FILE
echo "WantedBy=multi-user.target" >> $SERVICE_FILE

systemctl --system daemon-reload
systemctl enable home-assistant@$HA_USER
