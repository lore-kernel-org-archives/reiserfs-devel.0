From: Michael James <Michael.James@csiro.au>
Subject: Re: plugin for cached network file system
Date: Fri, 14 May 2004 12:07:17 +1000
Message-ID: <200405141207.17471.Michael.James@csiro.au>
References: <200405131059.22693.Michael.James@csiro.au> <200405131653.52862.Michael.James@csiro.au> <40A39B3E.3080701@namesys.com>
Reply-To: Michael.James@csiro.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18671-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40A39B3E.3080701@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> >>>Michael James asked:
> >>>
> >>>How hard would it be to write a Reiser4 plug-in
> >>>to implement a network file system with a cache on the local disk?


> >On Thursday 13 May 2004 15:49, Hans Reiser wrote:
> >
> >>It is easy to do a hack, and hard to do it right so that the world would 
> >>want to drop nfs and move to it.  We are trying to find a sponsor to do 
> >>it right, and have a proposal called Reiser5 that costs $1.8 million, 
> >>and provides global scalability (which nfs/afs/clusterfs/intermezzo do 
> >>not, in my view).

NFS has its strength: Easy, overlays onto an existing (trusted) filesystem
 and its many weaknesses: bad locking, single server, etc.
AFS and its derivatives Coda and Intermezzo
 use ACLs which map badly in a Unix environment.
Also to support disconnected operation so they need to be complete copies,
 (no good for my case) and because of the penalty of re-syncing on re-connect
 they aren't designed for big partitions (again no good).
Lustre I need to study more.

It's Hans' determination to to go right down to basics and do it properly
 that makes me think reiserfs could be the one to carry Linux to new levels.

That said, I don't have $1.8 M or even the time to spend it
 before my last kludge (rsync complete local copies onto the nodes)
 turns around and bites me. (the files grew, not enough space anymore)

So I'm still looking for the, "Don't worry, be scrappy" solution.


> >On Friday 14 May 2004 01:58, Hans Reiser wrote:
>
> I am very skeptical of the value of it (that is how NFS came about, just 
> doing things quickly....), but to answer the question asked, it would be 
> easy.

Where do I start?

-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166

