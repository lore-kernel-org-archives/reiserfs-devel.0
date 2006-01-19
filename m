From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Read errors from r/o-mounted reiser4
Date: Wed, 18 Jan 2006 18:00:15 -0700
Message-ID: <1137632415.6573.4.camel@tribesman.namesys.com>
References: <43B221E3.3020201@feise.com>
	 <1135823501.6469.63.camel@tribesman.namesys.com>
	 <43B8EC8E.3020500@feise.com>
	 <1137542900.6375.85.camel@tribesman.namesys.com> <43CD21B9.60801@feise.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-AypwBzoNyUso+8OWB5AF"
Return-path: <reiserfs-list-return-27780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43CD21B9.60801@feise.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: jfeise@feise.com
Cc: reiserfs-list@namesys.com

--=-AypwBzoNyUso+8OWB5AF
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Tue, 2006-01-17 at 08:56 -0800, Joe Feise wrote:
> 
> unfortunately, the patch did not help. I still get the same errors:
> 
sorry, please try new version of patch. (you have to patch -R the old
one).

> $: mount -o ro,remount /usr
> $: make xconfig
>   CHECK   qt
>   HOSTCC  scripts/kconfig/kconfig_load.o
> In file included from /usr/include/sys/types.h:133,
>                  from /usr/include/stdlib.h:433,
>                  from scripts/kconfig/kconfig_load.c:3:
> /usr/include/time.h:418: error: stray '\22' in program
> /usr/include/time.h:418: error: stray '\377' in program
> /usr/include/time.h:418: error: stray '\34' in program
> /usr/include/time.h:418: error: stray '\17' in program
> /usr/include/time.h:418: error: stray '\21' in program
> /usr/include/time.h:418: error: stray '\377' in program
> /usr/include/time.h:418: error: stray '\36' in program
> /usr/include/time.h:418: error: stray '\21' in program
> /usr/include/time.h:418: error: stray '\22' in program
> /usr/include/time.h:418: error: stray '\377' in program
> ...
> 
> /usr/include/time.h only has 417 lines.
> 
> -Joe
> 
> Vladimir V. Saveliev wrote on 01/17/06 16:08:
> 
> > Hello
> > 
> > Sorry for delayed answer. we had long holidays here.
> > Please try whether attached patch fixes the problem.
> > 
> > On Mon, 2006-01-02 at 01:04 -0800, Joe Feise wrote:
> >> Vladimir V. Saveliev wrote on 12/28/05 18:31:
> >>
> >>> Hello
> >>>
> >>> On Tue, 2005-12-27 at 21:25 -0800, Joe Feise wrote:
> >>>> Hi,
> >>>>
> >>>> in one of my systems, I have /usr on a Reiser4 partition.
> >>>> When I have that partition mounted read-only, I get errors whenever
> >>>> I try to compile anything. Other programs that read from that partition also
> >>>> seem to fail, but I don't get such nice output like the stuff from gcc.
> >>>> I am currently using Slackware 10.2 with kernel 2.6.15-rc5-mm3, but I have
> >>>> experienced the same problem with earlier kernels as well.
> >>>> The output from a make menuconfig in the kernel source dir:
> >>> Thanks for the report. We will take a look
> >>>
> >>>> $: make menuconfig
> >>>>
> >>>>   HOSTCC  scripts/kconfig/conf.o
> >>>> In file included from /usr/include/bits/types.h:31,
> >>>>
> >>>>                  from /usr/include/ctype.h:28,
> >>>>                  from scripts/kconfig/conf.c:6:
> >>>> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: syntax
> >>>> error before '}' token
> >>
> >> I thought about this a bit more, and decided to take a look at the stddef.h file.
> >> As it turns out, the file has only 419 lines, so line 420 is past the end of the
> >> file.
> >> That indicates to me that there is possibly a buffer that doesn't get cleared if
> >> the fs is mounted r/o (an optimization gone wrong, maybe?)
> >>
> >> -Joe
> 
> 

--=-AypwBzoNyUso+8OWB5AF
Content-Disposition: attachment; filename=reiser4-add-missing-zero-padding.patch
Content-Type: text/x-patch; name=reiser4-add-missing-zero-padding.patch; charset=utf-8
Content-Transfer-Encoding: 7bit


This patch adds missing page padding with 0s. It fixes error in readpage operation for files whose data
are stored in metadata blocks.


 fs/reiser4/plugin/item/tail.c |   69 ++++++++++++++++++++----------------------
 1 files changed, 34 insertions(+), 35 deletions(-)

