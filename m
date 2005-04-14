From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Less disk space with reiser4?
Date: Thu, 14 Apr 2005 11:49:12 +0400
Message-ID: <20050414074912.GQ6211@backtop.namesys.com>
References: <425A8A1D.9040206@siwnet.net> <20050411195253.GD6211@backtop.namesys.com> <425ADC6C.8090209@namesys.com> <425D15C1.6050107@siwnet.net> <20050413130438.GM6211@backtop.namesys.com> <425D21A6.10001@siwnet.net> <425DF300.3020500@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23875-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <425DF300.3020500@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Stefan Andersson <stefan@siwnet.net>, reiserfs-list@namesys.com

On Wed, Apr 13, 2005 at 11:35:12PM -0500, David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Stefan Andersson wrote:
> > Alex Zarochentsev wrote:
> > 
> >> On Wed, Apr 13, 2005 at 02:51:13PM +0200, Stefan Andersson wrote:
> >>  
> >>
> >>> Thanks for all the answers.
> >>>
> >>> Now would it be possible to change the 5% to something else?
> >>>   
> >>
> >>
> >> even if the fs would be unreliable?
> >>  
> >>
> > That is what I want to test, or if someone knows the answer to that.
> 
> The only indication I've heard that it would make the FS unreliable is
> if you had less space reserved than you had RAM available to stack up
> writes which haven't been allocated.  In your case, it's a bug that you
> haven't been able to set this on your own.
> 
> Note that I said unreliable, not slow.  Everyone keeps telling us that
> you'll get slow with <25% space available, so the 5% is really just a
> sanity check, but you're probably fine there, too.
> 
> My question to the Namesys guys is, have you actually tested situations
> like this?

no, it the 5% is our rough estimation. it would never reached.  It is like
extends of all files address only 1 block each. 

> If you want to artificially create that situation, you can probably just
> shrink the values down a bunch -- make an fs on a 1 gig drive on a
> virtual machine (qemu + accelerator) with only a couple megs of RAM
> available for cache/buffer, then try to fill it.  How close can you get
> to 100% full before something blows up?

Suppose the index part of the tree would take only 0.5%. And what?
Any successful test will not prove that the new estimation is correct
(reliable).

We need to re-design the estimation, make it "adaptive", for example,
to be aware of well-allocated files.  Or we have to change
the current disk space reservation scheme completely.

-- 
Alex.
