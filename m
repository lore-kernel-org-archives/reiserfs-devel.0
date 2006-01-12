From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Authoring a versioning plugin
Date: Thu, 12 Jan 2006 09:33:11 -0700
Message-ID: <1137083591.14934.5.camel@localhost>
References: <200601111759.14638.fred@lab.matcom.uh.cu>
	 <43C5D694.9050402@namesys.com>  <43C5FAE0.5090602@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-m9CeHWCFfCmRsT/kbrtm"
Return-path: <reiserfs-list-return-27678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C5FAE0.5090602@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>, reiserfs-List@namesys.com

--=-m9CeHWCFfCmRsT/kbrtm
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2006-01-11 at 22:44 -0800, Hans Reiser wrote:
> Hans Reiser wrote:
> >  I am skeptical that having it occur with every
> >write is desirable actually.
> > =20
> >
> Consider the case where you type cat file1 >> file2.  This will produce
> a version of file2 for every 4k that is in file1, because (well I didn't
> look at the bash source, but I would guess) it appends in 4k incremental
> writes rather than one big write.  Versioning on file close makes more
> sense
[snip]

Not that my opinion means anything. :-) But I agree with Hans that file
close is the place to create the new version.  The plugin should track
the writes (and mmap flushes) between file open and close, then on file
close it can process everything into a reverse binary diff to save
permanently.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-m9CeHWCFfCmRsT/kbrtm
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDxoTGG8fHaOLTWwgRAkE0AJ9qn75iDGZTgO+KpOEcVVqOuT8mgwCcDYyy
BHWE+E4oBHkabjZZHNIoAqM=
=Vtbo
-----END PGP SIGNATURE-----

--=-m9CeHWCFfCmRsT/kbrtm--

