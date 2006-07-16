From: maciejej@msoe.edu
Subject: reiser4 OOPSes and panics when out of memory
Date: Sun, 16 Jul 2006 12:44:53 -0500 (CDT)
Message-ID: <63591.70.224.221.228.1153071893.squirrel@people.msoe.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-29015-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Has my previous post
(http://marc.theaimsgroup.com/?l=reiserfs&m=115259665831650&w=2) been
overlooked, or have I not provided enough information? Do I need to
reproduce these issues on 2.6.18-rc1-mm2? Should I be trying any patches?

The bottom line is with 2.6.17-mm6, I've always been able to OOPs or panic
reiser4 on my amd64 machine (haven't tried x86 yet) by using all available
physical memory.

