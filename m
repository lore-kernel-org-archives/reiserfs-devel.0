From: Klaus Dieter Wolfinger <kd.wolfinger@gmx.de>
Subject: Problems with reiserfs partition after systemcrash -- I need help
Date: Thu, 1 May 2003 19:19:44 +0200
Message-ID: <200305011848.48027.kd.wolfinger@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13917-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello experts,
after a systemcrash I can't mount a partition (hdb2) with reiserfs.

Technical details:
reiserfsck 3.6.2 (2002)
SuSE Linux 8.1; Kernel 2.4


#> reiserfsck --rebuild-sb /dev/hdb2
Count of blocks on the device: 1636621
Number of bitmaps: 50
Blocksize: 4096
Free blocks (....): 393153
Root block: 33419
Filesystem is NOT clean
Tree height: 5
=2E
=2E
=2E
=2E
Superblock seems to be correct

#> reiserfsck --rebuild-tree /dev/hdb2

pass0 -> interrupts with the message:
cannot read block 12252

badblocks -b 4096 /dev/hdb2
98
99
=2E.... long list of numbers

23954
=2E
23966

-----------------------------------------------
Is it possible to retrieve the data on this partition ?

thanks a lot in advance
with best regards
Klaus Dieter Wolfinger
--
kd.wolfinger@gmx.de

