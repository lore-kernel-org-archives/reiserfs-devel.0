From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuild-tree fails in pass 2
Date: Thu, 15 Jan 2004 21:58:25 +0300
Message-ID: <200401152158.25992.vitaly@namesys.com>
References: <400692d3.46c9.0@cpinternet.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_RLuBAk8BS4kVlBB"
Return-path: <reiserfs-list-return-16530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <400692d3.46c9.0@cpinternet.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: mharnois@cpinternet.com, reiserfs-list@namesys.com

--Boundary-00=_RLuBAk8BS4kVlBB
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 15 January 2004 16:17, Michael Harnois wrote:
> None of the above. It first failed from a Debian installation,
> then I rebuilt it from scratch and got the same error. It
> doesn't fail checking any of my other partitions, just this
> one, and it dies in the same spot each time.

yes, it was a bug. The patch attached will solve the problem.

-- 
Thanks,
Vitaly Fertman
--Boundary-00=_RLuBAk8BS4kVlBB
Content-Type: text/x-diff;
  charset="koi8-r";
  name="3.6.11_pass2_bitmap_abort.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="3.6.11_pass2_bitmap_abort.patch"

diff -Nru a/reiserfsprogs/fsck/pass2.c b/reiserfsprogs/fsck/pass2.c
--- a/reiserfsprogs/fsck/pass2.c	Thu Jan 15 20:59:43 2004
+++ b/reiserfsprogs/fsck/pass2.c	Thu Jan 15 20:59:43 2004
@@ -491,7 +491,9 @@
 
     for (i = 0; i < 2; i++) {
         j = 0;
-        while (reiserfs_bitmap_find_zero_bit (fsck_uninsertables (fs), &j) == 0) {
+        while ((j < fsck_uninsertables(fs)->bm_bit_size) && 
+	       reiserfs_bitmap_find_zero_bit(fsck_uninsertables(fs), &j) == 0) 
+	{
 	    bh = bread (fs->fs_dev, j, fs->fs_blocksize);
 	    if (bh == 0) {
 	        fsck_log ("pass_2: Reading of the block (%lu) failed on the device 0x%x\n",

--Boundary-00=_RLuBAk8BS4kVlBB--

