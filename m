From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Sat, 29 Dec 2012 22:47:49 +0400
Message-ID: <3248106.Mt7OvaDhna@intelfx-laptop>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <4846951.qvq7k6WC3K@intelfx-laptop> <50DE3850.8020304@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1704549.GZDuoQtdJ8"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:user-agent
         :in-reply-to:references:mime-version:content-type
         :content-transfer-encoding;
        bh=lYrW7QlcAnpX0YHzclnEtSrU289l/UKJ49zPFIMJGl8=;
        b=g7veJDEg38Alj+CF1HXBxKZgmK+tUiDu3bPCV/LlsU8gY+Oj///B5bM5nDCbNYnVBo
         3DdK+RieVDKUPq0EuTkl6UWmY6G6xiP4yGGibDnVqmOI2dajfLEPm3mvZSsbMKg7wpzf
         OUPfxVdMAzTLP/mOGu2PrJAyApAfCJRwPHZ+lYn5P5RHu55f1La+/yOgx/uSToL08ykb
         1rGD4A13lP/stca8wiXjwej5ABmpXo51hFC1l1nk9mSXEcDpp9Nqc3SuvqRruowdKfMM
         bURIVUPiw2WkneBM3XSGjnk4HIlETMRl1ydZXDt6Ptwkrraqil7RxUYvFSwpVlkErnjt
         SIog==
In-Reply-To: <50DE3850.8020304@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.

