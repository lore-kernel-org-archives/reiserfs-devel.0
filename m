From: lists@unbeatenpath.net
Subject: Status of fsync() wrt mail servers
Date: Wed, 10 Sep 2003 00:29:53 -0500
Message-ID: <20030910002953.C14172@unbeatenpath.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,
I'm in the process of researching OSes and filesystems for a new mail
system.  I'm hoping to use linux+reiserfs+postfix, and I'm wondering
where reiserfs stands wrt to fsync().  Does reiserfs provide a mechanism
to have truly synchronous writes with a single fsync() call?  Thanks

I've read a very long linux-kernel thread[1] from 2001 where Matthias
Andree was petitioning for changes in the fsync() behavior, and I'm
having trouble following what happened since then.

Thanks

[1] http://lists.insecure.org/lists/linux-kernel/2001/Jul/3545.html
-- 
Cameron Moore
[ The early bird gets the worm, but the second mouse gets the cheese. ]
