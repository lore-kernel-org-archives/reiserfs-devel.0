From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: ReiserFS slow, need help diagnosing
Date: Mon, 05 Jun 2006 11:09:18 -0600
Message-ID: <1149527358.9416.33.camel@localhost>
References: <e61aht$7kf$1@sea.gmane.org>
	 <1149516737.6402.120.camel@tribesman.namesys.com>
	 <e61f4n$p6b$1@sea.gmane.org>
	 <1149520582.6402.134.camel@tribesman.namesys.com>
	 <Pine.LNX.4.63.0606051732110.25988@alpha.polcom.net>
	 <1149522884.6402.144.camel@tribesman.namesys.com>
	 <Pine.LNX.4.63.0606051805300.25988@alpha.polcom.net>
	 <44845A51.9030504@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-7IQr+gnnVBwoYnz+hzhp"
Return-path: <reiserfs-list-return-28736-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44845A51.9030504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Grzegorz Kulewski <kangur@polcom.net>, "Vladimir V. Saveliev" <vs@namesys.com>, Juergen Starek <quiterigorouslyfilteredusenetaccount@gmx.de>, reiserfs-list@namesys.com

--=-7IQr+gnnVBwoYnz+hzhp
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-06-05 at 09:22 -0700, Hans Reiser wrote:
> Grzegorz Kulewski wrote:
>=20
> >
> >>
> >> Well, inode location in reiser4 changed comparing to reiserfs. reiser4
> >> groups inodes of files of one directory together (reiserfs did not do
> >> that), but still allocated disk space for inodes dynamically as
> >> reiserfs.
> >> So, I guess that reiser4 will be better than reiserfs, but
> >> still worse than ext[23]. Would you verify this guess it please?
> >
> I wouild not assume this.  There is a huge difference with respect to
> this usage pattern between reiser4 and reiser3, it should dramatically
> improve.  I don't know if we will be better or worse than ext3, it could
> be either, best to measure it.

I also use Pan, and recently switched to using Reiser4 on my laptop.  I
can tell that Pan starts much more quickly than it used to using
Reiser3.  It isn't nearly as fast as starting it from a USB Flash drive
though.  I don't know how it compares to ext3, although the flash drive
was using a ext2 loopback on FAT-32 filesystem.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-7IQr+gnnVBwoYnz+hzhp
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBEhGU+G8fHaOLTWwgRAsq3AJ9/RYl2gIyDUeI+/8XbUJNHAT8duQCfdksc
kg0TegiNbgbjId4mZr0JT7I=
=u6vm
-----END PGP SIGNATURE-----

--=-7IQr+gnnVBwoYnz+hzhp--

