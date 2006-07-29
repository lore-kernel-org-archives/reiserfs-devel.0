From: David Masover <ninja@slaphack.com>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed
 by kernelnewbies.org regarding reiser4 inclusion)
Date: Sat, 29 Jul 2006 13:31:59 -0500
Message-ID: <44CBA99F.2040306@slaphack.com>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl>	<44CA31D2.70203@slaphack.com>	<Pine.LNX.4.64.0607280859380.4168@g5.osdl.org>	<44C9FB93.9040201@namesys.com>	<44CA6905.4050002@slaphack.com>	<44CA126C.7050403@namesys.com>	<44CA8771.1040708@slaphack.com>	<44CABB87.3050509@namesys.com> <17611.21640.208153.492074@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="------------enigB9E0BFBC06FA43D6B113FBF9"
Return-path: <reiserfs-list-return-29252-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17611.21640.208153.492074@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, Jeff Garzik <jeff@garzik.org>, Andrew Morton <akpm@osdl.org>, Theodore Tso <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

--------------enigB9E0BFBC06FA43D6B113FBF9
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Nikita Danilov wrote:

> As you see, ext2 code already has multiple file "plugins", with
> persistent "plugin id" (stored in i_mode field of on-disk struct
> ext2_inode).

Aha!  So here's another question:  Is it fair to ask Reiser4 to make its
plugins generic, or should we be asking ext2/3 first?


--------------enigB9E0BFBC06FA43D6B113FBF9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iQIVAwUBRMupn3gHNmZLgCUhAQpg9w//QOGlEsogxzZ3lLeUV68odeka5lfGp2ai
T6m07iECAKKHcm9Jw+vWuKAeZBr20Jrw0AYC163c7jdVA420VH0/8ou5IUsMRzGx
9k5bT/QjSPu52432mrn3iY8pqGDu50j3hggCie4O1Fy0bMq2Aqg5D5tdw53/kRem
VxWA4SP5dTIMJ/Vdf7PpC/CvZ2d6Hs4K70LzFW+ojTYB1ezM4LhvVJ3PSo8DE6TA
nqkRUPuHfKtjoWXM77I1vcVckV4NEuW2ta3Lv8j8T8qivHwk4pt6IttoDKke+rsx
fQBYluN2jRDFX0SxgqE75R/Q26l8aCvVac42qJ0oIHtVcskL4Q/Gp6qo96qRbWft
TIe01aImVUUjVcA3PaJtwxa83Uzo9FRam9PHRrczQRysEWe7Spy3EJ2a1ExTSVUM
aoe4SL23wpUntXPyVcOeBMyoPAWT4gHyKVGcJVVPW5CUDU/Kv0+KoQyai1Ped/7x
sSNLNPAMxqpgJ91fN/SojM0ErijmHLaNI7sCL9mor23sPs3a0oUzyDA7wr7FxxqP
Y6fEgIQ7KQ69j59UzvKTLnkKVmZjF8M/UuJrUfgIOx3u0EvHdq+qxEAJ1xFYSYgX
W8xkfOKwHQd8dwnV2u+SdBEOEX47gtcqcRPabm5A5zNyD8ALMue2bp3dPPS2A3uz
abCP6hKHon4=
=xEQW
-----END PGP SIGNATURE-----

--------------enigB9E0BFBC06FA43D6B113FBF9--
