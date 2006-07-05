From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Tue, 04 Jul 2006 17:37:26 -0700
Message-ID: <1152059846.30139.11.camel@ipso.snappymail.ca>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>
	 <1151608355.6335.79.camel@tribesman.namesys.com>
	 <1151612146.11510.4.camel@ipso.snappymail.ca>
	 <44A55271.7050501@namesys.com>  <44A55591.6060500@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-LngnEI+XXVbTNdQlPiHv"
Return-path: <reiserfs-list-return-28906-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44A55591.6060500@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: Hans Reiser <reiser@namesys.com>, "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

--=-LngnEI+XXVbTNdQlPiHv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

	I just tried the patch you suggested and it didn't make a difference.
The load still spikes as soon as the free space falls below ~10%.


On Fri, 2006-06-30 at 12:47 -0400, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hans Reiser wrote:
> > Mike Benoit wrote:
> >=20
> >> This seems strange, because to me this type of workload would lend
> >> itself to being less fragmented then most workloads. All the box does =
is
> >> records TV programs, so over the course of 30-60min periods I would
> >> guess 95+% of the writes are sequential.=20
> >>
> >> Why would the fragmentation be so bad? Is there a way to tell what the
> >> fragmentation rate is?
> >>
> >> Thanks.
> >>
> >> =20
> >>
> > I wonder how the bitmap optimizations that Jeff added handle this usage
> > pattern.  Jeff?
>=20
> That's certainly interesting. The bitmap hinting code should skip bitmap
> blocks with fewer blocks that are being asked for. The first zero hint
> patch was never applied to mainline. I have that in my queue as well.
>=20
> Try using the attached patch. It directs the block allocator to start
> the search at the first known 0 bit rather than scanning the entire
> block to find it. I'm not sure if will have a meaningful performance
> impact, but it's worth a try.
>=20
> - -Jeff
>=20
> - --
> Jeff Mahoney
> SUSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.2 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org
>=20
> iD8DBQFEpVWRLPWxlyuTD7IRAm1uAJwIExdMY1ju2VjnVFmbweEluNUi+QCgqZWL
> rNWRcVDW0KqBCrvUl1L4veE=3D
> =3DCuir
> -----END PGP SIGNATURE-----
--=20
Mike Benoit <ipso@snappymail.ca>

--=-LngnEI+XXVbTNdQlPiHv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEqwnGMhKjsejwBhgRAgOqAJ9isT/fYhWrTehfFrbWfSbUHYvZJgCdEOgR
YTGsSrEG3nRskob3mDQ+AnE=
=tEjR
-----END PGP SIGNATURE-----

--=-LngnEI+XXVbTNdQlPiHv--

