From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: fsck.reiser4 can't fix 1 fixable corruption
Date: Tue, 20 Apr 2004 17:33:51 +0300
Message-ID: <200404201733.51809.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18080-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I'm running Debian with these packages installed:

ii  reiser4progs                  0.5.3-1
ii  libc6                         2.3.2.ds1-11
ii  libncurses5                   5.4-3
ii  libreadline4                  4.3-10
ii  libuuid1                      1.35-4

The kernel is a kernel.org 2.6.5 kernel patched with the 
http://thebsh.namesys.com/snapshots/LATEST/all.diff.gz patch and an 
additional patch that was sent to this list (Subject: "Re: snapshot 
2004.03.26 + linux 2.6.5 = build error").

I decided to fsck my Reiser4 backup partition, which happens to be on an LVM2 
Logical Volume:

  --- Logical volume ---
  LV Name                /dev/sys/backup
  VG Name                sys
  LV UUID                boifcf-z605-EHXl-0zi7-CdW6-vpwk-35XsJ2
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                8.00 GB
  Current LE             256
  Segments               2
  Allocation             next free (default)
  Read ahead sectors     0
  Block device           254:7

fsck failed however, with the following warning (sorry about the line 
wrapping):


==============================================================================
[root@rmeijer-noc ~] # fsck /dev/sys/backup
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
free blocks:    420905
root block:     663
tail policy:    0x4 (smart)
next oid:       0x6f6ae
file count:     262871
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
        Read nodes 141159
        Nodes left in the tree 141159
                Leaves of them 138592, Twigs of them 2509
        Time interval: Tue Apr 20 17:00:59 2004 - Tue Apr 20 17:03:13 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 2509
        Time interval: Tue Apr 20 17:03:13 2004 - Tue Apr 20 17:03:20 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.
Error: Node (1444613), item (2): StatData of the file [2a:0:ffff] has the 
wrong bytes (0), Should be (188). Plugin (stat40).
        Time interval: Tue Apr 20 17:03:20 2004 - Tue Apr 20 17:07:02 2004
***** fsck.reiser4 finished at Tue Apr 20 17:07:02 2004
Closing fs...done

1 fixable corruptions were detected in the FileSystem. Run with --fix option 
to fix them.
==============================================================================


But running fsck.reiser4 with (among others) the --fix option results in the 
following:


==============================================================================
[root@rmeijer-noc ~] # fsck.reiser4 -v --build-sb --build-fs 
--fix /dev/sys/backup
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read REAMDE first.
*******************************************************************

Fscking the /dev/sys/backup block device.
Will build the Reiser4 SuperBlock.
Will build the Reiser4 FileSystem.
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
free blocks:    420905
root block:     663
tail policy:    0x4 (smart)
next oid:       0x6f6ae
file count:     262871
tree height:    4
key policy:     LARGE

***** Tree Traverse Pass: scanning the reiser4 internal tree.
        Read nodes 141159
        Nodes left in the tree 141159
                Leaves of them 138592, Twigs of them 2509
        Time interval: Tue Apr 20 16:46:16 2004 - Tue Apr 20 16:48:19 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 2509
        Time interval: Tue Apr 20 16:48:19 2004 - Tue Apr 20 16:48:27 2004
***** DiskScan Pass: scanning the partition for unconnected nodes.
        Read nodes 0
        Good nodes 0
                Leaves of them 0, Twigs of them 0
        Time interval: Tue Apr 20 16:48:27 2004 - Tue Apr 20 16:48:27 2004
***** TwigScan Pass: checking extent pointers of all twigs.
        Read twigs 0
        Time interval: Tue Apr 20 16:48:27 2004 - Tue Apr 20 16:48:27 2004
***** AddMissing Pass: inserting unconnected nodes into the tree.
        Twigs: read 0, inserted 0, by items 0
        Leaves: read 0, inserted 0, by items 0
        Time interval: Tue Apr 20 16:48:27 2004 - Tue Apr 20 16:48:27 2004
***** Semantic Traverse Pass: reiser4 semantic tree checking.
Error: Node (1444613), item (2): StatData of the file [2a:0:ffff] has the 
wrong bytes (0), Fixed to (188). Plugin (stat40).
        Time interval: Tue Apr 20 16:48:27 2004 - Tue Apr 20 16:55:48 2004
***** Cleanup Pass: cleaning up the reiser4 storage tree.
        Removed items 0
        Time interval: Tue Apr 20 16:55:48 2004 - Tue Apr 20 16:59:09 2004
***** fsck.reiser4 finished at Tue Apr 20 16:59:09 2004
Closing fs...done

No corruption found.
==============================================================================


Looks good, but when I run "fsck.reiser4 /dev/sys/backup" again, it tells me 
that it has found 1 fixable corruption and that I need to run it with the 
--fix parameter...

What can I do to fix this? Or isn't my filesystem broken in the first place? 
Could it be a problem with fsck.reiser4?

If you need more information, please let me know.


Thanks,

Ray

P.S. How about all these spelling errors in fsck's output? ;)
