From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: fsck.reiser4 can't fix 1 fixable corruption
Date: Wed, 21 Apr 2004 12:59:01 +0300
Message-ID: <200404211259.01802.rmeijer@internet.gr>
References: <200404201733.51809.rmeijer@internet.gr> <200404211255.41388.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404211255.41388.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed 21 April 2004 11:55, Vitaly Fertman wrote:

> would you try this patch, it should fix the problem,
> email me about the result please.

No luck... :(


fsck.reiser4 --fix /dev/sys/backup:

==============================================================================
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read REAMDE first.
*******************************************************************

Fscking the /dev/sys/backup block device.
Will fix minor corruptions of the Reiser4 SuperBblock.
Will fix minor corruptions of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** Openning the fs.
Reiser4 journal (journal40) on /dev/sys/backup: 0 transactions replaied of the 
total 0 blocks.
Reiser4 fs was detected on the /dev/sys/backup.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           f6a57152-e546-4a2a-b833-c0bce2a62caa
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.3
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x6909edad
blocks:         2097152
free blocks:    394814
root block:     171208
tail policy:    0x4 (smart)
next oid:       0x78512
file count:     291088
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
        Read nodes 151585
        Nodes left in the tree 151585
                Leaves of them 148854, Twigs of them 2674
        Time interval: Wed Apr 21 12:37:54 2004 - Wed Apr 21 12:40:20 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 2674
        Time interval: Wed Apr 21 12:40:20 2004 - Wed Apr 21 12:40:28 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.
Error: Node (25), item (2): StatData of the file [2a:0:ffff] has the wrong 
bytes (0), Fixed to (188). Plugin (stat40).
        Time interval: Wed Apr 21 12:40:29 2004 - Wed Apr 21 12:45:19 2004
***** fsck.reiser4 finished at Wed Apr 21 12:45:19 2004
Closing fs...done

No corruption found.
==============================================================================


fsck /dev/sys/backup:

==============================================================================
fsck 1.35 (28-Feb-2004)
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read REAMDE first.
*******************************************************************

Fscking the /dev/sys/backup block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** Openning the fs.
Reiser4 journal (journal40) on /dev/sys/backup: 0 transactions replaied of the 
total 0 blocks.
Reiser4 fs was detected on the /dev/sys/backup.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           f6a57152-e546-4a2a-b833-c0bce2a62caa
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.3
magic:          ReIsEr40FoRmAt
flushes:        0
mkfs id:        0x6909edad
blocks:         2097152
free blocks:    394814
root block:     171208
tail policy:    0x4 (smart)
next oid:       0x78512
file count:     291088
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
        Read nodes 151585
        Nodes left in the tree 151585
                Leaves of them 148854, Twigs of them 2674
        Time interval: Wed Apr 21 12:46:49 2004 - Wed Apr 21 12:49:14 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 2674
        Time interval: Wed Apr 21 12:49:14 2004 - Wed Apr 21 12:49:22 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.
Error: Node (25), item (2): StatData of the file [2a:0:ffff] has the wrong 
bytes (0), Should be (188). Plugin (stat40).
        Time interval: Wed Apr 21 12:49:22 2004 - Wed Apr 21 12:55:59 2004
***** fsck.reiser4 finished at Wed Apr 21 12:55:59 2004
Closing fs...done

1 fixable corruptions were detected in the FileSystem. Run with --fix option 
to fix them.
==============================================================================


Thanks,

Ray
