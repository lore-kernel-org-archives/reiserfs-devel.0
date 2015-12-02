From: <doiggl@velocitynet.com.au>
Subject: reiser4progs and 'Wrong order of keys.'
Date: Wed, 02 Dec 2015 19:38:58 +1100
Message-ID: <8d72ce880d71d4fc8f2172f439e17661@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello,
Patch query:

If available, can you send me the patch for the reiser4progs 'bug in fsck:
it jumps to wrong branch for some reason' please.

I can apply and build here for a test build:
https://build.opensuse.org/package/show/home:doiggl/reiser4progs
https://build.opensuse.org/package/view_file/home:doiggl/reiser4progs/reiser4progs.spec?expand=1

I can test with a volume that has 'Wrong order of keys' on it.
see http://www.spinics.net/lists/reiserfs-devel/msg04206.html

I have details for:
-------------------
# fsck.reiser4 -V
fsck.reiser4 1.1.0
Format release: 4.0.1

# ll
      366 Oct 16 22:57 print-journal.log
      139 Oct 16 22:54 print-journal.log.gz
      235 Oct 16 23:08 print-oid.log
      354 Oct 16 20:48 print-super.log.gz
 37585433 Oct 16 22:14 print-tree.log.gz
      750 Oct 16 21:40 print-tree.short.log

# debugfs.reiser4 --help
Usage: debugfs.reiser4 [ options ] FILE

Print options:
  -s, --print-super             prints the both super blocks.
  -t, --print-tree              prints the whole tree.
  -j, --print-journal           prints journal.
  -d, --print-oid               prints oid allocator data.
  -a, --print-alloc             prints block allocator data.
  -b, --print-block N           prints block by its number.
  -n, --print-nodes FILE        prints all nodes file lies in.
  -i, --print-file FILE         prints all items specified file
                                consists of.         
      
# debugfs.reiser4 /dev/sdb
debugfs.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING. 

Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format plugin.
version:        1
magic:          ReIsEr40FoRmAt
mkfs id:        0x1ddaf754
flushes:        0
blocks:         488378640
free blocks:    217146980
root block:     37017218
tail policy:    0x2 (smart)
next oid:       0xedade
file count:     188313
tree height:    6
key policy:     LARGE

FS status block (21):
Some unknown status flags found: 2ll

Cheers Glenn

other info
----------
http://www.spinics.net/lists/reiserfs-devel/msg04206.html

