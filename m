From: Nikita Danilov <Nikita@Namesys.COM>
Subject: [PATCH]: reiser4 [4/8] export pagevec_deactivate_inactive()
Date: Thu, 31 Oct 2002 19:02:59 +0300
Message-ID: <15809.21555.66344.176608@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11860-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <Torvalds@Transmeta.COM>
Cc: Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello, Linus,

    Following patch exports pagevec_deactivate_inactive(): reiser4 uses
    its own ->writepages() method rather than mpage_writepages(). It
    needs access to pagevec_deactivate_inactive() to play fair with VM.

Please apply.
Nikita.
diff -urN linus-bk-2.5/mm/Makefile linux-2.5-reiser4/mm/Makefile
--- linus-bk-2.5/mm/Makefile	2002-10-12 13:35:03.000000000 +0200
+++ linux-2.5-reiser4/mm/Makefile	2002-10-30 17:15:10.000000000 +0100
@@ -2,7 +2,7 @@
 # Makefile for the linux memory manager.
 #
 
-export-objs := shmem.o filemap.o mempool.o page_alloc.o page-writeback.o
+export-objs := shmem.o filemap.o mempool.o page_alloc.o page-writeback.o swap.o
 
 obj-y	 := memory.o mmap.o filemap.o mprotect.o mlock.o mremap.o \
 	    vmalloc.o slab.o bootmem.o swap.o vmscan.o page_io.o \
diff -urN linux-2.5.44-bk3-reiser4/mm/swap.c linux-2.5.44-bk3-reiser4.1/mm/swap.c
--- linux-2.5.44-bk3-reiser4/mm/swap.c	2002-10-16 10:53:13.000000000 +0200
+++ linux-2.5.44-bk3-reiser4.1/mm/swap.c	2002-10-30 17:14:23.000000000 +0100
@@ -22,6 +22,7 @@
 #include <linux/mm_inline.h>
 #include <linux/buffer_head.h>
 #include <linux/prefetch.h>
+#include <linux/module.h>
 
 /* How many pages do we try to swap or page in/out together? */
 int page_cluster;
@@ -192,6 +193,7 @@
 		spin_unlock_irq(&zone->lru_lock);
 	__pagevec_release(pvec);
 }
+EXPORT_SYMBOL(pagevec_deactivate_inactive);
 
 /*
  * Add the passed pages to the LRU, then drop the caller's refcount

