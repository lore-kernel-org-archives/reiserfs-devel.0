From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Subject: Re: Verify the items that we read from blocks
Date: Mon, 12 Jul 2021 09:14:22 +0530
Message-ID: <YOu6lkM2rmL2dKif@fedora>
References: <YN8rRYxhZvAa+VxU@fedora>
 <20210705113329.GE15373@quack2.suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FNaAgJi+fq8ys+9B4sOf2Hdg4MkZwkLSB0lQ2Ck2TCQ=;
        b=MlypPXS4oN/FOvVKZJObV515kSpjtrHQAyEhmUy6GubTrZv9qB52SgcVTeO+nUkfSk
         wSaw1+dFmS5ay8WcsyjgOeTLfBnYfXPtSnqZOYnJuJNHUvq2ip7Ph4++4LkMLxqBnLR+
         R5kQEQexTWga7ky6Z8Q1AZc+sB6yx5On1mqOcgOPrSuB211PMdQZ+r1hKCdyOxXTF9E6
         8Hfudo3501rVSMUgNpq9CeifYmj70lhyS4HlLexxI3FmL80RuJMDn2GNKXkgIMOm0TV1
         XKqLZY84+FjId+jzErP9mQeWTjA2wcoAb/IC27dmOSwcvUpR1ELQaYfY4+vbIKLIH6oJ
         drdg==
Content-Disposition: inline
In-Reply-To: <20210705113329.GE15373@quack2.suse.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: rkovhaev@gmail.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

I thought that my last email wasn't an appropriate response, since to me
it looked as if I hadn't read your suggestions before sending a
response. (Couldn't quote anything because I wasn't able to find the email on
mutt (messed up filters,) and had to write a quick email with the
in-reply-to option.) So I thought I'd resend the response after I've
fixed my inbox.

On Mon, Jul 05, 2021 at 01:33:29PM +0200, Jan Kara wrote:
> Hello!
> 
> On Fri 02-07-21 20:35:41, Shreyansh Chouhan wrote:
> > I was trying to work on this[1] bug. After a lot of reading the code and
> > running it under gdb, I found out that the error happens because
> > syzkaller creates a segment with raw binary data in the reproducer[2],
> > that has the wrong deh_location for the `..` directory item. (The value
> > is 0x5d (93), where as it should have been 0x20 (32).)
> 
> First, I'd like to note that reiserfs is a legacy filesystem which gets
> little maintenance and I think distributions are close to disabling it in
> their default kernels if they didn't do it already. So I'm not sure how
> much is it worth it to do any larger fixes to it. But if you have a
> personal passion for reiserfs feel free to go ahead and try to fix these
> issues.
> 

I had already spent a considerable amount of time on the debugging
portion, (to find an obvious mistake, now that I look back at it in
hindsight,) so I thought I'd just send in a patch.

> > I think that the solution would involve checking the items that we read,
> > and verify that they are actually valid. But this check could actually
> > happen in two places:
> > 
> > - First idea would be to check as soon as we read a
> >   block, and one way of doing that would be adding a wrapper around
> >   ll_rw_block that validates the leaf node blocks that we read. The
> >   benifits to this would be that since we're solving the problem at it's
> >   root, very few functions would have to be changed. But I don't know
> >   how much of a performance hit would it be.
> 
> It depends on how heavy the checks are going to be but generally checking
> when loading from the disk is the way how most filesystems handle this.
> 

The checks would be an O(n) traversal of directory headers, which
themselves check if the deh_location is greater than item length. The
item header checks were already present in the `is_leaf`(?) function.

> > - Second idea would be to do these validation checks lazily. This should
> >   be faster than the first idea, but this would involve changing the
> >   code at more places than in the first idea.
> > 
> > For how the validation happens, the first idea that comes to mind is
> > reading the item headers from the block that we read and verifying if
> > the header is valid, and if the items themselves are valid according to
> > the header.
> 
> Looks sound.
> 

I have added the implementation for the above idea to the `is_leaf`
function. Thanks a lot for your suggestions.

> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

Thanks,
Shreyansh Chouhan
