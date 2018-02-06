#!/bin/bash

clear
echo "This script will be about disk and filesystems"
echo "First let look at the Linux disk Partition"
fdisk -l
sleep 4
clear
echo "Now let look inside a partition and the partition table"
parted -l
sleep 4
echo "Now let create a file "
cd /home/user/
dd if=/dev/zero of=./32MB.img bs=1M count=32
sleep 4
echo "Now let create a filesystem"
mkfs -t ext2 ./32MB.img
ls -l /sbin/mkfs.*
echo "Now it's time to mount the filesystem that just been created"
mkdir /mnt/tmp
sudo mount ./32MB.img /mnt/tmp
sleep 3
df -h
sleep 3
echo "now let see the information about the block device"
lsblk
sleep 4
clear
echo "Let create text file and put in there"
echo "Week 4 script" > ./file.txt
echo "let unmount the filesystem"
sudo umount /mnt/tmp
clear
echo "Now let make some swap space"
dd if=/dev/zero of=./10MB.swap bs=1M count=10
mkswap ./10MB.swap
echo "Now give permission to the sawp file"
sudo chmod 0600 10MB.swap; sudo chown root 10MB.swap
free
sleep 5
clear
echo "Now make inode file"
cd /tmp
mkdir abc1 abc2
echo "a" > abc1/file1
echo "b" > abc1/file2
echo "c" > abc1/file3
echo "d" > abc2/file4
ln abc1/abc3 abc2/file5
echo "Now let look at files that have been just create"
ls -iR abc*
