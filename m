From: <doiggl@velocitynet.com.au>
Subject: Can fsck.reiser4 1.1.0 be included in code review as well ?
Date: Sat, 13 Aug 2016 16:26:28 +1000
Message-ID: <1e9a3c55a986fef6f5ae00708e0ff90d@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
As it is mentioned in-

Re: [BUG 4.5.3.patch] kernel BUG at fs/reiser4/plugin/file/file.c:820
http://www.spinics.net/lists/reiserfs-devel/msg05145.html

Question: 
---------
Can fsck.reiser4 1.1.0 be included in code review as well ?

I ask because of:
Re: What can I do next to use R4 partition sdb
http://www.spinics.net/lists/reiserfs-devel/msg04206.html

--Glenn

using:
# rpm -qa |grep -i reiser4 |sort
kernel-reiser4-4.7.0-9.2.x86_64
libreiser4-1_1-0-1.1.0-13.1.x86_64
reiser4progs-1.1.0-2.4.x86_64
reiser4progs-debuginfo-1.1.0-24.1.x86_64

#
http://www.spinics.net/lists/reiserfs-devel/msg04809.html
from url
.
.
FSCK: node.c: 108: repair_node_items_check: Node (284305753), items (61)
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

