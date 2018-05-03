#!/bin/bash

echo -e "\ninstalling neccessary tools ..."
sudo apt-get install -y qemu qemu-user-static binfmt-support aria2 cloud-guest-utils


mkdir -p img
cd img

echo -e "\ndownloading the raspbian lite image ..."
aria2c -x 4 http://director.downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2018-04-19/2018-04-18-raspbian-stretch-lite.zip

echo -e "\nunzipping the raspbian lite image ..."
unzip 2018-04-18-raspbian-stretch-lite.zip

echo -e "\nadding some free space to raspbian lite image ..."
dd if=/dev/zero bs=1M count=2048 >> 2018-04-18-raspbian-stretch-lite.img

echo -e "\ncreating a loop device from raspbian lite image ..."
sudo losetup -f -P --show 2018-04-18-raspbian-stretch-lite.img

echo -e "\ngrowing rootfs partition ..."
sudo growpart /dev/loop0 2

echo -e "\nchecking rootfs partition ..."
sudo e2fsck -f /dev/loop0p2

echo -e "\nresizing rootfs partition ..."
sudo resize2fs /dev/loop0p2

cd ..

mkdir -p mnt

echo -e "\nmounting the rootfs partition on $PWD/mnt ..."
sudo mount /dev/loop0p2 -o rw mnt

echo -e "\nfixing ld.so.preload ..."
sudo sed -i 's/^/#/g' mnt/etc/ld.so.preload

echo -e "\ncopying qemu to rootfs ..."
sudo cp /usr/bin/qemu-arm-static mnt/usr/bin

echo -e "\nmounting dev, sys, proc, and dev/pts ..." 
sudo mount --bind /dev mnt/dev/
sudo mount --bind /sys mnt/sys/
sudo mount --bind /proc mnt/proc/
sudo mount --bind /dev/pts mnt/dev/pts

sudo chroot mnt sudo apt-get install -y libpoco-dev libboost-dev qt5-default libboost-log-dev libboost-date-time-dev libboost-thread-dev libboost-filesystem-dev libeigen3-dev liblz4-dev libjpeg62-turbo-dev libopencv-dev libglew-dev libpng-dev libunwind-dev


echo -e "\nunmounting dev, sys, proc, and dev/pts ..." 
sudo umount mnt/dev/pts
sudo umount mnt/dev
sudo umount mnt/sys
sudo umount mnt/proc

echo -e "\nunmounting rootfs ..."
sudo umount mnt

echo -e "\nremoving loop device from raspbian lite image ..."
sudo losetup -d /dev/loop0

