From: Jindrich Makovicka <makovick@kmlinux.fjfi.cvut.cz>
Subject: Re: reiser4progs 1.0.4
Date: Fri, 18 Mar 2005 19:59:22 +0100
Message-ID: <423B250A.60209@kmlinux.fjfi.cvut.cz>
References: <200502201344.41656.vitaly@namesys.com> <20050221131024.GA43266@xs4all.nl> <4219F19F.1030106@kmlinux.fjfi.cvut.cz> <200502211949.43255.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502211949.43255.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Vitaly Fertman wrote:
>>so 1.0.3 & 1.0.4 bail out. Using fsck.reiser4 --build-sb from
>>reiser4progs 1.0.3 rendered the filesystem created under 1.0.0 unusable,
> 
> 
> fsck.reiser4 --build-sb is supposed to fix evth. what goes wrong?

sorry I didn't replied earlier, but I didn't have a spare disk
available. here it goes. 40GB partition was mkfs'ed with 1.0.0,
populated somehow (about 32k files, 400MB), then fsck --build-sb from
1.0.4 was run:

8<--- snip

holly:~# fsck.reiser4 --build-sb /dev/hdk1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hdk1 block device.

Will build the Reiser4 SuperBlock.

Will check the consistency of the Reiser4 FileSystem.

Continue?

(Yes/No): Yes
***** fsck.reiser4 started at Fri Mar 18 19:46:33 2005
FSCK: UUID (0xea4de9160ad898572244086da443359e) found in the master
super block does not match the one found in the backup
(0xba44099ce147985c3da7d6bf7448b582). Fixed.
FSCK: The on-disk format mkfs id (0x19e74713) does not match the backup
one (0x75315ca). Fixed.
Reiser4 fs was detected on /dev/hdk1.

Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           5c9847e1-9c09-44ba-82b5-4874bfd6a73d
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x75315ca
blocks:         9770662
free blocks:    9676935
root block:     25
tail policy:    0x2 (smart)
next oid:       0x17d22
file count:     32034
tree height:    4
key policy:     LARGE


CHECKING STORAGE TREE

FSCK: Node (25): failed to open the root node. The whole filter pass is
skipped.
Warn : Reiser4 storage tree does not exist. Filter pass skipped.

         Read nodes 0

         Nodes left in the tree 0
                 Leaves of them 0, Twigs of them 0
         Invalid node pointers 1
         Time interval: Fri Mar 18 19:46:37 2005 - Fri Mar 18 19:46:37 2005
CHECKING EXTENT REGIONS.

         Read twigs 0

         Time interval: Fri Mar 18 19:46:37 2005 - Fri Mar 18 19:46:37 2005
Warn : Fatal corruptions were found. Semantic pass is skipped.

***** fsck.reiser4 finished at Fri Mar 18 19:46:37 2005
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

holly:~# fsck.reiser4 --build-sb /dev/hdk1 > ~/r4_buildsb.txt
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hdk1 block device.

Will build the Reiser4 SuperBlock.

Will check the consistency of the Reiser4 FileSystem.

Continue?

(Yes/No): Yes

holly:~# fsck.reiser4 --build-fs /dev/hdk1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/hdk1 block device.

Will check the consistency of the Reiser4 SuperBlock.

Will build the Reiser4 FileSystem.

Continue?

(Yes/No): Yes
***** fsck.reiser4 started at Fri Mar 18 19:48:56 2005
Reiser4 fs was detected on /dev/hdk1.

Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           5c9847e1-9c09-44ba-82b5-4874bfd6a73d
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4.
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x75315ca
blocks:         9770662
free blocks:    9676935
root block:     25
tail policy:    0x2 (smart)
next oid:       0x17d22
file count:     32034
tree height:    4
key policy:     LARGE


CHECKING STORAGE TREE

FSCK: Node (25): failed to open the root node. The whole filter pass is
skipped.
Warn : Reiser4 storage tree does not exist. Filter pass skipped.

         Read nodes 0

         Nodes left in the tree 0
                 Leaves of them 0, Twigs of them 0
         Zeroed node pointers 1
         Time interval: Fri Mar 18 19:48:59 2005 - Fri Mar 18 19:48:59 2005
CHECKING EXTENT REGIONS.

         Read twigs 0

         Time interval: Fri Mar 18 19:48:59 2005 - Fri Mar 18 19:48:59 2005
LOOKING FOR UNCONNECTED NODES

         Read nodes 93393

         Good nodes 0
                 Leaves of them 0, Twigs of them 0
         Time interval: Fri Mar 18 19:49:00 2005 - Fri Mar 18 19:49:09 2005
CHECKING EXTENT REGIONS.

         Read twigs 0

         Time interval: Fri Mar 18 19:49:09 2005 - Fri Mar 18 19:49:09 2005
INSERTING UNCONNECTED NODES

1. Twigs: done

2. Twigs by item: done

3. Leaves: done

4. Leaves by item: done

         Twigs: read 0, inserted 0, by item 0, empty 0

         Leaves: read 0, inserted 0, by item 0
         Time interval: Fri Mar 18 19:49:10 2005 - Fri Mar 18 19:49:10 2005
Fatal: No reiser4 metadata were found. Semantic pass is skipped.

***** fsck.reiser4 finished at Fri Mar 18 19:49:10 2005
Closing fs...done

NO REISER4 METADATA WERE FOUND. FS RECOVERY IS NOT POSSIBLE.

8<--- snip

-- 
Jindrich Makovicka

