#! /bin/bash

mkdir raspbian
cd  raspbian

read -p "Do you want do download an image? [y/n]" answer
if [[ $answer = y ]] ; then
    wget http://downloads.raspberrypi.org/raspbian_latest
    wget http://xecdesign.com/downloads/linux-qemu/kernel-qemu 
fi


unzip '*.zip'
qemu-img *.img +2G

sudo mount *.img -o offset=62914560 /mnt

sudo echo "#/usr/lib/arm-linux-gnueabihf/libcofi_rpi.so" > /mnt/etc/ld.so.preload
sudo echo "KERNEL==\"sda\", SYMLINK+=\"mmcblk0\"" > /mnt/etc/udev/rules.d/90-qemu.rules
sudo echo "KERNEL==\"sda?\", SYMLINK+=\"mmcblk0p%n\"," >> /mnt/etc/udev/rules.d/90-qemu.rules
sudo sync

sudo umount /mnt
