From: Nikita Danilov <Nikita@Namesys.COM>
Subject: [PATCH]: reiser4 [5/8] export remove_from_page_cache()
Date: Thu, 31 Oct 2002 19:03:03 +0300
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <15809.21559.295852.205720@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <Torvalds@Transmeta.COM>
Cc: Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello, Linus,

    Following patch exports remove_from_page_cache(). reiser4 stores all
    meta-data in the page cache. When piece of meta-data is removed,
    corresponding page has to be removed from the page cache (this is
    similar to truncate, but for meta-data), explicit call to
    remove_from_page_cache() is required at this point.

Please apply.
Nikita.
diff -rup -X dontdiff linus-bk-2.5/mm/filemap.c linux-2.5-reiser4/mm/filemap.c
--- linus-bk-2.5/mm/filemap.c   Fri Oct 18 03:00:41 2002
+++ linux-2.5-reiser4/mm/filemap.c      Tue Oct 29 17:16:22 2002
@@ -97,6 +97,7 @@ void remove_from_page_cache(struct page 
 	__remove_from_page_cache(page);
 	write_unlock(&mapping->page_lock);
 }
+EXPORT_SYMBOL(remove_from_page_cache);
 
 static inline int sync_page(struct page *page)
 {
