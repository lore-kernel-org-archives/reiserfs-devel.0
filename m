From: Alex Malinovich <demonbane@the-love-shack.net>
Subject: Re: reiserfsck "block is in the tree already" error
Date: 21 Mar 2003 20:44:50 -0600
Message-ID: <1048301090.925.1.camel@Thief>
References: <1048266314.8146.18.camel@Thief>
	 <200303212014.29775.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-AQLtBikDfi5UFbNv0akq"
Return-path: <reiserfs-list-return-13328-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303212014.29775.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-AQLtBikDfi5UFbNv0akq
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-03-21 at 11:14, Vitaly Fertman wrote:
> Hi,=20
>=20
> On Friday 21 March 2003 20:05, Alex Malinovich wrote:
> > I've been trying to rebuild the tree on a reiserfs partition that seems
> > to have gotten corrupted during a resize operation. Unfortunately, I've
> > gone from having one or two directories not accessible to having the
> > whole partition not accessible now. Everything seems to go ok until pas=
s
> > 2. At this point I start getting this error:
> >
> > "do_pass_2: The block (4901823) is in the tree already. Should not
> > happen."
>=20
> It seems that reiserfsck was built on another computer, which has some=20
> other libs version, not statically. Would you try to rebuild it and try=20
> again.

I just downloaded the source and built it and it worked! Thank you VERY
much!

--=20
Alex Malinovich
Support Free Software, delete your Windows partition TODAY!
Encrypted mail preferred. You can get my public key from any of the
pgp.net keyservers. Key ID: A6D24837

--=-AQLtBikDfi5UFbNv0akq
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+e84iBPYwh6bSSDcRAto6AJ9xS9uDMp+TGzSgoDlhzDKswouiYgCfUmWN
jDG9XEpwCFTMgHGar8KAijo=
=8TbG
-----END PGP SIGNATURE-----

--=-AQLtBikDfi5UFbNv0akq--

