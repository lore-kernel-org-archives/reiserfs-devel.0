From: michael chang <thenewme91@gmail.com>
Subject: Re: More Slowdown
Date: Sat, 19 Nov 2005 04:44:13 +0000
Message-ID: <b14e81f00511182044r5a699cebn1ec91546faf905b@mail.gmail.com>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511120906.39109.jgilmore@glycou.com>
	 <1131997263.10816.56.camel@teratron.lan.etheus.net>
	 <200511142147.07787.chrivers@iversen-net.dk>
	 <1132064829.8002.9.camel@teratron.lan.etheus.net>
	 <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com>
	 <op.s0dozkscth1vuj@localhost> <437CF14B.4000808@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27023-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437CF14B.4000808@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: PFC <lists@boutiquenumerique.com>, Craig Shelley <craig@microtron.org.uk>, reiserfs-list@namesys.com

On 11/17/05, Hans Reiser <reiser@namesys.com> wrote:
> PFC wrote:
>
> >
> >     Just a few words about this "slowdown" thing.
> >
> >     I use linux-2.6.11-cko1-swsusp2 with reiser4 included. I won't
> > upgrade to  a new version until Hans says the current one is at least
> > as stable as it  was before starting the merge...
> >
> >     I get the "slowdown" once in a while, usually for 2-5 seconds,
> > it's not  that annoying.
> >
> >     However :
> >
> >     If I understand well, when memory is needed (memory pressure),
> > reiser4  triggers a flush and writes dirty pages to the disk in large
> > quantities.
> >     This has many advantages like not writing at all the temporary
> > files  which already have been deleted, deferred allocation, etc, it's
> > really  cool.
> >
> >     However when "memory pressure" (ie. need to free some RAM) occurs,
> > it is  usually that I am doing something interactively, like opening a
> > document  or starting some software. Or it might mean that the
> > database server just  received a big query which needs some sorting
> > space in RAM for instance.
> >     Thus, "memory pressure" almost always means "I need memory NOW
> > and  someone is waiting in front of their screen for it"...
> >     And it is at this very moment that reiser4 has to flush (to free
> > memory).
> >     Thus the "flush storm", by nature, always happens when you don't
> > want it  to happen. It almost never happens when you are away from the
> > computer  taking a leak, for instance.
> >
> >     This is analogous to the problem caused to postgres by
> > checkpointing...  the postgres guys implemented a background writer to
> > solve this.
> >     I wonder if reiser4 could do the same, ie. trickle down dirty
> > pages to  free up memory before it is actually needed, to improve
> > reactivity. There  is a balance to be found, of course, between
> > flushing as late as possible  (to benefit from all the nifty reiser4
> > features) and flushing earlier (to  avoid triggering the "flush storm")=
.
> >     Maybe this could be set via a few controls...
> >         - tell reiser4 to try to keep X amount of RAM immediately
> > available  without flush
> >         - when the CPU is idle, and/or when the disk is idle, start
> > flushing,  but stop doing it as soon as some CPU is needed, or a key
> > is hit...
> >         - just do frequent, small partial flushes which will keep good
> > locality  of reference while being small
> >         - do it at a lower priority so that the keyboard does not
> > stop  responding !!!
>
> I agree that smoothness needs working on.  After we merge.
>
> >
> >     Huh, well, that's it... what do you think ?
> >
> >
> >
> >> When fsyncing, Reiser4, to my understanding, isn't allowed to put
> >> stuff in it's memory cache - it must put it to disk right away.  And
> >
> >
> >     This is the whole point of fsync, yes.
> >     Now, it's pretty stupid for evlolution to issue a fsync() on every
> > pixel  move or whatever.
> >     fsync() is for databases or things which must survive a hard
> > system  crash...
> >     evolution could as well have used fflush() and everything would
> > have been  alright. Dumb.
> >
> >> For comparative purposes, I hear of consumer systems with 2 or 4 GB of
> >> ram, and I know of brand new PC hard disks which have a throughput of
> >> less than 5 MB/s (my hard disk maxees out at 20 MB/s on my PC.)  Do
> >> you know the throughputs of your drives, and the size of the memory in
> >> your machines?
> >
> >
> >     Hum. A crap laptop harddrive will do 15 MBytes/s and a recent
> > normal  desktop drive (7200rpm ATA or SATA) will do 50 MBytes/s or
> > more...
> >     If you get a lot less (like, 5 MB/s), you have a problem (DMA
> > disabled,  etc)
> >
> >
> >
> >
> PFC is right.
>

*shrugs* 15-30 MB/s on a recent low-end desktop from Dell (not that
old, maybe 6-12 months) that I own with DMA enabled; the other
machines are because people I know are using older PCs and can't
afford to upgrade them at the moment.  (Ironically, sometimes, those
PCs /feel/ faster, for some reason...)  Of course, a 7200rpm ATA/SATA
drive would be the best; but I just try and make do, as do people I
know.  But that's life; there will always be those on the bottom of
the heap. :)

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
