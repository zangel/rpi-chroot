# rpi-chroot

A set of scripts for setting up raspbian chroot directory for software development:

 - **make_chroot.sh**	creates the chroot image from a raspbian lite image;
 - **mount_chroot.sh** mounts the chroot image on mnt directory in current directory;
 - **umount_chroot.sh** unmounts the chroot image previously mounted by **mount_chroot.sh**
 - **chroot.sh** executes the preparet chroot directory and invokes commands passed to this script
 
