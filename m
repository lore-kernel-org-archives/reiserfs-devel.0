From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: fsck.reiser4 problem (was: reiser4 corruption problem)
Date: Tue, 31 Aug 2004 14:37:04 +0200
Message-ID: <413470F0.70609@dermichi.com>
References: <20040831012446.631CB15E2E@mail03.powweb.com>	 <200408311209.43653.IOBuf@gmx.de> <1093955415.2716.476.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21154-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093955415.2716.476.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>

> Would you, please, provide exact sequences of operations which confuses
> reiser4?

very simple:

criminal mnt # mkfs.reiser4 /dev/sda1
mkfs.reiser4 1.0.0
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

Block size 4096 will be used.
Linux 2.6.8.1-mm2 is detected.
Uuid 7219a23f-d1ad-4baf-aa90-4194418af02f will be used.
Reiser4 is going to be created on /dev/sda1.
(Yes/No): y
Creating reiser4 on /dev/sda1 ... done
criminal mnt # mount /dev/sda1 tmp/
criminal mnt # ls
backup      cdrecorder  diff.txt       dvdrom  mp3            tmp
cardreader  cdrom       diff_fsck.txt  floppy  myfilesonline  windows
criminal mnt # cd tmp/
criminal tmp # ls
criminal tmp # touch BewerbungF=FCrAnwaltsb=FCro.doc
criminal tmp # ls
BewerbungF=FCrAnwaltsb=FCro.doc
criminal tmp # cd ..
criminal mnt # umount tmp/
criminal mnt # fsck.reiser4 /dev/sda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda1 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): y
***** fsck.reiser4 started at Tue Aug 31 14:34:46 2004
Reiser4 journal (journal40) on /dev/sda1: 0 transactions replayed of the=20
total 0blocks.
Reiser4 fs was detected on /dev/sda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           7219a23f-d1ad-4baf-aa90-4194418af02f
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 1.0.0
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x48d945af
blocks:         31271
free blocks:    31246
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10001
file count:     1
tree height:    2
key policy:     LARGE


CHECKING STORAGE TREE
         Read nodes 2
         Nodes left in the tree 2
                 Leaves of them 1, Twigs of them 1
         Time interval: Tue Aug 31 14:34:46 2004 - Tue Aug 31 14:34:46 2004
CHECKING EXTENT REGIONS.
         Read twigs 1
         Time interval: Tue Aug 31 14:34:46 2004 - Tue Aug 31 14:34:46 2004
CHECKING SEMANTIC TREE
FSCK: Directory [29:0:2a] (dir40), node [24], item [1], unit [2]: entry has
wrong offset [2a:0(NAME):142657765726275:6e6746fc72416e77:135160352fe624].
Should be [2a:0(NAME):142657765726275:6e6746fc72416e77:13514d8cfe19f4].
         Found 1 objects.
         Time interval: Tue Aug 31 14:34:46 2004 - Tue Aug 31 14:34:46 2004
***** fsck.reiser4 finished at Tue Aug 31 14:34:46 2004
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs=20
option to fix them.


that's enough...
Michael
