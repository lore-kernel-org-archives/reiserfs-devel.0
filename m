From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: hmm, dependencies
Date: Fri, 17 Dec 2004 20:30:58 +0300
Message-ID: <1103304658.3589.109.camel@tribesman.namesys.com>
References: <1103226970.704.1.camel@localhost>
	 <1103291711.3589.32.camel@tribesman.namesys.com>
	 <1103296970.12405.0.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-E3Bg68aYeKqdzjQwLu0K"
Return-path: <reiserfs-list-return-22819-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1103296970.12405.0.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: redeeman@metanurb.dk
Cc: Reiserfs Mailinglist <reiserfs-list@namesys.com>

--=-E3Bg68aYeKqdzjQwLu0K
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Fri, 2004-12-17 at 18:22, Redeeman wrote:
> On Fri, 2004-12-17 at 16:55 +0300, Vladimir Saveliev wrote:
> > Hello
> > 
> > On Thu, 2004-12-16 at 22:56, Redeeman wrote:
> > > hello.. reiser4 is now in mm, but i realize that nearly all of the stuff
> > > that was mm specific when the move to mm was made, are probably merged
> > > into upstream by now, i wonder, can anyone tell me exactly what from mm
> > > it depends on?
> > > 
> > > thanks
> > > 
> > 
> > reiser4 got included into mm not because it needed something of it, but
> > rather because it is supposed that being in mm for certain amount of
> > time reiser4 will get a lot of testing and will prove that it is worth
> > to get included into stock kernel. 
> im aware, however, the reiser4 patches in mm are against mm, which means
> it depends on something from it, and i'd like to find out what :D so
> that i can take it out and apply to vanilla along with reiser4

did you see ftp.namesys.com/pub/reiser4-for-2.6/2.6.9?
It contains all things which reiser4 depends on.

If you would like to add reiser4 to vanilla kernel yourself you would
have to add reiser4 patches of mm kernel to vanilla one:

people/akpm/patches/2.6/2.6.X/2.6.X-mmY/broken-out/reiser4-*
and add the patch i am attaching to this email.


--=-E3Bg68aYeKqdzjQwLu0K
Content-Disposition: attachment; filename=reiser4-for-2.6.9.patch
Content-Type: text/plain; name=reiser4-for-2.6.9.patch; charset=koi8-r
Content-Transfer-Encoding: 7bit


This patch is to get reiser4 runable under not mm serie of kernel

diff -puN fs/reiser4/as_ops.c~reiser4-for-2.6.9 fs/reiser4/as_ops.c


 fs/reiser4/as_ops.c               |   18 +++++++++---------
 fs/reiser4/page_cache.c           |    8 ++++----
 fs/reiser4/plugin/file/file.c     |    8 ++++----
 fs/reiser4/plugin/object.c        |    1 -
 fs/reiser4/plugin/security/perm.c |    2 +-
 5 files changed, 18 insertions(+), 19 deletions(-)

