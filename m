From: <doiggl@velocitynet.com.au>
Subject: Can the patch to reiser4progs be made available error so fsck jumps to "correct" branch branch.'   ?
Date: Mon, 16 Feb 2015 16:54:49 +1100
Message-ID: <463a3b5ceec0decd4ce2e9937036b3c2@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Can the patch to reiser4progs be made available error so fsck jumps to
"correct" branch branch.'   ?
I could make use of it.
I can apply the patch file to a specfile, rebuild and try it out.[1]
I can report results back. 

Thanks Glenn

History:
http://www.spinics.net/lists/reiserfs-devel/msg04206.html


    # fsck.reiser4 --build-fs --force  /dev/sdb
    *******************************************************************
    This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
    *******************************************************************

    Fscking the /dev/sdb block device.

    Will check the consistency of the Reiser4 SuperBlock. Will build the
Reiser4 FileSystem. ***** fsck.reiser4 started at Tue Aug 26 17:22:24 2014

    Reiser4 fs was detected on /dev/sdb.

    Master super block (16):

    magic:          ReIsEr4
    blksize:        4096
    format:         0x0 (format40)
    uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
    label:          <none>

    Format super block (17):

    plugin:         format40
    description:    Disk-format plugin.
    version:        0
    magic:          ReIsEr40FoRmAt
    mkfs id:        0x1ddaf754
    flushes:        0
    blocks:         488378640
    free blocks:    217146980
    root block:     37017218
    tail policy:    0x2 (smart)
    next oid:       0xedade
    file count:     188313
    tree height:    6
    key policy:     LARGE

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

Edward

[1] test build details
https://build.opensuse.org/package/view_file/home:doiggl/reiser4progs/reiser4progs.spec?expand=1

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

