From: Brandon Low <lostlogic@gentoo.org>
Subject: New gentoo bug with reiserfsprogs-3.6.5
Date: Thu, 3 Apr 2003 10:02:31 -0600
Message-ID: <20030403160231.GF26830@lostlogicx.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13545-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Greetings Reiser devs,

I've just recieved a new bug report relating to the reiserfsprogs-3.6.5 version in gentoo (this includes a reiserfsprogs-3.6.5-flush_buffers-bug.patch from vitaly).  Please see: http://bugs.gentoo.org/show_bug.cgi?id=18612

Based on the initial bug report, I thought it was a fault in our kernel or the kernel that the user was using at least, but the user has confirmed that simply reverting to reiserfsprogs-3.6.4 fixes his issues.

Thanks!

--Brandon Low
