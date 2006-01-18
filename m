From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Read errors from r/o-mounted reiser4
Date: Tue, 17 Jan 2006 17:08:20 -0700
Message-ID: <1137542900.6375.85.camel@tribesman.namesys.com>
References: <43B221E3.3020201@feise.com>
	 <1135823501.6469.63.camel@tribesman.namesys.com>
	 <43B8EC8E.3020500@feise.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-4yFsnWqeOAOFNUv5mVPa"
Return-path: <reiserfs-list-return-27765-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43B8EC8E.3020500@feise.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: jfeise@feise.com
Cc: reiserfs-list@namesys.com

--=-4yFsnWqeOAOFNUv5mVPa
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

Sorry for delayed answer. we had long holidays here.
Please try whether attached patch fixes the problem.

On Mon, 2006-01-02 at 01:04 -0800, Joe Feise wrote:
> Vladimir V. Saveliev wrote on 12/28/05 18:31:
> 
> > Hello
> > 
> > On Tue, 2005-12-27 at 21:25 -0800, Joe Feise wrote:
> >> Hi,
> >>
> >> in one of my systems, I have /usr on a Reiser4 partition.
> >> When I have that partition mounted read-only, I get errors whenever
> >> I try to compile anything. Other programs that read from that partition also
> >> seem to fail, but I don't get such nice output like the stuff from gcc.
> >> I am currently using Slackware 10.2 with kernel 2.6.15-rc5-mm3, but I have
> >> experienced the same problem with earlier kernels as well.
> >> The output from a make menuconfig in the kernel source dir:
> > 
> > Thanks for the report. We will take a look
> > 
> >> $: make menuconfig
> >>
> >>   HOSTCC  scripts/kconfig/conf.o
> >> In file included from /usr/include/bits/types.h:31,
> >>
> >>                  from /usr/include/ctype.h:28,
> >>                  from scripts/kconfig/conf.c:6:
> >> /usr/lib/gcc-lib/i486-slackware-linux/3.3.6/include/stddef.h:420: error: syntax
> >> error before '}' token
> 
> 
> I thought about this a bit more, and decided to take a look at the stddef.h file.
> As it turns out, the file has only 419 lines, so line 420 is past the end of the
> file.
> That indicates to me that there is possibly a buffer that doesn't get cleared if
> the fs is mounted r/o (an optimization gone wrong, maybe?)
> 
> -Joe
> 

--=-4yFsnWqeOAOFNUv5mVPa
Content-Disposition: attachment; filename=reiser4-add-missing-zero-padding.patch
Content-Type: text/x-patch; name=reiser4-add-missing-zero-padding.patch; charset=utf-8
Content-Transfer-Encoding: 7bit


This patch adds missing page padding with 0s. It fixes error in readpage operation for files whose data
are stored in metadata blocks.


 fs/reiser4/plugin/item/tail.c |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff -puN fs/reiser4/plugin/item/tail.c~reiser4-add-missing-zero-padding fs/reiser4/plugin/item/tail.c
--- linux-2.6.15-mm4/fs/reiser4/plugin/item/tail.c~reiser4-add-missing-zero-padding	2006-01-17 13:51:05.000000000 +0300
+++ linux-2.6.15-mm4-root/fs/reiser4/plugin/item/tail.c	2006-01-17 13:55:34.000000000 +0300
@@ -336,9 +336,9 @@ static int do_readpage_tail(uf_coord_t *
 	int result;
 	coord_t coord;
 	lock_handle lh;
-
 	int count, mapped;
 	struct inode *inode;
+	char *pagedata;
 
 	/* saving passed coord in order to do not move it by tap. */
 	init_lh(&lh);
@@ -353,8 +353,6 @@ static int do_readpage_tail(uf_coord_t *
 
 	/* lookup until page is filled up. */
 	for (mapped = 0; mapped < PAGE_CACHE_SIZE; mapped += count) {
-		char *pagedata;
-
 		/* number of bytes to be copied to page. */
 		count = item_length_by_coord(&coord) - coord.unit_pos;
 
@@ -413,6 +411,12 @@ static int do_readpage_tail(uf_coord_t *
 		}
 	}
 
+	if (mapped != PAGE_CACHE_SIZE) {
+		pagedata = kmap_atomic(page, KM_USER0);
+		memset(pagedata + mapped, 0, PAGE_CACHE_SIZE - mapped);
+		flush_dcache_page(new_page);
+		kunmap_atomic(pagedata, KM_USER0);
+	}
 	/* making page up to date and releasing it. */
 	SetPageUptodate(page);
 	unlock_page(page);

_

--=-4yFsnWqeOAOFNUv5mVPa--

