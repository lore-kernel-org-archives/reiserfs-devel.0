From: michael chang <thenewme91@gmail.com>
Subject: Re: recovering from "rm -rf"
Date: Fri, 5 Aug 2005 20:22:54 -0400
Message-ID: <b14e81f0050805172275d01c26@mail.gmail.com>
References: <42F3A08A.30102@planet.nl> <42F3A16D.6090306@namesys.com>
	 <42F3C73B.9040808@slaphack.com>
	 <b14e81f0050805135739c94933@mail.gmail.com>
	 <42F3D760.7090008@slaphack.com> <op.su10y3q7th1vuj@localhost>
	 <42F3E7F1.1030205@slaphack.com> <42F3EF37.3090705@edsons.demon.nl>
	 <42F3F4A4.2050505@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25321-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F3F4A4.2050505@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: PFC <lists@boutiquenumerique.com>, reiserfs-list@namesys.com, rudy@edsons.demon.nl

On 8/5/05, David Masover <ninja@slaphack.com> wrote:
> Rudy Zijlstra wrote:
> > David Masover wrote:
> >
> >> PFC wrote:
> >>
> >>
> >>>> Drive A is a 500 gig striped RAID.  Drive B is a 200 gig IDE drive. =
 I
> >>>> mv'ed all my data (about 100 gigs) from drive A to drive B.  Drive B
> >>>> then had its power plug fall out (don't ask me how I managed that), =
I
> >>>> plugged it back in (stupid!) -- there was a spark -- drive B now won=
't
> >>>> spin up, and drive A is essentially "rm -rf"ed.
> >>>>
> >>>
> >>>    You probably fried the electronics... if the heads are still OK,
> >>> you  could recover your data by exchanging the PCB from a brand new
> >>> drive, with  the fried PCB of the old drive. You need some electronic=
s
> >>> skillz, but a  friend of mine did this (it was an adventure, as he ha=
d
> >>> to find the same  drive as he had, from ebay, etc) and it worked for
> >>> him... if something  that's not on the PCB is dead, well, you need a
> >>> recovery company.
> >>>
> >>
> >>
> >> Seems kind of a waste to buy a whole new drive, if it does end up bein=
g
> >> that simple.  I wonder if I couldn't ship this back to the manufacture=
r
> >> and have them do it?  I'm sure they have extras...
> >>
> >>
> >>
> > forget that idea, the extra's are bough by the recovery companies...
> >
> > In other words, its not cost effective for the manufacturers to keep
> > spare parts around.
> >
> > /Kick in open door
> > The thing you *should* have done is keep good backups, especially
> > considering the amount you are willing to pay to recover...
>=20
> I'm not sure yet how much I'm willing to pay.  If the Namesys people can
> help me out, there will certainly be a donation headed their way, but
> I'm not sure yet if I want to spend $500 to $5000 on a recovery.  It's
> an academic question, anyway -- if it costs too much, I'll have to wait.

Most people I've seen, when the drive dies, they just buy a new one,
and forget about their old data.

> > No matter how you do it, no matter what type of RAID level you run,
>=20
> Striping is fast, but not really RAID.

So this was a performance raid, not a backup raid?  Did you RAID on
the same drive?  o_O  [If memory serves me right, RAID/Striping only
gives better performance on multiple drives.]

> > nothing beats a backup on a separate medium, with an automated script t=
o
> > make it every night (or more often if needed).
> > Kick in open door/
>=20
> Indeed, a lesson learned.  I've got some sort of backup script
> somewhere, but I'm not sure exactly what it's backing up, or to where.
> It may have the really important stuff, but almost certainly won't have
> all the music and anime, so I'm still trying to recover Drive A.

Music and Anime?  Lol.  No wonder you're trying to recover it all.=20
I'd suggest a data recovery company, all the same, before you damage
your computer completely.  And maybe consider using e.g. a backup -
two drives; while you have to store data twice, at least if one fails,
you'll have a backup [how in the world did you end up with two drives
dead anyways?!?].

> Similar drive, if it'd work.  But my manufacturer warns me that even
> identical-looking drives sometimes have different firmware.

In the manual, or over the phone?

> > What you can do is ask the manufacturer which drives are using the same
> > PCBs. You might get lucky.
>=20
> (same PCBs and firmware.)  Thanks, I'll do that.

You'll be hard pressed to find a e-bay listing that lists the PCBs and
Firmware, per the components, though?  *shrugs*

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
