From: Lorenzo Allegrucci <l.allegrucci@gmail.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 15:30:01 +0200
Message-ID: <200509201530.01808.l.allegrucci@gmail.com>
References: <200509180934.50789.chriswhite@gentoo.org> <432FC150.9020807@namesys.com> <20050920114253.GL10845@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26120-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050920114253.GL10845@suse.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Axboe <axboe@suse.de>
Cc: Hans Reiser <reiser@namesys.com>, Nick Piggin <nickpiggin@yahoo.com.au>, Alan Cox <alan@lxorguk.ukuu.org.uk>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, lkml <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>, Nate Diller <ndiller@namesys.com>

On Tuesday 20 September 2005 13:42, Jens Axboe wrote:
> On Tue, Sep 20 2005, Hans Reiser wrote:
> > >>The name for one.  There is no elevator algorithm anywhere in it.  There
> > >>is a least block number first algorithm that was called an elevator, but
> > >>    
> > >>
> > >
> > >Well the terminology changed to "io scheduler" now, however the
> > >residual "elevator" name found in places doesn't cause anyone
> > >any problems and there isn't much reason to change it other than
> > >the desire to break things.
> > >  
> > >
> > Did you really say that?    I mean, come on, can't you at least manage a
> > "well, it ought to get changed but I am busy with something more
> > exciting to me".
> 
> Seeing as you are the one that is apparently bothered by the misnomer,
> it follows that you would be the one submitting a patch for this. Not
> that it would be accepted though, I don't see much point in renaming
> functions and breaking drivers just because of a slightly bad name. The
> io schedulers are all called foo-iosched.c, it's only the simple core
> api that uses the 'elevator' description.

Why not just rename the kernel option "elevator" to "iosched" ?

--- elevator.c  2005-09-20 15:26:19.000000000 +0200
+++ elevator.c.iosched  2005-09-20 15:27:11.000000000 +0200
@@ -178,7 +178,7 @@
        return 0;
 }

-__setup("elevator=", elevator_setup);
+__setup("iosched=", elevator_setup);

 int elevator_init(request_queue_t *q, char *name)
 {
