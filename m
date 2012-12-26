From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Wed, 26 Dec 2012 08:22:45 -0800 (PST)
Message-ID: <4846951.qvq7k6WC3K@intelfx-laptop>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <8441852.S0Hz7rjb2F@intelfx-laptop> <50CDEA86.3070104@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2317082.zoK1I1zYkn"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:user-agent
         :in-reply-to:references:mime-version:content-type
         :content-transfer-encoding;
        bh=9s1ftxo3mLboH+b7yn4mTKk/yVinPnLgZG1BRxsCel4=;
        b=bNYt/AqECSphWrQWbFSwwcSli0hWE+6WQ7rvdK5egNU6w4RGJmboq0O48SHmAVFb74
         eH3HnJMVSQE/wCBnWnxePScuKd13xijW68Jkr+VdtSAGXeyQlvIa5gTTArFmmAjur6vL
         8ovVc+Jb78VWDkrEpt8kIJGAQqPxzezfmNtg93UhJDeBhO8w3rASdIfPNoeHVfF10IIc
         k6Ao1TXxxrGd+cL5syLonH/RFQO6YGiiynrc5r5obqOeuhRKQiVd9Obun/amZT4mMM4s
         fFAwOGc6WOu5/0++xJf3+Ixx36H92zkJvxxMCJEag1IhG3nOEFFMqvJFfkAhUGubMthM
         c/iA==
In-Reply-To: <50CDEA86.3070104@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: =?utf-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.

--nextPart2317082.zoK1I1zYkn
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On 16 December 2012 16:36:38 Edward Shishkin wrote:
> On 12/14/2012 07:20 PM, Ivan Shapovalov wrote:
> > On 14 December 2012 12:07:56 Edward Shishkin wrote:
> >> On 12/14/2012 04:14 AM, Ivan Shapovalov wrote:
> >>> On 13 December 2012 23:47:10 Edward Shishkin wrote:
> >>>> On 12/11/2012 09:54 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> >>>>> On Tue, Dec 11, 2012 at 7:33 PM, Edward Shishkin
> >>>>>=20
> >>>>> <edward.shishkin@gmail.com>    wrote:
> >>>>>> On 12/11/2012 04:08 PM, Ivan Shapovalov wrote:
> >>>>>>> Hello!
> >>>>>>=20
> >>>>>> Hello.
> >>>>>>=20
> >>>>>>> With help of Du=C5=A1an =C4=8Coli=C4=87<dusanc@gmail.com>    =
who provided his
> >>>>>>> kernel
> >>>>>>> config
> >>>>>>> diff I've found a kernel option which, when disabled, greatly=

> >>>>>>> reduces
> >>>>>>> (hopefully to zero, but need time to verify it) corruption ra=
te in
> >>>>>>> reiser4.
> >>>>>>>=20
> >>>>>>> It's CONFIG_TRANSPARENT_HUGEPAGE (or something which is used =
by it
> >>>>>>> like
> >>>>>>> CONFIG_COMPACTION or CONFIG_MIGRATION).
> >>>>>>> For now I'm testing it with CONFIG_TRANSPARENT_HUGEPAGE disab=
led
> >>>>>>=20
> >>>>>> How long?
> >>>>>=20
> >>>>> For me the difference in uptime is months without vs hours with=
 it :D
> >>>>> on 2.6.39.4
> >>>>=20
> >>>> Hm, indeed: my setup with enabled migration can not survive even=
 one
> >>>> kernel compilation, while with disabled migration everything loo=
ks ok..
> >>>=20
> >>> The overnight testing also showed no errors...
> >>> So shall we release reiser4-for-3.7 and announce FIXED(?) once ag=
ain?
> >>>=20
> >>> :)
> >>=20
> >> I worry that migration is mandatory option for hugepages.
> >> Does fail_migrate_page() work with hugepages?
> >=20
> > _Apparently_ yes. We have a counter named "compact_pagemigrate_fail=
ed" in
> > /proc/vmstat (documented in vm/transhuge.txt), which means that fai=
ling a
> > page migration is not a critical event. So hugepages and compaction=
 will
> > work, albeit quite less effectively...
> >=20
> > ...And I've immediately got a bunch of (presumably silly) questions=

>=20
> Nop. Good questions.
>=20
>=20
>   while
>=20
> > trying to implement ->migratepage().
> >=20
> > 1) Why it is needed to writeback dirty pages before migrating them?=

> >=20
> > 2) Looking at the default implementation (fallback_migrate_page()),=
 what
