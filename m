From: Jason Holt <jason@lunkwill.org>
Subject: securely deleting files
Date: Tue, 6 May 2003 05:37:13 +0000 (UTC)
Message-ID: <Pine.LNX.4.44.0305060522270.20364-100000@potato.zayda.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13957-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


shred is a tool which is supposed to overwrite files so that they're
unrecoverable, even with fairly involved recovery techniques.  

But it isn't guaranteed to work - sensitive blocks may get moved around on the
physical disk, stored in journals, etc.

So here's how I get around it:

$ cat >sensitive
there's something sensitive in this file...

$ rm sensitive
$ cat /dev/zero    >foo ; sync ; rm foo  # Fill up the disk, then delete.
$ cat /dev/urandom >foo ; sync ; rm foo  # For the *truly* paranoid

Now, a good friend of mine pointed out that part of the space on a filesystem
is kept aside just for root, so you may want to fill the disk up as root.  
(Is this actually a concern?  Can blocks which used to hold user data end up
being reserved?)  

Also, if your sensitive file was in memory recently it might have been swapped
out, in which case it may still be in the swap partition.  I have a program
which fills up all available *memory* as well, and I could post the source
here if everyone's interested.

						-J

