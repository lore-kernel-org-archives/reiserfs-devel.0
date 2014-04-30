From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard support
Date: Wed, 30 Apr 2014 20:53:29 +0200
Message-ID: <536146A9.7010803@gmail.com>
References: <536138FA.3070602@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=xI4P6dAg89ybEb+eslZuCLCwiAqzvtpxgD8GkK7hnkY=;
        b=FJJeudzgdbg6LvllZUh+JT0WrakUcs+X1CCSaV06VOPyI57sR8wfw58EUgfYMpUA3E
         fWMs9QvvzhB8BbKv9nHNytwFeXp51JERCzyx6saekU4wkYVKFmiFI8RNj8LEtH5EnB9T
         XBHNcFDJILigCGHJKMAIXsT55ocYoWLbib/MGicLCb8v9r6pnLAIJZR/zNqhgBAcEH/7
         V1yWG8bPUkPfnzUBzQc6UQBARumVs2mylnZkX/GNDghwmP2IJMFRrP27XtdKalwEllk1
         E0ydfjHDPgeb5YHNizpk6B99BOwKBWarLao5x6C86VV9875CHbEE4Zq/You6SoW/roG/
         2xdA==
In-Reply-To: <536138FA.3070602@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>, Ivan Shapovalov <intelfx100@gmail.com>

On 04/30/2014 07:55 PM, Edward Shishkin wrote:
> On 04/30/2014 05:04 PM, Ivan Shapovalov wrote:
> [...]
> >> There is a ready implementation of rb-trees in the kernel (see 
> ./lib/rbtree.c,
> >> ./lib/rbtree_test.c). Could you please take a look at this?
> >
> > I've checked it already. Well, in case of trees:
> > - combined extent insertion+adjacent extent merge complexity is 
> O(n*log(n))
>
> Actually, this is:
>
> 1) Add n extents one-by-one to empty tree:
> log(1) + log(2) + ... + log(n-1)
>
> 2) Merge 2 trees of n extents:


BTW, (2) is an excess component, since merging of 2 trees
looks like adding one-by-one extents to a tree, and the final
number of extents to discard is n.
So, when using trees, complexity is (1/2)log(n)+ nlog(n/e).


> log(n) + log(n+1) + ... + log(2n-1)
>
> Total: log(1*2*...*2n-1) = log((2n-1)!)
>
> in accordance with Stirling's formula:
>
> log((2n)!) = log(((2n)^(1/2))*(2n/e)^n) =
> = (1/2)*log(2n) + n*log(2n/e) < n + n*log(n)
>
> Since atoms can be merged in parallel, we have that
> trees work better than lists. Also tree of extents has
> better memory consumption because of merging extents.
>
>
> >  against O(n+n*log(n)) in lists;
> > - joining two trees is not less than O(log(n)) against O(1) in lists.
> >
> > So I can't see any benefit in using trees, and join performance is a 
> downside of these. Am I missing something?
> >
> >>
> >>>
> [...]
> > Why after reiser4_invalidate_list()? I thought that it should be 
> called between reiser4_write_logs(), but before 
> reiser4_invalidate_list().
>
> OK, insert before. I think, it doesn't matter, since we don't look
> at this list when issuing discard requests, no? :)
>
> >
> > And why not after all reiser4_invalidate_list() calls?
> >
> >>
> >> Thanks,
> >> Edward.
> >> P.S.: You'll need to set up a debugging environment. Take a look at 
> this:
> >> http://bipinkunal.blogspot.cz/2012/05/kgdb-tutorial.html
> >> Do you have a second machine with a serial port?
> >
> > No, I don't. Will a VM suffice?
>
> Yes, if it works for you..
>
> Thanks,
> Edward.

