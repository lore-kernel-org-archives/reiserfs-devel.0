From: Chris Mason <mason@suse.com>
Subject: Re: I would like to see ReiserFS V3 enter a feature freeze
	real	soon.
Date: Tue, 01 Jun 2004 14:53:23 -0400
Message-ID: <1086116003.22636.3445.camel@watt.suse.com>
References: <20040528122854.GA23491@clipper.ens.fr>
	 <1085748363.22636.3102.camel@watt.suse.com>
	 <1085750828.1914.385.camel@tribesman.namesys.com>
	 <1085751695.22636.3163.camel@watt.suse.com> <40BB61C0.5020902@namesys.com>
	 <1086089827.22636.3391.camel@watt.suse.com> <40BCB6BC.8020901@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18949-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40BCB6BC.8020901@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Andrew Morton <akpm@osdl.org>, Alexander Zarochentcev <zam@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>

On Tue, 2004-06-01 at 13:02, Hans Reiser wrote:

> > I can't promise that I'll never making another
> >change in there, but my goal is to keep them to a minimum.
> >
> >  
> >
> >>Also, I would like to see some serious benchmarks of the bitmap 
> >>algorithm changes before they go in.  They seem nice in theory, and some 
> >>users liked them for their uses, but that does not make a serious 
> >>scientific study.  Such a study has a high chance of making them even 
> >>better.;-)
> >>
> >>    
> >>
> >
> >Some benchmarks have been posted on reiserfs-list, but I'd love to
> >coordinate with you on getting some mongo numbers. 
> >
> Ok.

> >A good start would be to just rebenchmark against v4.
> >  
> >
> V4 performance is not at a stable point at the moment I think, I have 
> not been monitoring things closely due to trying to earn bucks 
> consulting, and performance did not get tested every week, but there 
> have been reports of performance decreasing and no reports of anyone 
> investigating it, so I need to....
> 

Sure, since v4 is being done again -mm right now (right?) you can just
benchmark against a few of the new options.  mount -o alloc=skip_busy
will give you the old allocator.

> Elena, please compose a URL consisting of past benchmarks of various V4 
> snapshots and send it to me.  (I did not read the last one you sent, 
> sorry about that, so include the contents of that one also).
> 
> If the objective is to determine if the algorithm is good, then we 
> should test it with only the algorithm in question changed.
> 
> I would be quite happy to add the algorithm to V4 (or Chris and Jeff can 
> do that) and test it on vs. off.

The algorithm has a few key components, but v4 doesn't need most of it. 
The part to inherit packing localities down the chain would be most
interesting in v4.

The rest approximates things v4 should already be good at, like grouping
some of the metadata near the data blocks.

-chris