--nextPart1704549.GZDuoQtdJ8
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On 29 December 2012 01:24:48 Edward Shishkin wrote:
> On 12/26/2012 05:22 PM, Ivan Shapovalov wrote:
> > Hello Edward,
> 
> Hi Ivan,
> 
> > I've apparently managed to get a working implementation of
> > ->migratepage().
> > 
> > I'm attaching a patch; it seems stable, but I'm worried somewhat because
> > the destination pages (parameter newpage) sometimes (pretty often) have a
> > non-NULL private field.
> > 
> > Currently I've put there a warning and a set_page_private(newpage, 0) - it
> > seems to work, but well...
> > I'm continuing to test it and will report if that actually has bad
> > consequences.
> > 
> > - Ivan
> > 
> >> >  Edward.
> >> >  
> >>> >  >  Thanks,
> >>> >  >  Ivan.
> >>> >  >  
> >>>> >  >>  Also before the release I'll try to take a look at this:
> >>>> >  >>  http://marc.info/?l=reiserfs-devel&m=135402207623711&w=2
> >>>> >  >>  
> >>>> >  >>  This failed path might indicate that we adjusted to fs-writeback
> >>>> >  >>  incorrectly.
> >>>> >  >>  
> >>>> >  >>  Edward.
> >>>> >  >>  
> >>>>> >  >>>  Regards,
> >>>>> >  >>>  Ivan.
> >>>>> >  >>>  
> >>>>>>>>> >  >>>>>>>        on kernel
> >>>>>>>>> >  >>>>>>>  
> >>>>>>>>> >  >>>>>>>  3.6.10, and everything seems to be OK so far (so the
> >>>>>>>>> >  >>>>>>>  workaround is
> >>>>>>>>> >  >>>>>>>  version-
> >>>>>>>>> >  >>>>>>>  agnostic).
> >>>>>>>>> >  >>>>>>>  
> >>>>>>>>> >  >>>>>>>  Edward, are there any guesses on what can make reiser4
> >>>>>>>>> >  >>>>>>>  choke on
> >>>>>>>>> >  >>>>>>>  hugepages/compaction/migration?
> >>>>>>>> >  >>>>>>  
> >>>>>>>> >  >>>>>>  TBH, no ideas. They (hugepages) are_transparent_.
> >>>>>>>> >  >>>>>>  It means we shouldn't suffer in theory;)
> >>>>>>>> >  >>>>>>  
> >>>>>>>>> >  >>>>>>>        I'm not even barely familiar with the kernel
> >>>>>>>>> >  >>>>>>>  
> >>>>>>>>> >  >>>>>>>  internals.
> >>>>>>>>> >  >>>>>>>  
> >>>>>>>>> >  >>>>>>>  Thanks,
> >>>>>>>>> >  >>>>>>>  Ivan.
> > 
> > reiser4-migratepage.patch
> > 
> > 
> > diff --git a/fs/reiser4/as_ops.c b/fs/reiser4/as_ops.c
> > index 8d8a37d..20006fc 100644
> > --- a/fs/reiser4/as_ops.c
> > +++ b/fs/reiser4/as_ops.c
> > @@ -43,6 +43,7 @@
> > 
> >   #include<linux/backing-dev.h>
> >   #include<linux/quotaops.h>
> >   #include<linux/security.h>
> > 
> > +#include<linux/migrate.h>
> > 
> >   /* address space operations */
> > 
> > @@ -304,6 +305,98 @@ int reiser4_releasepage(struct page *page, gfp_t gfp
> > UNUSED_ARG)> 
> >   	}
> >   
> >   }
> > 
> > +int reiser4_migratepage(struct address_space *mapping, struct page
> > *newpage, +			struct page *page, enum migrate_mode mode)
> > +{
> > +	jnode *node;
> > +	int result;
> > +
> > +	assert("???-1", PageLocked(page));
> > +	assert("???-2", !PageWriteback(page));
> > +	assert("???-3", reiser4_schedulable());
> > +
> > +	if (PageDirty(page)) {
> > +		/*
> > +		 * Logic from migrate.c:fallback_migrate_page()
> > +		 * Only writeback pages in full synchronous migration
> > +		 */
> > +		if (mode != MIGRATE_SYNC)
> > +			return -EBUSY;
> > +		return write_one_page(page, true)<  0 ? -EIO : -EAGAIN;
> 
> Why? The migrate.c's writeout() doesn't work?
> I see it performs some cleanups..

Hi,

Because it's static. :)
But OK, I exported writeout() and used it.

> 
> > +	}
> > +
> > +	assert("???-4", !PageDirty(page));
> > +
> > +	assert("???-5", page->mapping != NULL);
> > +	assert("???-6", page->mapping->host != NULL);
> > +
> > +	/*
> > +	 * Iteration 1: release page before default migration by migrate_page().
> > +	 * Iteration 2: check if the page is releasable; if true, directly
> > replace +	 *              jnode's page pointer instead of releasing, then
> > migrate using +	 *              default migrate_page().
> > +	 */
> > +
> > +	/* -- comment taken from mm/migrate.c:migrate_page_move_mapping() --
> > +	 * The number of remaining references must be:
> > +	 * 1 for anonymous pages without a mapping
> > +	 * 2 for pages with a mapping
> > +	 * 3 for pages with a mapping and PagePrivate/PagePrivate2 set.
> > +	 */
> > +
> > +	if (page_count(page)>  (PagePrivate(page) ? 3 : 2))
> 
> OK
> 
> > +		return -EIO;
> 
> -EAGAIN would be better (like fallback_migrate_page() returns in
> the case of "non-releasable")

Fixed.

> 
> > +
> > +	/*
> > +	 * Non-referenced non-PagePrivate pages are e. g. anonymous pages.
> 
> "vfs-anonymous" are pages with page->mapping == NULL;
> 
> "reiser4-anonymous" are pages which are dirtied via ->mmap(),
> but not yet captured by reiser4 transaction manager.
> 
> Note, that none of those cases takes place at this point.

Hm, indeed that's an insane comment. Fixed.

> 
> > +	 * If any, just migrate them using default routine.
> > +	 */
> > +
> > +	if (!PagePrivate(page))
> > +		return migrate_page(mapping, newpage, page, mode);
> 
> OK
> 
> > +
> > +	node = jnode_by_page(page);
> > +	assert("???-7", node != NULL);
> > +
> > +	/* releasable() needs jnode lock, because it looks at the jnode fields
> > +	 * and we need jload_lock here to avoid races with jload(). */
> > +	spin_lock_jnode(node);
> > +	spin_lock(&(node->load));
> > +	if (jnode_is_releasable(node)) {
> > +		jref(node);
> 
> OK
> 
> > +
> > +		/* there is no need to synchronize against
> > +		 * jnode_extent_write() here, because pages seen by
> > +		 * jnode_extent_write() are !releasable(). */
> > +		page_clear_jnode(page, node);
> > +
> > +		if(jprivate(newpage)) {
> 
> Hmm, strange: the newpage is freshly allocated and locked..
> Somebody doesn't clean up after himself ???  Don't have other
> ideas..

Yes, apparently. There are no calls to set_page_private() in compaction.c or
migrate.c (actually, in last file there are some, but they do not get called
in observed pathes).

> 
> > +			// FIXME: warning or what? happens on a regular basis, behavior is
> > unaffected. +			warning("???-10", "Migration destination page has a
> > non-NULL private field (%x) - resetting it", page_private(newpage));
> Does it look like a pointer, which can be dereferenced?
> (print it better in %p format). If so, try to detect a
> jnode at this address by jnode's magic (JMAGIC 0x52654973,
> present only when debug is on). To make sure we are not
> the culprit..

Cannot be dereferenced. Proved by a handful of oopses...
The addresses (as printed by %p) look like "ffffea0002419800" and then
I get pagefault oopses for addresses like "0000000000001010".

> 
> > +			set_page_private(newpage, 0ul);
> > +		}
> > +
> > +		result = migrate_page(mapping, newpage, page, mode);
> > +		if (unlikely(result)) {
> > +			jnode_attach_page(node, page); /* migration failed - reattach the old
> > page */ +		} else {
> > +			jnode_attach_page(node, newpage);
> > +		}
> > +
> > +		jput(node);
> > +
> > +		spin_unlock(&(node->load));
> > +		spin_unlock_jnode(node);
> > +		assert("???-9", reiser4_schedulable());
> > +		return result;
> > +	} else {
> > +		spin_unlock(&(node->load));
> > +		spin_unlock_jnode(node);
> > +		assert("???-8", reiser4_schedulable());
> > +		return -EIO;
> 
> -EAGAIN

Fixed.

> 
> > +	}
> > +}
> > +
> 
> So simply releasing the page (by default migration routine) doesn't
> work, while such transfer of the relationship (page, jnode) to
> another pair (newpage, jnode) does work? Can not understand this..
> 
> E.g. vmscanner (vmscan.c), which also releases releasable page, but
> doesn't provide a newpage instead (in contrast with migration) works
> perfectly..

