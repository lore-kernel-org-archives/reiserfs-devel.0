From: Brandon Low <lostlogic@gentoo.org>
Subject: Re: r4 v. ext3, quick speed vs. cpu experiments
Date: Tue, 5 Aug 2003 18:04:27 -0500
Message-ID: <20030805230427.GC26180@lostlogicx.com>
References: <20030805224909.GA26180@lostlogicx.com> <Pine.LNX.4.30.0308052329440.6739-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15165-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0308052329440.6739-100000@divine.city.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Grant Miner <mine0057@mrs.umn.edu>, reiserfs-list@namesys.com

On Tue, 08/05/03 at 23:35:12 +0200, Szakacsits Szabolcs wrote:
> 
> On Tue, 5 Aug 2003, Brandon Low wrote:
> > On Tue, 08/05/03 at 23:08:31 +0200, Szakacsits Szabolcs wrote:
> > > BTW, from your numbers it seems ext3 gives better overall performance.
> > >
> > That is an incorrect statement.  Reiserfs is KNOWN to be heavier on CPU
> > than other filesystems, it's benefit is not there, it's benefit is in
> > speed of operation, and efficiency of disk accesses.  It would be near
> > impossible for a filesystem with 4x (unsure of this figure) the code of
> > ext3 to execute in the same CPU time, but the fact that it is
> > consistently a LOT faster on the total run time is very impressive.
> 
> Yes, if you have enough CPU capacity (aka you don't run anything else, just
> bechmarking filesystems). Otherwise it seems to be slower. That's I was
> refering to.
> 
And admittedly, reiser4 does have a ways to go in terms of getting those
5x numbers down to reasonable levels, in those benchmarks I wouldn't
call either of the FSs a clear winner or loser... I would say that it
really depends on where your particular system's bottleneck is.  If it
is in CPU then don't use reiser4, but if it is in the IO, then reiser
may be a very good choice.

--Brandon

> 	Szaka
