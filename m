From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: reiser4 plugins
Date: Tue, 05 Jul 2005 16:32:00 -0600
Message-ID: <1120602720.27600.79.camel@localhost>
References: <hubert@uhoreg.ca>
	 <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl>
	 <87hdfgvqvl.fsf@evinrude.uhoreg.ca>
	 <8783be6605062914341bcff7cb@mail.gmail.com> <42C3615A.9020600@namesys.com>
	 <20050705154624.GC15652@admingilde.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-8kci6TVVZuC746Y35uAa"
Return-path: <reiserfs-list-return-24970-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050705154624.GC15652@admingilde.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Martin Waitz <tali@admingilde.org>
Cc: Hans Reiser <reiser@namesys.com>, Ross Biro <ross.biro@gmail.com>, Hubert Chan <hubert@uhoreg.ca>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

--=-8kci6TVVZuC746Y35uAa
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-07-05 at 17:46 +0200, Martin Waitz wrote:
[snip]
> Filesystems are there to store files.
> Everything else can be done in userspace.

You could do filesystems in userspace too and just use the kernel's
block layer.

In fact you can reduce the OS kernel to just interrupts, memory
management, context switches and message passing.

Everything else can be done in userspace, but that doesn't always make
it a good idea.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-8kci6TVVZuC746Y35uAa
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCywpgG8fHaOLTWwgRAp8BAJ9YGvjZK++7+QwqNFOeJTeaApzyNQCgkGL/
mnF9Wp8ltaQonvU3R8kBczo=
=h5A0
-----END PGP SIGNATURE-----

--=-8kci6TVVZuC746Y35uAa--

