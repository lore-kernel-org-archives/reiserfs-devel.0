From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: [PATCH] reiserfs: reformat code with Lindent
Date: Fri, 08 Jul 2005 00:53:36 +0400
Message-ID: <42CD9650.6040401@namesys.com>
References: <42CD8CC6.4000808@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030108010904020203010507"
Return-path: <reiserfs-list-return-25043-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CD8CC6.4000808@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

--------------030108010904020203010507
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello

Jeff Mahoney wrote:
> Hey all -
> 
> Just out of curiousity, does anyone outside of Chris and I have
> outstanding patches against ReiserFS? 

I have no idea how the attached patch managed to not get included.

I ask because the tree has been
> relatively stable for some time and I wonder if it may be time to submit
> a Lindent patch to clean up the code and reformat it to adhere to the
> kernel style guidelines.
> 
> I've posted a patch[1] that is only the output of the Lindent script.
> Ideally, there should be some string formatting in there as well, but
> I'd like to split them up into separate pieces so we know each chunk is
> correct. Sorry I couldn't attach it - it was rejected by the list since
> it is over 128k in size.
> 
> Opinions?
> 
> -Jeff
> [1]:
> ftp://ftp.suse.com/pub/people/jeffm/reiserfs/kernel-v2.6/cleanups/2.6.13-rc2/01-reiserfs-lindent.diff
> 
> --
> Jeff Mahoney
> SuSE Labs

--------------030108010904020203010507
Content-Type: text/plain;
 name="reiserfs-old-read-bitmap.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-old-read-bitmap.patch"

 fs/reiserfs/super.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff -puN fs/reiserfs/super.c~reiserfs-old-read-bitmap fs/reiserfs/super.c
--- linux-2.6.12/fs/reiserfs/super.c~reiserfs-old-read-bitmap	2005-07-08 00:51:07.171918740 +0400
+++ linux-2.6.12-vs/fs/reiserfs/super.c	2005-07-08 00:51:54.185318407 +0400
@@ -1286,11 +1286,11 @@ static int read_old_bitmaps (struct supe
   int bmp1 = (REISERFS_OLD_DISK_OFFSET_IN_BYTES / s->s_blocksize) + 1;  /* first of bitmap blocks */
 
   /* read true bitmap */
-  SB_AP_BITMAP (s) = vmalloc (sizeof (struct reiserfs_buffer_info *) * sb_bmap_nr(rs));
+  SB_AP_BITMAP (s) = vmalloc (sizeof (struct reiserfs_bitmap_info) * sb_bmap_nr(rs));
   if (SB_AP_BITMAP (s) == 0)
     return 1;
 
-  memset (SB_AP_BITMAP (s), 0, sizeof (struct reiserfs_buffer_info *) * sb_bmap_nr(rs));
+  memset (SB_AP_BITMAP (s), 0, sizeof (struct reiserfs_bitmap_info) * sb_bmap_nr(rs));
 
   for (i = 0; i < sb_bmap_nr(rs); i ++) {
     SB_AP_BITMAP (s)[i].bh = sb_bread (s, bmp1 + i);

_

--------------030108010904020203010507--
