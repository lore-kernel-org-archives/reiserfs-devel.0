From: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>
Subject: Re: Partial data loss with reiserfs3
Date: Tue, 15 Feb 2005 11:33:42 +0200
Message-ID: <1108460022.4211c1f65609a@webmail.vu.lt>
References: <1108315756.420f8e6ce67b0@webmail.vu.lt> <200502141921.58903.vitaly@namesys.com> <1108399109.4210d40511ea6@webmail.vu.lt> <200502142008.32009.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502142008.32009.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Laurynas Biveinis <Laurynas.Biveinis@mif.vu.lt>, reiserfs-list@namesys.com

Cituojant Vitaly Fertman <vitaly@namesys.com>:

Hello,

> then meant before. ok, if you did not run fdisk between boot and 
> mkreiserfs, then mount, copy, umount were probably fine.

It is possible that I had created, copied, destroyed partitions since
last boot - but no repartitioning.

> after that you run fidsk -- have you run 'reiserfsck --rebuild-sb'
> after fdisk? 

I've never run 'reiserfsck --rebuild-sb'.

> what does 
> 	debugreiserfs /dev/hda6
> say?

[root@laurynas-pc ~]# debugreiserfs /dev/hda6
debugreiserfs 3.6.18 (2003 www.namesys.com)


Filesystem state: consistent

Reiserfs super block in block 16 on 0x306 of format 3.6 with standard
journal
Count of blocks on the device: 1741036
Number of bitmaps: 54
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks):1696533
Root block: 8212
Filesystem marked as cleanly umounted
Tree height: 3
Hash function used to sort names: "r5"
Objectid map size 78, max 972
Journal parameters:
        Device [0x0]
        Magic [0x5bf05c25]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 55
UUID: 11f4d25b-4b80-4dc7-8cd9-32dcd376dce4
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN


> what version of reiserfsprogs do you use?

3.6.18

--
Thanks,
Laurynas

