From: Sander Sweers <sander.sweers@gmail.com>
Subject: Re: Ebuild/rpm/deb repo's (was Re: reiser4 can now bear with
	filled fs, looks stable to me...)
Date: Tue, 08 Aug 2006 10:55:13 +0200
Message-ID: <1155027313.12074.6.camel@localhost>
References: <20060730223755.GA14386@hermes.uziel.local>
	 <44CD4127.9010202@slaphack.com> <11910177823.20060731232849@wp.pl>
	 <44CE7A3A.2010503@slaphack.com> <1256888283.20060801132818@wp.pl>
	 <1154455834.10745.21.camel@localhost> <1692247736.20060801231255@wp.pl>
	 <916440956.20060806162316@wp.pl> <20060807092435.GA11596@zeus.uziel.local>
	 <44D773D6.4020504@slaphack.com> <961493611.20060807205216@wp.pl>
	 <44D7CB55.9050805@slaphack.com> <532158090.20060808013105@wp.pl>
	 <44D7D543.2070400@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44D7D543.2070400@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Masover <ninja@slaphack.com>
Cc: Maciej =?iso-8859-2?Q?So=B3tysiak?= <pysiak.satriani@wp.pl>, reiserfs-list@namesys.com

On Mon, 2006-08-07 at 20:05 -0400, David Masover wrote:
> Maciej So=B3tysiak wrote:
> > Hello David,
> >=20
> > Tuesday, August 8, 2006, 1:23:01 AM, you wrote:
> >> Sounds good.  I don't have an ubuntu to test with at the moment, thoug=
h.
> > Well, both MS Virtual PC and VMWare are free of charge, so installing
> > is a real snap.
>=20
> Under what, though?  I don't want MS crap on my OS X (need that for work =

> ATM), and I can't imagine they've ported it to Linux.  I have no reason=20
> to boot Windows except for games, and if I was going to do that, I may=20
> as well shrink my Windows partition to make room for a native install.
>=20
> Which would be fine, but it's a lot of work when I don't run Ubuntu=20
> normally.
>=20
> I'd be willing to test on the one Ubuntu server I run, but it's across=20
> the country until next week, and also work-critical.
>=20
> >> Not to nitpick, but isn't that emulation?  Or have they actually done
> >> real virtualization yet?
> > I don't know the differences, can you shed some light? AFAICS M$ will
> > be shipping Virtual PC with Vista to allow people run older software
> > under virtual machines. (be it virtualized or emulated)
>=20
> Still hard to say.
>=20
> Virtualization splits up the real hardware.  It's like a scheduler, only =

> for OSes.  Emulation is more like an interpreter -- it reads each=20
> instruction and then executes something that does the same thing.=20
> Emulation can work from any arch to any arch, so Rosetta (allowing PPC=20
> OS X apps to run on OS X86) is emulation.
>=20
> Emulation is usually at least 2x slower than native.  Virtualization=20
> usually approaches native for CPU stuff, but at least disk IO and=20
> graphics usually have to be emulated -- so no 3D acceleration, so no=20
> games under a guest OS.
>=20
> If MS wanted to do the best possible thing for their consumers, they'd=20
> give you a free XP under VirtualPC with Vista, and actually do=20
> virtualization.  If M$ wanted to make it even more likely for people to=20
> want to upgrade to Vista, they might deliberately make it cost tons of=20
> money and make it emulation, so that XP looks slower, and native Vista=20
> apps look so much faster that people complain until everything works on=20
> Vista.
>=20
> > If Virtual PC is emulation, maybe Virtual Server 2005 R2 (also free of
> > charge) is virtualizaton.
>=20
> I have no idea what Virtual Server is.

There are many forms of virtualization see 1, one of them being
emulation. VMware and virtual pc do emulation but if possible they will
pass instruction directly to the hardware without emulating vias a
hypervisor. Good reading on virtualization on 2.

Greets
Sander

[1] http://en.wikipedia.org/wiki/Virtualization
[2] http://www.kernelthread.com/publications/virtualization/