diff -puN fs/reiser4/as_ops.c~reiser4-for-2.6.9 fs/reiser4/as_ops.c
--- linux-2.6.9/fs/reiser4/as_ops.c~reiser4-for-2.6.9	2004-12-08 16:27:45.008736629 +0300
+++ linux-2.6.9-vs/fs/reiser4/as_ops.c	2004-12-08 16:28:54.056614275 +0300
@@ -75,7 +75,7 @@ reiser4_clear_page_dirty(struct page *pa
 	mapping = page->mapping;
 	BUG_ON(mapping == NULL);
 
-	read_lock_irqsave(&mapping->tree_lock, flags);
+	spin_lock_irqsave(&mapping->tree_lock, flags);
 	if (TestClearPageDirty(page)) {
 		/* clear dirty tag of page in address space radix tree */
 		radix_tree_tag_clear(&mapping->page_tree, page->index,
@@ -84,12 +84,12 @@ reiser4_clear_page_dirty(struct page *pa
 		radix_tree_tag_clear(&mapping->page_tree, page->index,
 				     PAGECACHE_TAG_REISER4_MOVED);
 
-		read_unlock_irqrestore(&mapping->tree_lock, flags);
+		spin_unlock_irqrestore(&mapping->tree_lock, flags);
 		if (!mapping->backing_dev_info->memory_backed)
 			dec_page_state(nr_dirty);
 		return;
 	}
-	read_unlock_irqrestore(&mapping->tree_lock, flags);
+	spin_unlock_irqrestore(&mapping->tree_lock, flags);
 }
 
 /* as_ops->set_page_dirty() VFS method in reiser4_address_space_operations.
@@ -114,7 +114,7 @@ static int reiser4_set_page_dirty(struct
 		struct address_space *mapping = page->mapping;
 
 		if (mapping) {
-			read_lock_irq(&mapping->tree_lock);
+			spin_lock_irq(&mapping->tree_lock);
 			/* check for race with truncate */
 			if (page->mapping) {
 				assert("vs-1652", page->mapping == mapping);
@@ -126,7 +126,7 @@ static int reiser4_set_page_dirty(struct
 				radix_tree_tag_set(&mapping->page_tree,
 						   page->index, PAGECACHE_TAG_REISER4_MOVED);
 			}
-			read_unlock_irq(&mapping->tree_lock);
+			spin_unlock_irq(&mapping->tree_lock);
 			__mark_inode_dirty(mapping->host, I_DIRTY_PAGES);
 		}
 	}
@@ -145,14 +145,14 @@ int reiser4_set_page_dirty2(struct page 
 		struct address_space *mapping = page->mapping;
 
 		if (mapping) {
-			read_lock_irq(&mapping->tree_lock);
+			spin_lock_irq(&mapping->tree_lock);
 			/* check for race with truncate */
 			if (page->mapping) {
 				assert("vs-1652", page->mapping == mapping);
 				if (!mapping->backing_dev_info->memory_backed)
 					inc_page_state(nr_dirty);
 			}
-			read_unlock_irq(&mapping->tree_lock);
+			spin_unlock_irq(&mapping->tree_lock);
 			__mark_inode_dirty(mapping->host, I_DIRTY_PAGES);
 		}
 	}
@@ -600,13 +600,13 @@ reiser4_releasepage(struct page *page, i
 		/* we are under memory pressure so release jnode also. */
 		jput(node);
 
-		write_lock_irq(&mapping->tree_lock);
+		spin_lock_irq(&mapping->tree_lock);
 		/* shrink_list() + radix-tree */
 		if (page_count(page) == 2) {
 			__remove_from_page_cache(page);
 			__put_page(page);
 		}
-		write_unlock_irq(&mapping->tree_lock);
+		spin_unlock_irq(&mapping->tree_lock);
 
 		return 1;
 	} else {
diff -puN fs/reiser4/page_cache.c~reiser4-for-2.6.9 fs/reiser4/page_cache.c
--- linux-2.6.9/fs/reiser4/page_cache.c~reiser4-for-2.6.9	2004-12-08 16:27:45.014737053 +0300
+++ linux-2.6.9-vs/fs/reiser4/page_cache.c	2004-12-08 16:27:45.035738537 +0300
@@ -533,7 +533,7 @@ int set_page_dirty_internal (struct page
 		struct address_space *mapping = page->mapping;
 
 		if (mapping) {
-			read_lock_irq(&mapping->tree_lock);
+			spin_lock_irq(&mapping->tree_lock);
 			if (page->mapping) {	/* Race with truncate? */
 				BUG_ON(page->mapping != mapping);
 				if (!mapping->backing_dev_info->memory_backed)
@@ -551,7 +551,7 @@ int set_page_dirty_internal (struct page
 						PAGECACHE_TAG_REISER4_MOVED);
 				}
 			}
-			read_unlock_irq(&mapping->tree_lock);
+			spin_unlock_irq(&mapping->tree_lock);
 			__mark_inode_dirty(mapping->host, I_DIRTY_PAGES);
 		}
 	}
@@ -595,13 +595,13 @@ reiser4_internal void capture_reiser4_in
 			struct address_space * mapping = inode->i_mapping;
 			unsigned long flags;
 
-			read_lock_irqsave(&mapping->tree_lock, flags);
+			spin_lock_irqsave(&mapping->tree_lock, flags);
 			if (!radix_tree_tagged(&mapping->page_tree, PAGECACHE_TAG_DIRTY) &&
 			    !radix_tree_tagged(&mapping->page_tree, PAGECACHE_TAG_REISER4_MOVED))
 			{
 				inode->i_state &= ~(I_DIRTY);
 			}
-			read_unlock_irqrestore(&mapping->tree_lock, flags);
+			spin_unlock_irqrestore(&mapping->tree_lock, flags);
 		}
 		spin_unlock(&inode_lock);
 
