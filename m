From: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Subject: ReiserFS V3 and linux-kernel-2.6
Date: Wed, 9 Feb 2005 11:05:14 +0200
Message-ID: <139119350.20050209110514@kgpa.ru>
Reply-To: "Oleg O. Ossovitskii" <oleg@kgpa.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS-List <reiserfs-list@namesys.com>

Hello!


I run self compiled kernel 2.4.27 w/devfs and want to upgrade to
2.6.10 w/devfs. All kernels without using initrd

/dev/hdc2 - /boot - ext2
/dev/hdc8 - /     - ReiserFS V3

gcc 3.4.3, modultils-2.4.21, glibc-2.3.4

I installed
  module-init-tools-3.1.tar.bz2
  sysfsutils-1.1.0.tar.bz2
  hotplug-2004_09_23.tar.bz2
  udev-051

  and all that I found in Changes from kernel-2.6.10

  In the grub config i have:

  --------------------------------
  # For booting GNU/Linux
  title  GNU/Linux-2.6.x
  kernel (hd0,1)/vmlinuz root=/dev/hdc8 rw devfs=mount

  title  GNU/Linux-2.4.x
  kernel (hd0,1)/vmlinuz-2.4 root=/dev/hdc8 rw devfs=mount
 ----------------------------------

  I can boot into 2.4.x kernel, but when I try to boot to 2.6.10
  kernel I get error message & kernel panic:


  VFS: Cannot open root device "hdc8" or unknown-block(0,0)
  Please append a correct "root=" boot option
  Kernel panic - not syncing: VFS: Unable to mount root fs on
  unknown-block(0,0)
 

  Here is parts of my kernel config:
  ---------------------------------------------
  .....
#
# File systems
#
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
# CONFIG_EXT2_FS_POSIX_ACL is not set
# CONFIG_EXT2_FS_SECURITY is not set
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_XATTR=y
# CONFIG_EXT3_FS_POSIX_ACL is not set
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_JBD=y
# CONFIG_JBD_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=y
CONFIG_REISERFS_FS_XATTR=y
# CONFIG_REISERFS_FS_POSIX_ACL is not set
# CONFIG_REISERFS_FS_SECURITY is not set
CONFIG_JFS_FS=m
# CONFIG_JFS_POSIX_ACL is not set
# CONFIG_JFS_DEBUG is not set
# CONFIG_JFS_STATISTICS is not set
CONFIG_XFS_FS=m
# CONFIG_XFS_RT is not set
# CONFIG_XFS_QUOTA is not set
# CONFIG_XFS_SECURITY is not set
# CONFIG_XFS_POSIX_ACL is not set
CONFIG_MINIX_FS=m
CONFIG_ROMFS_FS=m
# CONFIG_QUOTA is not set
CONFIG_DNOTIFY=y
# CONFIG_AUTOFS_FS is not set
CONFIG_AUTOFS4_FS=y
  ......

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_SYSFS=y
CONFIG_DEVFS_FS=y
# CONFIG_DEVFS_MOUNT is not set
# CONFIG_DEVFS_DEBUG is not set
CONFIG_DEVPTS_FS_XATTR=y
# CONFIG_DEVPTS_FS_SECURITY is not set
CONFIG_TMPFS=y
CONFIG_TMPFS_XATTR=y
# CONFIG_TMPFS_SECURITY is not set
# CONFIG_HUGETLBFS is not set
# CONFIG_HUGETLB_PAGE is not set
CONFIG_RAMFS=y
 
  ---------------------------------------------


  What should I do additionally, for using RieserFS V3 with
  kernel-2.6?

  Should I enable CONFIG_REISERFS_FS_XATTR ?
 
---
Best regards, Oleg O. Ossovitskii
chief programmer, KGPA Ltd, West Russia, Kaliningrad (Koenigsberg)
mailto:oleg@kgpa.ru, icq# 33366588

