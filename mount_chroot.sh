#!/bin/bash

mydir="${0%/*}"

if [ -d "mnt/dev" ]
then
	echo "it seems you already have a mounted chroot environment, please unmount it first!"
	exit
fi

echo -e "\ncreating a loop device from raspbian lite image ..."
sudo losetup -f -P --show img/2018-04-18-raspbian-stretch-lite.img

echo -e "\nmounting the rootfs partition on $PWD/mnt ..."
sudo mount /dev/loop0p2 -o rw mnt

echo -e "\nmounting dev, sys, proc, and dev/pts ..." 
sudo mount --bind /dev mnt/dev/
sudo mount --bind /sys mnt/sys/
sudo mount --bind /proc mnt/proc/
sudo mount --bind /dev/pts mnt/dev/pts

