From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: [nikita-3002]: assertion failed: carry_level_invariant(doing, CARRY_DOING)
Date: Thu, 3 Aug 2006 19:28:23 +0400
Message-ID: <200608031928.25155.zam@namesys.com>
References: <200608021749.30205.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608030851.30457.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29460-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608030851.30457.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, Andrew James Wade <andrew.j.wade@gmail.com>

Hello,

> I've just had some warnings show up in my kernel log. I don't know if
> they're related to the troubles I've been having (I fscked after the
> last panic).

please apply the following patch:

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
 
+	/* extra page reference is used by reiser4 to protect
+	 * jnode<->page link from this ->releasepage(). */
+	if (page_count(page) > 3)
+		return 0;
+
 	/* releasable() needs jnode lock, because it looks at the jnode fields
 	 * and we need jload_lock here to avoid races with jload(). */
 	spin_lock_jnode(node);



