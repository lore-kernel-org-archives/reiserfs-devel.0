From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 plugins
Date: Thu, 7 Jul 2005 11:27:49 +0300
Message-ID: <20050707082749.GZ11013@nysv.org>
References: <200506290509.j5T595I6010576@laptop11.inf.utfsm.cl> <m2k6kd2rx8.fsf@Douglas-McNaughts-Powerbook.local> <20050629135820.GJ11013@nysv.org> <20050629205636.GN16867@khan.acc.umu.se> <42C4FA1A.1050100@slaphack.com> <20050701155446.GZ16867@khan.acc.umu.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="umhhH1MY3lvPZrwj"
Return-path: <reiserfs-list-return-25028-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20050701155446.GZ16867@khan.acc.umu.se>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>, Douglas McNaught <doug@mcnaught.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Hubert Chan <hubert@uhoreg.ca>, Kyle Moffett <mrmacman_g4@mac.com>, Valdis.Kletnieks@vt.edu, Lincoln Dale <ltd@cisco.com>, Gregory Maxwell <gmaxwell@gmail.com>, Hans Reiser <reiser@namesys.com>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org, ReiserFS List <reiserfs-list@namesys.com>

--umhhH1MY3lvPZrwj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 01, 2005 at 05:54:46PM +0200, David Weinehall wrote:
>
>Which would neither need VFS changes nor be dependent on Reiser4 in
>any way, so I don't see why this thread lives on.  Just get down to
>business and implement this metafs =3D)

I've been gone for a while and suddenly drowning in mail...

Anyway, I don't really like the metafs thing.

To access the data, you still need to refactor userspace,
so that's not a real advantage. Doing lookups from /meta
all the time, instead of in the file-as-dir-whatever...

And the best thing to do would be to bring these "Reiser4-specific"
enhancements to every FS.

--=20
mjt


--umhhH1MY3lvPZrwj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCzOeFIqNMpVm8OhwRAhZoAJ0adDv6sug/VsMk1Qn5uauM2N5jTACfQrwu
aDpLjm1wZLJBtp4ovvYOlZY=
=QoYa
-----END PGP SIGNATURE-----

--umhhH1MY3lvPZrwj--
