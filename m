From: Nick Piggin <piggin@cyberone.com.au>
Subject: Re: BUGed to death
Date: Wed, 16 Apr 2003 02:11:47 +1000
Message-ID: <3E9C2F43.1050908@cyberone.com.au>
References: <20030415143024.GA10117@rushmore> <20030415155708.GB17152@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13663-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030415155708.GB17152@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: rwhron@earthlink.net, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Dave Jones wrote:

>On Tue, Apr 15, 2003 at 10:30:24AM -0400, rwhron@earthlink.net wrote:
> > The patch below eliminates 4 BUG() calls that clearly 
> > cannot happen based on the context.
>
>This looks bogus.
>
> > --- linux-2.5.67-mm2/fs/reiserfs/hashes.c.orig	2003-04-15 10:11:44.000000000 -0400
> > +++ linux-2.5.67-mm2/fs/reiserfs/hashes.c	2003-04-15 10:13:43.000000000 -0400
> > @@ -90,10 +90,6 @@
> >  
> >  	if (len >= 12)
> >  	{
> > -	    	//assert(len < 16);
> > -		if (len >= 16)
> > -		    BUG();
> > -
>
>Imagine I pass in 20. Previously, the BUG triggers. Not any more.
>Ditto the other changes.  Or am _I_ missing something ?
>
Just from the context of the patch, you are right with the first
one. Subsequent bugs can be removed due to their possibility being
eliminated by previous if statements. The code suggests that
len will trivially not be >= 16 at this point, however. So the
patch is ok.

