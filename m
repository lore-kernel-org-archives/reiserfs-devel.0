From: "Lamont R. Peterson" <lamont@gurulabs.com>
Subject: Re: mongo_copy: cp: cannot stat
	`/mnt/testfs/testdir0-0-0/f92':	Input/output error
Date: Wed, 04 Aug 2004 18:14:15 -0600
Message-ID: <1091664855.2554.0.camel@wraith.lrp.advansoft.us>
References: <20040804065840.17C7915C7C@mail03.powweb.com>
	 <4110A0FA.3030007@namesys.com> <4110A38E.6070905@namesys.com>
	 <4110A561.9050200@namesys.com> <4110DBD6.7010904@namesys.com>
	 <20040804183801.GU1284@nysv.org>  <41115962.1030407@namesys.com>
	 <1091659605.8276.3.camel@leto.cs.pocnet.net> <411177E1.1040209@namesys.com>
	 <1091664410.9177.2.camel@leto.cs.pocnet.net>
Reply-To: lamont@gurulabs.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-OVEt7I0aviNjx8reAzEQ"
Return-path: <reiserfs-list-return-20011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1091664410.9177.2.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-OVEt7I0aviNjx8reAzEQ
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-08-04 at 18:06, Christophe Saout wrote:
> Am Mittwoch, den 04.08.2004, 16:57 -0700 schrieb Hans Reiser:
>=20
> > >>V4 likes stack.  If someone can convince me that kmalloc is as effici=
ent=20
> > >>as stack, I'd like to hear it, because I know I lack expertise on the=
 topic.
> > >>   =20
> > >>
> > >
> > >The disassembled fast path of kmalloc (with a size of the object known
> > >at compile time) fits on one page. Most of the time it will just retur=
n
> > >a pointer from a pool of cached and cache-hot objects.
> > >
> > whereas using stack is 0 instructions or?
>=20
> More or less. But who's counting? ;-)

I do not think it likely to be less, eh? ;-)
--=20
Lamont R. Peterson <lamont@gurulabs.com>
Senior Instructor
Guru Labs, L.C. http://www.GuruLabs.com/

--=-OVEt7I0aviNjx8reAzEQ
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBEXvWRK8Q4zt1QRURAmInAJ0YQMQqU6HwvCBYJjSENDlMunxQhQCg1R3G
wGlyXJV8Ns2SAZoV3SnxZik=
=VUoE
-----END PGP SIGNATURE-----

--=-OVEt7I0aviNjx8reAzEQ--

