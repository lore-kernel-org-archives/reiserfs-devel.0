From: Oleg Drokin <green@namesys.com>
Subject: Re: 2.6.0-test4 reiserfs oops
Date: Tue, 26 Aug 2003 12:32:45 +0400
Message-ID: <20030826083244.GC5816@namesys.com>
References: <200308252047.36054.l.allegrucci@tiscali.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15414-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200308252047.36054.l.allegrucci@tiscali.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Allegrucci <l.allegrucci@tiscali.it>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Aug 25, 2003 at 08:47:36PM +0000, Lorenzo Allegrucci wrote:

> I have got this oops running fsstress and fsx-linux
> on a 20Gb reiserfs partition.  Fully reproducible.

What are the options to fsx and fsstress?
Also I immediately see a place that can lead to an oops you quoted,
can you try to run with the patch attached and see if the oops go away?
(warning, untested code, not even compiled)

Thank you.

Bye,
    Oleg

===== fs/reiserfs/inode.c 1.81 vs edited =====
--- 1.81/fs/reiserfs/inode.c	Tue Aug 19 09:42:17 2003
+++ edited/fs/reiserfs/inode.c	Tue Aug 26 12:31:02 2003
@@ -2048,8 +2048,7 @@
         last_offset = inode->i_size & (PAGE_CACHE_SIZE - 1) ;
 	/* no file contents in this page */
 	if (page->index >= end_index + 1 || !last_offset) {
-	    error = 0 ;
-	    goto done ;
+	    return 0;
 	}
 	kaddr = kmap_atomic(page, KM_USER0);
 	memset(kaddr + last_offset, 0, PAGE_CACHE_SIZE-last_offset) ;
