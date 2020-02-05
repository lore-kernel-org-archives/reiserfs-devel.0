From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: prevent system lockups
Date: Wed, 5 Feb 2020 01:28:06 +0100
Message-ID: <94861335-0ff3-a8cf-8d73-e0f521fa0ffa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F3FF70D4737419259F49BAF5"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=Z1xYRpb1bVfuzQWiaKtil6nM5cdeU/NKJAbYLl6vRZs=;
        b=S/CWflw75H0hdZkF92cotz9oJIIPVwXOywvc4hZqCo7o6iToEj63QEEtAajpfIYW1f
         zmgNCGeXSWj8L2MVHhVtYxO5QtxNFJhKceYCUm8pGxI24ExtoQtPrXmpHX5U8ddhGX25
         UCqsEONUGhKQ8B7NE+wxzPHFnHFbNHW8aGs4eY1mxd9JUcC69L+tbTOC20p8uCOnK9mM
         TbY8Rcko2HOP9tWJ6a+PHh6JUykEGJqZ8ZOZtZr1ElBlCh/sYwYzgofpF/Mro/6vJQge
         ccE7vbyLt0hC81QtU8bfrTupMs8Y+HTMQvmMj/uSp30N69kbLP865MO4h97/CeStHTkC
         sBiw==
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------F3FF70D4737419259F49BAF5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Starting from Linux-4.15, VFS introduces optimizations, which
are incompatible with Reiser4 (as well as with any FS possessing
an advanced transaction manager). Here is the problematic commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa65c29ce1b6e1990cd2c7d8004bbea7ff3aff38

The attached patch fixes the problem. This patch is against
Linux-5.4+reiser4. Please, apply.

Later I'll prepare backports for all the mentioned kernels and will
put them on Sourceforge. If someone urgently needs a backport, then
let me know.

Thanks,
Edward.

--------------F3FF70D4737419259F49BAF5
Content-Type: text/x-patch;
 name="reiser4-fix-lockup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fix-lockup.patch"

diff -urN linux-5.4.6/fs/reiser4/page_cache.c linux-5.4.6.patched/fs/reiser4/page_cache.c
--- linux-5.4.6/fs/reiser4/page_cache.c	2020-02-05 00:08:07.121592727 +0100
+++ linux-5.4.6.patched/fs/reiser4/page_cache.c	2020-02-05 00:09:44.508645047 +0100
@@ -549,7 +549,8 @@
 	 */
 	.releasepage = reiser4_releasepage,
 	.direct_IO = NULL,
-	.migratepage = reiser4_migratepage
+	.migratepage = reiser4_migratepage,
+	.batch_lock_tabu = 1
 };
 
 /* called just before page is released (no longer used by reiser4). Callers:
diff -urN linux-5.4.6/fs/reiser4/plugin/object.c linux-5.4.6.patched/fs/reiser4/plugin/object.c
--- linux-5.4.6/fs/reiser4/plugin/object.c	2020-02-05 00:08:07.129592814 +0100
+++ linux-5.4.6.patched/fs/reiser4/plugin/object.c	2020-02-05 00:09:44.508645047 +0100
@@ -150,7 +150,8 @@
 	.bmap = reiser4_bmap_dispatch,
 	.invalidatepage = reiser4_invalidatepage,
 	.releasepage = reiser4_releasepage,
-	.migratepage = reiser4_migratepage
+	.migratepage = reiser4_migratepage,
+	.batch_lock_tabu = 1
 };
 
 /* VFS methods for symlink files */
diff -urN linux-5.4.6/include/linux/fs.h linux-5.4.6.patched/include/linux/fs.h
--- linux-5.4.6/include/linux/fs.h	2020-02-05 00:08:07.135592878 +0100
+++ linux-5.4.6.patched/include/linux/fs.h	2020-02-05 00:09:21.339394689 +0100
@@ -409,6 +409,7 @@
 	int (*swap_activate)(struct swap_info_struct *sis, struct file *file,
 				sector_t *span);
 	void (*swap_deactivate)(struct file *file);
+	int batch_lock_tabu;
 };
 
 extern const struct address_space_operations empty_aops;
diff -urN linux-5.4.6/mm/truncate.c linux-5.4.6.patched/mm/truncate.c
--- linux-5.4.6/mm/truncate.c	2019-12-21 11:05:23.000000000 +0100
+++ linux-5.4.6.patched/mm/truncate.c	2020-02-05 00:09:21.339394689 +0100
@@ -360,6 +360,13 @@
 				continue;
 			}
 			pagevec_add(&locked_pvec, page);
+			if (mapping->a_ops->batch_lock_tabu)
+				/*
+				 * the file system doesn't allow to hold
+				 * many pages locked, while calling
+				 * ->invalidatepage() for one of them
+				 */
+				break;
 		}
 		for (i = 0; i < pagevec_count(&locked_pvec); i++)
 			truncate_cleanup_page(mapping, locked_pvec.pages[i]);

--------------F3FF70D4737419259F49BAF5--
