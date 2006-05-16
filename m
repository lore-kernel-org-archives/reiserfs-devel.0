From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Recent patch frenzy, conflicts and Oopses
Date: Tue, 16 May 2006 14:32:20 +0400
Message-ID: <200605161432.21209.zam@namesys.com>
References: <20060515130450.GB8977@zeus.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060515130450.GB8977@zeus.uziel.local>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Christian Trefzer <ctrefzer@gmx.de>

On Monday 15 May 2006 17:04, Christian Trefzer wrote:
> Hi guys,
>
> as I am heavily using reiser4 for some time now on my stable machine,
> I keep a git tree with vanilla -stable and reiser4 since -mm has
> sometimes been too unreliable. Lurking on this list I collected some
> patches, of which two seem to collide. The first one fixes a nasty
> "out of memory?" Oops for me and maybe others, and the second one was
> posted as a response to other Oopses on the list.
>
> Since I reversed the first one in order to apply the second one,
> thinking (wrongly) that this one should be a better fix for the same
> issues and maybe more, I have my old pal out of memory back. Maybe
> the two should be merged in a compatible way, and a new patch against
> 2.6.16-stable be put on the namesys ftp server?
>
> Anyway, here come the patches in question:
>
> From: Alexander Zarochentsev <zam@namesys.com>
> To: reiserfs-list@namesys.com
> Subject: Re: "warning("vs-44", "out of memory?")"
> Date: Wed, 12 Apr 2006 14:26:59 +0400
>
> On Wednesday 12 April 2006 13:06, Alexander Zarochentsev wrote:
> > Hello
> >
> > On Wednesday 12 April 2006 11:42, Roy Lanek wrote:
> > > I have managed to save a copy of my
> > > /var/log/socklog-klog/others/current
> > > before the next complete freezing happened.
> >
> > Please use the latest reiser4 patch reiser4-for-2.6.16-2 from
> > ftp.namesys.com.
>
> and apply the following patch:

The patch disables the BUG() but reiser4 can deadlock.  However the 
deadlock requires 3 processes to use the same EA/NEA semaphore.  

better patches are there: 

ftp.kernel.org:/pub/linux/kernel/people/akpm/patches/2.6/2.6.17-rc4/2.6.17-rc4-mm1/broken-out/
reiser4-have-get_exclusive_access-restart-transaction.patch
reiser4-add-missing-txn_restart-before-get_nonexclusive_access-calls.patch


> Index: linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/extent_file_ops.c
> ===================================================================
> ---
> linux-2.6.17-rc1-mm1.orig/fs/reiser4/plugin/item/extent_file_ops.c
> +++ linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/extent_file_ops.c @@
> -807,7 +807,7 @@ extent_balance_dirty_pages(struct inode
>  		if (excl)
>  			get_exclusive_access(uf_info);
>  		else
> -			get_nonexclusive_access(uf_info, 0);
> +			get_nonexclusive_access(uf_info, 1);
>  	}
>  	return 0;
>  }
> Index: linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/tail.c
> ===================================================================
> --- linux-2.6.17-rc1-mm1.orig/fs/reiser4/plugin/item/tail.c
> +++ linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/tail.c
> @@ -510,7 +510,7 @@ tail_balance_dirty_pages(struct address_
>  		if (excl)
>  			get_exclusive_access(uf_info);
>  		else
> -			get_nonexclusive_access(uf_info, 0);
> +			get_nonexclusive_access(uf_info, 1);
>  	}
>  	return 0;
>  }
>
>
> This one helped me a lot. The second one brought older problems back,
> but may have fixed others for some people on this list. It seems to
> remove the second argument to get_nonexclusive_access(), though:
>
> From: Alexander Zarochentsev <zam@namesys.com>
> To: reiserfs-list@namesys.com
> Subject: Re: Reproducible reiser4 bug with 2.6.16.2 patch on
> tail_conversion.c:80 Date: Thu, 11 May 2006 11:24:53 +0400
>
> --Boundary-00=_FbuYEKWWhFAJ/IU
> Content-Type: text/plain;
>   charset="iso-8859-1"
> Content-Transfer-Encoding: 7bit
> Content-Disposition: inline
>
> Hello
>
> [original message snipped]
>
> please check whether the attached patch helps.

-- 
Alex.
