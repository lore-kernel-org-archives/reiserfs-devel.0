From: <doiggl@velocitynet.com.au>
Subject: Can the fix for 'bug in fsck: it jumps to wrong branch for some reason' be included in next reiser4progs please.
Date: Mon, 13 Apr 2015 13:55:26 +1000
Message-ID: <fe825cd2109d17b1c9fb593ef3ecc8fa@mail.velocitynet.com.au>
References: <114fff4391af47417e806586fb761345@mail.velocitynet.com.au> <24322648.R9GnluWRk3@intelfx-laptop> <458361e3164a300c930420b3dd9e5b43@mail.velocitynet.com.au> <53FDD565.6030500@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <53FDD565.6030500@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org

Hello,
Can the fix for 'bug in fsck: it jumps to wrong branch for some reason' be
included in next reiser4progs please.
Thank you.
--Glenn

references and history:

http://www.spinics.net/lists/reiserfs-devel/msg04206.html
http://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs/

reiser4progs-1.0.9.tar.gz 	2014-06-29 	913.5 kB
http://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs/reiser4progs-1.0.9.tar.gz

# cat ./ChangeLog
This file is part of reiser4progs package

Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

This file may be modified and/or distributed without restriction. This is
not an invitation to misrepresent the history of reiser4progs.

2014-06-28
        1.0.9 version
2014-06-28
        discard option to mkfs -- discard device at filesystem creation
        time (for SSD drives)

        Fixup in librepair/twig_scan.c: cb_item_region_check().
2013-05-03
        1.0.8 version
.
.
.


#http://www.spinics.net/lists/reiserfs-devel/msg04206.html

>> # fsck.reiser4 --build-fs --force  /dev/sdb
.
.
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



