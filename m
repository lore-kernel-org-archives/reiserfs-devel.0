From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Exact error Mssages.
Date: Fri, 15 Dec 2006 21:32:04 +0100
Message-ID: <194f62550612151232m69ac7bacod778363c0854b38@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30328-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com, Edward Shishkin <edward@namesys.com>

Hi again,

I thought maybe the exact error-messages could help finding the root
of the problem. By the way I thought fsck.reiser4 won't write anything
except I agree that it does?!

This are the messages I get from mount:
reiser4[mount(4030)]: try_init_format40
(fs/reiser4/plugin/disk_format/disk_format40.c:301)[vpf-1364]:
NOTICE: Warning: mounting sda3 with fatal errors, forcing read-only mount.
reiser4: sda3: found disk format 4.0.0.
reiser4[mount(4030)]: parse_node40
(fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
WARNING: Wrong level found in node: 5 != 19
reiser4[mount(4030)]: key_warning
(fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
WARNING: Error for inode 42 (-5)

These are the messages from fsck.reiser4:
[root@localhost ce]# /usr/local/sbin/fsck.reiser4 /dev/sda3
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda3 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Fri Dec 15 21:35:34 2006
Reiser4 fs was detected on /dev/sda3.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           b5ca3542-79a1-4e8f-b75f-6131aa1b1e6c
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format plugin.
version:        0
magic:          ReIsEr40FoRmAt
mkfs id:        0x3ce373f4
flushes:        0
blocks:         14488608
free blocks:    6920687
root block:     23
tail policy:    0x2 (smart)
next oid:       0x13d5af
file count:     429397
tree height:    5
key policy:     LARGE


CHECKING THE STORAGE TREE
FSCK: filter.c: 626: repair_filter_traverse: Node (23): failed to open the root
node. The whole filter pass is skipped.
Warn : Reiser4 storage tree does not exist. Filter pass skipped.
        Read nodes 0
        Nodes left in the tree 0
                Leaves of them 0, Twigs of them 0
        Invalid node pointers 1
        Time interval: Fri Dec 15 21:35:41 2006 - Fri Dec 15 21:35:41 2006
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Fri Dec 15 21:35:41 2006 - Fri Dec 15 21:35:41 2006
Warn : Fatal corruptions were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Fri Dec 15 21:35:41 2006
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

Hope that helps, lg Clemens
