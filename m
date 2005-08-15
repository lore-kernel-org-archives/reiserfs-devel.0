From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Reiser4 and ACLs
Date: Mon, 15 Aug 2005 14:34:01 -0600
Message-ID: <1124138041.11626.4.camel@localhost>
References: <42FEC9F1.9040709@perkel.com>
	 <20050814080812.GA22983@king.bitgnome.net> <42FF388F.3010506@perkel.com>
	 <b14e81f005081405316a06995c@mail.gmail.com>
	 <17151.17921.996376.693013@gargle.gargle.HOWL>
	 <87k6in5dri.fsf@evinrude.uhoreg.ca>
	 <17152.63727.435377.223362@thebsh.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-p1ReSEuaX4xzS/xIrs80"
Return-path: <reiserfs-list-return-25498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17152.63727.435377.223362@thebsh.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, reiserfs-list@namesys.com

--=-p1ReSEuaX4xzS/xIrs80
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-08-16 at 00:19 +0400, Nikita Danilov wrote:
> Hubert Chan writes:
>  > On Sun, 14 Aug 2005 17:24:17 +0400, Nikita Danilov <nikita@clusterfs.c=
om> said:
>  >=20
>  > > Not exactly. As a matter of fact, ACL and EA support was already
>  > > implemented in reiser4. But it used standard xattrs API to interface
>  > > to the user-land, and it was decided that reiser4 should go
>  > > sys_reiser4() route instead. So, it was reaped.
>  >=20
>  > Does this mean that file-as-dir has also been abandoned?
>=20
> Sorry, it seems I was too vague. It's exactly the opposite: standard
> xattr API was abandoned in favour of accessing EAs and ACLs through
> pseudo files. The latter method is not implemented yet, and I don't know
> how stable sys_reiser4() API is currently. Hans is the proper person to
> ask.

There is no reason not to support the standard xattr calls, whether it
is done in-kernel or in the C library.  The pseudo files would also be
good, but several programs already use the current xattr support.

Namesys may not want to add the support themselves but I hope they do
not reject contributed code for it.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-p1ReSEuaX4xzS/xIrs80
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDAPw4G8fHaOLTWwgRApJeAJ4/U5u9S9z5JmpmfJ/lahw1cymRyACeMNmG
Jys2Z0VUH/dEiIsRfTBjwsI=
=RwEv
-----END PGP SIGNATURE-----

--=-p1ReSEuaX4xzS/xIrs80--

