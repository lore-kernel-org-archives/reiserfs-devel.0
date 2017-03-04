From: <doiggl@velocitynet.com.au>
Subject: determine last used block on reiser4 volume to allow [truncate] of r4 volume query [sdb2]
Date: Sat, 04 Mar 2017 17:09:13 +1100
Message-ID: <6bc2296553663ee9a710b42702a4a04f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hello,
q01 - Could this method be used to find the last used block on reiser4
volume to allow [truncate] of volume ?
q02 - what tools or commands can be used to truncate reiser4 partition 
past the last used  block ?

thanks
--Glenn

Steps used:

Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes
255 heads, 63 sectors/track, 243201 cylinders, total 3907029168 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x0009a8dd

# fdisk -l

   Device Boot      Start         End      Blocks   Id  System\
/dev/sdb2      3221225472  3907028991   342901760   83  Linux



example: mount volume and find accessible files 
# mount /dev/sdb2 /media/disk2

# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdb2       311G  109G  203G  35% /media/disk2


# ll /media/disk2
total 113430164
-rw-r--r-- 1 root root 116148741254 Feb 28 21:12 r4files-sdb.tgz
-rw-r--r-- 1 root root      2466549 Mar  4 00:45 reiser4-for-4.10.0.patch
-rw-r--r-- 1 root root       625844 Mar  4 00:45
reiser4-for-4.10.0.patch.gz
-rw-r--r-- 1 root root       625387 Mar  4 00:49
reiser4-for-4.9.3.patch.gz

# cd /media/disk2
find . |sort > /tmp/files-on-volume.txt



#  cat /tmp/files-on-volume.txt
.
./r4files-sdb.tgz
./reiser4-for-4.10.0.patch
./reiser4-for-4.10.0.patch.gz
./reiser4-for-4.9.3.patch.gz

# cd /tmp
/tmp # umount /dev/sdb2


# debugfs.reiser4 /dev/sdb2  --print-nodes r4files-sdb.tgz >
/tmp/print-nodes.txt
debugfs.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

# debugfs.reiser4 /dev/sdb2  --print-nodes r4files-sdb.tgz |grep -i
"UNITS="                >  /tmp/print-nodes-units.txt
# debugfs.reiser4 /dev/sdb2  --print-nodes r4files-sdb.tgz |grep -i
"UNITS="  | cut -c12-  |sed 's/char//g' 

# debugfs.reiser4 /dev/sdb2  --print-super
debugfs.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           139d06a8-1886-44a0-a058-8f9da1ab88cf
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format plugin.
version:        1
magic:          ReIsEr40FoRmAt
mkfs id:        0x14b9244f
flushes:        0
blocks:         85725440
free blocks:    57365574
root block:     28395039
tail policy:    0x2 (smart)
next oid:       0x10004
file count:     5
tree height:    3
key policy:     LARGE

FS status block (21):
FS marked consistent


#
# debugfs.reiser4 /dev/sdb2  --print-nodes r4files-sdb.tgz |grep -i
"UNITS="  | cut -c12-  | sed 's/ /\n/g'  |hesd 
debugfs.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

36925(28547)
65474(32734)
98209(32735)
130946(32734)
163681(32735)
196418(32734)
229153(32735)
261889(32735)
294626(32734)
327361(32735)

# debugfs.reiser4 /dev/sdb2  --print-nodes r4files-sdb.tgz |grep -i
"UNITS="  | cut -c12-  | sed 's/ /\n/g'  | cut -d"(" -f1 |head
debugfs.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

36925
65474
98209
130946
163681
196418
229153
261889
294626
327361



-last used block
# debugfs.reiser4 /dev/sdb2  --print-nodes r4files-sdb.tgz |grep -i
"UNITS="  | cut -c12-  | sed 's/ /\n/g'  | cut -d"(" -f1 |tail
debugfs.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

28120225
28152961
28185697
28187399
28218433
28251169
28283905
28316641
28349377
28382113


# debugfs.reiser4 /dev/sdb2  --print-nodes reiser4-for-4.10.0.patch   
|grep -i "UNITS="  | cut -c12-  | sed 's/ /\n/g'  | cut -d"(" -f1 |tail
debugfs.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 
#

# debugfs.reiser4 /dev/sdb2  --print-nodes reiser4-for-4.9.3.patch.gz 
|grep -i "UNITS="  | cut -c12-  | sed 's/ /\n/g'  | cut -d"(" -f1 |tail
debugfs.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

394733
394886




- block calculations
--------------------

blocks:         85725440
free blocks:    57365574
last block used 28382113

total blocks for r4 volume - last block used on r4 volume 

85725440 - 28382113


85,725,440 -
28,382,113
----------
57,343,327
----------


volume could shrink to minimum of total blocks for r4 volume - (last block
used on r4 volume  + 1 ) = [28382114]
no r4 used blocks need to be altered or moved,

-Is this correct ?
Thanks
--Glenn