> > is
> > the meaning of migrating a released page?
>=20
> To make sure that nobody uses the page.
>=20
> Just imagine: we allocate a page, take a reference, make page uptodat=
e.
> At this point migration routine steals the page. Then we do kmap(), b=
ut
> virtual address is wrong. Welcome to corruption..
>=20
> So, at first, migration routine wants to make sure that file system
> doesn't use the page: try_to_release_page() checks a reference
> counter (see e.g reiser4_releasepage).
>=20
>=20
>   In other words, doesn't "releasing"
>=20
> > page anyway mean "completely freeing" it, requiring the fs to read
> > corresponding data again?
>=20
> File system can not use a pointer to page which has been released.
> We should obtain a new pointer (via find_get_page(), etc). IMHO dirty=

> page is a special case (this is regarding your question #1)
>=20
> > 3) As far as I could understand, migrating page (from fs's point of=
 view)
> > is just replacing all internal pointers to the "old" page with poin=
ters
> > to the new one together with calling predefined functions
> > migrate_page_move_mapping() and migrate_page_copy(). So here's a qu=
estion
> > - which structures of reiser4 (beyond jnode->pg) keep pointers to p=
ages
> > and how to access them, given a single page?
>=20
> Those pointers shouldn't be a concern, as we use them with reference
> counters hold. I don't see where we reuse pointers to released page.
>=20
> When a page is successfully released, we detach it from jnode (see
> page_clear_jnode() in reiser4_releasepage()).
>=20
> > I can remember cryptcompress's struct cluster_handle which stores a=
n array
> > of pages...
>=20
> All cluster handles do have a status of local variables. After
> checkin_page_cluster() we forget about the pointers while reference
> counters are still hold. After checkout_page_cluster() we drop
> reference counters and also forget about the pointers.
>=20
> I see that default migration routine tries to release only pages
> with non-zero private info. It won't work for reiser4, as not all
> our pages has non-zero private info. For files managed by
> cryptcompress plugin we allocate one jnode per page cluster (by
> default 16 pages for page size 4K). And only first page of the
> cluster gets non-zero private info. So reiser4_migratepage() should
> try to release _all_ pages, not only ones with non-zero private info.=

>=20
> Still don't have ideas why we get corruption in the case of files
> managed by (default) unix-file plugin (where we allocate one jnode
> per page)..

Hello Edward,

I've apparently managed to get a working implementation of ->migratepag=
e().

I'm attaching a patch; it seems stable, but I'm worried somewhat becaus=
e the=20
destination pages (parameter newpage) sometimes (pretty often) have a n=
on-NULL=20
private field.

Currently I've put there a warning and a set_page_private(newpage, 0) -=
 it=20
seems to work, but well...
I'm continuing to test it and will report if that actually has bad=20
consequences.

- Ivan

>=20
> Edward.
>=20
> > Thanks,
> > Ivan.
> >=20
> >> Also before the release I'll try to take a look at this:
> >> http://marc.info/?l=3Dreiserfs-devel&m=3D135402207623711&w=3D2
> >>=20
> >> This failed path might indicate that we adjusted to fs-writeback
> >> incorrectly.
> >>=20
> >> Edward.
> >>=20
> >>> Regards,
> >>> Ivan.
> >>>=20
> >>>>>>>      on kernel
> >>>>>>>=20
> >>>>>>> 3.6.10, and everything seems to be OK so far (so the workarou=
nd is
> >>>>>>> version-
> >>>>>>> agnostic).
> >>>>>>>=20
> >>>>>>> Edward, are there any guesses on what can make reiser4 choke =
on
> >>>>>>> hugepages/compaction/migration?
> >>>>>>=20
> >>>>>> TBH, no ideas. They (hugepages) are _transparent_.
> >>>>>> It means we shouldn't suffer in theory ;)
> >>>>>>=20
> >>>>>>>      I'm not even barely familiar with the kernel
> >>>>>>>=20
> >>>>>>> internals.
> >>>>>>>=20
> >>>>>>> Thanks,
> >>>>>>> Ivan.
--nextPart2317082.zoK1I1zYkn
Content-Disposition: attachment; filename="reiser4-migratepage.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="reiser4-migratepage.patch"

diff --git a/fs/reiser4/as_ops.c b/fs/reiser4/as_ops.c
index 8d8a37d..20006fc 100644
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
+		return write_one_page(page, true) < 0 ? -EIO : -EAGAIN;
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
+		return -EIO;
+
+	/*
+	 * Non-referenced non-PagePrivate pages are e. g. anonymous pages.
+	 * If any, just migrate them using default routine.
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
+			warning("???-10", "Migration destination page has a non-NULL private field (%x) - resetting it", page_private(newpage));
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
+		return -EIO;
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

--nextPart2317082.zoK1I1zYkn--

