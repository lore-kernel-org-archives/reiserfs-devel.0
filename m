From: Pierre Abbat <phma@webjockey.net>
Subject: help recover filesystem corrupted by failing ide controller
Date: Fri, 14 Mar 2003 19:42:00 -0500
Message-ID: <200303141942.00679.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13265-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Wednesday evening, my computer started giving weird errors. ls in a busy 
directory showed lots of garbled filenames. Within an hour it was unbootable. 
I called a friend and we went and swapped drives around; the computer 
wouldn't recognize either drive, and he suspected a motherboard problem. 
Today I got a loaner and put the drives in it; it recognized them both and 
booted right up. reiserfsck -x, however, showed lots of crosslinked files and 
other errors I don't understand. Attempting to cat .procmailrc hung cat. So I 
ran reiserfsck --rebuild-tree, which has worked for me before, and it made 
the filesystem unbootable. -x claims that lots of bitmaps are wrong. I 
haven't yet gotten the latest reiserfsck. The one I have is 3.x.0i from 
Mandrake 8.0 or 8.1. The reiserfs version in the kernel is 3.6.25; the 
filesystem is 3.5.x. Can I use debugreiserfs -p to dump the tree and recreate 
the filesystem on another disk?

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
