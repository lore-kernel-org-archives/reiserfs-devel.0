From: "Nicolas Smallwood" <smallwood@maya.com>
Subject: RE: Errors reported with dmesg using reiser4
Date: Wed, 2 Feb 2005 13:15:29 -0500
Message-ID: <CMEFJOIJPCAMFCEKIEOEOEPBCFAA.smallwood@maya.com>
References: <CMEFJOIJPCAMFCEKIEOECEMJCFAA.smallwood@maya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <CMEFJOIJPCAMFCEKIEOECEMJCFAA.smallwood@maya.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiser <reiserfs-list@namesys.com>

Here is the output from check and build-sb

joshuadev root # fsck.reiser4 --check /dev/sdc1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdc1 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): yes
***** fsck.reiser4 started at Mon Jan 31 23:38:48 2005
Fatal: Failed to open the reiser4 backup.
Fatal: Cannot open the FileSystem on (/dev/sdc1).

1 fatal corruptions were detected in SuperBlock. Run with --build-sb option
to  fix them.

joshuadev root # fsck.reiser4 --build-sb /dev/sdc1
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sdc1 block device.
Will build the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): yes
***** fsck.reiser4 started at Mon Jan 31 23:40:09 2005
Enter the key plugin name [key_large]:
Reiser4 fs was detected on /dev/sdc1.
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
mkfs id:        0x73665e9a
blocks:         61049000
free blocks:    34231800
root block:     25269822
tail policy:    0x2 (smart)
next oid:       0x1c4f4d11
file count:     474893555
tree height:    5
key policy:     LARGE


CHECKING STORAGE TREE
FSCK: Node (26425112), items (4) and (5): Wrong order of keys.
FSCK: Node (26425112): the node is broken. Pointed from the node (26764690),
item (64), unit (0). The whole subtree is skipped.
        Read nodes 26805778
        Nodes left in the tree 26805777
                Leaves of them 26490907, Twigs of them 311160
        Broken of them 1
                Leaves of them 0, Twigs of them 0
        Time interval: Mon Jan 31 23:40:28 2005 - Tue Feb  1 09:33:30 2005
CHECKING EXTENT REGIONS.
        Read twigs 311160
        Time interval: Tue Feb  1 09:33:30 2005 - Tue Feb  1 10:01:39 2005
Warn : Fatal corruptions were found. Semantic pass is skipped.
***** fsck.reiser4 finished at Tue Feb  1 10:01:39 2005
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs option
to fix them.

***************************************

Running build-fs now...

Thanks,

Nicolas Smallwood

-----Original Message-----
From: Nicolas Smallwood [mailto:smallwood@maya.com]
Sent: Tuesday, February 01, 2005 11:56 AM
To: reiser
Subject: RE: Errors reported with dmesg using reiser4


The fsck.reiser4 check reported one fatal error in the superblock

Running fsck.reiser4 --build-sb as I type this.

Nicolas Smallwood



-----Original Message-----
From: Alex Zarochentsev [mailto:zam@namesys.com]
Sent: Monday, January 31, 2005 3:44 PM
To: smallwood@maya.com
Cc: reiserfs-list@namesys.com
Subject: Re: Errors reported with dmesg using reiser4


Hello,

On Tue, Jan 25, 2005 at 03:28:54PM -0500, smallwood@maya.com wrote:
> Hello, for the record, this is from a system running the following specs:
>
> Gentoo Linux
> 2.6.10-gentoo-r6 patched with reiser4-for-2.6.10-1
> 3ware 7000 series card with 4 SATA 250GB Western Digitial Drives with no
> raid configured.
>
> I am running a test pushing millions of directories onto one of the drives
> using a UUID as the directory name.  These all reside in the base
> directory of the filesystem.
>
> The directories are now being propogated by two python scripts creating
> random data inside these folders on two of the other drives.  When about
> 1.5gb has collected, they begin moving the folders onto the main drive.
>
> This latest test was started last Thursday, with the drive being about 34
> GBs full of data from related testing.
>
> Since then, the drive has filled to 92GB, but at some point, I discovered
> the following error:
>
> reiser4[mv(28692)]: key_warning
(fs/reiser4/plugin/object.c:97)[nikita-717]:
> WARNING: Error for inode 215673251 (-2)
> reiser4[mv(28692)]: write_sd_by_inode_common
> (fs/reiser4/plugin/object.c:480[nikita-2221]:
> WARNING: Failed to save sd for 215673251: -2
>
> These messages are then repeated nine times.
>
> Any suggestions on further checks I can make?

can you run fsck.reiser4 --check on that drive?

>
> Thank You,
>
> Nicolas Smallwood
> smallwood@maya.com

--
Alex.


