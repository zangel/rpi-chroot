#!/bin/bash

mydir="${0%/*}"

if [ ! -d "mnt/dev" ]
then
	echo "you have no mounted chroot environment, mount it first!"
	exit
fi

sudo chroot mnt $@
