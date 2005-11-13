From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So
 nevermind...
Date: Sun, 13 Nov 2005 14:12:13 +0100
Message-ID: <20051113141213.07be2e71@SiRiUS.home>
References: <200511111359.39715.jgilmore@glycou.com>
	<b14e81f00511111907l3c159ff7rd2e0de5f9e6a0aa7@mail.gmail.com>
	<43758E00.4000601@namesys.com>
	<200511120906.39109.jgilmore@glycou.com>
	<43765E8D.7030104@namesys.com>
	<43768EEA.90307@ursynow.2a.pl>
	<43772F11.7090907@free.fr>
	<437731A5.9070802@ursynow.2a.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary=Sig_7GAdia4+WDCC+4vsZPhShJ1;
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-26919-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437731A5.9070802@ursynow.2a.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Sig_7GAdia4+WDCC+4vsZPhShJ1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, 13 Nov 2005 13:29:25 +0100
Artur Mak=F3wka <juice@ursynow.2a.pl> wrote:

> Laurent Riffard wrote:
> > Le 13.11.2005 01:55, Artur Mak=F3wka a =E9crit :
> > [snip]
> >> one more thing im pretty sure of - the 2.6.13mm3 without any
> >> reiser4 additional patches (just clean 2.6.13mm3 as it has reiser4
> >> already built) is working fine.
> >>
> >> i mean, im not sure if this bug still exists here, but im 100%
> >> sure i can write vim files easy without any downtime, so this is
> >> big difference.
> >>
> >> so for everyone with this bug - try clean 2.6.13mm3 from
> >> kernel.org. It worked for me. i will wait with this kernel for a
> >> patch to stable line.
> >>
> >> Also - i will test it a little more tomorrow to be sure that this
> >> version is bug free.
> >>
> >=20
> > Hello,
> >=20
> > It seems that fsync could be really slow when there is a lot of
> > activity on the FS.
> >=20
> > I've done the following test :
> > - on a reiser4 FS, unpack a fresh kernel tarball and start a
> > compilation
> > - open a new terminal, wait 1 minute and start editing a file on the
> > same FS with vi.
> > - hit ":w" and wait...
> >=20
> > $ strace -T vi foo 2>strace_vi.log
> > $ grep fsync strace_vi.log
> > fsync(3)                                =3D 0 <30.923808>
> > $
> >=20
> > My computer is a desktop with an Athlon XP 1600 and 512 Mb RAM.
> > Write cache is disabled on the disk (hdparm -W0 /dev/hda).
> >=20
> > ~~
> > laurent
> >=20
>=20
> it crashed today morning, so 2.6.13mm is not much better than 2.6.14.
>=20
> My fs is heavly used (but not overloaded) by many apache process or
> ftp process or postfix process.
>=20
> I have free hosting server and i think i will have to close this
> thing becouse for over a month its often downtime everyday. Could you
> please tell us if there is any idea of how to fix it? i would move to
> another more stable fs but its too much data..

hmm, wondering which I/O scheduler you guys are using.=20
I had the same slowdowns and soft lockups till 10 minutes ago, when i
switched from cfq to anticipatory I/O. I'm currently usig 2.6.15-rc1 +
reiser4 from 2.6.14-mm2
I was in the middle of a big gentoo'ish emerge, desktop almost
unusable. but now with anticipatory all seems fine so far.=20
the compile seems a lot faster. no soft lockup trying to use vim or
locate... hmmm

regards
tom

--Sig_7GAdia4+WDCC+4vsZPhShJ1
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFDdzuyaMf8HmTow1YRAlJ5AKDgkB+WsqjYqqrJVHQlCNNOFsWXZwCg4DmQ
UkgJIConV3MQg3udNCjYI0k=
=oItr
-----END PGP SIGNATURE-----

--Sig_7GAdia4+WDCC+4vsZPhShJ1--
