From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Reiserfs concurrent write problems
Date: Sat, 1 May 2004 16:52:29 +0200
Message-ID: <200405011652.29753.Dieter.Nuetzel@hamburg.de>
References: <20040426172648.GA22918@em.ca> <1083356649.30344.479.camel@watt.suse.com> <20040430214410.GA790@em.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18351-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040430214410.GA790@em.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Chris Mason <mason@suse.com>, Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>

Am Freitag, 30. April 2004 23:44 schrieb Bruce Guenter:
> On Fri, Apr 30, 2004 at 04:24:10PM -0400, Chris Mason wrote:
> > Thanks.  One thing I didn't notice before:
> >
> > Filesystem partition: 72GB on a software RAID-1 array of Fujitsu SCSI
> > 15kRPM disks.
> > Journal partition: 400MB on a software RAID-1 array of Quantum Atlas 10K
> > SCSI disks.
> >
> > So the external log is on slower disks?  That might explain why it is
> > sometimes slower to have reiserfs on the external log.
>
> Yes, the journal is on a slower array.  That's what was available when
> building the system.  They're still not *SLOW* disks, though, at 10kRPM
> and 32MB/sec transfer rate.

I have the former Fujitsu, too.
So the Atlas are "very" slow disks. ;-)

One of my Fujitsu MASxxxx:

SunWave1 /home/nuetzel# hdparm -tT /dev/sdb2

/dev/sdb2:
 Timing buffer-cache reads:   1064 MB in  2.00 seconds = 531.55 MB/sec
 Timing buffered disk reads:  214 MB in  3.00 seconds =  71.30 MB/sec

Cheers,
	Dieter
