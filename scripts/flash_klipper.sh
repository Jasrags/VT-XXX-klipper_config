#!/bin/bash
sudo service klipper stop
cd ~/klipper

# Flash MCU (OctoPro)
make clean KCONFIG_CONFIG=config.octo
make menuconfig KCONFIG_CONFIG=config.octo
make KCONFIG_CONFIG=config.octo
read -p "OctoPro firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
./scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_stm32f446xx_470027000550534E4E313120-if00 btt-skr-v1.4
read -p "OctoPro firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

# Flash MCU (Linux)
make clean KCONFIG_CONFIG=config.rpi
make menuconfig KCONFIG_CONFIG=config.rpi
make KCONFIG_CONFIG=config.rpi
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make flash KCONFIG_CONFIG=config.rpi
read -p "RPi firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

# Flash MCU (Expander)
# make clean KCONFIG_CONFIG=config.expander
# make menuconfig KCONFIG_CONFIG=config.expander
# make KCONFIG_CONFIG=config.expander
# read -p "Expander firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
# make flash KCONFIG_CONFIG=config.expander FLASH_DEVICE=0483:df11
# read -p "Expander firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

sudo service klipper start

# make clean KCONFIG_CONFIG=config.octo && make menuconfig KCONFIG_CONFIG=config.octo && make KCONFIG_CONFIG=config.octo