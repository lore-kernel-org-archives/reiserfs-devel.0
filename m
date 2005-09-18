From: Damien Wyart <damien.wyart@free.fr>
Subject: ent:sdXnn going to D state with latest reiser4 patch
Date: Sun, 18 Sep 2005 22:29:04 +0200
Message-ID: <20050918202904.GA3025@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26041-reiserfs=m.gmane.org@namesys.com>
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

Doing some tests with latest reiser4 patches from 2.6.14-mm1, I noticed
that the load of the machine never goes under 2. It comes from two
processes related to reiser4 and going to D state immediately after the
filesystems are mounted. As there are two reiser4 partitions, I get two
such processes, and the load is always higher than 2. These processes
appear as ent:sdb7 and ent:sdb11 (correspnding fs are on sdb7 and sdb11)
and same with square brackets sometimes.

I can reproduce this with 2.6.14-rc1-git4 and 2.6.13.2, with the latest
patch. I do not have this problem with previous reiser4 patch
(2.6.13-mm3 + latest reiser4-only.1.patch from ftp.namesys.com.

I guess people doing simple tests of this patch will see this behaviour,
and I am surprised nobody seems to have posted about this on the list.


Best regards,

-- 
Damien Wyart
