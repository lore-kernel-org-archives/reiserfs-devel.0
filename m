From: Jim Wisniewski <wisnij@rpi.edu>
Subject: Possible bug (assertion failed)
Date: Sat, 29 Mar 2003 15:31:14 EST
Message-ID: <200303292031.h2TKVEQ9000888@smtp3.server.rpi.edu>
Reply-To: Jim Wisniewski <wisnij@rpi.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13440-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On a system with SuSE 8.0 and some definite filesystem errors, booting from
the install CD and running "reiserfsck --check /dev/hda6" results in the
following:


reiserfsck 3.x.1b (2002)
Will read-only check consistency of the filesystem on /dev/hda6
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Sat Mar 29 14:17:51 2003
###########
Replaying journal..
0 transactions replayed
Checking S+tree.. /  1 (of   3)/  2 (of 128)/ 83 (of 170)bit 2015394848,
bitsize 2430532
reiserfsck: bitmap.c:160: reiserfs_bitmap_test_bit: Assertion `bit_number <
bm->bm_bit_size' failed.
Aborting


