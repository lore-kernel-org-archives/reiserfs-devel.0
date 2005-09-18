From: Denis Vlasenko <vda@ilport.com.ua>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Sun, 18 Sep 2005 13:21:23 +0300
Message-ID: <200509181321.23211.vda@ilport.com.ua>
References: <432AFB44.9060707@namesys.com> <200509171415.50454.vda@ilport.com.ua> <200509180934.50789.chriswhite@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26029-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509180934.50789.chriswhite@gentoo.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: chriswhite@gentoo.org
Cc: Christoph Hellwig <hch@infradead.org>, Hans Reiser <reiser@namesys.com>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Sunday 18 September 2005 03:34, Chris White wrote:
> CC-List trimmed
> 
> On Saturday 17 September 2005 20:15, Denis Vlasenko wrote:
> > > At least reiser4 is smaller. IIRC xfs is older than reiser4 and had more
> > > time to optimize code size, but:
> > >
> > > reiser4        2557872 bytes
> > > xfs            3306782 bytes
> >
> > And modules sizes:
> >
> > reiser4.ko        442012 bytes
> > xfs.ko            494337 bytes
> 
> All this is fine and dandy, but saying "My code is better than yours!!" still 
> doesn't solve the issue this thread hopes to achieve, that being "I'd like to 
> get reiser4 into the kernel".  There seems to be a lot of (historical?) 
> tension present here, but all that seems to be doing is making things worse.  
> PLEASE keep this thing a tad on par.  Keeping this up is hurting everyone 
> more than helping.  I wish I could say something as simple as "let's just be 
> friends", but that's saying a lot.  I can say this though: this is open 
> source, and that means that our source is open, and we should be too.

I am trying to say that I think that Hans is being treated a bit unfairly.
His fs is new and has fairly complex on-disk structure and complex journalling
machinery, yet his source and object code is smaller than xfs which already
is accepted. This is no easy feat I guess.

Maybe xfs shouldn't be accepted too, this may be an answer.

Let's look at the code. Hans' code is not _that_ awful. Yet people
(not all of them, but some) do not point to specific things which they
want to be fixed/improved. I see blanket arguments like "your code is hard
to read". Well. Maybe spend a minute on what exactly is hard to read,
or do we require Hans to be able to read minds from the distance?

This is it. I do not say "accept reiser4 NOW", I am saying "give Hans
good code review".
--
vda
