From: "Neil Ferguson" <info@netvis.co.uk>
Subject: Corruption? :-(
Date: Wed, 9 Jun 2004 11:23:00 +0100 (BST)
Message-ID: <32908.195.137.32.205.1086776580.squirrel@server27.ukservers.net>
Reply-To: neil@netvis.co.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-19113-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm using a snapshot of Reiser4 from February, and whilst doing a backup
last night the machine appears to have crashed, causing corruption of the
(root) Reiser4 partition from which the backup was being made.

As the partition is only partly backed up, I could really do with getting
the rest of the data off - I don't mind if its never bootable again, I
just want it readible once so I can grab stuff off it.  I also appreciate
that using a snapshot that old isn't exactly wise, would you believe I was
going to try and find the time to upgrade at the weekend...  Th results of
my attempts to recover it so far are shown below,

I've put the drive in another machine to try and recover it, which has
2.6.5 patched for Reiser4 with the debian-packaged patches (appears to be
20040326), and I'm using reiser4progs version 0.5.3.  Any help or
suggestions whatsoever would be appreciated, I know I've been stupid...


# fsck.reiser4 -v --check /dev/hdb4
Continue? (Yes)
Fatal: Wrong magic found in the master super block
Fatal: Failed to open the master super block.
Fatal: Cannot open the FileSystem on (/dev/hdb4).

1 fatal corruptions were detected in SuperBlock. Run with --build-sb
option to fix them.


# fsck.reiser4 -v --build-sb /dev/hdb4
Continue? (Yes)
***** Openning the fs.
Fatal: Wrong magic found in the master super block.
Master super block cannot be found.  Do you want to build a new one on
(/dev/hdb4)? (Yes)
Which block size do you want to use? [4096]: (Same as I used originally -
Enter)
Information: A new master superblock is created on (/dev/hdb4).
Error: Can't find disk-format plugin by its id 0xff.
Fatal: Cannot open the on-disk format on (/dev/hdb4)
umka-2649: Assertion (blocks > 0) at format40.c:236 in function
format40_create() failed.
Aborted
#


Thanks,


Neil
