From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Mon, 31 Jul 2006 19:20:02 +0200
Message-ID: <20060731172002.GM31121@lug-owl.de>
References: <1153760245.5735.47.camel@ipso.snappymail.ca> <200607241806.k6OI6uWY006324@laptop13.inf.utfsm.cl> <20060731125846.aafa9c7c.reiser4@blinkenlights.ch> <20060731144736.GA1389@merlin.emma.line.org> <20060731175958.1626513b.reiser4@blinkenlights.ch> <20060731162224.GJ31121@lug-owl.de> <Pine.LNX.4.64.0607311842120.13492@nedra.edsons.demon.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rPgHZmYkQ+bUEpVC"
Return-path: <reiserfs-list-return-29305-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0607311842120.13492@nedra.edsons.demon.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Rudy Zijlstra <rudy@edsons.demon.nl>
Cc: Adrian Ulrich <reiser4@blinkenlights.ch>, Matthias Andree <matthias.andree@gmx.de>, vonbrand@inf.utfsm.cl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

--rPgHZmYkQ+bUEpVC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-07-31 18:44:33 +0200, Rudy Zijlstra <rudy@edsons.demon.nl> wro=
te:
> On Mon, 31 Jul 2006, Jan-Benedict Glaw wrote:
> > On Mon, 2006-07-31 17:59:58 +0200, Adrian Ulrich=20
> > <reiser4@blinkenlights.ch> wrote:
> > > A colleague of mine happened to create a ~300gb filesystem and started
> > > to migrate Mailboxes (Maildir-style format =3D many small files (1-3k=
b))
> > > to the new LUN. At about 70% the filesystem ran out of inodes; Not a
> >=20
> > So preparation work wasn't done.
>=20
> Of course you are right. Preparation work was not fully done. And using=
=20
> ext1 would also have been possible. I suspect you are still using ext1,=
=20
> cause with proper preparation it is perfectly usable.

Nope, I'm a quite happy ext3 user for quite divergent workloads.
Starting with storing loads of small files in a hugh number of
directories (mkfs -T news) over hugh numbers of files in few
directories (mkfs -O dir_index) to only a small number of really hugh
files (mkfs -T largefile4).

All that I still need to catch up with is 4TB sized files. But I guess
this is really an uncommon workload, but ISTR that somebody even works
on this.

MfG, JBG

--=20
       Jan-Benedict Glaw       jbglaw@lug-owl.de                +49-172-760=
8481
 Signature of:                       Don't believe in miracles: Rely on the=
m!
 the second  :

--rPgHZmYkQ+bUEpVC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFEzjvCHb1edYOZ4bsRAh/CAJsH2mGOd2BsF6emuzMtt+D1Ub4GtgCfY7w6
EbL/cKZsOAC4Rw0SwXi845o=
=f1Q9
-----END PGP SIGNATURE-----

--rPgHZmYkQ+bUEpVC--
