From: David Masover <ninja@slaphack.com>
Subject: Re: Our introduction to Reiser-list
Date: Wed, 26 Oct 2005 15:43:10 -0500
Message-ID: <435FEA5E.70502@slaphack.com>
References: <200510251558.13860.pvh@uvic.ca> <87k6g1yp5a.fsf@evinrude.uhoreg.ca> <435F7A2A.5020506@st-andrews.ac.uk> <200510260910.12136.pvh@uvic.ca> <435FB231.5070507@nauticom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <435FB231.5070507@nauticom.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Chester R. Hosey" <chosey@nauticom.net>
Cc: reiserfs-list@namesys.com

Chester R. Hosey wrote:
> Peter van Hardenberg wrote:
> 
>>Although I freely acknowledge my inexperience, I believe the real problems are 
>>related to graph traversal algorithms. Linus has commented on the obvious 
>>hardlink issues. I imagine there are more gremlins lurking in the shadows on 
>>this one. Garbage collectors have largely given up on reference counting, a 
>>luxury afforded by blazingly fast access to small amounts of storage. I am 
>>not particularly up on the research though.
> 
> 
> Just a suggestion from the uninformed peanut gallery...
> 
> Hans already plans on having a repacker, which will run incrementally in
> the background. Might it make sense to do incremental GC, possibly even
> in combination with the repacker's traversal of the disk?

You're not the first person to suggest GC instead of refcounting.  I 
still say, if at all possible, let's not let it come to that.

Try this:  I have a box which I call "the server" because it's headless 
and it does things like my one-man email operation.  It has a TV tuner 
card on it, and it has an 80 gig hard drive.

It wouldn't take a lot of TV to fill up 80 gigs.  My desktop has a 500 
gig RAID, which I use for games, my Windows install, and so on.

So, I can pull the TV from my server onto my desktop relatively easily 
-- there's a gigabit crossover between them, and NFS is fast enough. 
That way, I keep the server disk usage below 50%, even though I don't 
leave the desktop on all the time, and even though it can take awhile 
before I watch the shows I'm recording.  Even if I just choose to record 
from a particular channel for a full day, then skim through the 
recording to see if there's anything interesting.

With grabage collection, the idea is that maybe once a week, the 
repacker runs, and frees space at the same time.  In other words, if I 
delete something, I may not get the space back for most of a week.  With 
the current reference counting scheme, I get the space back immediately.

In virtual machines and such, garbage collection is fast, so it can be 
run much more frequently, even on demand -- need more RAM?  Run the 
garbage collector, flush the buffers, and you have RAM.

You can't do that with an FS, because the garbage collection would take 
insanely long, and you'd never know when it'd hit.  Kind of like lazy 
allocation, only worse.  Lazy allocation means that after awhile, my RAM 
fills up and Reiser4 decides to flush to disk, making my FS access 
unresponsive for a few seconds, sometimes 10 or 20.  It's better now, 
not sure if that's because I've got 2 gigs of RAM on my desktop instead 
of half a gig or because the new version of Reiser4 is smarter about it.

But, imagine that annoying random insane disk activity, effectively a 
few seconds of a frozen system, only you very likely have to lock the 
entire FS, and it takes several minutes or hours instead of a few 
seconds.  That's why you can't do on-disk garbage collection on demand.

Also, if you keep disk usage low, it's easier to keep things 
defragmented.  In RAM, no one cares -- use all the RAM, if it gets out 
of order, so what?  It's called "Random Access Memory" for a reason. 
And don't tell me you repack every time you collect garbage, because it 
already takes too long, and repacking would make it take longer.  And if 
you tried to do it in the same pass, you'd end up with a perfectly 
defragmented FS, except for the hundreds of tiny, randomly distributed 
holes where the recently collected garbage was.

