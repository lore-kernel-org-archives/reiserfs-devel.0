From: Ole Tange <reiserfs@tange.dk>
Subject: reiserfsck on /
Date: Wed, 25 Sep 2002 15:22:36 +0200 (CEST)
Message-ID: <Pine.LNX.4.33L2.0209251521300.8332-100000@mailbackup.pi.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11529-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Summary: How do I run reiserfsck on / ?

I have previously succesfully run e2fsck on / while logged in through ssh.
e2fsck is happy as long as / is mounted read only. Reiserfs, however,
seems to be a bit more picky.

I can run reiserfsck --check:

  There were found 175 corruptions which can be fixed with --fix-fixable

but not --fix-fixable:

reiserfsprogs 3.6.2

Will check consistency of the filesystem on /dev/hdb2
Will fix what can be fixed w/o --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --fix-fixable started at Wed Sep 25 15:12:04 2002
###########
Filesystem seems mounted read-only. Skipping journal replay..
--fix-fixable ignored

So how do I correct the errors on / through ssh? I am willing to sacrify
all files made after last reboot, so I guess the journal is not important
to me.


/Ole


