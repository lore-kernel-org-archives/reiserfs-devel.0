From: <doiggl@velocitynet.com.au>
Subject: help with testing
Date: Fri, 13 Feb 2015 16:08:46 +1100
Message-ID: <927eb13cbcde61cf5883293488f76fda@mail.velocitynet.com.au>
References: <1423788499-30430-1-git-send-email-intelfx100@gmail.com> <b045f6704fdbb4417ce3428f4a423257@mail.velocitynet.com.au> <1423796471.3303.5.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1423796471.3303.5.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>, edward.shishkin@gmail.com

Hello,
Regards "if you want to help with testing."

I could help with tests after a r4 partition/disk is recovered, using
#fsck.reiser4 --build-fs /dev/sdb

-But I need a patch to fix this problem first [see below]

--Cheers Glenn
--------------

Details:
--------

# fsck.reiser4 --build-fs --force  /dev/sdb
.
.
>> LOOKING FOR UNCONNECTED NODES
>>                                               
>> FSCK: node.c: 108: repair_node_items_check: Node (43828275), items (0)
>> and
>> (1): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (52697435), items (79)
>> and (80): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (63227569), items (24)
>> and (25): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (63227571), items (73)
>> and (74): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (116595727), items
(20)
>> and (21): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (227923161), items
(22)
>> and (23): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (284305753), items
(61)
>> and (62): Wrong order of keys.
>>          Read nodes 1481038
>>                                             
>>          Good nodes 471512
>>                  Leaves of them 466164, Twigs of them 5348
>>          Time interval: Wed Aug 27 03:35:57 2014 - Wed Aug 27 03:39:46
>>          2014
>>
>> ***** fsck.reiser4 finished at Wed Aug 27 03:39:46 2014
>> Closing fs...done
>>
>> FS is consistent.
> 
> 
> This is a bug in fsck: it jumps to wrong branch for some reasons.
> Not yet fixed.
> 
> Edward.
> --

other info:
-----------

# fsck.reiser4 --print-profile /dev/sdb
Default profile:
create:          "ccreg40"         (id:0x4 type:0x0)    [Regular file
plugin for creat(2)]
key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]
compress:        "lzo1"            (id:0x0 type:0xc)    [Compression
plugin]
compressMode:    "conv"            (id:0x4 type:0xd)    [Compression Mode
plugin]
cluster:         "64K"             (id:0x0 type:0x10)   [Cluster plugin]
hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory entry
hash plugin]
fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibration
plugin]
formatting:      "smart"           (id:0x2 type:0x5)    [File body
formatting plugin]

reiser4progs-1.0.9 # find . |sort |grep -i fsck
./doc/fsck.reiser4.8
./progs/fsck
./progs/fsck/Makefile.am
./progs/fsck/Makefile.in
./progs/fsck/backup.c
./progs/fsck/backup.h
./progs/fsck/fsck.c
./progs/fsck/fsck.h

# which fsck.reiser4 
/usr/sbin/fsck.reiser4

# rpm -qlp reiser4progs-1.0.9-1.2.x86_64.rpm
/usr/sbin/debugfs.reiser4
/usr/sbin/fsck.reiser4
/usr/sbin/make_reiser4
/usr/sbin/measurefs.reiser4
/usr/sbin/mkfs.reiser4
/usr/share/doc/packages/reiser4progs
/usr/share/doc/packages/reiser4progs/BUGS
/usr/share/doc/packages/reiser4progs/COPYING
/usr/share/doc/packages/reiser4progs/ChangeLog
/usr/share/doc/packages/reiser4progs/NEWS
/usr/share/doc/packages/reiser4progs/README
/usr/share/doc/packages/reiser4progs/TODO
/usr/share/man/man8/debugfs.reiser4.8.gz
/usr/share/man/man8/fsck.reiser4.8.gz
/usr/share/man/man8/measurefs.reiser4.8.gz
/usr/share/man/man8/mkfs.reiser4.8.gz

--installation
# rpm -ivhU reiser4progs-1.0.9-1.2.x86_64.rpm

# r4 partition recovery /dev/sdb
http://www.spinics.net/lists/reiserfs-devel/msg04596.html