/me just looked at vmscan.c, which also skips ->releasepage() when there is
no private data on page, and wonders how did that ever work with reiser4.

So I'd say there is nothing strange in that the fallback_migrate_page() does not work
while our custom one works (it's all about remembering about non-PagePrivate pages);
instead, it is strange that the vmscanner works while fallback_migrate_page() does not.

Maybe vmscanner finds out that the page is used by some other means?..

> 
> Did you stress it well enough?

Yes, I think so. Parallel building + various git operations + databases + virtual machines.

> 
> I think we'll release reiser4-for-3.7 with fail_migrate_page (to fix
> a stability point), and continue to play with migration..

Maybe.. What are the next targets to play?
I'm attaching a patch with all these issues corrected.

Regards,
Ivan.

> 
> Thanks for important results!
> 
> Edward.
--nextPart1704549.GZDuoQtdJ8
Content-Disposition: attachment; filename="reiser4-migratepage-v2.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="reiser4-migratepage-v2.patch"

diff --git a/fs/reiser4/as_ops.c b/fs/reiser4/as_ops.c
index 8d8a37d..5949e5d 100644
--- a/fs/reiser4/as_ops.c
+++ b/fs/reiser4/as_ops.c
@@ -43,6 +43,7 @@
 #include <linux/backing-dev.h>
 #include <linux/quotaops.h>
 #include <linux/security.h>
