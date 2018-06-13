#!/bin/bash

pushd initramfs
find . | cpio --create --format='newc' >  ../initramfs.cpio
popd

gzip -f initramfs.cpio && mkimage -n "XO" -A arm -O linux -T ramdisk -C gzip -d initramfs.cpio.gz initramfs.cpio.gz.uboot

