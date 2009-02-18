From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 2/2] vfs: (take 2)add set_page_dirty_notag
Date: Wed, 18 Feb 2009 16:27:06 +0300
Message-ID: <18844.3242.540724.320644@edward.zelnet.ru>
References: <18837.24581.181196.569183@edward.zelnet.ru>
	<1234530519.6519.46.camel@twins>
	<49957C43.7050701@gmail.com>
	<1234534150.6519.101.camel@twins>
	<18838.49922.215481.399653@edward.zelnet.ru>
	<1234645893.4695.8.camel@laptop>
	<18841.60432.329341.514726@edward.zelnet.ru>
	<20090217143506.f6899342.akpm@linux-foundation.org>
	<499B55A8.50103@gmail.com>
	<20090217163820.48a2ce68.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090217163820.48a2ce68.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, peterz@infradead.org, npiggin@suse.de, rmh3093@gmail.com, randy.dunlap@oracle.com, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

In accordance with reiser4 transactional model every dirty page should be
"captured" by some atom.  However, outside reiser4 context dirty page can
not be captured in some cases, as it is accompanied with specific work
(jnode creation, etc).  Reiser4 recognizes such "anonymous" pages (i.e. 
pages that were dirtied outside of reiser4) by the tag
PAGECACHE_TAG_DIRTY.  Pages dirtied inside reiser4 context are not tagged
at all: we don't need this.  Indeed, once page is dirtied and captured, it
is attached to a jnode (a special header to keep a track of transactions).

reiser4_set_page_dirty_internal() was the internal reiser4 function that
set dirty bit without tagging the page.  Having such internal function led
to real problems (incorrect task io accounting, etc.  because of not
updating this internal "friend").

Solution:

The following patch adds a core library function that sets a dirty bit
without tagging the page.

Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>
---
 include/linux/mm.h  |    1 +
 mm/page-writeback.c |   26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

--- mmotm.orig/include/linux/mm.h
+++ mmotm/include/linux/mm.h
@@ -842,6 +842,7 @@ int redirty_page_for_writepage(struct wr
 void update_page_accounting(struct page *page, struct address_space *mapping);
 int set_page_dirty(struct page *page);
 int set_page_dirty_lock(struct page *page);
+int set_page_dirty_notag(struct page *page);
 int clear_page_dirty_for_io(struct page *page);
 
 extern unsigned long move_page_tables(struct vm_area_struct *vma,
--- mmotm.orig/mm/page-writeback.c
+++ mmotm/mm/page-writeback.c
@@ -1256,6 +1256,32 @@ int __set_page_dirty_nobuffers(struct pa
 EXPORT_SYMBOL(__set_page_dirty_nobuffers);
 
 /*
+ * set_page_dirty_notag() -- similar to __set_page_dirty_nobuffers()
+ * except it doesn't tag the page dirty in the page-cache radix tree.
+ * This means that the address space using this cannot use the regular
+ * filemap ->writepages() helpers and must provide its own means of
+ * tracking and finding non-tagged dirty pages.
+ *
+ * NOTE: furthermore, this version also doesn't handle truncate races.
+ */
+int set_page_dirty_notag(struct page *page)
+{
+	struct address_space *mapping = page->mapping;
+
+	if (!TestSetPageDirty(page)) {
+		unsigned long flags;
+		WARN_ON_ONCE(!PagePrivate(page) && !PageUptodate(page));
+		local_irq_save(flags);
+		update_page_accounting(page, mapping);
+		local_irq_restore(flags);
+		__mark_inode_dirty(mapping->host, I_DIRTY_PAGES);
+		return 1;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(set_page_dirty_notag);
+
+/*
  * When a writepage implementation decides that it doesn't want to write this
  * page for some reason, it should redirty the locked page via
  * redirty_page_for_writepage() and it should then unlock the page and return 0
