From: Phil Howard <phil-reiserfs@ipal.net>
Subject: copying partition to partition, sector by sector, live
Date: Sun, 21 Apr 2002 13:16:14 -0500
Message-ID: <20020421181614.GA11239@vega.ipal.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10098-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Under ext2, I could copy a live mounted partition to another partition
of the same size sector by sector, followed by an e2fsck of the target
partition, and have complete all files that are otherwise complete on
the source partition.  Sometimes I might even get files copied this way
that would not have survived a power-reset event because such copying
would usually be done from cache.

Under reiserfs, the picture changes due to the changing roles of the
tools for managing and repairing the filesystem.  What I would like to
find out is what steps would be appropriate to bring a sector copied
reiserfs filesystem back into consistency on the target partition.
Surely I could run the maximal set of recovery tools, but this might
be overkill.  Or maybe not.

A power-reset event would leave a filesystem in the state as stored in
its entirety at the instant of the event.  It would be like freezing
the whole machine and taking a sector by sector snapshot.  One problem
is that doing a sector-by-sector copy of a partition does not get a
time-consistent snapshot.  Instead, you get a time skewed snapshot.
An update to the partition by the filesystem might write a group of
sectors crossing the sectors currently being read by the copying.
This would result in a potential out-of-order snapshot where sectors
written first are not present (written to locations already copied)
and sectors written later are present (written to locations not yet
copied).

How well can the various tools for reiserfs deal with this?  In ext2,
the time to do a raw sector copy is shorter than the time to mount the
target partition as a filesystem and scan both file trees for updates
(method 1) or to reformat the target filesystem and mount the target
and copy every file from the source filesystem (method 2).  This makes
sector copying attractive for backup purposes.  The e2fsck step would
not be routinely performed; it would be done if needed during recovery.

For reiserfs, the issue I'm concerned with is that the time skew may
completely disrupt the balanced tree structure in a way that the journal
cannot replay.  While tools may be able to recover this, it may involve
lengthy processing (rebuilding a tree, for example).  If this is too
lengthy, it may be counter productive.

A consideration exists for going back to backup by copying individual
files.  Before making such a decision, I would like to get an idea what
impact and effect this will have with regard to reiserfs, which I have
begun conversion to.  Since backups are done to guard against loss due
to catastrophic storage device failure, the fact that reiserfs does
journaling is unlikely to have much consequence for the choice; that
feature instead will be expected to aid in faster resumption of normal
operations in lesser failure modes, e.g. power-reset.

-- 
-----------------------------------------------------------------
| Phil Howard - KA9WGN |   Dallas   | http://linuxhomepage.com/ |
| phil-nospam@ipal.net | Texas, USA | http://phil.ipal.org/     |
-----------------------------------------------------------------
