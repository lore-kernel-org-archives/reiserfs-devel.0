From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 2/10] Reiser4: cometics changes in mm/filemap.c.
Date: Sat,  2 Dec 2006 14:16:23 +0100
Message-ID: <1165065391534-git-send-email-laurent.riffard@free.fr>
References: <1165065391908-git-send-email-laurent.riffard@free.fr> <1165065391122-git-send-email-laurent.riffard@free.fr>
Return-path: <reiserfs-list-return-30272-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1165065391122-git-send-email-laurent.riffard@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Laurent Riffard <laurent.riffard@free.fr>

This patch moves some EXPORT_SYMOLs near the functions definition.
---
 mm/filemap.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index ffe6dcc..c117b52 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -467,6 +467,7 @@ int add_to_page_cache_lru(struct page *page, struct address_space *mapping,
 		lru_cache_add(page);
 	return ret;
 }
+EXPORT_SYMBOL(add_to_page_cache_lru);
 
 #ifdef CONFIG_NUMA
 struct page *__page_cache_alloc(gfp_t gfp)
@@ -740,7 +741,7 @@ unsigned find_get_pages(struct address_space *mapping, pgoff_t start,
 	read_unlock_irq(&mapping->tree_lock);
 	return ret;
 }
-EXPORT_SYMBOL(add_to_page_cache_lru);
+EXPORT_SYMBOL(find_get_pages);
 
 /**
  * find_get_pages_contig - gang contiguous pagecache lookup
@@ -801,7 +802,7 @@ unsigned find_get_pages_tag(struct address_space *mapping, pgoff_t *index,
 	read_unlock_irq(&mapping->tree_lock);
 	return ret;
 }
-EXPORT_SYMBOL(find_get_pages);
+EXPORT_SYMBOL(find_get_pages_tag);
 
 /**
  * grab_cache_page_nowait - returns locked page at given index in given cache
@@ -859,7 +860,6 @@ static void shrink_readahead_size_eio(struct file *filp,
 
 	ra->ra_pages /= 4;
 }
-EXPORT_SYMBOL(find_get_pages_tag);
 
 /**
  * do_generic_mapping_read - generic file read routine
-- 
1.4.4.1.gaed4

