From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Reiser4 bug?  Zeros in files.
Date: Wed, 03 Mar 2004 00:02:35 -0700
Message-ID: <1078297355.31628.4.camel@titania.zlynx.org>
References: <1078266036.12548.6.camel@localhost.localdomain>
	 <20040303053548.GA1570@backtop.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-lGEBahsdo5Qamtl0nM2Y"
Return-path: <reiserfs-list-return-17027-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040303053548.GA1570@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alex Zarochentsev <zam@namesys.com>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-lGEBahsdo5Qamtl0nM2Y
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-03-02 at 22:35, Alex Zarochentsev wrote:
> Hello,
>=20
> On Tue, Mar 02, 2004 at 03:20:37PM -0700, Jonathan Briggs wrote:
> > I'm using Reiser4 on MD RAID 0.  I'm seeing blocks of zeros in files.=20
>=20
> [ ... ]
> =20
> > So, any ideas?  Things you'd like to know?  Things you'd like me to try=
?
>=20
> What reiser4 snapshot are you using?  There were bugs related to md-devic=
es
> in the snapshots before 2004.02.25.=20

The date I have on all.diff.gz is Feb 25.  I believe I downloaded it the
day the new snapshot was announced.

It might be nifty if Reiser4 exported its build version in
/sys/fs/reiser4 somewhere.  If it is there I did not see it.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-lGEBahsdo5Qamtl0nM2Y
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBARYMLG8fHaOLTWwgRAiFLAJ9yJl6BIA1s5pQwkAoX4VwQxg3/cwCfUuD3
4u5byE0+pqFacrxq+zIxQXk=
=F94/
-----END PGP SIGNATURE-----

--=-lGEBahsdo5Qamtl0nM2Y--

