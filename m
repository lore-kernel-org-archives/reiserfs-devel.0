From: Christophe Saout <christophe@saout.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 22:17:21 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <1093551441.13881.30.camel@leto.cs.pocnet.net>
References: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-GQ2TPbJ9f0jGs0xoFQ+H"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0408261607070.27909-100000@chimarrao.boston.redhat.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Rik van Riel <riel@redhat.com>
Cc: Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com


--=-GQ2TPbJ9f0jGs0xoFQ+H
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 16:10 -0400 schrieb Rik van Riel:

> > So "/tmp/bash" is _not_ two different things. It is _one_ entity, that
> > contains both a standard data stream (the "file" part) _and_ pointers t=
o
> > other named streams (the "directory" part).
>=20
> Thinking about it some more, how would file managers and
> file chosers handle this situation ?

I would say they don't. That's where metadata and pseudo-files sit. It's
up to the applications to do something useful with the data.

> Do we really want to have a file paradigm that's different
> from the other OSes out there ?

Some other OSes have similar things.

> What happens when users want to transfer data from Linux
> to another system ?

No one should store really important data inside file/ that makes the
file completely useless. I just love these postscript fonts on the Mac.
The actual main file stream is 0 bytes in size. The actual font is
inside the resource fork. When I want to convert it the Mac user needs
to pack it into a compound file using a special tool and then I can
decode it using another tool to access the PFB file. Crap.

It's useful for metadata like keywords, ACLs and these things. If you
can pack it using an aware backup program, fine. If you don't, you still
have the data.


--=-GQ2TPbJ9f0jGs0xoFQ+H
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLkVRZCYBcts5dM0RAjfcAKCWyJiqFIH0Pm+zoO0CechCJPdxIwCglX6Z
rA3ohyR1G4JNtMhQkYlUZd0=
=OoSJ
-----END PGP SIGNATURE-----

--=-GQ2TPbJ9f0jGs0xoFQ+H--

