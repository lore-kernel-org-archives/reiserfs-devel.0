From: Tom Vier <tmv@comcast.net>
Subject: vs-8115: get_num_ver: not directory item
Date: Mon, 13 Sep 2004 22:25:46 -0400
Message-ID: <20040914022546.GA2425@zero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21731-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

i got this warning on my md0 (raid 0, two scsi drives) array. i've never
seen it before. reiserfsck 3.6.14 (i know, not the latest) didn't detect any
problems. i tried to reproduce it, but i couldn't trigger it. i've never
seen this before.

i found this, which claims to fix it, but it already applied:
http://www.mail-archive.com/reiserfs-list@namesys.com/msg03866.html

i'm running 2.6.8 UP x86 on an opteron, highmem enabled, no preempt.
nothing fancy.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
