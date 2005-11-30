From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: reiser4 bug
Date: Wed, 30 Nov 2005 11:40:16 +0100
Message-ID: <20051130114016.5b294aa0@SiRiUS.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27161-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi!
after some days of uptime i just had a soft lockup with / and /usr on
reiser4 while running an emerge (which quit on make install with a
segmentation fault). RAM was at 192/512 mb, lots of diskspace left on
both partitions. I thought it will be able to sync after some seconds,
but after 5 minutes hanging at this state, i had to reset the system. 

kernel is 2.6.15-rc2 with reiser4 from 2.6.15-rc2-mm1. reiser4 is
mounted noatime,nodiratime (otherwhise it wouldn't be usable at all
atm because of hanging at tasks like 'ebuild foo.ebuild digest' and the
already known vi :wq! - where it seems to take forever to return to
the prompt).

following is the bug message:
http://phpfi.com/89498

regards!
tom