diff -puN fs/reiser4/plugin/item/tail.c~reiser4-add-missing-zero-padding fs/reiser4/plugin/item/tail.c
--- linux-2.6.15-mm4/fs/reiser4/plugin/item/tail.c~reiser4-add-missing-zero-padding	2006-01-17 13:51:05.000000000 +0300
+++ linux-2.6.15-mm4-vs/fs/reiser4/plugin/item/tail.c	2006-01-18 15:01:47.000000000 +0300
@@ -330,15 +330,15 @@ static int overwrite_tail(coord_t *coord
 }
 
 /* tail redpage function. It is called from readpage_tail(). */
-static int do_readpage_tail(uf_coord_t * uf_coord, struct page *page)
+static int do_readpage_tail(uf_coord_t *uf_coord, struct page *page)
 {
 	tap_t tap;
 	int result;
 	coord_t coord;
 	lock_handle lh;
-
 	int count, mapped;
 	struct inode *inode;
+	char *pagedata;
 
 	/* saving passed coord in order to do not move it by tap. */
 	init_lh(&lh);
@@ -352,33 +352,32 @@ static int do_readpage_tail(uf_coord_t *
 		goto out_tap_done;
 
 	/* lookup until page is filled up. */
-	for (mapped = 0; mapped < PAGE_CACHE_SIZE; mapped += count) {
-		char *pagedata;
-
-		/* number of bytes to be copied to page. */
+	for (mapped = 0; mapped < PAGE_CACHE_SIZE; ) {
+		/* number of bytes to be copied to page */
 		count = item_length_by_coord(&coord) - coord.unit_pos;
-
 		if (count > PAGE_CACHE_SIZE - mapped)
 			count = PAGE_CACHE_SIZE - mapped;
 
-		/* attaching @page to address space and getting data address. */
+		/* attach @page to address space and get data address */
 		pagedata = kmap_atomic(page, KM_USER0);
 
-		/* copying tail body to page. */
+		/* copy tail item to page */
 		memcpy(pagedata + mapped,
 		       ((char *)item_body_by_coord(&coord) + coord.unit_pos),
 		       count);
+		mapped += count;
 
 		flush_dcache_page(page);
 
-		/* dettaching page from address space. */
+		/* dettach page from address space */
 		kunmap_atomic(pagedata, KM_USER0);
 
 		/* Getting next tail item. */
-		if (mapped + count < PAGE_CACHE_SIZE) {
-
-			/* unlocking page in order to avoid keep it locked durring tree lookup,
-			   which takes long term locks. */
+		if (mapped < PAGE_CACHE_SIZE) {
+			/*
+			 * unlock page in order to avoid keep it locked
+			 * during tree lookup, which takes long term locks
+			 */
 			unlock_page(page);
 
 			/* getting right neighbour. */
@@ -386,50 +385,50 @@ static int do_readpage_tail(uf_coord_t *
 
 			/* lock page back */
 			lock_page(page);
-
-			/* page is uptodate due to another thread made it up to date. Getting
-			   out of here. */
 			if (PageUptodate(page)) {
+				/*
+				 * another thread read the page, we have
+				 * nothing to do
+				 */
 				result = 0;
 				goto out_unlock_page;
 			}
 
 			if (result) {
-				/* check if there is no neighbour node. */
 				if (result == -E_NO_NEIGHBOR) {
+					/*
+					 * rigth neighbor is not a formatted
+					 * node
+					 */
 					result = 0;
-					goto out_update_page;
+					goto done;
 				} else {
 					goto out_tap_relse;
 				}
 			} else {
-				/* check if found coord is not owned by file. */
 				if (!inode_file_plugin(inode)->
 				    owns_item(inode, &coord)) {
+					/* item of another file is found */
 					result = 0;
-					goto out_update_page;
+					goto done;
 				}
 			}
 		}
 	}
 
-	/* making page up to date and releasing it. */
-	SetPageUptodate(page);
-	unlock_page(page);
-
-	/* releasing tap */
-	tap_relse(&tap);
-	tap_done(&tap);
-
-	return 0;
-
-      out_update_page:
+ done:
+	if (mapped != PAGE_CACHE_SIZE) {
+		pagedata = kmap_atomic(page, KM_USER0);
+		memset(pagedata + mapped, 0, PAGE_CACHE_SIZE - mapped);
+		flush_dcache_page(new_page);
+		kunmap_atomic(pagedata, KM_USER0);
+	}
 	SetPageUptodate(page);
-      out_unlock_page:
+ out_unlock_page:
 	unlock_page(page);
-      out_tap_relse:
+ out_tap_relse:
 	tap_relse(&tap);
-      out_tap_done:
+ out_tap_done:
 	tap_done(&tap);
 	return result;
 }

_

--=-AypwBzoNyUso+8OWB5AF--

