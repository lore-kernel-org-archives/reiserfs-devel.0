From: Joel Ebel <jbebel@ncsu.edu>
Subject: read-only drive with reiserfs partiton not mountable
Date: Thu, 03 Jul 2003 13:09:21 -0400
Message-ID: <3F046341.8000408@ncsu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Ok.  I've got an unusual problem.  My hard drive decided yesterday to 
turn read-only.  I can't write anything to it.  The data seems to be all 
  there and readable, but any write to the drive fails.  I have 
partitions of NTFS, FAT32, ext3, and reiserfs.  I'm able to mount all 
the other partitions and copy files off of them, but the reiserfs 
partition refuses to mount saying wrong fs type, bad superblock, etc... 
  Is there a reason that a reiserfs partition on a read-only drive 
wouldn't mount?  I'd sure like to get what data I can off of it.  Any ideas?

Thanks,
Joel Ebel

