From: Geoff Oakham <g@mbl.ca>
Subject: linux-2.6.0-test7 patch of 2003.09.12 snapshot
Date: Fri, 10 Oct 2003 00:12:38 -0400
Message-ID: <20031010041238.GB1623@mbl.ca>
Reply-To: Geoff Oakham <g@mbl.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="yNb1oOkm5a9FJOVX"
Return-path: <reiserfs-list-return-15828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These are the modifications I had to make to reiser4.diff (from snapshot
2003.09.12) to get it compile with linux-2.6.0-test7.  I hope someone
finds it useful..

Geoff "why yes, it's a patch-patch.." Oakham

-- 
  PGP fingerprint: 8ADC 92E1 6782 D034 E0E3  8EF4 EA4D 25E3 C17C 48D2
  "If you want to learn more about guns, get a job at [an American]
  convenience store or visit our website at ... " --Michael Moore


--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="diff.diff"

--- reiser4.diff	2003-10-05 10:55:49.000000000 -0400
+++ reiser4.linux-2.6.0-test7.diff	2003-10-09 23:02:51.000000000 -0400
@@ -88787,14 +88787,15 @@ diff -rupN -X /home/green/dontdiff -x al
 diff -rupN -X /home/green/dontdiff -x all-reiser4.c -x regression.sh -x ulevel -x '*.bak' -x Makefile.user-level linux-2.5/include/asm-i386/unistd.h reiser4-linux-2.5-snapshot/include/asm-i386/unistd.h
 --- linux-2.5/include/asm-i386/unistd.h	2003-09-12 16:38:47.000000000 +0400
 +++ reiser4-linux-2.5-snapshot/include/asm-i386/unistd.h	2003-09-12 15:55:15.000000000 +0400
-@@ -278,8 +278,9 @@
+@@ -278,9 +278,10 @@
  #define __NR_tgkill		270
  #define __NR_utimes		271
  #define __NR_fadvise64_64	272
-+#define __NR_reiser4		273
+ #define __NR_vserver		273
++#define __NR_reiser4		274
  
--#define NR_syscalls 273
-+#define NR_syscalls 274
+-#define NR_syscalls 274
++#define NR_syscalls 275
  
  /* user-visible error numbers are in the range -1 - -124: see <asm-i386/errno.h> */
  
@@ -88940,16 +88941,28 @@ diff -rupN -X /home/green/dontdiff -x al
  void __wait_on_inode(struct inode * inode);
  void sync_inodes_sb(struct super_block *, int wait);
 diff -rupN -X /home/green/dontdiff -x all-reiser4.c -x regression.sh -x ulevel -x '*.bak' -x Makefile.user-level linux-2.5/kernel/ksyms.c reiser4-linux-2.5-snapshot/kernel/ksyms.c
---- linux-2.5/kernel/ksyms.c	2003-09-12 16:39:34.000000000 +0400
-+++ reiser4-linux-2.5-snapshot/kernel/ksyms.c	2003-09-12 15:55:27.000000000 +0400
-@@ -137,6 +137,7 @@ EXPORT_SYMBOL(kmap_pte);
- EXPORT_SYMBOL(page_address);
- #endif
- EXPORT_SYMBOL(get_user_pages);
+--- linux-2.5/mm/page-writeback.c	2003-09-12 16:39:34.000000000 +0400
++++ reiser4-linux-2.5-snapshot/mm/page-writeback.c	2003-09-12 15:55:27.000000000 +0400
+@@ -146,7 +146,7 @@ 
+  * If we're over `background_thresh' then pdflush is woken to perform some
+  * writeout.
+  */
+-static void balance_dirty_pages(struct address_space *mapping)
++/* static */ void balance_dirty_pages(struct address_space *mapping)
+ {
+ 	struct page_state ps;
+ 	long nr_reclaimable;
+diff -rupN -X /home/green/dontdiff -x all-reiser4.c -x regression.sh -x ulevel -x '*.bak' -x Makefile.user-level linux-2.5/kernel/ksyms.c reiser4-linux-2.5-snapshot/kernel/ksyms.c
+--- linux-2.5/mm/readahead.c	2003-09-12 16:39:34.000000000 +0400
++++ reiser4-linux-2.5-snapshot/mm/readahead.c	2003-09-12 15:55:27.000000000 +0400
+@@ -464,6 +464,7 @@ 
+ out:
+ 	return;
+ }
 +EXPORT_SYMBOL(page_cache_readahead);
  
- /* filesystem internal functions */
- EXPORT_SYMBOL(def_blk_fops);
+ 
+ /*
 diff -rupN -X /home/green/dontdiff -x all-reiser4.c -x regression.sh -x ulevel -x '*.bak' -x Makefile.user-level linux-2.5/mm/filemap.c reiser4-linux-2.5-snapshot/mm/filemap.c
 --- linux-2.5/mm/filemap.c	2003-09-12 16:39:38.000000000 +0400
 +++ reiser4-linux-2.5-snapshot/mm/filemap.c	2003-09-12 15:55:27.000000000 +0400

--yNb1oOkm5a9FJOVX--
