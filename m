From: michael chang <thenewme91@gmail.com>
Subject: Re: recovering from "rm -rf"
Date: Fri, 5 Aug 2005 17:27:35 -0400
Message-ID: <b14e81f00508051427254bb32@mail.gmail.com>
References: <42F3A08A.30102@planet.nl> <42F3A16D.6090306@namesys.com>
	 <42F3C73B.9040808@slaphack.com>
	 <b14e81f0050805135739c94933@mail.gmail.com>
	 <42F3D760.7090008@slaphack.com>
Reply-To: michael chang <thenewme91@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25312-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F3D760.7090008@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On 8/5/05, David Masover <ninja@slaphack.com> wrote:
> michael chang wrote:
> > On 8/5/05, David Masover <ninja@slaphack.com> wrote:
> >
> >>I've got a Reiser4 partition which I just moved (mv) a bunch of stuff
> >>off of, onto another drive.  The other drive died immediately after.
> >>
> >>I'm trying to repair the other drive, and to find any backups, but is
> >>there a reasonable chance to recover from the good drive?  Maybe force
> >>fsck.reiser4 to rebuild stuff... somehow?  It's sort of the equivalent
> >>of an "rm -rf".
> >
> >
> > I have no idea what you're trying to say; can you identify your drives
> > by e.g. Drive A and Drive B?  However, I've heard that Spinrite
> > (grc.com) is known to be pretty good at drive recovery, and supposedly
> > compatable with Linux partitions.  Requires an i386 compatable
> > machine, and I believe you need Windows to write the diskette/iso
> > which you can boot the recovery system from.  Haven't tried it though.
>=20
> I could do that, but this is Reiser4.  Does anyone but Namesys support
> recovery from Reiser4 yet?

No clue.  They'll be able to tell you, for $25, from what I've heard.

> > What are you trying to do?  Format a broken hard drive so you can
> > write to it again, or recover data you deleted unintentionally?  A
>=20
> Sort of both.
>=20
> Drive A is a 500 gig striped RAID.  Drive B is a 200 gig IDE drive.  I
> mv'ed all my data (about 100 gigs) from drive A to drive B.  Drive B
> then had its power plug fall out (don't ask me how I managed that), I
> plugged it back in (stupid!) -- there was a spark -- drive B now won't
> spin up, and drive A is essentially "rm -rf"ed.

Well, most filesystems [I don't know for sure about Reiser4] will not
immediately clear out unused data.  However, if Drive A has been
running for a while post "rm -rf" and has some sort of repacker
enabled (I think they haven't implemented it yet or it was removed in
recent versionf of Reiser4) then the data could be all gone.=20
Otherwise, I suppose if you had a backup of the metadata [which you
probably don't], you could try recovering from that...

As a note for the Power Plug + Sparks -- in the future, if it falls
out, unplug BOTH ends of the cord, then plug in the end that is
connected to the device FIRST, then the power socket/source SECOND.=20
This goes for _ALL_ electronic devices, and will save you a lot of
hassle.  Paranoid people will also unplug electronics during a
thunderstorm/rolling blackouts/brownouts, and get a UPS system.

> > anyways, so you shouldn't use it).  For all you know, the drive could
> > have died because the internals wore out/broke, or because your cable
> > died/broke/etc.
>=20
> I'm guessing that the internals did break, so I think that a recovery
> service would probably be able to recover 100% of my data (as an image),
> but only after replacing some parts, or even pulling the whole thing
> apart in a cleanroom.  This would cost at least $300-500, and if it goes
> to the cleanroom, probably $700 and up.

Considering the situation, most likely you shocked (e.g. with static
electricity or from that AC)  the motor and head and whatnot, although
if you're lucky, the spindle containing your data will be untouched.
In that case, a data recovery center only has to take it apart, move
the spindle to an identical drive, and put it back in the machine
(hopefully, without shocking it a second time).  As for drive A, you
can ask if there is some hack to get an older version of the metadata.
 *shrugs*

> By the way, do you know any good data recovery services?

Not that I've used.  What area [e.g. country, metro area, etc.]

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
