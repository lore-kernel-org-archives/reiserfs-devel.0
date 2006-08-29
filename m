From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Is as_ops.c releasepage patch still needed?
Date: Tue, 29 Aug 2006 10:01:53 +0400
Message-ID: <200608291001.53573.zam@namesys.com>
References: <1156186198.10806.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29722-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1156186198.10806.5.camel@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Jonathan Briggs <jbriggs@esoft.com>

Hi,

On 21 August 2006 22:49, Jonathan Briggs wrote:
> The following patch was posted to the Reiser4 list August 3 by zam. 
> Is it still needed?  It solved many problems for me, making my
> systems able to actually complete full Beagle indexing.

the patch submitted already and will be included into the next -mm 
kernel (after 2.6.18-rc4-mm3).

>
> But I have not seen this patch show up in the last two mm kernel
> releases.  Did something else fix it or is this patch still needed?
>
>
> Index: linux-2.6-git/fs/reiser4/as_ops.c
> ===================================================================
> --- linux-2.6-git.orig/fs/reiser4/as_ops.c
> +++ linux-2.6-git/fs/reiser4/as_ops.c
> @@ -350,6 +350,11 @@ int reiser4_releasepage(struct page *pag
>         if (PageDirty(page))
>                 return 0;
>
> +       /* extra page reference is used by reiser4 to protect
> +        * jnode<->page link from this ->releasepage(). */
> +       if (page_count(page) > 3)
> +               return 0;
> +
>         /* releasable() needs jnode lock, because it looks at the
> jnode fields * and we need jload_lock here to avoid races with
> jload(). */ spin_lock_jnode(node);

-- 
Alex.

