From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Our introduction to Reiser-list
Date: Thu, 27 Oct 2005 14:44:30 -0600
Message-ID: <1130445872.17539.14.camel@localhost>
References: <200510251558.13860.pvh@uvic.ca>
	 <200510262349.02012.pvh@uvic.ca> <4360B73D.5090502@slaphack.com>
	 <200510271220.06346.pvh@uvic.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-8869PUBja/jkF7hO8mEF"
Return-path: <reiserfs-list-return-26692-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510271220.06346.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

--=-8869PUBja/jkF7hO8mEF
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2005-10-27 at 12:20 -0700, Peter van Hardenberg wrote:
> On October 27, 2005 04:17 am, David Masover wrote:
> > Peter van Hardenberg wrote:
> > > On October 26, 2005 10:02 am, John Gilmore wrote:
> > >
> > > And I thought the whole idea was to unify the namespace and make thin=
gs
> > > like ID3 tags obsolete...
> >
> > The two are not mutually exclusive.  You unify the namespace, and use
> > that to access things like ID3 tags.  Of course, eventually ID3 tags
> > become obsolete, and the information is instead stored outside of the
> > file itself, as a separate stream (treated as a file).  You'd have a
> > standard way of serializing any given file and all its metadata, so tha=
t
> > "something like id3" doesn't have to be re-invented for every file type
> > that has metadata, and so that similar metadata can be accessed through
> > a standard mechanism -- searching for a particular artist should return
> > songs (using id3 tags) and music videos (using the mpeg equivalent) and
> > maybe even song lyrics (using separate metadata).
>=20
> It's much easier, more extensible, and more secure to create a utility wh=
ich=20
> ties together a number of userspace metadata libraries to create static f=
iles=20
> than to move them all down into kernel space. I feel plugins providing=20
> pseudofiles should only be used when there is no viable alternative.

And with transactions, it can be safe against becoming out of sync
(which is one of the arguments for doing it in-kernel).

Scenario:
        Reiser4 detects a file update about to happen.
        Transaction opens.  Changes are now invisible outside
        transaction.
                File contents are updated. =20
                User space helper is called.
                Metadata files are updated.
                User space helper exits.
        Transaction closes.  File and metadata updates are now visible.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-8869PUBja/jkF7hO8mEF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDYTwuG8fHaOLTWwgRAix7AJ9QVcJt5r0WTX6fJO1q+znRE0vdqwCeP49E
pJKMbZitkOEV2/bvvyjZXS8=
=Q7ex
-----END PGP SIGNATURE-----

--=-8869PUBja/jkF7hO8mEF--

