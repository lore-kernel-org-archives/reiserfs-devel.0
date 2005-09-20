From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: I request inclusion of reiser4 in the mainline kernel
Date: Tue, 20 Sep 2005 12:18:46 -0600
Message-ID: <1127240326.10407.22.camel@localhost>
References: <200509182004.j8IK4JNx012764@inti.inf.utfsm.cl>
	 <432E5024.20709@namesys.com> <20050920075133.GB4074@elf.ucw.cz>
	 <43301FA0.7030906@slaphack.com>  <20050920175727.GA17820@thunk.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-N1FZ3+XBlmhdHUM2RXRo"
Return-path: <reiserfs-list-return-26144-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050920175727.GA17820@thunk.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: David Masover <ninja@slaphack.com>, Pavel Machek <pavel@suse.cz>, Hans Reiser <reiser@namesys.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, thenewme91@gmail.com, Christoph Hellwig <hch@infradead.org>, Denis Vlasenko <vda@ilport.com.ua>, chriswhite@gentoo.org, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

--=-N1FZ3+XBlmhdHUM2RXRo
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-09-20 at 13:57 -0400, Theodore Ts'o wrote:
> On Tue, Sep 20, 2005 at 09:41:36AM -0500, David Masover wrote:
> > And personally, if it was my FS, I'd stop working on fsck after it was=20
> > able to "check".  That's what it's for.  To fix an FS, you wipe it and=20
> > restore from backups.
>=20
> If that's Reiser4's philosophy, just make sure you tell all of your
> prospective users about ahead of time.  Is it really an explicit goal
> that performance is so important beyond all other considerations that
> it's OK if the filesystem is extremely fragile and that if anything
> goes wrong, you have to wipe things and recover from backups?!?
[snip]

I think that you missed the bit "if it was my FS" that David wrote.  As
far as I know, Hans Reiser defines the Reiser philosophy.

I use Reiser3 and Reiser4 on all my systems and fsck has always worked
even if it has been much slower than I would like.  The only problems
I've experienced have been on the same level as when an ext2/3
filesystem fsck dumps several directories of unlabeled files into lost
+found.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-N1FZ3+XBlmhdHUM2RXRo
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDMFKGG8fHaOLTWwgRAhO9AKClOQyvab3pnu0JB5grlh8W5cB0nQCfR6sO
ItVgqfqMe9CuB6u0ykvY2Uc=
=AbYA
-----END PGP SIGNATURE-----

--=-N1FZ3+XBlmhdHUM2RXRo--

