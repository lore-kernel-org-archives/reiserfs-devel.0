From: Thomas Kuther <gimpel@sonnenkinder.org>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 1 Sep 2005 15:15:45 +0200
Message-ID: <20050901151545.5f393cd0@SiRiUS.home>
References: <20050901134604.31ddd297@SiRiUS.home>
	<4316F9CC.2090904@namesys.com>
	<20050901150507.3d6f53c7@SiRiUS.home>
	<200509011513.36586.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary="Signature_Thu__1_Sep_2005_15_15_45_+0200_Tp1_s5EAB3/n=/_Y";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-25784-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200509011513.36586.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Signature_Thu__1_Sep_2005_15_15_45_+0200_Tp1_s5EAB3/n=/_Y
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Sep 2005 15:13:36 +0200
Marcel Hilzinger <marcel@hilzinger.hu> wrote:

> Am Donnerstag, 1. September 2005 15:05 schrieb Thomas Kuther:
> > On Thu, 01 Sep 2005 16:53:32 +0400
> >
> > "Vladimir V. Saveliev" <vs@namesys.com> wrote:
> > > Hello
> > >
> [...]
> > >
> > > reiser4 reserves 5% of disk space for its internal needs.
> >
> > Ah OK, that computes. So i'll go with reiserfs on that big one (11
> > GB for internal stuff is too much i have to admit).
>=20
> If I remember well, you can adjust this value in the code.
>=20
> --=20
> =DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
> Marcel Hilzinger
>=20

aha! OK. now the question would be: what is a good number for reiser4
to work properly. how much does it need from a 233GB disk? or are the
5% chosen 'cause it's the "healthy" value?

--Signature_Thu__1_Sep_2005_15_15_45_+0200_Tp1_s5EAB3/n=/_Y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFDFv8FaMf8HmTow1YRAkSEAJ9ClqRZqL14PQf6MwyVKIixom5eWQCgtdmU
gjFASWBixMTjTGUmD88U9gI=
=Yrpz
-----END PGP SIGNATURE-----

--Signature_Thu__1_Sep_2005_15_15_45_+0200_Tp1_s5EAB3/n=/_Y--
