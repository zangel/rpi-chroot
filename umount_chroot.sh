#!/bin/bash

mydir="${0%/*}"

if [ ! -d "mnt/dev" ]
then
	echo "you have no mounted chroot environment!"
	exit
fi

echo -e "\nunmounting dev, sys, proc, and dev/pts ..." 
sudo umount mnt/dev/pts
sudo umount mnt/dev
sudo umount mnt/sys
sudo umount mnt/proc

echo -e "\nunmounting rootfs ..."
sudo umount mnt

echo -e "\nremoving loop device from raspbian lite image ..."
sudo losetup -d /dev/loop0
