From: Andreas Abele <aba@IZS.FhG.de>
Subject: Re: mkreiserfs and big RAID-Systems
Date: 15 Jul 2002 18:01:34 +0200
Message-ID: <1026748894.30600.39.camel@pallas.IZS.FhG.de>
References: <1026741573.30600.25.camel@pallas.IZS.FhG.de>
	<200207151639.03258.vitaly@namesys.com>
	<1026744912.30621.31.camel@pallas.IZS.FhG.de> 
	<200207151738.02786.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207151738.02786.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

> First of all get the latest reiserfsprogs-3.6.2 from our ftp site please 
> and try again.

Hi Vitaly,

i have built the 3.6.2-Progs and get the following behaviour:

1.) mkreiserfs -d /dev/sdf1 180000000 (less than 720 GB)
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
[root@saturn6 mkreiserfs]# ./mkreiserfs -d /dev/sdf1 180000000

<-------------mkreiserfs, 2002------------->
reiserfsprogs 3.6.2

mkreiserfs: Guessing about desired format.. 
mkreiserfs: Kernel 2.4.18 is running.
Block 16 (0x851) contains super block. Format 3.6 with standard journal
Count of blocks on the device: 180000000
Number of blocks consumed by mkreiserfs formatting process: 13705
Free blocks: 179986295
Blocksize: 4096
Hash function used to sort names: "r5"
Number of bitmaps: 5494
Root block: 8211
Tree height: 2
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x1162e2dd]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Filesystem state 0x0
sb_version 2
inode generation number: 0
UUID: df15b6bc-8c2f-484e-876b-9930cbcc3548
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
        ALL DATA WILL BE LOST ON '/dev/sdf1'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%
Syncing..ok

=>Everything seems to be okay until now.
2.) => Now the following command (bigger than 720 GB):

[root@saturn6 mkreiserfs]# ./mkreiserfs -d /dev/sdf1 190000000

<-------------mkreiserfs, 2002------------->
reiserfsprogs 3.6.2

mkreiserfs: Guessing about desired format.. 
mkreiserfs: Kernel 2.4.18 is running.
Block 16 (0x851) contains super block. Format 3.6 with standard journal
Count of blocks on the device: 190000000
Number of blocks consumed by mkreiserfs formatting process: 14010
Free blocks: 189985990
Blocksize: 4096
Hash function used to sort names: "r5"
Number of bitmaps: 5799
Root block: 8211
Tree height: 2
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x7457c150]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Filesystem state 0x0
sb_version 2
inode generation number: 0
UUID: 8e4a9fe8-1e96-47f3-9d2d-e5a7e05cc01f
ATTENTION: YOU SHOULD REBOOT AFTER FDISK!
        ALL DATA WILL BE LOST ON '/dev/sdf1'!
Continue (y/n):y
Initializing journal - 0%....20%....40%....60%....80%....100%

bread: Cannot read a block # 189999999.
Abgebrochen (core dumped)

=> the same behaviour with no filesize-param at the end.

any Ideas?

thanks
Andreas Abele


