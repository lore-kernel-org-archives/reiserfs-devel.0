From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 1 Sep 2005 15:12:49 +0200
Message-ID: <20050901151249.2abec739@SiRiUS.home>
References: <20050901134604.31ddd297@SiRiUS.home>
	<20050901144842.34629bcf@SiRiUS.home>
	<4316F9CC.2090904@namesys.com>
	<op.swfc8hleth1vuj@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="Signature_Thu__1_Sep_2005_15_12_49_+0200_Jx4=uaE+A+dbkjCI";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-25783-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.swfc8hleth1vuj@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Signature_Thu__1_Sep_2005_15_12_49_+0200_Jx4=uaE+A+dbkjCI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 01 Sep 2005 15:03:43 +0200
PFC <lists@boutiquenumerique.com> wrote:

>=20
> >>> 250GB disk
>=20
> Well, 250GB is the "marketing capacity", the real formatted capacity
> is always less (ask fdisk) also of course you have 1024 vs 1000
>=20
yeah see my 2. mail - 233 GB is the true (1024 based) size of the disk

> > reiser4 reserves 5% of disk space for its internal needs.
>=20
> 	So, do you mean this 5% is for metadata, and thus it would be
> used anyway on any other filesystem as files are written, and thus it
> makes absolutely no difference ?
>=20
>=20
humm.. interesting point. maybe there are starting things like
blocksize and journal size to play a role?

--Signature_Thu__1_Sep_2005_15_12_49_+0200_Jx4=uaE+A+dbkjCI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFDFv5WaMf8HmTow1YRAs8yAJ4rVrP4/xWG935TtqEHWdtRS3kaswCg6Nzk
x7taRrlU0SRYJnTHCVNb2tY=
=cmc8
-----END PGP SIGNATURE-----

--Signature_Thu__1_Sep_2005_15_12_49_+0200_Jx4=uaE+A+dbkjCI--
