#! /bin/bash

# Dependencias
sudo apt-get install qemu-system
sudo apt-get install unzip

# Referencias: http://xecdesign.com/qemu-emulating-raspberry-pi-the-easy-way/
mkdir ~/qemu_vms/
cd ~/qemu_vms/
# mv ~/downloads/2013-09-25-wheezy-raspbian.zip .
unzip 2013-09-25-wheezy-raspbian.zip
# Download do Kernel
wget http://xecdesign.com/downloads/linux-qemu/kernel-qemu

# Referencias: http://www.raspberrypi.org/phpBB3/viewtopic.php?f=29&t=37386
# dd if=/dev/zero of=2013-09-25-wheezy-raspbian.img bs=1024000 conv=notrunc seek=4000 count=1

sudo mount ~/qemu_vms/2013-09-25-wheezy-raspbian.img -o offset=62914560 /mnt
sudo vim /mnt/etc/ld.so.preload
# Comment out the line in the file (use a # as the first character of the line) and save the file.
sudo umount /mnt

# qemu-system-arm -cpu arm1176 -kernel kernel-v13-qemu-130323 -name 'builder-raspi' -hda 2013-09-25-wheezy-raspbian.img -m 256 -M versatilepb -no-reboot -serial stdio -net vde,sock=/var/run/vde2/tap0.ctl -net nic -append “root=/dev/sda2 panic=0 ro single”
# qemu-system-arm -kernel kernel-qemu -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1" -hda 2013-09-25-wheezy-raspbian.img -redir tcp:5022::22
qemu-system-arm -kernel kernel-qemu -cpu arm1176 -m 256 -M versatilepb -no-reboot -serial stdio -append "root=/dev/sda2 panic=1" -hda 2013-09-25-wheezy-raspbian.img &
