From: Jens Axboe <axboe@suse.de>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 20:18:07 +0200
Message-ID: <20050920181805.GR10845@suse.de>
References: <20050918102658.GB22210@infradead.org> <b14e81f0050918102254146224@mail.gmail.com> <1127079524.8932.21.camel@localhost.localdomain> <432E4786.7010001@namesys.com> <432F8D1E.7060300@yahoo.com.au> <432FABFA.9010406@namesys.com> <1127200590.9436.15.camel@npiggin-nld.site> <432FC150.9020807@namesys.com> <20050920114253.GL10845@suse.de> <43304531.4080201@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26142-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43304531.4080201@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Nick Piggin <nickpiggin@yahoo.com.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, lkml <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

On Tue, Sep 20 2005, Hans Reiser wrote:
> Jens Axboe wrote:
> 
> >
> >Seeing as you are the one that is apparently bothered by the misnomer,
> >it follows that you would be the one submitting a patch for this. Not
> >that it would be accepted though, I don't see much point in renaming
> >functions and breaking drivers just because of a slightly bad name. The
> >io schedulers are all called foo-iosched.c, it's only the simple core
> >api that uses the 'elevator' description.
> >
> >  
> >
> He asked for an example of messy code, I gave one.  Nate can give
> details on other messiness in that code.

You never gave any details on why the code is "messy" or made you go
"ugh", so no you gave no such examples. Which is a pretty odd position
to put yourself in to be honest, anyone can make silly unsubstantiated
claims.

> Reiser4 has flaws also....

All code has flaws, nothing is perfect. It's not the point. Forgive me
for being a little offended that you call my code messy for no obvious
reason.

-- 
Jens Axboe

