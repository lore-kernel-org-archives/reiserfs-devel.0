From: Oleg Drokin <green@namesys.com>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Mon, 31 Mar 2003 13:05:40 +0400
Message-ID: <20030331130540.J25533@namesys.com>
References: <20030331123705.F25533@namesys.com> <Pine.GSO.4.21.0303311039470.4102-100000@pille>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13467-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.21.0303311039470.4102-100000@pille>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <sonne@first.gmd.de>
Cc: Soeren Sonnenburg <reiserfs@nn7.de>, reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 10:43:56AM +0200, Soeren Sonnenburg wrote:
> > > > > Yes of course I am. I hope the other admins won't kill me, but I guess they 
> > > > > know that I willing to do experiments from time to time ;-)
> > > > > Could something worse happen when I try the patch, that could not be fixed by 
> > > > > simple rebooting ?
> > > > See the patch below.
> > > > It should not break anything.
> > > Well, we keep getting this error in massess too... and in our case it is
> > > very likely that clients access the same file from all the clients...
> > Are all of your NFS exports where these errors happens reiserfs?
> This is the same machine I was telling you about on lkml ...

Ah, ok.

> well, I can't do experimental testing as there are like 40
> diskless machines using
> that disk ... I could somewhen in the evening/night do some stress test
> but thats it...

Ok, I understand. Well, I guess I will spend some time on this iget5 2.4.20 backport
and on trying to reproduce the problem locally.

Bye,
    Oleg
