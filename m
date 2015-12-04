From: <doiggl@velocitynet.com.au>
Subject: Can I shrink reiser4 volume with gparted gparted-live-0.24.0-2-amd64.iso [/dev/sdb]
Date: Fri, 04 Dec 2015 13:18:22 +1100
Message-ID: <f6902d30f9d22c79fad056e47c553eb8@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Question.
Can I shrink reiser4 volume with gparted gparted-live-0.24.0-2-amd64.iso
[/dev/sdb]

r4 metadata has errors as follows [1]:

--Glenn

http://gparted.sourceforge.net/download.php

[1]
http://www.spinics.net/lists/reiserfs-devel/msg04206.html

    CHECKING THE STORAGE TREE Read nodes 197008413 Nodes left in the tree
197008413 Leaves of them 194764277, Twigs of them 2217790 Time interval:
Tue Aug 26 17:24:21 2014 - Wed Aug 27 01:25:31 2014 CHECKING EXTENT
REGIONS. Read twigs 2217790 Time interval: Wed Aug 27 01:25:31 2014 - Wed
Aug 27 03:35:39 2014 LOOKING FOR UNCONNECTED NODES FSCK: node.c: 108:
repair_node_items_check: Node (43828275), items (0) and

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
    FSCK: node.c: 108: repair_node_items_check: Node (116595727), items
(20)
    and (21): Wrong order of keys.
    FSCK: node.c: 108: repair_node_items_check: Node (227923161), items
(22)
    and (23): Wrong order of keys.
    FSCK: node.c: 108: repair_node_items_check: Node (284305753), items
(61)
    and (62): Wrong order of keys.
             Read nodes 1481038

    Good nodes 471512

                     Leaves of them 466164, Twigs of them 5348
             Time interval: Wed Aug 27 03:35:57 2014 - Wed Aug 27 03:39:46
2014

    ***** fsck.reiser4 finished at Wed Aug 27 03:39:46 2014
    Closing fs...done

    FS is consistent.



This is a bug in fsck: it jumps to wrong branch for some reasons.
Not yet fixed.

Edward.
--
