From: <doiggl@velocitynet.com.au>
Subject: reiser4progs and Wrong order of keys. query [on sdb]
Date: Thu, 05 Mar 2015 14:00:40 +1100
Message-ID: <3ceb7fd89df3e379f7d8b195bd814b11@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Hello,
Is there a patch available to fix the problem of [1]
I'm using reiser4progs: version-1.0.9
--Thanks Glenn

I can apply patch and build at:
https://build.opensuse.org/package/view_file/home:doiggl/reiser4progs/reiser4progs.spec?expand=1

- I can make a image copy of disk[using linux dd] to another disk and use
that to see if repair works. 
- run # fsck.reiser4 --build-fs --force  /dev/sdb
- run # fsck.reiser4 --check /dev/sdb

- see if volume can be accessed:
    mount command used.
    mount /dev/sdb  /media/disk

- I can report results back to list.


 Background history
 ==================
 http://www.spinics.net/lists/reiserfs-devel/msg04206.html
 http://www.spinics.net/lists/reiserfs-devel/msg04682.html

[1]
 fsck.reiser4 --build-fs --force  /dev/sdb
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

