From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Bitmap alignment issues....
Date: Tue, 15 Feb 2005 21:30:11 +0300
Message-ID: <20050215183011.GU7482@backtop.namesys.com>
References: <20050210084002.GP7482@backtop.namesys.com> <3p803d$37lqf@smtp05.mrf.mail.rcn.net>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3p803d$37lqf@smtp05.mrf.mail.rcn.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Evans <tom@23palmer.net>
Cc: reiserfs-list@namesys.com

On Thu, Feb 10, 2005 at 10:29:36AM -0500, Tom Evans wrote:
> 
> 
> I am using what was the current 2.6.11 development line with the 
> -mm patch series (that's what includes reiser4).
>  
> I am not certain if any of those patches were "required" - I just
> needed it for reiser4 support.
> 
> I also may have spoke too soon about the patch - I tried doing a full
> kernel build and at some time during the process, it crashed and
> then that kernel directory started behaving oddly.
> 
> I received a kernel oops - don't have it with me, and then accesses to
> that directory would "hang".
> 
> 
> I realize my setup may be complicated, I am using a beta kernel, on a
> non-x86,
> with reiser4 on a LVM partition, so anything in that chain can be
> responsible.
> 
> I had been running that kernel for several days without issues (except for
> the alignment faults).

do you see aligment faults in the bitmap code after my patch?

I fixed one place in the replace_extent (see the patch below), it  would be
fine to know which other places reiser4 has unaligned access faults in. 

------------------------------------
# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2005/02/12 18:55:16+03:00 zam@crimson.namesys.com 
#   replace_extent: unaligned access fix.
# 
# plugin/item/extent.c
#   2005/02/12 18:55:10+03:00 zam@crimson.namesys.com +1 -1
#   replace_extent: unaligned access fix.
# 
diff -Nru a/plugin/item/extent.c b/plugin/item/extent.c
--- a/plugin/item/extent.c	Tue Feb 15 21:25:22 2005
+++ b/plugin/item/extent.c	Tue Feb 15 21:25:22 2005
@@ -135,7 +135,7 @@
 			assert("vs-987", znode_is_loaded(coord_after.node));
 			assert("vs-988", !memcmp(ext, &orig_ext, sizeof (*ext)));
 
-			*ext = *replace;
+			memcpy(ext, replace, sizeof(*ext));
 			znode_make_dirty(coord_after.node);
 
 			if (coord_after.node != orig_znode)

------------------------------------
> 
> Is there a recommended kernel to use with reiser4?

latest -mm kernel.

> Thanks again,
> 
> ...tom
> 

-- 
Alex.
