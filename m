From: Daniel Egger <degger@fhm.edu>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: 25 Jul 2003 16:20:52 +0200
Message-ID: <1059142851.6962.18.camel@sonja>
References: <3F1EF7DB.2010805@namesys.com>
	 <1059062380.29238.260.camel@sonja>
	 <16160.4704.102110.352311@laputa.namesys.com>
	 <1059093594.29239.314.camel@sonja>
	 <16161.10863.793737.229170@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zZxwTz4+4qIfWF1DwMQj"
Return-path: <reiserfs-list-return-15045-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16161.10863.793737.229170@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Hans Reiser <reiser@namesys.com>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

--=-zZxwTz4+4qIfWF1DwMQj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Fre, 2003-07-25 um 15.02 schrieb Nikita Danilov:

> No special measures are taken to level block allocation. Wandered blocks
> are allocated to improve packing i.e., place blocks of the same file
> close to each other. Actually, it tries to place tree nodes in the
> parent-first order.

So the new blocks are created as close as possible to the old blocks
instead of say spreading them as far as possible. This is pretty bad for
usage in the embedded world but I guess this is not the market you're
aiming at. :(

--=20
Servus,
       Daniel

--=-zZxwTz4+4qIfWF1DwMQj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/ITzDchlzsq9KoIYRAjCkAJ9NgpQRLL498Zy+8OW4MSxcmwNIbwCglW/L
8aA88cOOibNYjlaCVcGV2Ic=
=oIIy
-----END PGP SIGNATURE-----

--=-zZxwTz4+4qIfWF1DwMQj--

