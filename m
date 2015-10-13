From: <doiggl@velocitynet.com.au>
Subject: A request for fix for 'FSCK: node.c:  Wrong order of keys.'
Date: Wed, 14 Oct 2015 10:49:15 +1100
Message-ID: <fa254638aecdadfc37c99129b79e46e5@mail.velocitynet.com.au>
References: <02dbaf91d2fcee90ee2f08ec0c937a63@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <02dbaf91d2fcee90ee2f08ec0c937a63@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,

A request for fix for 'FSCK: node.c:  Wrong order of keys.'

Can problem be fixed ?
Thanks
--Glenn

# fsck.reiser4  -V
fsck.reiser4 1.1.0
Format release: 4.0.1

# rpm -qa |grep -i reiser4 |sort
kernel-reiser4-4.1.6-7.1.gd2bbe7f.x86_64
libreiser4-1_1-0-1.1.0-14.1.x86_64
reiser4progs-1.1.0-14.1.x86_64


# full spec file:
https://build.opensuse.org/package/view_file/home:doiggl/reiser4progs/reiser4progs.spec?expand=1

Background history
==================
http://www.spinics.net/lists/reiserfs-devel/msg04727.html

[from url]

#fsck.reiser4  --build-fs --force  /dev/sdb
.
.
LOOKING FOR UNCONNECTED NODES                                             
                                                                          
     
#http://www.spinics.net/lists/reiserfs-devel/msg04206.html

# fsck.reiser4 --build-fs --force  /dev/sdb
.
.
 (1): Wrong order of keys.
 FSCK: node.c: 108: repair_node_items_check: Node (52697435), items (79)
 and (80): Wrong order of keys.
 FSCK: node.c: 108: repair_node_items_check: Node (63227569), items (24)
 and (25): Wrong order of keys.
 FSCK: node.c: 108: repair_node_items_check: Node (63227571), items (73)
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
