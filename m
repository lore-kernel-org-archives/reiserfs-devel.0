From: Christophe Saout <christophe@saout.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 21:33:35 +0200
Message-ID: <1093548815.13881.10.camel@leto.cs.pocnet.net>
References: <20040824202521.GA26705@lst.de>	<412CEE38.1080707@namesys.com>
	 <20040825152805.45a1ce64.akpm@osdl.org>	<412D9FE6.9050307@namesys.com>
	 <20040826014542.4bfe7cc3.akpm@osdl.org>  <412DAC59.4010508@namesys.com>
	 <1093548414.5678.74.camel@krustophenia.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-yKABj20cj8+xmV23deNV"
Return-path: <reiserfs-list-return-20771-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093548414.5678.74.camel@krustophenia.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Lee Revell <rlrevell@joe-job.com>
Cc: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

--=-yKABj20cj8+xmV23deNV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 26.08.2004, 15:26 -0400 schrieb Lee Revell:

> > Well, in V4, you can easily compose a plugin from plugin methods of=20
> > other plugins, write a little piece of code with the one thing you want=
=20
> > different, and add it in.  Disk format changes, no big deal, add a new=20
> > disk format plugin, or a new item plugin, or a new node plugin, etc.,=20
> > and you got your new format.
>=20
> OK, real world example.  My roommate has an AKAI MPC-2000, a very
> popular hardware sampler from the 90's.  The disk format is known,there
> are a few utilities to edit the disks on a PC and extract the PCM
> samples, but there are no tools to mount it on a modern PC.  Are you
> saying that, since I know the MPC disk format, I could write a reiser4
> plugin to mount an MPC drive?

No, the underlying storage must be a reiser4-like tree. If you want to
mount an MPC drive, write an MPC filesystem.


--=-yKABj20cj8+xmV23deNV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLjsPZCYBcts5dM0RAj+EAJ9EIpu53LIhCzS5GbDdW1E9DtJEwgCfY+8R
pLJnt66pMHizzrwdE7WLzr8=
=YpfM
-----END PGP SIGNATURE-----

--=-yKABj20cj8+xmV23deNV--

