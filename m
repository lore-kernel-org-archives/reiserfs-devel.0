From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: reiser4 plugins
Date: Wed, 06 Jul 2005 14:33:18 -0600
Message-ID: <1120681998.13341.23.camel@localhost>
References: <42CB1E12.2090005@namesys.com> <1740726161-BeMail@cr593174-a>
	 <87hdf8zqca.fsf@evinrude.uhoreg.ca> <42CB7DE0.4050200@namesys.com>
	 <1120675943.13341.10.camel@localhost>  <87mzozemqp.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-PoQIS3nu07blch1tWasI"
Return-path: <reiserfs-list-return-25005-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87mzozemqp.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hubert Chan <hubert@uhoreg.ca>
Cc: "Alexander G. M. Smith" <agmsmith@rogers.com>, ross.biro@gmail.com, vonbrand@inf.utfsm.cl, mrmacman_g4@mac.com, Valdis.Kletnieks@vt.edu, ltd@cisco.com, gmaxwell@gmail.com, jgarzik@pobox.com, hch@infradead.org, akpm@osdl.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, zam@namesys.com, vs@thebsh.namesys.com, ndiller@namesys.com, ninja@slaphack.com, vitaly@thebsh.namesys.com

--=-PoQIS3nu07blch1tWasI
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-07-06 at 15:51 -0400, Hubert Chan wrote:
> On Wed, 06 Jul 2005 12:52:23 -0600, Jonathan Briggs <jbriggs@esoft.com> s=
aid:
[snip]
> > It still has the performance and locking problem of having to update
> > every child file when moving a directory tree to a new parent.  On the
> > other hand, maybe the benefit is worth the cost.
>=20
> Every node should store the inode number(s) for its parent(s).  Not the
> path name.  So you don't need to do any updates, since when you move a
> tree, inode numbers don't change.

You do need the updates if you change what inode is the parent.

/a/b/c, /a/b/d, /a/b/e, /b
mv /a/b /b
Now you have to change the stored grand-parent inodes for /a/b/c, /a/b/d
and /a/b/e so that they reference /b/b instead of /a/b.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-PoQIS3nu07blch1tWasI
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBCzEAOG8fHaOLTWwgRAsZfAJ9isO94/vbgL77SKKzkey+qqe0WsQCfTaU8
mItT2sR8XaJiRv3zFQ4kIXg=
=gMQb
-----END PGP SIGNATURE-----

--=-PoQIS3nu07blch1tWasI--

