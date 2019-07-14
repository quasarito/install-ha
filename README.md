# Scripts to install Home Assistant

Shell scripts to install Home Assistant on Raspbian & Ubuntu.

Based on instructions here:
https://www.home-assistant.io/docs/installation/raspberry-pi/

## Running the script

By default, the installation script will install Home Assistant under the
user account `homeassistant` in the folder `/srv/homeassistant`.

Edit the `env-vars.sh` file and edit the values for `HA_USER` and `HA_INSTALL_DIR`
to change these defaults for your needs.

To install Home Assistant:
````
$ ./install-homeassistant.sh
````

To start Home Assistant automatically on boot:
````
$ ./install-systemd-ha.sh
````

To configure a ramdisk for swap and Home Assistant history:

Edit the file `zram-ha`, and edit the values for `ZRAM_SWAP_*` and `ZRAM_RAMDISK_*`
for your needs. The default values are reasonable defaults for a Raspberry Pi
with 1GB of RAM.
The `ZRAM_*_MEMLIMIT` value specifies how much RAM is to be used by `zram` for
the ram disk.
The `ZRAM_*_DISKSIZE` value specifies the storage size of the ram disk that will
reported by `zram` to the operating system. The default values assumes that the
compression ratio achieved will be at least 2:1. Realistically, it would be
higher, given the highly compressible nature of the history database.

````
$ ./install-zram.sh
````

## Updating Home Assistant to the latest version

````
$ ./update-homeassistant.sh
````
