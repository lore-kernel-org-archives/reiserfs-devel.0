From: "Nate Diller" <nate.diller@gmail.com>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 29 Jun 2006 13:36:12 -0700
Message-ID: <5c49b0ed0606291336g3c8cd12m713a97c554f2b9d9@mail.gmail.com>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>
	 <1151608355.6335.79.camel@tribesman.namesys.com>
	 <1151612146.11510.4.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1151612146.11510.4.camel@ipso.snappymail.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Benoit <ipso@snappymail.ca>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

On 6/29/06, Mike Benoit <ipso@snappymail.ca> wrote:
> On Thu, 2006-06-29 at 23:12 +0400, Vladimir V. Saveliev wrote:
> > Hello
> >
> > On Thu, 2006-06-29 at 10:41 -0700, Mike Benoit wrote:
> > > So I finally got around to profiling mythbackend when the load starts to
> > > spike. To my surprise it appears that once I have less then 10% (30GB)
> > > free on the drive reiserfs can't up, even just writing at 1mb/sec is too
> > > much for it.
> > >
> > > Is there something that can be done to fix this, 30gb seems like a lot
> > > of wasted space.
> > >
> > > #opreport
> > > CPU: CPU with timer interrupt, speed 0 MHz (estimated)
> > > Profiling through timer interrupt
> > >           TIMER:0|
> > >   samples|      %|
> > > ------------------
> > >     77863 78.7856 reiserfs
> > >     18183 18.3984 vmlinux
> > >       695  0.7032 mysqld
> > >       452  0.4574 libc-2.4.so
> > >       360  0.3643 libmythtv-0.19.so.0.19.0
> > >       324  0.3278 ivtv
> > >       323  0.3268 nvidia
> > >       242  0.2449 libqt-mt.so.3.3.6
> > >       110  0.1113 libpthread-2.4.so
> > >        53  0.0536 libstdc++.so.6.0.8
> > >        35  0.0354 ld-2.4.so
> > >        23  0.0233 libperl.so
> > >        22  0.0223 libz.so.1.2.3
> > > <snip>
> > >
> > > #opreport -l /usr/src/linux/vmlinux
> > > CPU: CPU with timer interrupt, speed 0 MHz (estimated)
> > > Profiling through timer interrupt
> > > samples  %        symbol name
> > > 9607     52.8351  default_idle
> > > 7694     42.3142  find_next_zero_bit
> >
> > It looks like the problem is high fragmentation of free space.
> > find_next_zero_bit is a function which is used to scan bitmaps in order
> > to find blocks for allocation.
> >
>
> This seems strange, because to me this type of workload would lend
> itself to being less fragmented then most workloads. All the box does is
> records TV programs, so over the course of 30-60min periods I would
> guess 95+% of the writes are sequential.

do you frequently record more than one program at once?

> Why would the fragmentation be so bad? Is there a way to tell what the
> fragmentation rate is?

reiserfs does not use delayed allocation, and AFAIK cannot do
reservations either.  this means that if you are recording two things
at once, they will get interleaved on disk in very small increments.
then when you delete one file, the free space is fragmented too.

best bet would be to use reiser4, which has delayed allocation, and
set /proc/sys/vm/dirty_background_ratio to 40, and dirty_ratio to 45
or 50.

NATE
