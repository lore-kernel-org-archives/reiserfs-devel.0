From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: SOLVED! (was Re: Problem with 2004.04.21-internal.testing)
Date: Wed, 21 Apr 2004 16:53:03 +0300
Message-ID: <200404211653.03400.rmeijer@internet.gr>
References: <20040421121611.GA27992@brouette.noos.fr> <200404211732.41805.vitaly@namesys.com> <200404211642.48301.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404211642.48301.rmeijer@internet.gr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed 21 April 2004 16:42, Raymond A. Meijer wrote:

> Okay, this compiled and installed cleanly.
>
> Running 'fsck.reiser4 /dev/sys/backup' now...

Wooohoooooo! No more (spelling ;) errors:

==============================================================================
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sys/backup block device.
Will check the consistency of the Reiser4 SuperBlock.
Will check the consistency of the Reiser4 FileSystem.
Continue?
(Yes/No): Yes
***** Opening the fs.
Reiser4 journal (journal40) on /dev/sys/backup: 0 transactions replayed of the 
total 0 blocks.
Reiser4 fs was detected on /dev/sys/backup.
Master super block (16):
magic:          ReIsEr4
blksize:        4096
format:         0x0 (format40)
uuid:           f6a57152-e546-4a2a-b833-c0bce2a62caa
label:          <none>

Format super block (17):
plugin:         format40
description:    Disk-format for reiser4, ver. 0.5.4
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
        Time interval: Wed Apr 21 16:42:43 2004 - Wed Apr 21 16:45:12 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 2674
        Time interval: Wed Apr 21 16:45:12 2004 - Wed Apr 21 16:45:20 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.
        Time interval: Wed Apr 21 16:45:20 2004 - Wed Apr 21 16:51:24 2004
***** fsck.reiser4 finished at Wed Apr 21 16:51:24 2004
Closing fs...done

No corruption found.
==============================================================================


Thanks a million!!

Ray
