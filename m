From: Stefan Schweizer <sschweizer@gmail.com>
Subject: Grub segfaults when trying to access reiser4
Date: Mon, 26 Jul 2004 23:50:08 +0200
Message-ID: <e7963922040726145045bdb0cd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19827-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I managed to patch grub with your reiser4 patches, but it does not
work. I can see the partition but I cannot access any files on it. If
I try it segfaults. What am I doing wrong or is this a known issue?

grub> kernel (hd0,
 Possible partitions are:
   Partition num: 0,  Filesystem type is reiser4, partition type 0x83
   Partition num: 1,  Filesystem type unknown, partition type 0x82
   Partition num: 2,  Filesystem type unknown, partition type 0x83
   Partition num: 3,  Filesystem type is ext2fs, partition type 0x83

grub> kernel (hd0,0)/Segmentation Fault
/home # 

(I only pressed [tab] and had to add the / manually before)

Grub versions tested: 0.94, 0.95
Kernel Version: 2.6.8-rc2
Reiser4progs Version: 0.5.6
libaal Version: 0.5.3

Thanks in advance,

Stefan Schweizer
