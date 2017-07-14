From: <doiggl@velocitynet.com.au>
Subject: Anyone know to fix "Exiting after unrecoverable error." using mkfs -t reiserfs /dev/sdbX
Date: Fri, 14 Jul 2017 20:46:48 +1000
Message-ID: <7e71024c79157640844bd4a628256909@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello.
Anyone know to fix "Exiting after unrecoverable error." using mkfs -t
reiserfs /dev/sdb3
using mkfs.reiserfs 3.6.25

-error is repeatable:

--Glenn


# strace -e open mkfs -V -t reiserfs /dev/sdb3
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No
such file or directory)
open("/usr/share/locale/locale.alias", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib/locale/en_US.UTF-8/LC_CTYPE", O_RDONLY|O_CLOEXEC) = -1
ENOENT (No such file or directory)
open("/usr/lib/locale/en_US.utf8/LC_CTYPE", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/gconv/gconv-modules.cache", O_RDONLY) = 3
mkfs from util-linux 2.23.2
mkfs.reiserfs /dev/sdb3 
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/libreiserfscore.so.0", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libcom_err.so.2", O_RDONLY|O_CLOEXEC) = 3
open("/usr/lib64/libuuid.so.1", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
open("/lib64/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
mkfs.reiserfs 3.6.25

open("/dev/sdb3", O_RDONLY)             = 3
open("/proc/mounts", O_RDONLY|O_CLOEXEC) = 3
open("/etc/mtab", O_RDONLY|O_CLOEXEC)   = 3
Guessing about desired format.. Kernel 4.9.0-3-vanilla is running.
open("/dev/sdb3", O_RDONLY)             = 3
open("/dev/sdb3", O_RDWR|O_EXCL)        = 3
open("/dev/sdb3", O_RDWR)               = 4
open("/dev/urandom", O_RDONLY|O_CLOEXEC) = 5
Format 3.6 with standard journal
Count of blocks on the device: 7079168
Number of blocks consumed by mkreiserfs formatting process: 8428
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: e6999e40-3421-4ddd-9033-d05a038746a6
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
        ALL DATA WILL BE LOST ON '/dev/sdb3'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Exiting after unrecoverable error.
+++ exited with 1 +++

#
# Tried ext4 -process worked.
#

# mkfs -t ext4 /dev/sdb3
mke2fs 1.42.8 (20-Jun-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
1770720 inodes, 7079168 blocks
353958 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=4294967296
217 block groups
32768 blocks per group, 32768 fragments per group
8160 inodes per group
Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
2654208, 
        4096000

Allocating group tables: done                            
Writing inode tables: done                            
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done   

# mount /dev/sdb3   /media/disk3
# umount /dev/sdb3

# Tried reiserfs again -process failed.

# mkfs -t reiserfs /dev/sdb3
mkfs.reiserfs 3.6.25

Guessing about desired format.. Kernel 4.9.0-3-vanilla is running.
Format 3.6 with standard journal
Count of blocks on the device: 7079168
Number of blocks consumed by mkreiserfs formatting process: 8428
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: d867e985-b90a-438d-ba8d-e5a2e4bf699f
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
        ALL DATA WILL BE LOST ON '/dev/sdb3'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Exiting after unrecoverable error.

