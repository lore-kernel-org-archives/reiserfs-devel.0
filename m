From: Sergey Matviyenko <stealth@sitv.ru>
Subject: reiserfsck --rebuild-tree failed
Date: Sat, 10 Mar 2007 18:00:23 +0500
Message-ID: <1979353763.20070310180023@sitv.ru>
Reply-To: Sergey Matviyenko <stealth@sitv.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30596-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I run reiserfsck --yes --rebuild-tree --scan-whole-partition.

With reiserfsprogs-3.6.19 i have error on Pass 3a:
"lost+found.c 348 pass_3a_look_for_lost
look_for_lost: The entry 'lost+found' could not be found in the root directory."

With reiserfsprogs-3.6.19.5 i have error on Pass 2:
reiserfsck: ustree.c:51: free_unformatted_nodes: Assertion `to_be_forgotten->b_count > 0' failed.






