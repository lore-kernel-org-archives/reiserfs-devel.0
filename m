From: <doiggl@velocitynet.com.au>
Subject: Is there a patch to fix problem of fsck so it jumps to "correct" branch?
Date: Sat, 21 Feb 2015 14:16:41 +1100
Message-ID: <65fefb5d0bbbda86028dbd94de54c586@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

Is there a patch to fix problem of fsck so it jumps to "correct" branch
[1] ?

I will use [to test first] 
# fsck.reiser4 --check /dev/sdb 
first before using 
# fsck.reiser4 --build-fs --force  /dev/sdb

I ask because I want to use this disk. I cannot access it because the
command mount failed 

# md   /media/disk
# mount -t reiser4  /dev/sdb  /media/disk
mount: mount(2) failed: No such file or directory

# ll /lib/modules/`uname -r`/kernel/fs/reiser4
total 733
-rw-r--r-- 1 root root 747680 Feb 16 12:34 reiser4.ko

Thanks Glenn
------------

[1 ]problem
# fsck.reiser4 --build-fs --force  /dev/sdb
.
.

        LOOKING FOR UNCONNECTED NODES FSCK: node.c: 108:
repair_node_items_check: Node (43828275), items (0)

        and
        (1): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (52697435), items
(79)
        and (80): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (63227569), items
(24)
        and (25): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (63227571), items
(73)
        and (74): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (116595727),
items

(20)

        and (21): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (227923161),
items

(22)

        and (23): Wrong order of keys.
        FSCK: node.c: 108: repair_node_items_check: Node (284305753),
items

(61)

        and (62): Wrong order of keys.
                  Read nodes 1481038

        Good nodes 471512

                          Leaves of them 466164, Twigs of them 5348
                  Time interval: Wed Aug 27 03:35:57 2014 - Wed Aug 27
03:39:46
                  2014

        ***** fsck.reiser4 finished at Wed Aug 27 03:39:46 2014
        Closing fs...done

        FS is consistent.


    This is a bug in fsck: it jumps to wrong branch for some reasons.
    Not yet fixed.

    Edward.

 
 Background history
 ==================
 http://www.spinics.net/lists/reiserfs-devel/msg04206.html
