From: Christophe Saout <christophe@saout.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 23:48:37 +0200
Message-ID: <1093556917.13881.78.camel@leto.cs.pocnet.net>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com>
	 <200408262128.41326.vda@port.imtp.ilyichevsk.odessa.ua>
	 <20040826193617.GA21248@arlut.utexas.edu>
	 <20040826201639.GA5733@mail.shareable.org>
	 <1093551956.13881.34.camel@leto.cs.pocnet.net>
	 <16686.23053.559951.815883@thebsh.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZhoNKf2SybDMgqzRKbN2"
Return-path: <reiserfs-list-return-20820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16686.23053.559951.815883@thebsh.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Jamie Lokier <jamie@shareable.org>, Jonathan Abbey <jonabbey@arlut.utexas.edu>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Rik van Riel <riel@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Diego Calleja <diegocg@teleline.es>, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

--=-ZhoNKf2SybDMgqzRKbN2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 27.08.2004, 01:45 +0400 schrieb Nikita Danilov:

>  > At least in reiser4 they don't have, or at least you can't access them=
.
>=20
> They do.
>=20
>  > ln -s foo bar; cd bar/metas shows me the content of foo/metas.
>=20
> That's because lookup for "bar" performs symlink resolution.

So I can't access them and it is pointless. ;-)

BTW, I can do a cd metas/metas/metas/metas/plugin/metas... I don't think
this makes sense. :)


--=-ZhoNKf2SybDMgqzRKbN2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLlq0ZCYBcts5dM0RAoGxAKCKxze3+2ks74pjBrvYJmuP+s7hIwCfYSLg
oLP85a2FwO7dArKCzTd71vs=
=UYAU
-----END PGP SIGNATURE-----

--=-ZhoNKf2SybDMgqzRKbN2--

