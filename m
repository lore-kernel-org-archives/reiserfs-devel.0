From: Tom Vier <tmv@comcast.net>
Subject: 2.6.4 corruption
Date: Sun, 21 Mar 2004 19:55:55 -0500
Message-ID: <20040322005555.GA509@zero>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17365-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

after rebooting (no umount, sysreq wouldn't respond) due to a radeon
problem, some files had their data blocks switched. one file was truncated,
and what was truncated (it's mounted notail, btw) was attached to another
file. one file was completely corrupt. this isn't considered normal
behavior, i assume.

i'm currently bootstrapping an altroot, so i can run reiserfsck.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
