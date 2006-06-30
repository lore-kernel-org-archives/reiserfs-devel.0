From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Fri, 30 Jun 2006 12:47:13 -0400
Message-ID: <44A55591.6060500@suse.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>	 <1151608355.6335.79.camel@tribesman.namesys.com> <1151612146.11510.4.camel@ipso.snappymail.ca> <44A55271.7050501@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010800080507040402000302"
Return-path: <reiserfs-list-return-28878-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44A55271.7050501@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Mike Benoit <ipso@snappymail.ca>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

--------------010800080507040402000302
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
> Mike Benoit wrote:
> 
>> This seems strange, because to me this type of workload would lend
>> itself to being less fragmented then most workloads. All the box does is
>> records TV programs, so over the course of 30-60min periods I would
>> guess 95+% of the writes are sequential. 
>>
>> Why would the fragmentation be so bad? Is there a way to tell what the
>> fragmentation rate is?
>>
>> Thanks.
>>
>>  
>>
> I wonder how the bitmap optimizations that Jeff added handle this usage
> pattern.  Jeff?

That's certainly interesting. The bitmap hinting code should skip bitmap
blocks with fewer blocks that are being asked for. The first zero hint
patch was never applied to mainline. I have that in my queue as well.

Try using the attached patch. It directs the block allocator to start
the search at the first known 0 bit rather than scanning the entire
block to find it. I'm not sure if will have a meaningful performance
impact, but it's worth a try.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFEpVWRLPWxlyuTD7IRAm1uAJwIExdMY1ju2VjnVFmbweEluNUi+QCgqZWL
rNWRcVDW0KqBCrvUl1L4veE=
=Cuir
-----END PGP SIGNATURE-----

--------------010800080507040402000302
Content-Type: text/x-patch;
 name="reiserfs-05-bitmap-use-first-zero-hint.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfs-05-bitmap-use-first-zero-hint.diff"

From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 5/5] reiserfs: make bitmap use cached first zero bit

 Currently, the bitmap code uses half of the hinting data gathered and cached
 and wastes the other half. We'll skip completely full bitmaps, but start
 scanning in bitmaps at locations where if we consulted the zero bit hint,
 we'd know there aren't any free bits available.

 This patch uses the first zero hint to bump the beginning of the search
 window to where we know there is at least one zero bit.

 fs/reiserfs/bitmap.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletion(-)

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX ../dontdiff linux-2.6.15.orig.staging1/fs/reiserfs/bitmap.c linux-2.6.15.orig.staging2/fs/reiserfs/bitmap.c
--- linux-2.6.15.orig.staging1/fs/reiserfs/bitmap.c	2006-01-16 16:53:35.663319136 -0500
+++ linux-2.6.15.orig.staging2/fs/reiserfs/bitmap.c	2006-01-16 16:53:35.673317616 -0500
@@ -187,7 +187,10 @@ static int scan_bitmap_block(struct reis
 			return 0;	// No free blocks in this bitmap
 		}
 
-		/* search for a first zero bit -- beggining of a window */
+		if (*beg < bi->first_zero_hint)
+			*beg = bi->first_zero_hint;
+
+		/* search for a first zero bit -- beginning of a window */
 		*beg = reiserfs_find_next_zero_le_bit
 		    ((unsigned long *)(bh->b_data), boundary, *beg);
 

--------------010800080507040402000302--
