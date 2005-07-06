From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 12:52:23 -0600
Message-ID: <1120675943.13341.10.camel@localhost>
References: <42CB1E12.2090005@namesys.com> <1740726161-BeMail@cr593174-a>
	 <87hdf8zqca.fsf@evinrude.uhoreg.ca>  <42CB7DE0.4050200@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-xAS1uxFf0+ZoZHNTpMdX"
Return-path: <reiserfs-list-return-25001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42CB7DE0.4050200@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, "Alexander G. M. Smith" <agmsmith@rogers.com>, ross.biro@gmail.com, vonbrand@inf.utfsm.cl, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, ninja@slaphack.com, vitaly@thebsh.namesys.com

--=-xAS1uxFf0+ZoZHNTpMdX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-07-05 at 23:44 -0700, Hans Reiser wrote:
> Hubert Chan wrote:
> >And a question: is it feasible to store, for each inode, its parent(s),
> >instead of just the hard link count?
> > =20
> >
> Ooh, now that is an interesting old idea I haven't considered in 20
> years.... makes fsck more robust too....

Hey, sounds like the idea I proposed a couple months ago of storing the
path names in each file, instead of in directories.  Only better, since
each path component isn't text but a link instead.

It still has the performance and locking problem of having to update
every child file when moving a directory tree to a new parent.  On the
other hand, maybe the benefit is worth the cost.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-xAS1uxFf0+ZoZHNTpMdX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCzChnG8fHaOLTWwgRApXpAJwJ2y/fZTbJ+UTqwm7DMQuSsQAinwCdGLU5
klm5bQKQNZWXO28y/3togzQ=
=yPew
-----END PGP SIGNATURE-----

--=-xAS1uxFf0+ZoZHNTpMdX--

