From: "Ken D'Ambrosio" <kend@cubicwafer.com>
Subject: fsck not working right on large partition?
Date: Wed, 31 May 2006 13:30:45 -0400 (EDT)
Message-ID: <54673.70.88.218.169.1149096645.squirrel@webmail.xanoptix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28706-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I've got a system with several partitions, once of which is a 2.5 TB LVM
array.  On boot, fsck runs through all the partitions, and they all report
back "Filesystem is clean" -- except the big one; I then get dumped into
single-user mode.  Running fsck manually turns up nothing, though it, too,
never reports back that the filesystem is clean.  I've run a "strace" on
fsck.reiserfs, and don't see anything particularly alarming.

Any ideas as to why it's not working?

Thanks,

-Ken D'Ambrosio

