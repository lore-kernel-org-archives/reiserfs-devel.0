From: Paolo Correnti <paolunix@yahoo.com>
Subject: REISER4 - A simple test with a filesystem and Oracle
Date: Fri, 16 Jan 2004 05:04:06 -0800 (PST)
Message-ID: <20040116130406.64681.qmail@web21507.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16542-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: REISER LIST <reiserfs-list@namesys.com>

Hallo,

I decided to test some days ago Kernel 2.6 with
Reiser4
on a laptop 3,8 Gb partition.
I installed Oracle 9.2 test DB (size: about 2 Gb ) and
wrote a script to insert 10 millions rows on a
tablespace.

Linux Distribution: Slackware 9.1
Oracle 9.2.0.4

Oracle test tablespace size: 300 Mb

START

Filesystem           1K-blocks      Used Available
Use% Mounted on

/dev/hda6              3701704   1953024   1748680 
53% /u01

After about 7 millions of inserted rows Oracle has had
an abnormal shutdown due to problems writing log
files.

I was monitoring tablespace occupation and it was
almost 50% just before Oracle shutdown, so I was sure
that more than 1 Gb was free for Oracle operations but
.... I founded that partition /u01 was full (?!).

END

Filesystem           1K-blocks      Used Available
Use% Mounted on

/dev/hda6              3701704   3701644        60
100% /u01

After deleting 300 Mb Oracle datafile I obtained that
only 9776 Kb were free (?!)

So I decided to 

root@pamilo:/# umount /u01

root@pamilo:/# measurefs.reiser4 -f /dev/hda6
measurefs.reiser4 0.4.20
Copyright (C) 2001, 2002, 2003 by Hans Reiser,
licensing governed by reiser4progs/COPYING.
 
Packing statistics:
  Formatted nodes:    2593.04b (63.31%)
  Branch nodes:        396.00b (9.67%)
  Twig nodes:         2921.50b (71.33%)
  Leaf nodes:         4095.94b (100.00%)
 
Node statistics:
  Total nodes:         847610
  Formatted nodes:         23
  Unformatted nodes:   847587
  Branch nodes:             1
  Twig nodes:               8
  Leaf nodes:          847601
 
Item statistics:
  Total items:            448
  Nodeptr items:           22
  Statadata items:        210
  Direntry items:           8
  Tail items:               4
  Extent items:           204

root@pamilo:/# fsck.reiser4 --fix /dev/hda6

Fscking the /dev/hda6 block device.
Will fix minor corruptions of the Reiser4 SuperBblock.
Will fix minor corruptions of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** Openning the fs.
Reiser4 fs was detected on the /dev/hda6.
Master super block (16):
magic:          R4Sb
blksize:        4096
format:         0x0 (format40)
uuid:           2fee362a-e9c7-4a2b-ab4c-8f285624eba4
label:          <none>
 
Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.4.20
magic:          R4Sb-Default
flushes:        0
mkfs id:        0x791886f1
blocks:         973932
free blocks:    126254
root block:     76235
tail policy:    0x4 (smart)
next oid:       0x100e0
file count:     209
tree height:    3
key policy:     LARGE
 
***** Tree Traverse Pass: scanning the reiser4
internal tree.
        Read nodes 23
        Nodes left in the tree 23
                Leaves of them 14, Twigs of them 8
        Time interval: Fri Jan 16 13:24:54 2004 - Fri
Jan 16 13:24:55 2004
***** TwigScan Pass: checking extent pointers of all
twigs.
        Read twigs 8
        Time interval: Fri Jan 16 13:24:55 2004 - Fri
Jan 16 13:24:55 2004
***** Semantic Traverse Pass: reiser4 semantic tree
checking.
Error: Node (76237), item (8): StatData of the file
[10004:1616662635f5041:10022] has the wrong bytes
(5634560), Fixed to
(5636096). Plugin (stat40).
.....
..... other similar messages 
.....
 (27754496), Fixed to
(26222592). Plugin (stat40).
Error: Node (423116), item (16): StatData of the file
[10008:78646230312e64:1002e] has the wrong bytes
(22511616), Fixed to
(20979712). Plugin (stat40).
        Time interval: Fri Jan 16 13:24:55 2004 - Fri
Jan 16 13:24:56 2004
***** fsck.reiser4 finished at Fri Jan 16 13:24:56
2004
Closing fs...done
 
No corruption found.

After mounting of /dev/hda6 I finally founded that
almost 300 Mb were available.

root@pamilo:/# df
Filesystem           1K-blocks      Used Available
Use% Mounted on

/dev/hda6              3701704   3390712    310992 
92% /u01

I'm just a DBA, not a kind of filesystem expert, so I
can just feel there's something wrong calculating
space occupation.

Hoping this kind of "hobby" test could be useful.

All the best

Paolo Correnti


__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus
