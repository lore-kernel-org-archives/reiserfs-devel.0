From: Tom Vier <tmv@comcast.net>
Subject: Re: 2.6.4 corruption
Date: Mon, 22 Mar 2004 19:08:56 -0500
Message-ID: <20040323000856.GA3975@zero>
References: <20040322005555.GA509@zero> <200403221221.42413.Dieter.Nuetzel@hamburg.de>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17390-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200403221221.42413.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, Mar 22, 2004 at 12:21:42PM +0100, Dieter N?tzel wrote:
> Use the data-logging patches for 2.6.4 up or "wait" or 2.6.5/2.6.6.

i'm getting rejects using:

for i in `cat /pkgs/linux/reiserfs/mason/data-logging/2.6.4/series`; do \
patch -p1 --dry-run < /pkgs/linux/reiserfs/mason/data-logging/2.6.4/$i; done

patching file fs/reiserfs/stree.c
patching file include/linux/reiserfs_fs.h
patching file fs/reiserfs/stree.c
Hunk #1 FAILED at 678.
Hunk #2 succeeded at 690 (offset -2 lines).
Hunk #3 FAILED at 704.
2 out of 3 hunks FAILED -- saving rejects to file fs/reiserfs/stree.c.rej
patching file fs/reiserfs/stree.c
patching file fs/reiserfs/inode.c
patching file fs/reiserfs/file.c
patching file fs/reiserfs/journal.c
patching file fs/reiserfs/namei.c
patching file fs/reiserfs/inode.c
patching file include/linux/reiserfs_fs_sb.h
patching file fs/reiserfs/journal.c
Hunk #1 succeeded at 408 (offset 3 lines).
Hunk #2 succeeded at 443 (offset 3 lines).
Hunk #3 succeeded at 2048 (offset -2 lines).
Hunk #4 succeeded at 2284 (offset -2 lines).
Hunk #5 succeeded at 2478 (offset -2 lines).
patching file fs/reiserfs/namei.c
patching file fs/reiserfs/file.c
Hunk #1 succeeded at 29 (offset 1 line).
Hunk #2 succeeded at 58 (offset 1 line).
patching file fs/reiserfs/prints.c
patching file fs/reiserfs/fix_node.c
patching file fs/reiserfs/inode.c
patching file fs/reiserfs/do_balan.c
patching file include/linux/reiserfs_fs_sb.h
patching file include/linux/reiserfs_fs.h
patching file fs/reiserfs/journal.c
Hunk #8 succeeded at 534 (offset 47 lines).
Hunk #9 succeeded at 561 (offset 47 lines).
Hunk #10 succeeded at 586 (offset 47 lines).
Hunk #11 succeeded at 627 (offset 47 lines).
Hunk #12 succeeded at 712 (offset 47 lines).
Hunk #13 succeeded at 726 (offset 47 lines).
Hunk #14 succeeded at 916 (offset 47 lines).
Hunk #15 succeeded at 953 (offset 47 lines).
Hunk #16 succeeded at 994 (offset 47 lines).
Hunk #17 succeeded at 1028 (offset 47 lines).
Hunk #18 succeeded at 1066 (offset 47 lines).
Hunk #19 succeeded at 1080 (offset 47 lines).
Hunk #20 succeeded at 1100 (offset 47 lines).
Hunk #21 succeeded at 1141 (offset 47 lines).
Hunk #22 succeeded at 1162 (offset 47 lines).
Hunk #23 succeeded at 1177 (offset 47 lines).
Hunk #24 succeeded at 1460 (offset 47 lines).
Hunk #25 succeeded at 1594 (offset 47 lines).
Hunk #26 succeeded at 1634 (offset 47 lines).
Hunk #27 succeeded at 1662 (offset 47 lines).
Hunk #28 succeeded at 1830 (offset 47 lines).
Hunk #29 succeeded at 1890 (offset 47 lines).
Hunk #30 succeeded at 1918 (offset 47 lines).
Hunk #31 succeeded at 1972 (offset 47 lines).
Hunk #32 succeeded at 2082 (offset 47 lines).
Hunk #33 succeeded at 2093 (offset 47 lines).
Hunk #34 succeeded at 2202 (offset 47 lines).
Hunk #35 succeeded at 2219 (offset 48 lines).
Hunk #36 succeeded at 2233 (offset 48 lines).
Hunk #37 succeeded at 2243 (offset 48 lines).
Hunk #38 FAILED at 2262.
Hunk #39 succeeded at 2298 (offset 45 lines).
Hunk #40 succeeded at 2336 with fuzz 2 (offset 45 lines).
Hunk #41 FAILED at 2351.
Hunk #42 succeeded at 2428 with fuzz 1 (offset 8 lines).
Hunk #43 succeeded at 2443 (offset 8 lines).
Hunk #44 FAILED at 2461.
Hunk #45 succeeded at 2486 (offset 9 lines).
Hunk #46 succeeded at 2525 (offset 9 lines).
Hunk #47 succeeded at 2571 (offset -7 lines).
Hunk #48 succeeded at 2596 (offset -7 lines).
Hunk #49 succeeded at 2649 (offset -5 lines).
Hunk #50 succeeded at 2719 (offset -5 lines).
Hunk #51 succeeded at 2736 (offset -5 lines).
Hunk #52 succeeded at 2746 (offset -5 lines).
Hunk #53 succeeded at 2784 (offset -5 lines).
Hunk #54 succeeded at 2824 (offset -5 lines).
Hunk #55 succeeded at 2848 (offset -5 lines).
Hunk #56 succeeded at 2880 (offset -5 lines).
Hunk #57 succeeded at 2889 (offset -5 lines).
Hunk #58 succeeded at 2977 (offset -5 lines).
Hunk #59 FAILED at 3028.
Hunk #60 succeeded at 3050 (offset -9 lines).
Hunk #61 succeeded at 3081 with fuzz 1 (offset -12 lines).
Hunk #62 succeeded at 3098 (offset -12 lines).
Hunk #63 succeeded at 3132 (offset -12 lines).
Hunk #64 succeeded at 3148 (offset -12 lines).
Hunk #65 succeeded at 3161 (offset -12 lines).
Hunk #66 succeeded at 3168 (offset -12 lines).
Hunk #67 succeeded at 3204 (offset -12 lines).
Hunk #68 succeeded at 3226 (offset -12 lines).
4 out of 68 hunks FAILED -- saving rejects to file fs/reiserfs/journal.c.rej
patching file fs/reiserfs/objectid.c
patching file fs/reiserfs/super.c
patching file fs/reiserfs/ibalance.c
patching file fs/reiserfs/procfs.c
patching file fs/reiserfs/fix_node.c
patching file fs/reiserfs/inode.c
Hunk #1 succeeded at 969 (offset 5 lines).
Hunk #2 succeeded at 1626 (offset 5 lines).
patching file fs/reiserfs/do_balan.c
Hunk #1 FAILED at 30.
1 out of 1 hunk FAILED -- saving rejects to file fs/reiserfs/do_balan.c.rej
patching file include/linux/reiserfs_fs_i.h
patching file include/linux/reiserfs_fs_sb.h
Hunk #3 FAILED at 154.
Hunk #4 succeeded at 157 (offset -4 lines).
Hunk #5 succeeded at 198 (offset -4 lines).
Hunk #6 succeeded at 219 (offset -4 lines).
Hunk #7 succeeded at 408 (offset -4 lines).
Hunk #8 FAILED at 463.
Hunk #9 succeeded at 473 (offset -3 lines).
2 out of 9 hunks FAILED -- saving rejects to file include/linux/reiserfs_fs_sb.h.rej
patching file include/linux/reiserfs_fs.h
Hunk #1 succeeded at 1701 (offset -1 lines).
Hunk #2 succeeded at 1747 (offset 1 line).
patching file fs/reiserfs/journal.c
Hunk #1 FAILED at 54.
Hunk #2 FAILED at 596.
Hunk #3 succeeded at 845 with fuzz 2 (offset -54 lines).
Hunk #4 FAILED at 906.
Hunk #5 FAILED at 1100.
Hunk #6 FAILED at 1339.
Hunk #7 FAILED at 1373.
Hunk #8 FAILED at 2096.
Hunk #9 succeeded at 2319 (offset -62 lines).
Hunk #10 succeeded at 2493 with fuzz 2 (offset -99 lines).
Hunk #11 FAILED at 2676.
Hunk #12 FAILED at 2687.
Hunk #13 succeeded at 2788 with fuzz 2 (offset -114 lines).
Hunk #14 FAILED at 2803.
Hunk #15 FAILED at 3208.
Hunk #16 FAILED at 3385.
Hunk #17 FAILED at 3474.
13 out of 17 hunks FAILED -- saving rejects to file fs/reiserfs/journal.c.rej
patching file fs/reiserfs/super.c
Hunk #1 succeeded at 506 (offset -4 lines).
Hunk #2 succeeded at 668 (offset -4 lines).
Hunk #3 succeeded at 742 (offset -4 lines).
Hunk #4 succeeded at 847 (offset -3 lines).
Hunk #5 succeeded at 1340 (offset -3 lines).
patching file fs/reiserfs/file.c
Hunk #2 succeeded at 155 (offset 3 lines).
Hunk #3 succeeded at 173 (offset 3 lines).
Hunk #4 succeeded at 199 (offset 3 lines).
Hunk #5 succeeded at 211 (offset 3 lines).
Hunk #6 succeeded at 227 (offset 3 lines).
Hunk #7 succeeded at 301 (offset 3 lines).
Hunk #8 succeeded at 331 (offset 3 lines).
Hunk #9 succeeded at 341 (offset 3 lines).
Hunk #10 succeeded at 373 (offset 3 lines).
Hunk #11 succeeded at 437 (offset 3 lines).
Hunk #12 succeeded at 448 (offset 3 lines).
Hunk #13 succeeded at 479 (offset 3 lines).
Hunk #14 succeeded at 521 (offset 3 lines).
Hunk #15 succeeded at 535 (offset 3 lines).
Hunk #16 succeeded at 599 (offset 3 lines).
Hunk #17 succeeded at 666 (offset 3 lines).
Hunk #18 succeeded at 685 (offset 3 lines).
Hunk #19 succeeded at 1083 (offset -1 lines).
Hunk #20 succeeded at 1119 (offset -1 lines).
Hunk #21 succeeded at 1221 (offset -1 lines).
Hunk #22 succeeded at 1244 (offset -1 lines).
Hunk #23 succeeded at 1256 (offset -1 lines).
patching file fs/reiserfs/inode.c
Hunk #2 succeeded at 110 (offset 4 lines).
Hunk #5 FAILED at 554.
Hunk #6 succeeded at 563 (offset 1 line).
Hunk #7 succeeded at 591 (offset 1 line).
Hunk #8 succeeded at 612 (offset 3 lines).
Hunk #9 succeeded at 638 (offset 3 lines).
Hunk #10 FAILED at 680.
Hunk #11 succeeded at 703 (offset 4 lines).
Hunk #12 succeeded at 733 (offset 4 lines).
Hunk #13 succeeded at 759 (offset 4 lines).
Hunk #14 succeeded at 774 (offset 4 lines).
Hunk #15 succeeded at 806 (offset 4 lines).
Hunk #16 succeeded at 869 (offset 4 lines).
Hunk #17 succeeded at 900 (offset 4 lines).
Hunk #18 succeeded at 918 (offset 4 lines).
Hunk #19 succeeded at 932 with fuzz 2 (offset 4 lines).
Hunk #20 succeeded at 2022 (offset 8 lines).
Hunk #21 succeeded at 2235 (offset 8 lines).
Hunk #22 succeeded at 2283 (offset 8 lines).
Hunk #23 succeeded at 2306 (offset 8 lines).
Hunk #24 succeeded at 2378 (offset 8 lines).
Hunk #25 succeeded at 2495 (offset 8 lines).
Hunk #26 succeeded at 2529 (offset 8 lines).
2 out of 26 hunks FAILED -- saving rejects to file fs/reiserfs/inode.c.rej
patching file fs/reiserfs/ioctl.c
patching file fs/buffer.c
patching file include/linux/reiserfs_fs_sb.h
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
6 out of 6 hunks ignored -- saving rejects to file include/linux/reiserfs_fs_sb.h.rej
patching file include/linux/reiserfs_fs.h
Hunk #1 succeeded at 1148 with fuzz 2 (offset -559 lines).
Hunk #2 FAILED at 1176.
Hunk #3 succeeded at 1762 with fuzz 2 (offset -17 lines).
Hunk #4 succeeded at 1772 (offset -14 lines).
1 out of 4 hunks FAILED -- saving rejects to file include/linux/reiserfs_fs.h.rej
patching file fs/Kconfig
patching file fs/reiserfs/Makefile
patching file fs/reiserfs/dir.c
patching file fs/reiserfs/file.c
Hunk #2 succeeded at 99 (offset 1 line).
Hunk #3 succeeded at 1161 (offset -80 lines).
patching file fs/reiserfs/inode.c
Hunk #3 succeeded at 41 with fuzz 1 (offset -1 lines).
Hunk #4 succeeded at 1055 (offset -2 lines).
Hunk #5 succeeded at 2386 (offset -109 lines).
patching file fs/reiserfs/namei.c
Hunk #3 succeeded at 965 (offset 9 lines).
Hunk #4 succeeded at 1351 (offset 19 lines).
patching file fs/reiserfs/super.c
Hunk #2 succeeded at 354 (offset -4 lines).
Hunk #3 succeeded at 668 (offset -12 lines).
Hunk #4 succeeded at 788 (offset -40 lines).
Hunk #5 succeeded at 805 (offset -40 lines).
Hunk #6 succeeded at 823 with fuzz 2 (offset -39 lines).
Hunk #7 succeeded at 846 with fuzz 2 (offset -40 lines).
Hunk #8 succeeded at 1279 (offset -40 lines).
Hunk #9 FAILED at 1425.
Hunk #10 succeeded at 1498 (offset -53 lines).
Hunk #11 succeeded at 1510 (offset -53 lines).
Hunk #12 succeeded at 1523 (offset -53 lines).
1 out of 12 hunks FAILED -- saving rejects to file fs/reiserfs/super.c.rej
patching file fs/reiserfs/xattr.c
patching file fs/reiserfs/xattr_user.c
patching file include/linux/reiserfs_fs.h
Hunk #2 succeeded at 1914 (offset -46 lines).
Hunk #3 succeeded at 1966 (offset -46 lines).
Hunk #4 succeeded at 2185 (offset -46 lines).
patching file include/linux/reiserfs_fs_i.h
Hunk #1 succeeded at 20 (offset -2 lines).
patching file include/linux/reiserfs_fs_sb.h
Hunk #2 succeeded at 260 (offset 9 lines).
Hunk #3 succeeded at 403 (offset 9 lines).
Hunk #4 FAILED at 449.
Hunk #5 FAILED at 476.
2 out of 5 hunks FAILED -- saving rejects to file include/linux/reiserfs_fs_sb.h.rej
patching file include/linux/reiserfs_xattr.h
patching file fs/Kconfig
Hunk #1 succeeded at 244 with fuzz 2 (offset -10 lines).
Hunk #2 succeeded at 294 (offset -10 lines).
patching file fs/reiserfs/Makefile
Hunk #1 succeeded at 9 with fuzz 2 (offset -4 lines).
patching file fs/reiserfs/file.c
Hunk #1 FAILED at 5.
1 out of 1 hunk FAILED -- saving rejects to file fs/reiserfs/file.c.rej
patching file fs/reiserfs/inode.c
Hunk #1 FAILED at 5.
Hunk #2 FAILED at 977.
Hunk #3 succeeded at 1633 (offset -6 lines).
Hunk #4 succeeded at 1719 (offset -6 lines).
Hunk #5 succeeded at 2399 with fuzz 2 (offset -164 lines).
2 out of 5 hunks FAILED -- saving rejects to file fs/reiserfs/inode.c.rej
patching file fs/reiserfs/namei.c
Hunk #1 FAILED at 15.
Hunk #2 succeeded at 566 (offset -14 lines).
Hunk #3 FAILED at 575.
Hunk #4 succeeded at 624 (offset -13 lines).
Hunk #5 succeeded at 636 (offset -13 lines).
Hunk #6 succeeded at 687 (offset -13 lines).
Hunk #7 succeeded at 701 (offset -13 lines).
Hunk #8 succeeded at 717 (offset -13 lines).
Hunk #9 succeeded at 970 (offset -5 lines).
2 out of 9 hunks FAILED -- saving rejects to file fs/reiserfs/namei.c.rej
patching file fs/reiserfs/super.c
Hunk #1 FAILED at 17.
Hunk #2 succeeded at 419 (offset -15 lines).
Hunk #3 succeeded at 461 (offset -15 lines).
Hunk #4 succeeded at 484 (offset -15 lines).
Hunk #5 FAILED at 687.
Hunk #6 FAILED at 838.
3 out of 6 hunks FAILED -- saving rejects to file fs/reiserfs/super.c.rej
can't find file to patch at input line 312
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux-2.6.3/fs/reiserfs/xattr.c
|===================================================================
|--- linux-2.6.3.orig/fs/reiserfs/xattr.c
|+++ linux-2.6.3/fs/reiserfs/xattr.c
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
10 out of 10 hunks ignored
patching file fs/reiserfs/xattr_acl.c
can't find file to patch at input line 1035
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux-2.6.3/fs/reiserfs/xattr_user.c
|===================================================================
|--- linux-2.6.3.orig/fs/reiserfs/xattr_user.c
|+++ linux-2.6.3/fs/reiserfs/xattr_user.c
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
4 out of 4 hunks ignored
patching file include/linux/reiserfs_acl.h
patching file include/linux/reiserfs_fs_i.h
Hunk #1 FAILED at 52.
1 out of 1 hunk FAILED -- saving rejects to file include/linux/reiserfs_fs_i.h.rej
patching file include/linux/reiserfs_fs_sb.h
Hunk #1 FAILED at 442.
Hunk #2 FAILED at 470.
2 out of 2 hunks FAILED -- saving rejects to file include/linux/reiserfs_fs_sb.h.rej
can't find file to patch at input line 1209
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux-2.6.3/include/linux/reiserfs_xattr.h
|===================================================================
|--- linux-2.6.3.orig/include/linux/reiserfs_xattr.h
|+++ linux-2.6.3/include/linux/reiserfs_xattr.h
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
2 out of 2 hunks ignored
patching file fs/reiserfs/namei.c
Hunk #1 succeeded at 631 (offset -36 lines).
patching file fs/reiserfs/Makefile
Hunk #1 FAILED at 10.
1 out of 1 hunk FAILED -- saving rejects to file fs/reiserfs/Makefile.rej
can't find file to patch at input line 18
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux-2.6.3/fs/reiserfs/xattr.c
|===================================================================
|--- linux-2.6.3.orig/fs/reiserfs/xattr.c
|+++ linux-2.6.3/fs/reiserfs/xattr.c
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
1 out of 1 hunk ignored
patching file fs/reiserfs/xattr_trusted.c
can't find file to patch at input line 116
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux-2.6.3/include/linux/reiserfs_xattr.h
|===================================================================
|--- linux-2.6.3.orig/include/linux/reiserfs_xattr.h
|+++ linux-2.6.3/include/linux/reiserfs_xattr.h
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
1 out of 1 hunk ignored
patching file fs/reiserfs/Makefile
Hunk #1 FAILED at 13.
1 out of 1 hunk FAILED -- saving rejects to file fs/reiserfs/Makefile.rej
can't find file to patch at input line 20
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux.lkcd/fs/reiserfs/xattr.c
|===================================================================
|--- linux.lkcd.orig/fs/reiserfs/xattr.c	2004-02-20 21:31:14.000000000 -0500
|+++ linux.lkcd/fs/reiserfs/xattr.c	2004-02-20 21:31:57.000000000 -0500
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
1 out of 1 hunk ignored
patching file fs/reiserfs/xattr_security.c
patching file fs/Kconfig
Hunk #1 succeeded at 244 with fuzz 2 (offset -22 lines).
can't find file to patch at input line 131
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux.lkcd/include/linux/reiserfs_xattr.h
|===================================================================
|--- linux.lkcd.orig/include/linux/reiserfs_xattr.h	2004-02-20 21:31:14.000000000 -0500
|+++ linux.lkcd/include/linux/reiserfs_xattr.h	2004-02-20 21:31:57.000000000 -0500
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 5
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux.lkcd/fs/reiserfs/xattr_acl.c
|===================================================================
|--- linux.lkcd.orig/fs/reiserfs/xattr_acl.c	2004-02-20 21:27:44.000000000 -0500
|+++ linux.lkcd/fs/reiserfs/xattr_acl.c	2004-02-20 21:32:06.000000000 -0500
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
2 out of 2 hunks ignored
patching file fs/reiserfs/inode.c
Hunk #1 FAILED at 979.
Hunk #2 FAILED at 1642.
2 out of 2 hunks FAILED -- saving rejects to file fs/reiserfs/inode.c.rej
can't find file to patch at input line 62
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux.lkcd/fs/reiserfs/xattr.c
|===================================================================
|--- linux.lkcd.orig/fs/reiserfs/xattr.c	2004-02-20 21:31:57.000000000 -0500
|+++ linux.lkcd/fs/reiserfs/xattr.c	2004-02-20 21:32:06.000000000 -0500
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
13 out of 13 hunks ignored
can't find file to patch at input line 199
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux.lkcd/include/linux/reiserfs_xattr.h
|===================================================================
|--- linux.lkcd.orig/include/linux/reiserfs_xattr.h	2004-02-20 21:31:57.000000000 -0500
|+++ linux.lkcd/include/linux/reiserfs_xattr.h	2004-02-20 21:32:06.000000000 -0500
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
2 out of 2 hunks ignored
patching file include/linux/reiserfs_fs_i.h
Hunk #1 FAILED at 24.
Hunk #2 FAILED at 56.
2 out of 2 hunks FAILED -- saving rejects to file include/linux/reiserfs_fs_i.h.rej
patching file fs/reiserfs/tail_conversion.c
patching file fs/reiserfs/bitmap.c
patching file fs/reiserfs/stree.c
patching file fs/reiserfs/namei.c
Hunk #1 succeeded at 16 with fuzz 2 (offset -2 lines).
Hunk #2 succeeded at 505 (offset -15 lines).
Hunk #3 succeeded at 514 (offset -15 lines).
Hunk #4 succeeded at 529 (offset -15 lines).
Hunk #5 succeeded at 557 (offset -15 lines).
Hunk #6 succeeded at 800 (offset -42 lines).
Hunk #7 succeeded at 886 (offset -38 lines).
Hunk #8 succeeded at 1308 (offset -31 lines).
patching file fs/reiserfs/super.c
Hunk #1 succeeded at 109 (offset -6 lines).
Hunk #2 succeeded at 295 (offset -6 lines).
Hunk #3 succeeded at 338 (offset -6 lines).
Hunk #4 succeeded at 665 (offset -47 lines).
patching file fs/reiserfs/file.c
Hunk #1 FAILED at 13.
Hunk #2 FAILED at 256.
Hunk #3 FAILED at 286.
Hunk #4 FAILED at 403.
Hunk #5 FAILED at 434.
Hunk #6 FAILED at 444.
Hunk #7 FAILED at 489.
7 out of 7 hunks FAILED -- saving rejects to file fs/reiserfs/file.c.rej
patching file fs/reiserfs/fix_node.c
Hunk #2 succeeded at 2506 (offset 13 lines).
patching file fs/reiserfs/inode.c
Hunk #1 succeeded at 4 with fuzz 2.
Hunk #2 succeeded at 36 (offset -4 lines).
Hunk #3 succeeded at 643 with fuzz 2 (offset -6 lines).
Hunk #4 succeeded at 651 with fuzz 2 (offset -7 lines).
Hunk #5 FAILED at 685.
Hunk #6 FAILED at 731.
Hunk #7 FAILED at 773.
Hunk #8 FAILED at 782.
Hunk #9 succeeded at 814 (offset -8 lines).
Hunk #10 FAILED at 861.
Hunk #11 FAILED at 907.
Hunk #12 succeeded at 938 (offset -7 lines).
Hunk #13 succeeded at 1052 (offset -10 lines).
Hunk #14 succeeded at 1092 (offset -10 lines).
Hunk #15 succeeded at 1119 (offset -10 lines).
Hunk #16 succeeded at 1127 (offset -10 lines).
Hunk #17 succeeded at 1144 (offset -10 lines).
Hunk #18 succeeded at 1152 (offset -10 lines).
Hunk #19 succeeded at 1160 (offset -10 lines).
Hunk #20 succeeded at 1170 (offset -10 lines).
Hunk #21 succeeded at 1185 (offset -10 lines).
Hunk #22 succeeded at 1245 (offset -10 lines).
Hunk #23 succeeded at 1528 (offset -10 lines).
Hunk #24 succeeded at 1573 (offset -10 lines).
Hunk #25 succeeded at 1610 (offset -10 lines).
Hunk #26 succeeded at 1678 (offset -10 lines).
Hunk #27 succeeded at 1721 (offset -13 lines).
Hunk #28 succeeded at 1747 (offset -13 lines).
Hunk #29 succeeded at 1760 (offset -13 lines).
Hunk #30 succeeded at 1792 (offset -26 lines).
Hunk #31 FAILED at 2314.
Hunk #32 FAILED at 2341.
Hunk #33 FAILED at 2557.
9 out of 33 hunks FAILED -- saving rejects to file fs/reiserfs/inode.c.rej
patching file fs/reiserfs/do_balan.c
Hunk #1 succeeded at 1257 (offset 23 lines).
Hunk #2 succeeded at 1270 (offset 23 lines).
patching file include/linux/reiserfs_fs.h
Hunk #3 succeeded at 1843 (offset -46 lines).
Hunk #4 succeeded at 1866 (offset -46 lines).
Hunk #5 succeeded at 1911 (offset -46 lines).
Hunk #6 succeeded at 2094 (offset -48 lines).
patching file fs/reiserfs/file.c
Hunk #1 succeeded at 216 (offset 43 lines).
patching file fs/reiserfs/super.c
Hunk #1 FAILED at 1342.
1 out of 1 hunk FAILED -- saving rejects to file fs/reiserfs/super.c.rej
can't find file to patch at input line 5
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|Index: linux-2.6.0/fs/reiserfs/xattr.c
|===================================================================
|--- linux-2.6.0.orig/fs/reiserfs/xattr.c	2004-01-05 12:59:45.000000000 +0100
|+++ linux-2.6.0/fs/reiserfs/xattr.c	2004-01-05 13:00:00.000000000 +0100
--------------------------
File to patch: 
Skip this patch? [y] 
Skipping patch.
1 out of 1 hunk ignored
patching file fs/reiserfs/file.c
Hunk #1 succeeded at 1191 (offset 43 lines).
Hunk #2 succeeded at 1207 (offset 43 lines).
patching file fs/reiserfs/tail_conversion.c
patching file fs/reiserfs/inode.c
Hunk #1 succeeded at 2037 (offset -89 lines).
Hunk #2 succeeded at 2084 (offset -89 lines).
patching file fs/reiserfs/file.c
Hunk #1 succeeded at 280 (offset 37 lines).
patching file fs/reiserfs/journal.c
Hunk #1 FAILED at 788.
Hunk #2 FAILED at 802.
Hunk #3 FAILED at 823.
Hunk #4 succeeded at 3069 with fuzz 1 (offset -390 lines).
3 out of 4 hunks FAILED -- saving rejects to file fs/reiserfs/journal.c.rej

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
