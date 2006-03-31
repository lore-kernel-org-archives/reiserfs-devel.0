From: "Sarath Menon" <sarathmenon@gmail.com>
Subject: fsck.reiser4 segfaults
Date: Fri, 31 Mar 2006 16:21:10 +0200
Message-ID: <932539950603310621m67305c9eg42492492b84767fc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28427-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I've been using reiser4 for more than a year without any problems. The
filesystem performance has been commendable to say the least.
Yesterday, I had to powercycle my pc (due to a dma hang with my cd
drive - happens occasionaly) and after the reboot, grub would not
load. I use a single root partition (/boot inclusive) and the patched
grub sources.

I've tried booting into knoppix and compiling reiser4progs and running an f=
sck.

This is what I get -:
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x3a4f3c7b
blocks:         2443880
free blocks:    428490
root block:     743745
tail policy:    0x2 (smart)
next oid:       0xf63a06
file count:     469920
tree height:    5
key policy:     LARGE


CHECKING STORAGE TREE
FSCK: Node (743744), item (0), unit (0): Points to the block (743745)
which is in the tree already.
The whole subtree is skipped.
Segmentation fault

debugfs.reiser4 also segfaults, and a mount also fails, it complians
of a duplicate key. (I can't post the exact message because the second
livecd doesn't have X or any mail client :(


Cheers,
Sarath

--
I presume, when you pronounce iptables, you say that you are peeing tables
