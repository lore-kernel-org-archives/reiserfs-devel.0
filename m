From: Nick Piggin <npiggin@suse.de>
Subject: Re: [patch] reiser4 releasepage fix
Date: Sat, 15 Apr 2006 17:03:24 +0200
Message-ID: <20060415150324.GC10144@wotan.suse.de>
References: <20060415085758.GB14115@wotan.suse.de> <200604151817.34062.zam@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28494-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200604151817.34062.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com, Nick Piggin <npiggin@suse.de>, Andrew Morton <akpm@osdl.org>

On Sat, Apr 15, 2006 at 06:17:33PM +0400, Alexander Zarochentsev wrote:
> hello,
> 
> On Saturday 15 April 2006 12:57, Nick Piggin wrote:
> > Hi Andrew,
> >
> > Can you put the following in -mm please? I cc'ed Hans about it
> > earlier. Basically, resier4 does not present a good reason why
> > pagecache should be dropped here. 
> 
> correct. it duplicates remove_mapping().
> 
> we tested similar patch recently and found no problems.

Oh good :)

> > --
> > Index: linux-2.6/fs/reiser4/as_ops.c
> > ===================================================================
> > --- linux-2.6.orig/fs/reiser4/as_ops.c
> > +++ linux-2.6/fs/reiser4/as_ops.c
> > @@ -358,11 +358,6 @@ int reiser4_releasepage(struct page *pag
> >  	assert("reiser4-4", page->mapping != NULL);
> >  	assert("reiser4-5", page->mapping->host != NULL);
> >
> 
> Except my patch didn't remove the page ref count check from 
> reiser4_releasepage.
> 
> Nick, does the check conflict with the lockless pagecache patches?  
> Reiser4 just tries to avoid unnecessary detaching private page objects 
> if the page_count doesn't allow page removal.

Well the check is racy anyway because if the page is in pagecache,
then there is nothing to prevent find_get_page from running (eg.
page fault, or read(2)).

So strictly, no, the check does not conflict with lockless pagecache.
It is simply nice to cut down the number of places where it isn't
immediately obvious.

I'd also like to think about removing page_count from outside mm/, in
favour of a pagecache API which gives us more confidence that the
caller is sane and has taken correct locks, etc.

Anway, if you can "ack" this for Andrew, I'm sure he'd sleep a bit
better (as would I)!


> 
> > -	/* is_page_cache_freeable() check
> > -	   (mapping + private + page_cache_get() by shrink_cache()) */
> > -	if (page_count(page) > 3)
> > -		return 0;
> > -
> >  	if (PageDirty(page))
> >  		return 0;
> >

BTW. the PageDirty check is also racy, so it can probably go too. I
didn't have the courage to remove it because I don't know whether
your page dirtying functions try to somehow synchronise against this.

Thanks,
Nick
