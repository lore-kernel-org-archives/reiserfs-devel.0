From: Nikita Danilov <Nikita@Namesys.COM>
Subject: [PATCH]: reiser4 [3/8] export page_cache_readahead()
Date: Thu, 31 Oct 2002 19:03:00 +0300
Message-ID: <15809.21556.364239.763833@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11861-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <Torvalds@Transmeta.COM>
Cc: Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello, Linus,

    Following patch exports page_cache_readahead() so that file systems
    that don't use generic_file_read(), but do use page cache can
    perform readahead consistently.

Please apply.
Nikita.
diff -rup -X dontdiff linus-bk-2.5/kernel/ksyms.c linux-2.5-reiser4/kernel/ksyms.c
--- linus-bk-2.5/kernel/ksyms.c Fri Oct 18 03:00:41 2002
+++ linux-2.5-reiser4/kernel/ksyms.c    Tue Oct 29 17:18:22 2002
@@ -134,6 +134,7 @@ EXPORT_SYMBOL(kmap_pte);
 EXPORT_SYMBOL(page_address);
 #endif
 EXPORT_SYMBOL(get_user_pages);
+EXPORT_SYMBOL(page_cache_readahead);
 
 /* filesystem internal functions */
 EXPORT_SYMBOL(def_blk_fops);
