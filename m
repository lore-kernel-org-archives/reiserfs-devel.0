From: Lorenzo Allegrucci <l.allegrucci@tiscali.it>
Subject: Re: 2.6.0-test4 reiserfs oops
Date: Tue, 26 Aug 2003 15:59:20 +0000
Message-ID: <200308261559.20668.l.allegrucci@tiscali.it>
References: <200308252047.36054.l.allegrucci@tiscali.it> <200308261146.47241.l.allegrucci@tiscali.it> <20030826103851.GA14676@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15421-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030826103851.GA14676@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 26 +August 2003 10:38, Oleg Drokin wrote:
> Hello!
>
> On Tue, Aug 26, 2003 at 11:46:47AM +0000, Lorenzo Allegrucci wrote:
> > > > I have got this oops running fsstress and fsx-linux
> > > > on a 20Gb reiserfs partition.  Fully reproducible.
> > >
> > > What are the options to fsx and fsstress?
> >
> > fsx-linux linux-2.5.0.tar.bz2 :)
> > mkdir d
> > fsstress -d d -n 1000000 -p 10
> > The oops follows immediately.
>
> works for me without any patches.

This is easier to reproduce:
touch file
mkdir d
fsstress -d d -n 1000000 -p 10

As soon as I run "fsx-linux file" on another console I get the oops.
(However fsx-linux without fsstress is not sufficient)

> Do you have SMP?

No.

>Some other system details?

HW is a Athlon XP 1500+, 512 Mb RAM, 60 Gb Maxtor hd.
Stable, well cooled.  All other filesystems pass the test.
System is Debian unstable.

> > > Also I immediately see a place that can lead to an oops you quoted,
> > > can you try to run with the patch attached and see if the oops go away?
> >
> > The oops goes away but fsx-linux hangs in "D" state.
>
> Ah.
> I see, we need to unlock the page. How about this patch instead?
>
> Bye,
>     Oleg
> ===== fs/reiserfs/inode.c 1.81 vs edited =====
> --- 1.81/fs/reiserfs/inode.c	Tue Aug 19 09:42:17 2003
> +++ edited/fs/reiserfs/inode.c	Tue Aug 26 14:27:32 2003
> @@ -2048,8 +2048,8 @@
>          last_offset = inode->i_size & (PAGE_CACHE_SIZE - 1) ;
>  	/* no file contents in this page */
>  	if (page->index >= end_index + 1 || !last_offset) {
> -	    error = 0 ;
> -	    goto done ;
> +    	    unlock_page(page);
> +	    return 0;
>  	}
>  	kaddr = kmap_atomic(page, KM_USER0);
>  	memset(kaddr + last_offset, 0, PAGE_CACHE_SIZE-last_offset) ;

This patch seems to fix both issues for me.

