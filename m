From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 2/8] reiserfs: use kmap_local_folio() in
 _get_block_create_0()
Date: Mon, 19 Dec 2022 11:42:37 +0100
Message-ID: <20221219104237.l6cormdkqu6pgk3s@quack3>
References: <20221216205348.3781217-1-willy@infradead.org>
 <20221216205348.3781217-3-willy@infradead.org>
 <Y5343RPkHRdIkR9a@iweiny-mobl>
 <Y54TYOqbPuKlfiHk@casper.infradead.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1671446558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6F18xC5FZQcGDk8y37OvpM2HmoLNG/J4BK4wInmkOts=;
        b=oLXnHFXvFEyTiw8Kbtq0Ty/QXxP5X+nVgqHvSaQCDFk2SV3kLlLlzVTZsueq5CkZcloP8C
        FRARtjzq7A3W4HGOxqOLIMqPDonkgua74/U1mqkREjHSHf/zbtXnTmp7VDddnJUGv+qs8D
        Z+148cZB9v+wvb/3+jGjsfQW7x10M8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1671446558;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6F18xC5FZQcGDk8y37OvpM2HmoLNG/J4BK4wInmkOts=;
        b=/OLwzC/ByqDhxjtpma9tNPb0uAk05vcnxrf5j91Q51d6iLI3ytVpVD8cz/0yYnu8nmBpvZ
        XrUks6ySKO7UozBA==
Content-Disposition: inline
In-Reply-To: <Y54TYOqbPuKlfiHk@casper.infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: Ira Weiny <ira.weiny@intel.com>, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>

On Sat 17-12-22 19:07:12, Matthew Wilcox wrote:
> On Sat, Dec 17, 2022 at 09:14:05AM -0800, Ira Weiny wrote:
> > On Fri, Dec 16, 2022 at 08:53:41PM +0000, Matthew Wilcox (Oracle) wrote:
> > > Switch from the deprecated kmap() to kmap_local_folio().  For the
> > > kunmap_local(), I subtract off 'chars' to prevent the possibility that
> > > p has wrapped into the next page.
> > 
> > Thanks for tackling this one.  I think the conversion is mostly safe because I
> > don't see any reason the mapping is passed to another thread.
> > 
> > But comments like this make me leary:
> > 
> >          "But, this means the item might move if kmap schedules"
> > 
> > What does that mean?  That seems to imply there is something wrong with the
> > base code separate from the kmapping.
> 
> I should probably have deleted that comment.  I'm pretty sure what it
> refers to is that we don't hold a lock that prevents the item from
> moving.  When ReiserFS was written, we didn't have CONFIG_PREEMPT, so 
> if kmap() scheduled, that was a point at which the item could move.
> I don't think I introduced any additional brokenness by converting
> from kmap() to kmap_local().  Maybe I'm wrong and somebody who
> understands ReiserFS can explain.

I think you've got it mostly right. Reiserfs comes from the times of the
Big Kernel Lock which reiserfs was using to protect all its data
structures. And that lock was automagically released when we scheduled. So
when kmap scheduled, the lock preventing item from moving got dropped and
we could have a problem. These days BKL in reiserfs got replaced by the
reiserfs_write_lock() / reiserfs_write_unlock() magic which mostly behaves
as a standard mutex so this is not a concern anymore.

									Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
