From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: Re: [nikita-3002]: assertion failed: carry_level_invariant(doing, CARRY_DOING)
Date: Fri, 11 Aug 2006 14:37:18 -0400
Message-ID: <200608111437.22403.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200608021749.30205.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608101355.29298.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608111315.17116.vs@namesys.com>
Reply-To: ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29575-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608111315.17116.vs@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, andrew.j.wade@gmail.com, Alexander Zarochentsev <zam@namesys.com>

On Friday 11 August 2006 05:15, Vladimir V. Saveliev wrote:
> Hello
> 
> On Thursday 10 August 2006 21:55, Andrew James Wade wrote:
> > Hello,
> >
> > I've had another panic on a fscked filesystem:
> >
> > reiser4 panicked cowardly: reiser4[updatedb(3302)]: reiser4_writepage
> > (fs/reiser4/page_cache.c:521)[]: assertion failed: can_hit_entd(ctx, s)
> > Kernel panic - not syncing: reiser4[updatedb(3302)]: reiser4_writepage
> > (fs/reiser4/page_cache.c:521)[]: assertion failed: can_hit_entd(ctx, s)
> >
> 
> What kernel do you use? Recently we had few fixes of such problem.

2.6.18-rc3-mm2 + the patch below.

I've been unable to observe any corruption in over 300 GB of file data
written to the hd, so I don't think I have a hardware issue.

I will continue poking away at the problem.

Andrew Wade

------

re-add to reiser4_releasepage mistakenly removed page_count check.
extra page reference is used to protect page from detaching from the 
jnode.

Signed-off-by: Alexander Zarochentsev <zam@namesys.com>
---
 fs/reiser4/as_ops.c |    5 +++++
 1 file changed, 5 insertions(+)

Index: linux-2.6-git/fs/reiser4/as_ops.c
===================================================================
--- linux-2.6-git.orig/fs/reiser4/as_ops.c
+++ linux-2.6-git/fs/reiser4/as_ops.c
@@ -350,6 +350,11 @@ int reiser4_releasepage(struct page *pag
        if (PageDirty(page))
                return 0;
 
+       /* extra page reference is used by reiser4 to protect
+        * jnode<->page link from this ->releasepage(). */
+       if (page_count(page) > 3)
+               return 0;
+
        /* releasable() needs jnode lock, because it looks at the jnode fields
         * and we need jload_lock here to avoid races with jload(). */
        spin_lock_jnode(node);
