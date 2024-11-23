#! /usr/bin/env bash

if test -v $1; then
    echo 'usage: flash_qmk.sh firmware [chip-type]'
    exit 1
fi

if ! test -f /etc/udev/rules.d/50-qmk.rules; then
    read -p 'qmk rules are missing. Download? [N/y]' $perm
    if [[ $perm != 'y' && $perm != 'Y' ]]; then
        exit 1
    fi
    
    curl https://raw.githubusercontent.com/qmk/qmk_firmware/master/util/udev/50-qmk.rules -s -o /tmp/50-qmk.rules
    # pretty sure this should already exist but just in case...
    sudo mkdir -p /etc/udev/rules.d
    sudo mv /tmp/50-qmk.rules /etc/udev/rules.d/
    sudo udevadm control --reload-rules
    sudo udevadm trigger
fi

mcu=${2:-atmega32u4}

if ! dfu-programmer atmega32u4 get &>/dev/null; then
    echo "no $mcu devices in bootloader mode!"
    exit 1
fi
echo $device

cowsay 'WARNING: DO NOT disconnect the keyboard until this process is finished. I am NOT fucking around. Your shit will be screwed up silly style if you do not listen to me.'

dfu-programmer $mcu erase --force
dfu-programmer $mcu flash $1
dfu-programmer $mcu reset
