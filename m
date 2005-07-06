From: Martin Waitz <tali@admingilde.org>
Subject: Re: reiser4 plugins
Date: Wed, 6 Jul 2005 09:20:59 +0200
Message-ID: <20050706072059.GE15652@admingilde.org>
References: <hubert@uhoreg.ca> <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl> <87hdfgvqvl.fsf@evinrude.uhoreg.ca> <8783be6605062914341bcff7cb@mail.gmail.com> <42C3615A.9020600@namesys.com> <20050705154624.GC15652@admingilde.org> <1120602720.27600.79.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TU+u6i6jrDPzmlWF"
Return-path: <reiserfs-list-return-24982-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1120602720.27600.79.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Hans Reiser <reiser@namesys.com>, Ross Biro <ross.biro@gmail.com>, Hubert Chan <hubert@uhoreg.ca>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

--TU+u6i6jrDPzmlWF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hoi :)

On Tue, Jul 05, 2005 at 04:32:00PM -0600, Jonathan Briggs wrote:
> You could do filesystems in userspace too and just use the kernel's
> block layer.

but you can't do that in an library, you have to use a filesystem
server in order to get access control.
But you can build a library that handles uniform access to
files and directories.

Don't get me wrong, I'm all for a uniform interface for files and
metadata, but I don't think that it has to be in the kernel.
Gnome and KDE already have their own userspace VFS, something
like that should be used.

One has to distinguish between the low-level filesystem and
the storage system which is presented to the user.

--=20
Martin Waitz

--TU+u6i6jrDPzmlWF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCy4Zbj/Eaxd/oD7IRAguVAJ4vT8avX+ZkGGUSdVEiARDpP1zhuwCdERaQ
8Y6bC3l+jpDpyMl0aSo+Ryk=
=7MXK
-----END PGP SIGNATURE-----

--TU+u6i6jrDPzmlWF--
