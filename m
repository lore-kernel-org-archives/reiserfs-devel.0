From: Kevin <coggy@redefine.org>
Subject: reiserfsck  error
Date: Tue, 4 Jun 2002 13:54:40 -0700
Message-ID: <12761801616.20020604135440@redefine.org>
Reply-To: Kevin <coggy@redefine.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10508-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

When I try to run reiserfsck it errors out.  I found similar problems
on the mailing list archive, however I  didn't see a resolution.
Wondering if anyone has found out what causes this?

original thread:
http://marc.theaimsgroup.com/?l=reiserfs&m=101710118326041&w=2

my output:
<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will read-only check consistency of the filesystem on /dev/hdi1
Will put log info to '/root/hdi.log'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --check started at Tue Jun  4 13:10:16 2002
###########
Replaying journal..
0 transactions replayed
Checking S+tree../  8 (of 103)/ 94 (of 155)bit 2863267851, bitsize 14658328
reiserfsck: bitmap.c:160: reiserfs_bitmap_test_bit: Assertion `bit_number < bm->bm_bit_size' failed.
Aborted

