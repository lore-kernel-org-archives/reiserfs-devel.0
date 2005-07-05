From: Martin Waitz <tali@admingilde.org>
Subject: Re: reiser4 plugins
Date: Tue, 5 Jul 2005 17:46:24 +0200
Message-ID: <20050705154624.GC15652@admingilde.org>
References: <hubert@uhoreg.ca> <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl> <87hdfgvqvl.fsf@evinrude.uhoreg.ca> <8783be6605062914341bcff7cb@mail.gmail.com> <42C3615A.9020600@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Return-path: <reiserfs-list-return-24956-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42C3615A.9020600@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Ross Biro <ross.biro@gmail.com>, Hubert Chan <hubert@uhoreg.ca>, Horst von Brand <vonbrand@inf.utfsm.cl>, Kyle Moffett <mrmacman_g4@mac.com>, David Masover <ninja@slaphack.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hoi :)

On Wed, Jun 29, 2005 at 08:04:58PM -0700, Hans Reiser wrote:
> >How is directories as files logically any different than putting all
> >data into .data files and making all files directories (yes you would
> >need some sort of special handling for files that were really called
> >.data).=20
> >
> Add to this that you make .data the default if the file within the
> directory is not specified, and define a stanadard set of names for
> metafiles, and you've got the essential idea, and any differences are
> details.

sure, that would work more or less, but what would it give you?
You haven't introduced anything new that userspace couldn't do before.
Just write a library which mangles pathnames and treats files and
directories the same. You don't need the kernel to do that.

Filesystems are there to store files.
Everything else can be done in userspace.

--=20
Martin Waitz

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCyqtQj/Eaxd/oD7IRAutQAJ9SVdhimwM4FQtsy474jufwR0u+hwCaAjI0
1GgC+SvUvSLvRd9FIWOJ7NM=
=TiSP
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
