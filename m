From: John Dalbec <jpdalbec@ysu.edu>
Subject: resize_reiserfs 3.6.8 doesn't shrink bitmap correctly
Date: Mon, 23 Jun 2003 16:10:38 -0400
Message-ID: <3EF75EBE.9070304@ysu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14679-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

I ran resize_reiserfs -s -1024M on a ReiserFS partition for testing. 
The partition resized OK, mounted OK, umounted OK.  Then I tried to 
restore the original filesystem size, but resize_reiserfs reported that 
it couldn't read the on-disk bitmap.  I ran reiserfsck and it reported:

Zero bit found in on-disk bitmap after the last valid bit.

and said I could fix it with --fix-fixable.  I ran reiserfsck 
--fix-fixable and it fixed the problem.  I then ran resize_reiserfs on 
the same partition to restore the original size with no problems.  I 
repeated this exercise to make sure it wasn't a fluke, with the same 
results.
Thanks,
John Dalbec