+#include <linux/migrate.h>
 
 /* address space operations */
 
@@ -304,6 +305,98 @@ int reiser4_releasepage(struct page *page, gfp_t gfp UNUSED_ARG)
 	}
 }
 
+int reiser4_migratepage(struct address_space *mapping, struct page *newpage,
+			struct page *page, enum migrate_mode mode)
+{
+	jnode *node;
+	int result;
+
+	assert("???-1", PageLocked(page));
+	assert("???-2", !PageWriteback(page));
+	assert("???-3", reiser4_schedulable());
+
+	if (PageDirty(page)) {
+		/*
+		 * Logic from migrate.c:fallback_migrate_page()
+		 * Only writeback pages in full synchronous migration
+		 */
+		if (mode != MIGRATE_SYNC)
+			return -EBUSY;
+		return writeout(mapping, page);
+	}
+
+	assert("???-4", !PageDirty(page));
+
+	assert("???-5", page->mapping != NULL);
+	assert("???-6", page->mapping->host != NULL);
+
+	/*
+	 * Iteration 1: release page before default migration by migrate_page().
+	 * Iteration 2: check if the page is releasable; if true, directly replace
+	 *              jnode's page pointer instead of releasing, then migrate using
+	 *              default migrate_page().
+	 */
+
+	/* -- comment taken from mm/migrate.c:migrate_page_move_mapping() --
+	 * The number of remaining references must be:
+	 * 1 for anonymous pages without a mapping
+	 * 2 for pages with a mapping
+	 * 3 for pages with a mapping and PagePrivate/PagePrivate2 set.
+	 */
+
+	if (page_count(page) > (PagePrivate(page) ? 3 : 2))
+		return -EAGAIN;
+
+	/*
+	 * If there are non-referenced non-PagePrivate pages,
+	 * just migrate them using default routine.
+	 */
+
+	if (!PagePrivate(page))
+		return migrate_page(mapping, newpage, page, mode);
+
+	node = jnode_by_page(page);
+	assert("???-7", node != NULL);
+
+	/* releasable() needs jnode lock, because it looks at the jnode fields
+	 * and we need jload_lock here to avoid races with jload(). */
+	spin_lock_jnode(node);
+	spin_lock(&(node->load));
+	if (jnode_is_releasable(node)) {
+		jref(node);
+
+		/* there is no need to synchronize against
+		 * jnode_extent_write() here, because pages seen by
+		 * jnode_extent_write() are !releasable(). */
+		page_clear_jnode(page, node);
+
+		if(jprivate(newpage)) {
+			// FIXME: warning or what? happens on a regular basis, behavior is unaffected.
+			warning("???-10", "Migration destination page has a non-NULL private field (%p) - resetting it", page_private(newpage));
+			set_page_private(newpage, 0ul);
+		}
+
+		result = migrate_page(mapping, newpage, page, mode);
+		if (unlikely(result)) {
+			jnode_attach_page(node, page); /* migration failed - reattach the old page */
+		} else {
+			jnode_attach_page(node, newpage);
+		}
+
+		jput(node);
+
+		spin_unlock(&(node->load));
+		spin_unlock_jnode(node);
+		assert("???-9", reiser4_schedulable());
+		return result;
+	} else {
+		spin_unlock(&(node->load));
+		spin_unlock_jnode(node);
+		assert("???-8", reiser4_schedulable());
+		return -EAGAIN;
+	}
+}
+
 int reiser4_readpage(struct file *file, struct page *page)
 {
 	assert("edward-1533", PageLocked(page));
diff --git a/fs/reiser4/page_cache.c b/fs/reiser4/page_cache.c
index bce07ea..1bbb9dc 100644
--- a/fs/reiser4/page_cache.c
+++ b/fs/reiser4/page_cache.c
@@ -548,7 +548,8 @@ static struct address_space_operations formatted_fake_as_ops = {
 	   and, may be made page itself free-able.
 	 */
 	.releasepage = reiser4_releasepage,
-	.direct_IO = NULL
+	.direct_IO = NULL,
+	.migratepage = reiser4_migratepage
 };
 
 /* called just before page is released (no longer used by reiser4). Callers:
diff --git a/fs/reiser4/plugin/object.c b/fs/reiser4/plugin/object.c
index e8db03b..ef37a2d 100644
--- a/fs/reiser4/plugin/object.c
+++ b/fs/reiser4/plugin/object.c
@@ -121,7 +121,8 @@ static struct address_space_operations regular_file_a_ops = {
 	.write_end = reiser4_write_end_careful,
 	.bmap = reiser4_bmap_careful,
 	.invalidatepage = reiser4_invalidatepage,
-	.releasepage = reiser4_releasepage
+	.releasepage = reiser4_releasepage,
+	.migratepage = reiser4_migratepage
 };
 
 /* VFS methods for symlink files */
@@ -172,7 +173,8 @@ static struct address_space_operations directory_a_ops = {
 	.write_end = bugop,
 	.bmap = bugop,
 	.invalidatepage = bugop,
-	.releasepage = bugop
+	.releasepage = bugop,
+	.migratepage = bugop
 };
 
 /*
diff --git a/fs/reiser4/vfs_ops.h b/fs/reiser4/vfs_ops.h
index 6ca85f8..3c6c0f3 100644
--- a/fs/reiser4/vfs_ops.h
+++ b/fs/reiser4/vfs_ops.h
@@ -24,6 +24,8 @@ int reiser4_writepage(struct page *, struct writeback_control *);
 int reiser4_set_page_dirty(struct page *);
 void reiser4_invalidatepage(struct page *, unsigned long offset);
 int reiser4_releasepage(struct page *, gfp_t);
+int reiser4_migratepage(struct address_space *, struct page *,
+			struct page *, enum migrate_mode);
 
 extern int reiser4_update_sd(struct inode *);
 extern int reiser4_add_nlink(struct inode *, struct inode *, int);
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index ce7e667..2d0340f 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -30,6 +30,9 @@ extern int migrate_vmas(struct mm_struct *mm,
 extern void migrate_page_copy(struct page *newpage, struct page *page);
 extern int migrate_huge_page_move_mapping(struct address_space *mapping,
 				  struct page *newpage, struct page *page);
+
+extern int writeout(struct address_space *mapping, struct page *page);
+
 #else
 
 static inline void putback_lru_pages(struct list_head *l) {}
@@ -59,6 +62,11 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 	return -ENOSYS;
 }
 
+static inline int writeout(struct address_space *mapping, struct page *page)
+{
+	return -ENOSYS;
+}
+
 /* Possible settings for the migrate_page() method in address_operations */
 #define migrate_page NULL
 #define fail_migrate_page NULL
diff --git a/mm/migrate.c b/mm/migrate.c
index 77ed2d7..3a854cb 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -557,7 +557,7 @@ EXPORT_SYMBOL(buffer_migrate_page);
 /*
  * Writeback a page to clean the dirty state
  */
-static int writeout(struct address_space *mapping, struct page *page)
+int writeout(struct address_space *mapping, struct page *page)
 {
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_NONE,
@@ -594,6 +594,7 @@ static int writeout(struct address_space *mapping, struct page *page)
 
 	return (rc < 0) ? -EIO : -EAGAIN;
 }
+EXPORT_SYMBOL(writeout);
 
 /*
  * Default handling if a filesystem does not provide a migration function.

--nextPart1704549.GZDuoQtdJ8--

