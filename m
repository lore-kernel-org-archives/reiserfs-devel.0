From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.19-pre7.pending 01-05 didn't make it's way
	into -pre8?
Date: 03 May 2002 09:34:56 -0400
Message-ID: <1020432896.1510.197.camel@tiny>
References: <200205031448.56202.Dieter.Nuetzel@hamburg.de>
	<1020431887.1510.190.camel@tiny> 
	<200205031527.45970.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200205031527.45970.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Oleg Drokin <green@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, 2002-05-03 at 09:27, Dieter N=FCtzel wrote:
> On Friday 03 May 2002 15:18, Chris Mason wrote:
> > On Fri, 2002-05-03 at 08:48, Dieter N=FCtzel wrote:
> > > Only for notification and up-to date info.
> > > Seems that 06 is in, Chris?
> >
> > I started getting daily reports of some people hitting that on
> > sledgehammer and s390, so it got sent in before the others.
>=20
> Ah, the SuSE/AMD team? ;-)

The s390 guys actually found the bug, any 64 bit platform should hit it,
unless they somehow find a way to store 6800 bytes in a 4k buffer.  The
LTP suite triggers it very reliably, more people are running that now so
the reports went up in frequency.

I won't even guess how alphas and ia64s managed to work as long as they
did (it gets caught by a debugging check before corrupting anything,
thank you Vladimir).

>=20
> [-]
> > > Even all (?) current SuSE (one of the main ReiserFS promoter) release
> > > kernels do not include the quota stuff. Why?
> >
> > The new quota patches require a quota utilities upgrade, so they won't
> > go into a stable kernel series.  Jan Kara recently started on a version
> > of the new quota stuff that worked with the old utils.
> >
> > The suse kernels do include the quota patches (which is the main reason
> > I keep the reiserfs bits up to date ;-)
>=20
> Huh,
>=20
> this is weird.
> I upgraded a SuSE 7.3 system (server at a school) with=20
> k_i386-2.4.16-20.i386.rpm quota tools installed but nothing worked.
> Even the quota file generation failed with "quota not supported".
> ReiserFS 3.6, of course.
>=20
> Should I try again with newer kernel version?

Mount -o usrquota,grpquota?  SuSE started putting in the quota stuff for
reiserfs around 2.4.12.

-chris


