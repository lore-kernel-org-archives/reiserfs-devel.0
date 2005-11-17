From: michael chang <thenewme91@gmail.com>
Subject: Re: More Slowdown
Date: Wed, 16 Nov 2005 22:08:38 -0500
Message-ID: <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511120906.39109.jgilmore@glycou.com>
	 <1131997263.10816.56.camel@teratron.lan.etheus.net>
	 <200511142147.07787.chrivers@iversen-net.dk>
	 <1132064829.8002.9.camel@teratron.lan.etheus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26968-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132064829.8002.9.camel@teratron.lan.etheus.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Craig Shelley <craig@microtron.org.uk>
Cc: reiserfs-list@namesys.com

On 11/15/05, Craig Shelley <craig@microtron.org.uk> wrote:
> On Mon, 2005-11-14 at 21:47 +0100, Christian Iversen wrote:
> > That's _serisouly_ odd. I've seen something like this happen before, wh=
en X
> > programs generated some (non-harmful) X warnings. These were then writt=
en
> > into a log file, typically .xsession-errors or similar. Any chance that=
's
> > what you are seeing?
> >
>
> This explains the problem with Evolution, it looks a bit trigger happy
> with the fsync call while resizing columns.

> Why does calling fsync on this one small file cause so much hard disk
> activity?

If memory serves me right, it has been said time and time again (in
docs and on the list) that fsync performance on Reiser4 is horrendous
because it is (at the moment) unoptimized until ... other issues are
resolved and the optimizations can be implemented.

You should also realized the _reason_ why a majority of disk calls
take so little time - it's because Reiser4 puts them in memory, before
flushing to disk when memory is full.  That would explain any
jerkiness -- it's because Reiser4 is writing everything from the last
real write to the actual disk to now (the current real right) in one
go, and making everything wait.  (Now why this can't be done in
parallel is beyond me - or is it already done in parallel?)

This also means that if your hard disk can't handle writing the
contents of say 80% of your memory's size to disk or it takes 5
seconds for it to do so would explain the problem with the concepts
shown here.  Example: 1GB memory, hard disk can write at a max of 10
MB/s.  If it used 75% of the memory for a Reiser4 cache, [768 MB] it
would take maybe 77 or more seconds to flush. [Yes, a full minute.] =20
For comparative purposes, I hear of consumer systems with 2 or 4 GB of
ram, and I know of brand new PC hard disks which have a throughput of
less than 5 MB/s (my hard disk maxees out at 20 MB/s on my PC.)  Do
you know the throughputs of your drives, and the size of the memory in
your machines?

When fsyncing, Reiser4, to my understanding, isn't allowed to put
stuff in it's memory cache - it must put it to disk right away.  And
maybe that's also why (partially) Reiser4 performance isn't as optimal
as it will eventually be.  [So, short answer: while there are
shortcomings, and this stuff shouldn't happen, part of this Reiser4FS
behaviour is, to my understanding, intentionally placed.]

Note, this is a my speculation based on what I've read on this mailing
list and on the namesys website, and could be inaccurate.  If any
professionals who are working with the Reiser4 code (e.g. Hans Reiser
and the like) correct me on what I say - their statements take
precedence.

Also, I've noticed in some newer computer's BIOSes (I know some recent
DELL desktop machines have this) sometimes you can find a setting to
change the noisiness/performance trade off of the hard disk.  Maybe
something similar is involved with your PC?  It should be said that
I've witnessed that in quieter mode settings, the disk seems to
operate slower - that could mean that a flush could be less noisy, but
might take longer.

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
