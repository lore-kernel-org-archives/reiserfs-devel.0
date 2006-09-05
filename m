From: John M Harrison <jmh5@nei.mv.com>
Subject: Re: Reiser FS will not boot after crash
Date: Mon, 4 Sep 2006 20:02:55 -0400 (EDT)
Message-ID: <Pine.LNX.3.95.1060904195202.6194d-100000@nei>
References: <200609042333.27778.vs@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29806-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609042333.27778.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com


Hi - Thanks for your reply. Further comments below:


On Mon, 4 Sep 2006, Vladimir V. Saveliev wrote:

> Hello
> 
> On Monday 04 September 2006 23:26, jmh5@nei.mv.com wrote:
> > Hi,
> >
> >   I am observing the following Reiser failure:
> >
> >   I am trying to use camorama with a Creative WebCam Live spca5xx driver
> > (recently downloaded and compiled) . Camorama does not start and computer
> > freezes (no response to mouse, or keyboard. Can't change to terminal
> > window.
> >
> >   Reset or pull plug leaves Knoppix 5.0.1-DVD unbootable:
> >
> >   The actual message from GRUB is inconsistent filesystem?! From a boot
> > loader?
> 
> after unclean shutdown journal reply is necessary to return reiserfs to 
> consistent state. Maybe GRUB did not do that?
> 

You are probably correct. I don't know how to tell if GRUB did or did not
do this.

> >
> >   The 'fix' is even stranger. I execute fsck.reiserfs from another OS
> > partition on the Knoppix 5.0.1-DVD partition (takes forever). 
> 
> Did fsck complete? What did it report?

Yes, fsck did complete with no problems found? This is what confuses me. I
had assumed it would NOT modify the filesystem unless you gave it
permission. From what I can see it must have rewritten at least some part
of the filesystem.

> 
> > Somehow 
> > 'reading' the Knoppix filesystem 'fixes' whatever was preventing Knoppix
> > 5.0.1-DVD from booting.
> >
> 
> fsck replayed the journal.

Sounds like it to me.

> Does camorama work now?

No, camorama (loaded by apt-get install camorama) crashes Knoppix 5.0.1
every time. That said all the programs supplied spca5xx driver and friends
work OK.

Curiously, gnetmeeting, or whatever it's called, cannot connect to the
video webcam? Maybe the next version of the driver or gnetmeeting will fix
this?

> 
> If it still causes computer freeze - can you please install serial or network 
> console and try to catch what does kernel output when it freezes.

I will try to do that. I assume you mean do a tail -f /var/log/messages
from a remote console? Any other files of interest?

> 
> >   I am curious what your comments and/or suggestions might be?
> >
> 
> 
> >   regards to all Linuxers,
> >   john
> 

