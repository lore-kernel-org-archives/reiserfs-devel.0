From: Soeren Sonnenburg <sonne@first.gmd.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Mon, 31 Mar 2003 10:43:56 +0200 (MET DST)
Message-ID: <Pine.GSO.4.21.0303311039470.4102-100000@pille>
References: <20030331123705.F25533@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13463-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030331123705.F25533@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Soeren Sonnenburg <reiserfs@nn7.de>, reiserfs-list@namesys.com



On Mon, 31 Mar 2003, Oleg Drokin wrote:

> Hello!
> 
> On Sat, Mar 29, 2003 at 07:45:34PM +0100, Soeren Sonnenburg wrote:
> > > > > I think may be race with iget4 might cause this, but I am not sure.
> > > > > We have a patch for this iget4 race, and if you are willing to test it, I
> > > > > can send it to you.
> > > > Yes of course I am. I hope the other admins won't kill me, but I guess they 
> > > > know that I willing to do experiments from time to time ;-)
> > > > Could something worse happen when I try the patch, that could not be fixed by 
> > > > simple rebooting ?
> > > See the patch below.
> > > It should not break anything.
> > Well, we keep getting this error in massess too... and in our case it is
> > very likely that clients access the same file from all the clients...
> 
> Are all of your NFS exports where these errors happens reiserfs?

This is the same machine I was telling you about on lkml ...
The errors I got now are all on the most actively used nfs share which
uses reiserfs as the underlying filesystem.

> > However I cannot quickly test that atm but if it is really safe I might
> > test it next week.
> 
> Well, there is a problem reported with that 2.4.20 backport, that I am going to look into.
> If you can try 2.4.21-pre6 with iget5_locked.diff (I just sent to the list in this same
> thread) that would be great.
> 
> Thank you.

well, I can't do experimental testing as there are like 40
diskless machines using
that disk ... I could somewhen in the evening/night do some stress test
but thats it...

Soeren
 
> Bye,
>     Oleg
> 

