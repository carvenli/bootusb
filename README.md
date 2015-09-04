# 创建一个msdos分区表的UEFI可引导USB

参照两个帖子：
http://forum.ubuntu.org.cn/viewtopic.php?f=139&t=384120
http://forum.ubuntu.org.cn/viewtopic.php?t=393256

制作一个UEFI模式安装ubuntu和windows7,windows8的U盘
推荐使用Gparted图形化分区工具来操作


\\\假设为16GB USB

分区一 NTFS（msdos，不可引导，占用绝对比例空间）
分区二 FAT32（msdos，可引导，可启动，200MiB）




分区一（NTFS不可引导）
bootmgfw.efi（Windows7 Only，Windows8不需要）
iso/（存放ISO文件）

分区二（msdosFAT32可引导分区）
efi/boot/bootx64.efi(UEFI启动引导文件)
boot/grub/wzlboot.cfg(引导菜单)



把windows7或8官方原版光盘iso镜像中的文件解压缩，复制到U盘的较大分区（分区一，NTFS分区）的根目录下，如果是windows7还需要bootmgfw.efi同样放在根目录下




\\\假设为32GB USB

分区一 NTFS（msdos，不可引导，分配大致15GB空间）
分区二 FAT32（msdos，可引导，可启动，200MiB）
分区三 Ext4（实验性，分配剩余部分空间）


\\Tools目录说明
bootx64.efi.zip（bootx64.efi和用来制作的shell脚本，脚本运行需要管理员权限）
wzlboot.cfg.zip（引导菜单，在U盘NTFS分区里面，如果只有1个FAT32就放在里面，boot/grub/wzlboot.cfg）
bootmgfw.efi.zip（这个文件是提取自windows，但是提取比较麻烦就直接贴出来了）



\\\UEFI模式引导，测试U盘能否正常引导并且进入Windows10/Windows8.1/Windows7（包含PE）安装程序

\\\BIOS模式引导，测试U盘能否正常引导并且进入Linux/WindowsXP（包含PE）安装程序



# 增加GRUB引导，支持BIOS启动引导

\\\挂载

mount /dev/sdb1 /media/用户名/usb


\\\安装GRUB
grub-install --root-directory=/media/cry/usb /dev/sdb

\\\更新GRUB
update-grub


\\\BIOS模式引导，测试U盘能否正常引导并且进入Linux/WindowsXP（包含PE）安装程序










