From: Will Smith <will@willsmith.org>
Subject: Minor, 'mergable units' error caused by repacker.
Date: Wed, 15 Sep 2004 20:40:45 +0800
Message-ID: <4148384D.2010508@willsmith.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21755-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

I've been running the repacker a number of times, and often it causes
minor errors, fixable with fsck.reiser4 --fix.

It appears to only cause errors when run in 'direction=1' (backward) mode.

Config : Linux server 2.6.8.1-mm4
        : reiser4progs-1.0.0
        : all defaults
Reiser4 filesystem : kernel source (fragmented) on 350Mb partition



Example fsck.reiser4 output:

[root@server repacker]# /usr/local/sbin/fsck.reiser4  /dev/hdc2
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hdc2 block device. 

Will check the consistency of the Reiser4 SuperBlock. 

Will check the consistency of the Reiser4 FileSystem. 

Continue? 

(Yes/No): y
***** fsck.reiser4 started at Wed Sep 15 19:25:06 2004
Reiser4 journal (journal40) on /dev/hdc2: 0 transactions replayed of the 
total 0
blocks.
Reiser4 fs was detected on /dev/hdc2. 

Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           95531358-2088-4577-92c3-3ab69c186415
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 1.0.0
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x313b7a2d
blocks:         85554
free blocks:    39522
root block:     17836
tail policy:    0x2 (smart)
next oid:       0x7f245
file count:     15924
tree height:    4
key policy:     LARGE


CHECKING STORAGE TREE 

FSCK: Node (18023), item (2): 1 mergable units were found in the 
extent40 unit.
FSCK: Node (18333), item (78): 1 mergable units were found in the 
extent40 unit.
FSCK: Node (19880), item (65): 1 mergable units were found in the 
extent40 unit.
FSCK: Node (22794), item (28): 1 mergable units were found in the 
extent40 unit.
FSCK: Node (22794), item (33): 1 mergable units were found in the 
extent40 unit.
FSCK: Node (23976), item (79): 1 mergable units were found in the 
extent40 unit.
...




