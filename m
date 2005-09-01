From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 1 Sep 2005 15:28:21 +0200
Message-ID: <20050901152821.455f13d7@SiRiUS.home>
References: <20050901134604.31ddd297@SiRiUS.home>
	<20050901144842.34629bcf@SiRiUS.home>
	<4316F9CC.2090904@namesys.com>
	<20050901150507.3d6f53c7@SiRiUS.home>
	<df6uqb$bkf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="Signature_Thu__1_Sep_2005_15_28_21_+0200_ZAa/_UXbG6LQRzcT";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-25786-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <df6uqb$bkf$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Signature_Thu__1_Sep_2005_15_28_21_+0200_ZAa/_UXbG6LQRzcT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 01 Sep 2005 14:13:43 +0100
Lexington Luthor <lexington.luthor@gmail.com> wrote:

> Thomas Kuther wrote:
> > Ah OK, that computes. So i'll go with reiserfs on that big one (11
> > GB for internal stuff is too much i have to admit).
> >=20
> > Thanks!
> > Tom
>=20
> Other filesystems will also consume space (most of them, more so than=20
> reiserfs or reiser4), they will just allocate it incrementally with
> the data. The metadata handling in reiser4 is designed differently,
> so it allocated during mkfs.
>=20
> Ext3 will use more space than reiser4 for the same data. reiserfs
> with tail packing will use the least space (of all the filesystems in
> linux), but will be slower than reiser4.
>=20
> I would suggest reiser4 if speed is important, or XFS if data safety
> is important (since r4 is still experimental). Both of them will use
> around 5-8% of the disk (depending on the number of files etc.),
> which is less than most filesystems.
>=20
> LL
>=20

Interesting! OK safty is important on the stuff on that disk.. anyways
reiser4 has been rocksolid on my system. even the system is completely
backed up for that reason that reiser4 is still "experimental". So
maybe XFS would be the best way to go...never dealed with it so far.
Anyways those files haven't to be accessed that fast.. and reiserfs
with tail is what i currently run on that disk. i'll keep that then i
guess :)

Thanks for the answer(s)

Regards!
Tom

--Signature_Thu__1_Sep_2005_15_28_21_+0200_ZAa/_UXbG6LQRzcT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFDFwH7aMf8HmTow1YRAu9XAJ9Uf/nCBq0qMZZGhmrWWJCnmrz0RwCg3T9D
Brw1Nz4XezuXsLgu9ur5Tn0=
=5ifP
-----END PGP SIGNATURE-----

--Signature_Thu__1_Sep_2005_15_28_21_+0200_ZAa/_UXbG6LQRzcT--
