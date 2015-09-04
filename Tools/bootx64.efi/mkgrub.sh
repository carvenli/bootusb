#!/bin/sh
format_set="x86_64-efi"
rm bootx64.efi 1> /dev/null
rm memdisk.img 1> /dev/null
dd if=/dev/zero of=memdisk.img bs=1K count=8192
mkfs.ext2 memdisk.img
mkdir /tmp/1 2> /dev/null
mount -o loop memdisk.img /tmp/1
mkdir /tmp/1/boot
mkdir /tmp/1/boot/grub
mkdir /tmp/1/boot/grub/locale
cp /usr/lib/grub/$format_set/*.mod /tmp/1/boot/grub/
cp /usr/lib/grub/$format_set/*.lst /tmp/1/boot/grub/
cp grub.cfg /tmp/1/boot/grub/
cp /usr/share/grub/unicode.pf2 /tmp/1/boot/grub/
cp /boot/grub/locale/* /tmp/1/boot/grub/locale
umount /tmp/1 1> /dev/null
grub-mkimage -O $format_set -o bootx64.efi --memdisk=memdisk.img --prefix='(memdisk)/boot/grub' memdisk loopback ext2
