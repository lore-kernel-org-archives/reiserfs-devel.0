From: Timothy <treaves@silverfields.com>
Subject: Could not make new filesystem
Date: Wed, 5 Mar 2003 19:38:52 -0500
Message-ID: <20030305193852.6394596d.treaves@silverfields.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13101-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs <reiserfs-list@namesys.com>

	Hello all.

	Today I tried to make a new file system on a 154 gig driver, /dev/sdb1. 
reiserfs could not do it.  It would give errors ( I did not write it down,
but think it was '/dev/sdb1 is not a valid block device').  This suprised
me.  I have used reiser exclusivly for a while.  I know it was not a disk
problem, as jfs had no problem creating a filesystem, and I can use it
that way.

	This is a standard SuSE box.

	Any idea?
