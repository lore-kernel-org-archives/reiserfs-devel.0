From: Dave Thomas <linuxsense@gmail.com>
Subject: "WARNING: Wrong master super block magic" message on boot only
Date: Fri, 10 Sep 2004 20:26:23 -0700
Message-ID: <676b8ab0409102026251feacd@mail.gmail.com>
Reply-To: Dave Thomas <linuxsense@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21691-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I am setting up a new test server with Reiser4 and I have noticed an
error in 'dmesg' when mounting my Reiser4 partition on boot. This is
the error:

"reiser4[mount(1956)]: _init_read_super
(fs/reiser4/init_super.c:198)[nikita-2608]:
WARNING: Wrong master super block magic."

This message only shows up on boot...if I unmount the partition then
mount it again I do not get that error. I ran a 'fsck' on the
partition and everything looked OK...output is at end of message. I
have re-run 'mkfs.reiser4' on the partition but this did not stop the
'warning' message on boot.

I am running Gentoo Linux with gentoo-dev-sources 2.6.8 with
reiser4progs-1.0.1. The Reiser4 partition is a 200GB partition on a
software raid mirror.

Thanks for any help on this,
Dave

Fscking the /dev/md2 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): yes
***** fsck.reiser4 started at Fri Sep 10 13:15:31 2004
Reiser4 journal (journal40) on /dev/md2: 0 transactions replayed of
the total 0 blocks.
Reiser4 fs was detected on /dev/md2.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           ab01dab7-e10f-400d-8d1a-7a0000000000
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 1.0.1
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x3463fc54
blocks:         50654928
free blocks:    50653339
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10000
file count:     0
tree height:    2
key policy:     LARGE


CHECKING STORAGE TREE
        Read nodes 2
        Nodes left in the tree 2
                Leaves of them 1, Twigs of them 1
        Time interval: Fri Sep 10 13:15:43 2004 - Fri Sep 10 13:15:43 2004
CHECKING EXTENT REGIONS.
        Read twigs 1
        Time interval: Fri Sep 10 13:15:43 2004 - Fri Sep 10 13:15:43 2004
CHECKING SEMANTIC TREE
        Found 1 objects.
        Time interval: Fri Sep 10 13:15:43 2004 - Fri Sep 10 13:15:43 2004
***** fsck.reiser4 finished at Fri Sep 10 13:15:43 2004
Closing fs...done

FS is consistent.
