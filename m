From: Danila Beketov <danila.beketov@gmail.com>
Subject: reiser4: mv command lost folder.
Date: Fri, 28 May 2010 09:57:32 +0400
Message-ID: <AANLkTilTr_Yt0OWx1ED8pt2pM0rZc4FCg9obrNKVX2w9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=P0EEIFo2cfEujaHJMTLouuekCjCziJjwCn5fMjSA8k4=;
        b=M3VgzqZjwuyg93an7Er0agVa1HeUMOjp38hMvwyt2dCpipfu9ZwBiWS3au7cnZKLap
         DmNiecry8Nk1gSLm3IG1reS5eSD+nTBQbxHsmHcuIIOfc9963B56aeoOHrnx0cKPatWY
         lC3RvyYxhXVcjNaVeuBtJGWdGawjoODJsADjo=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Hello,

Need help to return my lost folder, that has disappeared after mv
command execution by magic way.
Execution of fsck.reiser4 --build-fs shows the follow:

*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda8 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Fri May 28 09:11:22 2010
Reiser4 fs was detected on /dev/sda8.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           391b932d-6eb6-4d55-86c5-ae95b2b022d8
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format plugin.
version:        0
magic:          ReIsEr40FoRmAt
mkfs id:        0x502a6b1
flushes:        0
blocks:         119778624
free blocks:    58921227
root block:     58151748
tail policy:    0x2 (smart)
next oid:       0x408079
file count:     12526
tree height:    5
key policy:     LARGE


CHECKING THE STORAGE TREE
        Read nodes 12130
        Nodes left in the tree 12130
                Leaves of them 7608, Twigs of them 4410
        Time interval: Fri May 28 09:11:54 2010 - Fri May 28 09:12:32 2010
CHECKING EXTENT REGIONS.
        Read twigs 4410
        Time interval: Fri May 28 09:12:32 2010 - Fri May 28 09:12:36 2010
LOOKING FOR UNCONNECTED NODES
        Read nodes 0
        Good nodes 0
                Leaves of them 0, Twigs of them 0
        Time interval: Fri May 28 09:12:47 2010 - Fri May 28 09:12:47 2010
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Fri May 28 09:12:47 2010 - Fri May 28 09:12:47 2010
INSERTING UNCONNECTED NODES
        Twigs: read 0, inserted 0, by item 0, empty 0
        Leaves: read 0, inserted 0, by item 0
        Time interval: Fri May 28 09:12:57 2010 - Fri May 28 09:12:57 2010
CHECKING THE SEMANTIC TREE
        Found 12526 objects.
        Lost&found 1 objects.
        Time interval: Fri May 28 09:12:57 2010 - Fri May 28 09:12:59 2010
CLEANING UP THE STORAGE TREE
        Removed items 0
        Time interval: Fri May 28 09:12:59 2010 - Fri May 28 09:12:59 2010
***** fsck.reiser4 finished at Fri May 28 09:12:59 2010
Closing fs...done

FS is consistent

but there's no in lost+found dir.

After second execution:

*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda8 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** fsck.reiser4 started at Fri May 28 09:15:37 2010
Reiser4 fs was detected on /dev/sda8.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           391b932d-6eb6-4d55-86c5-ae95b2b022d8
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format plugin.
version:        0
magic:          ReIsEr40FoRmAt
mkfs id:        0x502a6b1
flushes:        0
blocks:         119778624
free blocks:    58921227
root block:     58151748
tail policy:    0x2 (smart)
next oid:       0x408079
file count:     12526
tree height:    5
key policy:     LARGE


CHECKING THE STORAGE TREE
        Read nodes 12130
        Nodes left in the tree 12130
                Leaves of them 7608, Twigs of them 4410
        Time interval: Fri May 28 09:16:09 2010 - Fri May 28 09:16:47 2010
CHECKING EXTENT REGIONS.
        Read twigs 4410
        Time interval: Fri May 28 09:16:47 2010 - Fri May 28 09:16:51 2010
LOOKING FOR UNCONNECTED NODES
        Read nodes 0
        Good nodes 0
                Leaves of them 0, Twigs of them 0
        Time interval: Fri May 28 09:17:02 2010 - Fri May 28 09:17:02 2010
CHECKING EXTENT REGIONS.
        Read twigs 0
        Time interval: Fri May 28 09:17:02 2010 - Fri May 28 09:17:02 2010
INSERTING UNCONNECTED NODES
        Twigs: read 0, inserted 0, by item 0, empty 0
        Leaves: read 0, inserted 0, by item 0
        Time interval: Fri May 28 09:17:12 2010 - Fri May 28 09:17:12 2010
CHECKING THE SEMANTIC TREE
Error: Entry "lost_name_1002b:6d757369630000:106e5" already exists.
Error: Can't add entry lost_name_1002b:6d757369630000:106e5 to
1002b:6d757369630000:106e5.
        Found 12142 objects.
        Lost&found 1 objects.
        Time interval: Fri May 28 09:17:12 2010 - Fri May 28 09:17:13 2010
***** fsck.reiser4 finished at Fri May 28 09:17:13 2010
Closing fs...done

Operational error occurred while fscking.

but there's no lost_name_1002b:6d757369630000:106e5 file on the partition.

Does anyone know how to repair my partition?

beda ~ # uname -a
Linux beda 2.6.31-gentoo-r10 #1 PREEMPT Sun May 23 11:29:07 MSD 2010
i686 Intel(R) Pentium(R) 4 CPU 2.40GHz GenuineIntel GNU/Linux

beda ~ # fsck.reiser4 --version
fsck.reiser4 1.0.7
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING

Danila.
