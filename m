From: <doiggl@velocitynet.com.au>
Subject: What commands can be done to analyze  and fix the r4 file system/meta-data [sdb]
Date: Sat, 16 Apr 2016 20:26:52 +1000
Message-ID: <017eab4fbb869c6829875f9049dff938@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Edward Shishkin <edward.shishkin@gmail.com>
reiserfs-devel@vger.kernel.org

Help needed with r4 meta-data analyze and fix [sdb]

Hello Edward,

- What commands can be done to analyze and fix the r4 file
system/meta-data ?
- What commands do you run against unpacked meta-data ?

Some questions:

1. How can r4 volume be mounted-accessed ?
2. Is their a patch available for reiser4progs  'Wrong order of keys'
using [reiser4progs-1.0.5-43.1.x86_64] ?

Thank you for any help the commands to run.
I cannot shrink r4 volume -dont see any tools to do that.
I know files and data are on disk but just trying to access it.

Thankyou Glenn

# fsck.reiser4 --build-fs  /dev/sdb shows:

Format super block (17): 
plugin:         format40 
description:    Disk-format plugin. 
version:        0 
magic:          ReIsEr40FoRmAt 
mkfs id:        0x1ddaf754 
flushes:        0 
blocks:         488378640 
free blocks:    217146980 
root block:     37017218 
tail policy:    0x2 (smart) 
next oid:       0xedade 
file count:     188,313 
tree height:    6 
key policy:     LARGE 

packed with
# debugfs.reiser4 -P /dev/sdb | bzip2 -9  > metadata-sdb.bz2

un-packed with
# bunzip2 metadata-sdb.bz2

un-packed size shows:

# ll
-rw-r--r-- 1 root users 24733058856 Nov 27 14:33 r4meta-sdb
24,733,058,856
= 24,733,057,832 MB (24,733,058,856 /1024)

#
# rpm -qa |grep -i reiser4 |sort
kernel-reiser4-4.1.6-7.1.gd2bbe7f.x86_64
libreiser4-1_0-5-1.0.5-43.1.x86_64
reiser4progs-1.0.5-43.1.x86_64

-version 
# debugfs.reiser4 -V
debugfs.reiser4 1.0.5
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

# lsmod |grep -i reiser
reiser4               442368  0 
reiserfs              245760  3 

- last check
[1]example of problem:
http://www.spinics.net/lists/reiserfs-devel/msg04577.html


other details
-------------
# debugfs.reiser4 -V
debugfs.reiser4 1.0.5
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

# fdisk -l

Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

# fsck.reiser4 -p  /dev/sdb 
Default profiles:
format:     "format40" (id:0x0 type:0x8)
journal:    "journal40" (id:0x0 type:0xf)
oid:        "oid40" (id:0x0 type:0x9)
alloc:      "alloc40" (id:0x0 type:0xe)
key:        "key_large" (id:0x1 type:0x10)
node:       "node40" (id:0x0 type:0x2)
statdata:   "stat40" (id:0x0 type:0x1)
nodeptr:    "nodeptr40" (id:0x3 type:0x1)
direntry:   "cde40" (id:0x2 type:0x1)
tail:       "plain40" (id:0x6 type:0x1)
extent:     "extent40" (id:0x5 type:0x1)
acl:        "absent (id:0x4 type:0x1)"
permission: "absent (id:0x0 type:0x6)"
regular:    "reg40" (id:0x0 type:0x0)
directory:  "dir40" (id:0x1 type:0x0)
symlink:    "sym40" (id:0x2 type:0x0)
special:    "spl40" (id:0x3 type:0x0)
hash:       "r5_hash" (id:0x1 type:0x3)
fibration:  "ext_1_fibre" (id:0x2 type:0x4)
formatting: "smart" (id:0x2 type:0x5)

# dmesg
[ 1183.248249] usb 1-2: new high-speed USB device number 6 using ehci-pci
[ 1183.382150] usb 1-2: New USB device found, idVendor=0984,
idProduct=0040
[ 1183.382162] usb 1-2: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[ 1183.382169] usb 1-2: Product: SATAWire        
[ 1183.382175] usb 1-2: Manufacturer: Apricorn
[ 1183.382180] usb 1-2: SerialNumber: 365644443230323820202020
[ 1183.383564] usb-storage 1-2:1.0: USB Mass Storage device detected
[ 1183.383843] scsi host5: usb-storage 1-2:1.0
[ 1184.381828] scsi 5:0:0:0: Direct-Access     Apricorn SATAWire        
1.08 PQ: 0 ANSI: 4
[ 1184.382421] sd 5:0:0:0: Attached scsi generic sg3 type 0
[ 1184.383702] sd 5:0:0:0: [sdb] 625142448 512-byte logical blocks: (320
GB/298 GiB)
[ 1184.384557] sd 5:0:0:0: [sdb] Write Protect is off
[ 1184.384573] sd 5:0:0:0: [sdb] Mode Sense: 23 00 00 00
[ 1184.387240] sd 5:0:0:0: [sdb] No Caching mode page found
[ 1184.387251] sd 5:0:0:0: [sdb] Assuming drive cache: write through
[ 1184.456480]  sdb: sdb1
[ 1184.460286] sd 5:0:0:0: [sdb] Attached SCSI disk
[ 1292.945362] REISERFS (device sdb1): found reiserfs format "3.6" with
standard journal
[ 1292.945394] REISERFS (device sdb1): using ordered data mode
[ 1292.945398] reiserfs: using flush barriers
[ 1292.960464] REISERFS (device sdb1): journal params: device sdb1, size
8192, journal first block 18, max trans len 1024, max batch 900, max commit
age 30, max trans age 30
[ 1292.961859] REISERFS (device sdb1): checking transaction log (sdb1)
[ 1293.019508] REISERFS (device sdb1): Using r5 hash to sort names
[ 1314.228504] Loading Reiser4 (format release: 4.0.1) See www.namesys.com
for a description of Reiser4.
[ 1314.233772] reiser4: sdb: found disk format 4.0.0.

[ 1424.752017] reiser4[mount(2571)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[ 1424.752035] reiser4[mount(2571)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)

- I restarted system again # dmesg shows:

[  202.699451] scsi 4:0:0:0: Direct-Access     ST320005 42AS              
  PQ: 0 ANSI: 2
[  202.700003] sd 4:0:0:0: Attached scsi generic sg2 type 0
[  202.704071] sd 4:0:0:0: [sdb] 3907029168 512-byte logical blocks: (2.00
TB/1.81 TiB)
[  202.707403] sd 4:0:0:0: [sdb] Write Protect is off
[  202.707413] sd 4:0:0:0: [sdb] Mode Sense: 38 00 00 00
[  202.710005] sd 4:0:0:0: [sdb] No Caching mode page found
[  202.710012] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[  202.743968] sd 4:0:0:0: [sdb] Attached SCSI disk
[  303.775565] Loading Reiser4 (format release: 4.0.1) See www.namesys.com
for a description of Reiser4.
[  303.781081] reiser4: sdb: found disk format 4.0.1.
[  303.781244] reiser4: sdb: use 'fsck.reiser4 --fix' to complete disk
format upgrade.
[  414.131150] reiser4[mount(1988)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
[  414.131163] reiser4[mount(1988)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:510)[nikita-717]:
WARNING: Error for inode 42 (-2)

