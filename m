From: Ookhoi <ookhoi@xs4all.nl>
Subject: Re: reiser4progs 1.0.4
Date: Mon, 21 Feb 2005 14:10:24 +0100
Message-ID: <20050221131024.GA43266@xs4all.nl>
References: <200502201344.41656.vitaly@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200502201344.41656.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Sun, Feb 20, 2005 at 01:44:41PM +0300, Vitaly Fertman wrote:
> The new reiser4progs package is available on our ftp 
> site (ftp://ftp.namesys.com/pub/reiser4progs/). 

Thank you for this release. It doesn't crash anymore :-)

But it does tell me:
"NO REISER4 METADATA WERE FOUND. FS RECOVERY IS NOT POSSIBLE."

I have a copy of the fs, but I did run verson 1.0.3 on it before
I made a copy. (1.0.3 crashes with segfault).

Is this fs fixable you think?

Thanks in advance and with kind regards, Sander


bellyup:~# fsck.reiser4 --version
fsck.reiser4 1.0.4
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by reiser4progs/COPYING.

bellyup:~# fsck.reiser4 /dev/hda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hda1 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Mon Feb 21 13:49:30 2005
Fatal: Wrong magic found in the master super block.
Fatal: Failed to open the reiser4 backup.
Fatal: Cannot open the FileSystem on (/dev/hda1).

1 fatal corruptions were detected in SuperBlock. Run with --build-sb option to fix them.

bellyup:~# fsck.reiser4 --build-sb /dev/hda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hda1 block device.
Will build the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Mon Feb 21 13:49:43 2005
Fatal: Wrong magic found in the master super block.
Fatal: Failed to open the reiser4 backup.
Fatal: Cannot open the FileSystem on (/dev/hda1).

1 fatal corruptions were detected in SuperBlock. Run with --build-sb option to fix them.

bellyup:~# fsck.reiser4 --build-sb /dev/hda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hda1 block device.
Will build the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Mon Feb 21 13:49:43 2005
Fatal: Wrong magic found in the master super block.
Master super block cannot be found on (/dev/hda1). Do you want to build a new one?
(Yes/No): Yes
Which block size do you use? [4096]:
Warn : A new master superblock is created on '/dev/hda1'.
Fatal: Can't open disk-format format40.
Enter the key plugin name [key_large]:
Enter the correct block count please [126504]:
Warn : The format 'format40' is created on '/dev/hda1'.
Error: Wrong magic is found in the filesystem status block.
Warn : Creating a new status block.
FSCK: Checksum missmatch in bitmap block 18. Checksum is 0x0, should be 0xffc0001.
FSCK: Checksum missmatch in bitmap block 32736. Checksum is 0xef2d8782, should be 0x955c26fe.
FSCK: Checksum missmatch in bitmap block 65472. Checksum is 0x64c78fa2, should be 0xf55bf507.
FSCK: Checksum missmatch in bitmap block 98208. Checksum is 0xf6d9d7e3, should be 0x885c0260.
FSCK: Checksums will be fixed later.
Reiser4 fs was detected on /dev/hda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0xe78822c
blocks:         126504
free blocks:    0
root block:     0
tail policy:    0x2 (smart)
next oid:       0x0
file count:     0
tree height:    0
key policy:     LARGE


CHECKING STORAGE TREE
Warn : Reiser4 storage tree does not exist. Filter pass skipped.
        Read nodes 0
        Nodes left in the tree 0
                Leaves of them 0, Twigs of them 0
        Invalid node pointers 1
        Time interval: Mon Feb 21 13:49:52 2005 - Mon Feb 21 13:49:52 2005
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Mon Feb 21 13:49:52 2005 - Mon Feb 21 13:49:52 2005
Warn : Fatal corruptions were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Mon Feb 21 13:49:52 2005
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.

bellyup:~# fsck.reiser4 /dev/hda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hda1 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Mon Feb 21 13:50:02 2005
FSCK: Checksum missmatch in bitmap block 18. Checksum is 0x0, should be 0xffc0001.
FSCK: Checksum missmatch in bitmap block 32736. Checksum is 0xef2d8782, should be 0x955c26fe.
FSCK: Checksum missmatch in bitmap block 65472. Checksum is 0x64c78fa2, should be 0xf55bf507.
FSCK: Checksum missmatch in bitmap block 98208. Checksum is 0xf6d9d7e3, should be 0x885c0260.
Reiser4 fs was detected on /dev/hda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0xe78822c
blocks:         126504
free blocks:    0
root block:     0
tail policy:    0x2 (smart)
next oid:       0x0
file count:     0
tree height:    0
key policy:     LARGE


CHECKING STORAGE TREE
Warn : Reiser4 storage tree does not exist. Filter pass skipped.
        Read nodes 0
        Nodes left in the tree 0
                Leaves of them 0, Twigs of them 0
        Invalid node pointers 1
        Time interval: Mon Feb 21 13:50:02 2005 - Mon Feb 21 13:50:02 2005
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Mon Feb 21 13:50:02 2005 - Mon Feb 21 13:50:02 2005
Warn : Fatal corruptions were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Mon Feb 21 13:50:02 2005
Closing fs...done

1 fixable corruptions were detected in the SuperBlock. Run with --fix option to fix them.

bellyup:~# fsck.reiser4 --fix /dev/hda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hda1 block device.
Will fix minor corruptions of the Reiser4 SuperBlock.
Will fix minor corruptions of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Mon Feb 21 13:50:14 2005
FSCK: Checksum missmatch in bitmap block 18. Checksum is 0x0, should be 0xffc0001.
FSCK: Checksum missmatch in bitmap block 32736. Checksum is 0xef2d8782, should be 0x955c26fe.
FSCK: Checksum missmatch in bitmap block 65472. Checksum is 0x64c78fa2, should be 0xf55bf507.
FSCK: Checksum missmatch in bitmap block 98208. Checksum is 0xf6d9d7e3, should be 0x885c0260.
FSCK: Checksums will be fixed later.
Reiser4 fs was detected on /dev/hda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0xe78822c
blocks:         126504
free blocks:    0
root block:     0
tail policy:    0x2 (smart)
next oid:       0x0
file count:     0
tree height:    0
key policy:     LARGE


CHECKING STORAGE TREE
Warn : Reiser4 storage tree does not exist. Filter pass skipped.
        Read nodes 0
        Nodes left in the tree 0
                Leaves of them 0, Twigs of them 0
        Invalid node pointers 1
        Time interval: Mon Feb 21 13:50:14 2005 - Mon Feb 21 13:50:14 2005
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Mon Feb 21 13:50:14 2005 - Mon Feb 21 13:50:14 2005
Warn : Fatal corruptions were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Mon Feb 21 13:50:14 2005
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.

bellyup:~# fsck.reiser4 --build-fs /dev/hda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hda1 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Mon Feb 21 13:50:26 2005
FSCK: Checksum missmatch in bitmap block 18. Checksum is 0x0, should be 0xffc0001.
FSCK: Checksum missmatch in bitmap block 32736. Checksum is 0xef2d8782, should be 0x955c26fe.
FSCK: Checksum missmatch in bitmap block 65472. Checksum is 0x64c78fa2, should be 0xf55bf507.
FSCK: Checksum missmatch in bitmap block 98208. Checksum is 0xf6d9d7e3, should be 0x885c0260.
Reiser4 fs was detected on /dev/hda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0xe78822c
blocks:         126504
free blocks:    0
root block:     0
tail policy:    0x2 (smart)
next oid:       0x0
file count:     0
tree height:    0
key policy:     LARGE


CHECKING STORAGE TREE
Warn : Reiser4 storage tree does not exist. Filter pass skipped.
        Read nodes 0
        Nodes left in the tree 0
                Leaves of them 0, Twigs of them 0
        Zeroed node pointers 1
        Time interval: Mon Feb 21 13:50:26 2005 - Mon Feb 21 13:50:26 2005
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Mon Feb 21 13:50:26 2005 - Mon Feb 21 13:50:26 2005
LOOKING FOR UNCONNECTED NODES
        Read nodes 96346
        Good nodes 0
                Leaves of them 0, Twigs of them 0
        Time interval: Mon Feb 21 13:50:26 2005 - Mon Feb 21 13:50:35 2005
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Mon Feb 21 13:50:35 2005 - Mon Feb 21 13:50:35 2005
INSERTING UNCONNECTED NODES
1. Twigs: done
2. Twigs by item: done
3. Leaves: done
4. Leaves by item: done
        Twigs: read 0, inserted 0, by item 0, empty 0
        Leaves: read 0, inserted 0, by item 0
        Time interval: Mon Feb 21 13:50:35 2005 - Mon Feb 21 13:50:35 2005
Fatal: No reiser4 metadata were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Mon Feb 21 13:50:35 2005
Closing fs...done

1 fixable corruptions were detected in the SuperBlock. Run with --fix option to fix them.
NO REISER4 METADATA WERE FOUND. FS RECOVERY IS NOT POSSIBLE.

bellyup:~# fsck.reiser4 --fix /dev/hda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hda1 block device.
Will fix minor corruptions of the Reiser4 SuperBlock.
Will fix minor corruptions of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Mon Feb 21 13:51:01 2005
Reiser4 fs was detected on /dev/hda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0xe78822c
blocks:         126504
free blocks:    126476
root block:     18446744073709551615
tail policy:    0x2 (smart)
next oid:       0x0
file count:     0
tree height:    0
key policy:     LARGE


CHECKING STORAGE TREE
Warn : Reiser4 storage tree does not exist. Filter pass skipped.
        Read nodes 0
        Nodes left in the tree 0
                Leaves of them 0, Twigs of them 0
        Invalid node pointers 1
        Time interval: Mon Feb 21 13:51:02 2005 - Mon Feb 21 13:51:02 2005
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Mon Feb 21 13:51:02 2005 - Mon Feb 21 13:51:02 2005
Warn : Fatal corruptions were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Mon Feb 21 13:51:02 2005
Closing fs...done
1 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.

bellyup:~# fsck.reiser4 --build-fs --fix /dev/hda1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hda1 block device.
Will fix minor corruptions of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Mon Feb 21 13:52:45 2005
Reiser4 fs was detected on /dev/hda1.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0xe78822c
blocks:         126504
free blocks:    126476
root block:     18446744073709551615
tail policy:    0x2 (smart)
next oid:       0x0
file count:     0
tree height:    0
key policy:     LARGE


CHECKING STORAGE TREE
Warn : Reiser4 storage tree does not exist. Filter pass skipped.
        Read nodes 0
        Nodes left in the tree 0
                Leaves of them 0, Twigs of them 0
        Zeroed node pointers 1
        Time interval: Mon Feb 21 13:52:46 2005 - Mon Feb 21 13:52:46 2005
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Mon Feb 21 13:52:46 2005 - Mon Feb 21 13:52:46 2005
LOOKING FOR UNCONNECTED NODES
        Read nodes 0
        Good nodes 0
                Leaves of them 0, Twigs of them 0
        Time interval: Mon Feb 21 13:52:46 2005 - Mon Feb 21 13:52:46 2005
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Mon Feb 21 13:52:46 2005 - Mon Feb 21 13:52:46 2005
INSERTING UNCONNECTED NODES
1. Twigs: done
2. Twigs by item: done
3. Leaves: done
4. Leaves by item: done
        Twigs: read 0, inserted 0, by item 0, empty 0
        Leaves: read 0, inserted 0, by item 0
        Time interval: Mon Feb 21 13:52:46 2005 - Mon Feb 21 13:52:46 2005
Fatal: No reiser4 metadata were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Mon Feb 21 13:52:46 2005
Closing fs...done

NO REISER4 METADATA WERE FOUND. FS RECOVERY IS NOT POSSIBLE.