diff -puN fs/reiser4/plugin/file/file.c~reiser4-for-2.6.9 fs/reiser4/plugin/file/file.c
--- linux-2.6.9/fs/reiser4/plugin/file/file.c~reiser4-for-2.6.9	2004-12-08 16:27:45.019737406 +0300
+++ linux-2.6.9-vs/fs/reiser4/plugin/file/file.c	2004-12-08 16:27:45.038738749 +0300
@@ -1363,7 +1363,7 @@ sync_page_list(struct inode *inode)
 	mapping = inode->i_mapping;
 	from = 0;
 	result = 0;
-	read_lock_irq(&mapping->tree_lock);
+	spin_lock_irq(&mapping->tree_lock);
 	while (result == 0) {
 		struct page *page;
 
@@ -1375,17 +1375,17 @@ sync_page_list(struct inode *inode)
 		/* page may not leave radix tree because it is protected from truncating by inode->i_sem downed by
 		   sys_fsync */
 		page_cache_get(page);
-		read_unlock_irq(&mapping->tree_lock);
+		spin_unlock_irq(&mapping->tree_lock);
 
 		from = page->index + 1;
 
 		result = sync_page(page);
 
 		page_cache_release(page);
-		read_lock_irq(&mapping->tree_lock);
+		spin_lock_irq(&mapping->tree_lock);
 	}
 
-	read_unlock_irq(&mapping->tree_lock);
+	spin_unlock_irq(&mapping->tree_lock);
 	return result;
 }
 
diff -puN fs/reiser4/plugin/object.c~reiser4-for-2.6.9 fs/reiser4/plugin/object.c
--- linux-2.6.9/fs/reiser4/plugin/object.c~reiser4-for-2.6.9	2004-12-08 16:27:45.024737760 +0300
+++ linux-2.6.9-vs/fs/reiser4/plugin/object.c	2004-12-08 16:27:45.040738890 +0300
@@ -991,7 +991,6 @@ static void delete_inode_common(struct i
 	 * FIXME: this resembles generic_delete_inode
 	 */
 	list_del_init(&object->i_list);
-	list_del_init(&object->i_sb_list);
 	object->i_state |= I_FREEING;
 	inodes_stat.nr_inodes--;
 	spin_unlock(&inode_lock);
diff -puN fs/reiser4/plugin/security/perm.c~reiser4-for-2.6.9 fs/reiser4/plugin/security/perm.c
--- linux-2.6.9/fs/reiser4/plugin/security/perm.c~reiser4-for-2.6.9	2004-12-08 16:27:45.028738042 +0300
+++ linux-2.6.9-vs/fs/reiser4/plugin/security/perm.c	2004-12-08 16:27:45.041738961 +0300
@@ -14,7 +14,7 @@
 static int
 mask_ok_common(struct inode *inode, int mask)
 {
-	return generic_permission(inode, mask, NULL);
+	return vfs_permission(inode, mask);
 }
 
 static int

_

--=-E3Bg68aYeKqdzjQwLu0K--

