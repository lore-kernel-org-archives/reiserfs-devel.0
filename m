From: "Stephan Reichel" <Stephan.Reichel@1net4you.de>
Subject: bug report
Date: Sun, 23 Nov 2003 03:09:18 +0100
Message-ID: <NHBBLMBAALMFLLANBMBIKECOCAAA.Stephan.Reichel@1net4you.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

proxy:/home/reichel# reiserfsck --check -l /home/reichel/rfsck.log /dev/hdb6

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will read-only check consistency of the filesystem on /dev/hdb6
Will put log info to '/home/reichel/rfsck.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Sat Nov 22 21:38:48 2003
###########
Filesystem seems mounted read-only. Skipping journal replay..
Checking S+tree../  3 (of   3)/115 (of 122)/ 32 (of 170)bit 1067128968,
bitsize 8154586
reiserfsck: bitmap.c:160: reiserfs_bitmap_test_bit: Assertion `bit_number <
bm->bm_bit_size' failed.
Aborted
proxy:/home/reichel#


(I run reiserfsck because I got some errors "file '...' exists but can not
stat-ed")


Thanks in advance

Stephan Reichel
Barteldesplatz 1
D-01309 Dresden
+49 (0351) 3400111
Stephan.Reichel@1net4you.de

