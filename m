From: Andreas Dilger <adilger@clusterfs.com>
Subject: [BUG][trivial] atime not set on directory reads
Date: Thu, 13 Jun 2002 15:35:30 -0600
Message-ID: <20020613213530.GN682@clusterfs.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10732-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello reiserfs folks,
I'm just in the process of running some POSIX conformance tests on
Linux (test available at http://www.opengroup.org/testing/lsb-fhs/)
and reiserfs fails one test where ext2/ext3 are passing.

The test checks whether atime is updated on a directory if you do a
directory lookup.  I imagine that it is as simple as adding a call
UPDATE_ATIME(inode) to the reiserfs directory lookup.  This can, of
course, be turned off at runtime via the "noatime" mount option (I
think newer kernels also have a newer "nodiratime").

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

