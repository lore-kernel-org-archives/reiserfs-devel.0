From: Henning Westerholt <henning-usenet-03@die.informatik.uni-siegen.de>
Subject: stat-data problems with the 2004.02.06 snapshot
Date: Sat, 7 Feb 2004 16:22:18 +0100
Message-ID: <200402071622.18075.henning-usenet-03@die.informatik.uni-siegen.de>
References: <16419.38404.592630.141335@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16419.38404.592630.141335@laputa.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello Nikita,

thank you for the updated snapshot!
I tried it with 2.6.2 and noticed the following problem on my system:

*** Output from /var/log/messages ***

Feb  7 15:51:50 sonne kernel: reiser4[strip(30695)]: delete_inode_common 
(fs/reiser4/plugin/object.c:1027)[vs-1434]:
Feb  7 15:51:50 sonne kernel: WARNING: nrpages 3
Feb  7 15:51:50 sonne kernel: Feb  7 15:51:50 sonne kernel: reiser4
[strip(30701)]: delete_inode_common (fs/reiser4/plugin/object.c:1027)
[vs-1434]:
Feb  7 15:51:50 sonne kernel: WARNING: nrpages 2
Feb  7 15:51:50 sonne kernel: Feb  7 15:51:51 sonne kernel: reiser4
[strip(30721)]: delete_inode_common (fs/reiser4/plugin/object.c:1027)
[vs-1434]:
Feb  7 15:51:51 sonne kernel: WARNING: nrpages 1
... 


*** Output from fsck.reiser4 ***
Reiser4 fs was detected on the /dev/hdd9.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           921a81ba-f1aa-47b8-846c-71af014be94d
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.0
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x46a0ee0e
blocks:         2441872
free blocks:    1671323
root block:     75948
tail policy:    0x4 (smart)
next oid:       0x5f7b6
file count:     139258
tree height:    4
key policy:     LARGE
[...]
Error: Node (745146), item (12): StatData of the file 
[278ba:656e7669726f6e:278bb] has the wrong bytes (48445), Should be (49152). 
Plugin (stat40).
Error: Node (745159), item (4): StatData of the file 
[278bf:656e7669726f6e:278c0] has the wrong bytes (53438), Should be (57344). 
Plugin (stat40).
Error: Node (745174), item (4): StatData of the file 
[278c4:656e7669726f6e:278c5] has the wrong bytes (72103), Should be (73728). 
Plugin (stat40).
Error: Node (743705), item (9): StatData of the file 
[27637:656e7669726f6e:27638] has the wrong bytes (46229), Should be (49152). 
Plugin (stat40):
...

These problems occour on a fresh filesystem after six hours compiling.  
fsck.reiser4 seems to fix this, nice work. 


With kind regards,

Henning

