From: Pierre-Philipp Braun <pbraun@nethence.com>
Subject: sparse-file archive on GFS2 corrupts Reiser4
Date: Fri, 18 Sep 2020 08:44:51 +0200
Message-ID: <712d2a21-8873-4373-16aa-78fd9dbf3b07@nethence.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hello

I am experiencing a weird and unexpected issue.  When archiving a sparse 
file virtual disk and file-system that is Reiser4, with the `tar -S` 
option accordingly, to actually keep the sparse, I get a corrupted 
file-system as a result.  This does not happen when the Reiser4 sparse 
file lives on EXT4, don't worry.  But it happens on GFS2 *1 and my guess 
is that it is not something that is supposed to happen.  I am not sure 
it's a bug, and even so, I am not sure whether it affects Reiser4 --OR-- 
Redhat GFS2.  I ping here at Reiser4 first, to have your advise.

Here's how to reproduce.  On a GFS2 file-system, creating a raw sparse 
file and a Reiser4 file-system on it.

dd if=/dev/zero of=dummy.reiser4 bs=1G count=0 seek=1
mkfs.reiser4 -fy dummy.reiser4
fsck.reiser4 -y dummy.reiser4

The result is fine, as expected.

*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the dummy.reiser4 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
***** fsck.reiser4 started at Fri Sep 18 09:22:01 2020
Reiser4 fs was detected on dummy.reiser4.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           51b8c5a3-ffd3-4528-9d0b-d5be985231e4
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format plugin.
version:        2
magic:          ReIsEr40FoRmAt
mkfs id:        0x4934ef80
flushes:        0
blocks:         262144
free blocks:    262107
root block:     23
tail policy:    0x2 (smart)
next oid:       0x10000
file count:     1
tree height:    2
key policy:     LARGE


CHECKING THE STORAGE TREE
         Read nodes 2
         Nodes left in the tree 2
                 Leaves of them 1, Twigs of them 1
         Time interval: Fri Sep 18 09:22:01 2020 - Fri Sep 18 09:22:01 2020
CHECKING EXTENT REGIONS.
         Read twigs 1
         Time interval: Fri Sep 18 09:22:01 2020 - Fri Sep 18 09:22:01 2020
CHECKING THE SEMANTIC TREE
         Found 1 objects (some could be encountered more then once).
         Time interval: Fri Sep 18 09:22:01 2020 - Fri Sep 18 09:22:01 2020
***** fsck.reiser4 finished at Fri Sep 18 09:22:01 2020
Closing fs...done

FS is consistent.

Then archiving and extracting it with `-S`.

tar czSf dummy.reiser4.tar.gz dummy.reiser4
rm -f dummy.reiser4
tar xzSf dummy.reiser4.tar.gz
fsck.reiser4 -y dummy.reiser4

and here it comes

*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the dummy.reiser4 block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
***** fsck.reiser4 started at Fri Sep 18 09:23:23 2020
FSCK: backup.c: 485: repair_backup_open: Only 4 of 5 backup blocks are 
found.
Fatal: Failed to open the reiser4 backup.
Fatal: Cannot open the FileSystem on (dummy.reiser4).

1 fatal corruptions were detected in SuperBlock. Run with --build-sb 
option to fix them.


What angle should I take to this problem?

Thank you

*1 https://en.wikipedia.org/wiki/GFS2
-- 
Pierre-Philipp
