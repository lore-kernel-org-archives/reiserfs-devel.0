From: "Matheus Izvekov" <mizvekov@gmail.com>
Subject: bad reiser4 fs causes system to freeze
Date: Sat, 13 Jan 2007 07:29:56 -0200
Message-ID: <305c16960701130129n3122c73co89d85504267a724a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi all
This filesystem got corrupted by a crash in the middle of an rsync,
and after that whenever i try to rsync again, my system completely
freezes and i cant even get the oops msg.
Im using 2.6.19 with latest patch from namesys.
i have a metadata dump of this, its a 8mb bzip2 file. I can send it on request.

when i ran fsck on it, i got this:

localhost ~ # fsck.reiser4 --fix -L reiser4.log /dev/sda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda1 block device.
Will fix minor corruptions of the Reiser4 SuperBlock.
Will fix minor corruptions of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Sat Jan 13 06:58:44 2007
Reiser4 fs was detected on /dev/sda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           5c2a9458-e44d-4ec1-8326-1f3096c248eb
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x745193ff
blocks:         263056
free blocks:    205961
root block:     34
tail policy:    0x2 (smart)
next oid:       0x6328c
file count:     157669
tree height:    4
key policy:     LARGE


CHECKING STORAGE TREE
        Read nodes 53126
        Nodes left in the tree 53125
                Leaves of them 52280, Twigs of them 830
        Broken of them 1
                Leaves of them 1, Twigs of them 0
        Time interval: Sat Jan 13 06:58:45 2007 - Sat Jan 13 07:00:22 2007
CHECKING EXTENT REGIONS.
        Read twigs 830
        Time interval: Sat Jan 13 07:00:22 2007 - Sat Jan 13 07:00:22 2007
Warn : Fatal corruptions were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Sat Jan 13 07:00:22 2007
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

================================================================

this is what i got in reiser4.log:

FSCK: Node (28693), item (0), unit (74),
[26b48:0(NAME):6a646570656e64:2d322e392d723200:0]: unit offset (65488) is wrong.
FSCK: Node (28693), item (0), unit (74),
[26b48:0(NAME):6a646570656e64:2d322e392d723200:0]: unit offset (65488) is wrong,
should be (3858).
FSCK: Node (28693), item (0), [26b48:0(NAME):6a646570656e64:2d322e392d723200:0]:
broken item found.
FSCK: Node (28693): the node is broken. Pointed from the node (60855), item
(34), unit (0). The whole subtree is skipped.

=================================================================

This is what i got when i ran it with --rebuild-fs:

localhost ~ # fsck.reiser4 --build-fs -L reiser4.log /dev/sda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda1 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Sat Jan 13 07:07:29 2007
Reiser4 fs was detected on /dev/sda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           5c2a9458-e44d-4ec1-8326-1f3096c248eb
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
flushes:        0
mkfs id:        0x745193ff
blocks:         263056
free blocks:    205961
root block:     34
tail policy:    0x2 (smart)
next oid:       0x6328c
file count:     157669
tree height:    4
key policy:     LARGE


CHECKING STORAGE TREE
        Read nodes 53126
        Nodes left in the tree 53125
                Leaves of them 52280, Twigs of them 830
        Time interval: Sat Jan 13 07:07:30 2007 - Sat Jan 13 07:09:35 2007
CHECKING EXTENT REGIONS.
        Read twigs 830
        Time interval: Sat Jan 13 07:09:35 2007 - Sat Jan 13 07:09:35 2007
LOOKING FOR UNCONNECTED NODES
        Read nodes 0
        Good nodes 0
                Leaves of them 0, Twigs of them 0
        Time interval: Sat Jan 13 07:09:35 2007 - Sat Jan 13 07:09:35 2007
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Sat Jan 13 07:09:35 2007 - Sat Jan 13 07:09:35 2007
INSERTING UNCONNECTED NODES
1. Twigs: done
2. Twigs by item: done
3. Leaves: done
4. Leaves by item: done
        Twigs: read 0, inserted 0, by item 0, empty 0
        Leaves: read 0, inserted 0, by item 0
        Time interval: Sat Jan 13 07:09:35 2007 - Sat Jan 13 07:09:35 2007
CHECKING SEMANTIC TREE
        Found 157670 objects.
        Lost&found 80 objects.
        Time interval: Sat Jan 13 07:09:35 2007 - Sat Jan 13 07:09:54 2007
CLEANUPING STORAGE TREE
        Removed items 0
        Time interval: Sat Jan 13 07:09:54 2007 - Sat Jan 13 07:09:56 2007
***** fsck.reiser4 finished at Sat Jan 13 07:09:56 2007
Closing fs...done

FS is consistent.

=================================================================

This time i got this in reiser4.log:

FSCK: Node (28693), item (0), unit (74),
[26b48:0(NAME):6a646570656e64:2d322e392d723200:0]: unit offset (65488) is wrong.
FSCK: Node (28693), item (0), unit (74),
[26b48:0(NAME):6a646570656e64:2d322e392d723200:0]: unit offset (65488) is wrong,
should be (3858). Fixed.
FSCK: Node (28693), item (0), [26b48:0(NAME):6a646570656e64:2d322e392d723200:0]:
wrong order of units [75, 76]. The whole item is to be removed.
FSCK: Node (28693), item (0), [26b48:0(NAME):6a646570656e64:2d322e392d723200:0]:
broken item found. Remove it.
FSCK: Node (28693): the node is empty. Pointed from the node (60855), item (34),
unit (0). Removed.
FSCK: No 'lost+found' entry found. Building a new object with the key 2a:0:ffff.
FSCK: Failed to recognize the plugin for the directory [2a:0:ffff].
FSCK: Trying to recover the directory [2a:0:ffff] with the default
plugin--dir40.
FSCK: The file [2a:0:ffff] does not have a StatData item. Creating a new one.
Plugin dir40.
FSCK: Directory [2a:0:ffff]: The entry "." is not found. Insert a new one.
Plugin (dir40).
FSCK: Node (228), item (0), [2a:0:ffff] (stat40): wrong size (0), Fixed to (1).
FSCK: Node (228), item (0), [2a:0:ffff] (stat40): wrong bytes (0), Fixed to
(50).
FSCK: Node (26110), item (0), [2345e:6465762d6a6176:26b48] (stat40): wrong size
(779), Fixed to (699).
FSCK: Node (26110), item (0), [2345e:6465762d6a6176:26b48] (stat40): wrong bytes
(41360), Fixed to (37360).
FSCK: File count 157669 is wrong. Fixed to 157670.

================================================================

and after this i can use my filesystem normally again.

Thanks
