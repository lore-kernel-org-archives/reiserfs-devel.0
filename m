From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Horrible ftruncate performance
Date: Thu, 10 Jul 2003 05:23:39 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0307100523110.24356-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14857-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi,

I've noticed very long "hangs" using reiserfs and they were always at
ftruncate(2). I made a comparision between different filesystems. SuSE 8.2
(same bad performance on older SuSE versions as well), same partitition,
default mkfs.*. Let's create a 200GB sparse file:

	dd if=/dev/zero of=sparse bs=1 seek=200G count=1

Results:
	ext3	    0.00 sec
	XFS         0.00 sec
	JFS         0.00 sec
	reiserfs  874.27 sec (all spent in the kernel)

I also created a 2TB sparse file with the other filesystems and the results
were still unmeasurable. However it would have taken 10x more time for
reiserfs because as I noticed the time spent in ftruncate is linear to the
length the file to be truncated.

Is there a faster way to create big sparse files on reiserfs?

	Szaka

