From: Christophe Saout <christophe@saout.de>
Subject: Re: Broken reiser4 FS
Date: Wed, 25 Aug 2004 14:22:31 +0200
Message-ID: <1093436551.10608.7.camel@leto.cs.pocnet.net>
References: <412C7634.3040908@flipperit.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-5hrRWiQkltvF0d1r7Ke/"
Return-path: <reiserfs-list-return-20498-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <412C7634.3040908@flipperit.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Ari =?ISO-8859-1?Q?Sovij=E4rvi?= <apz@flipperit.net>
Cc: reiserfs-list@namesys.com

--=-5hrRWiQkltvF0d1r7Ke/
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 25.08.2004, 14:21 +0300 schrieb Ari Sovij=C3=A4rvi:

> I tested the reiser4 shipped with mm-patch, and I managed to corrupt the=20
> filesystem after the first unmount. See the URL for details:
> http://apz.fi/apz/reiser4.txt
>
> CHECKING SEMANTiC TREE
> FSCK: Directory [2a:6d703300000000:10001] (dir40), node [2281606], item [=
0],=20
> unit [4]: entry has wrong offset=20
> [10001:0(NAME):1446f6e2048756f:6e6f74202d204879:d5b58f25a1408e04]. Should=
 be=20
> [10001:0(NAME):1446f6e2048756f:6e6f74202d204879:6e433d19ec834164].=20

Just FYI:

I've also seen a bunch of these on my notebook. I'm ruling out memory
problems, my hardware is reliable.

fsck then removed the directories. I'm not exactly sure which directory
was damaged, but it seems the directoriy were a temporary one (?), I
found some library files in lost+found but the ones in /usr/lib were
still there.

My notebook is sometimes low on memory and swaps a lot while I'm doing
some disk I/O. This is perhaps increasing the chance of getting this
corruption, I'm not sure.

I panicked and didn't create a metadata dump or something, I justed
wanted it fixed before the damage starts to spread. Sorry for that.


--=-5hrRWiQkltvF0d1r7Ke/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBLISHZCYBcts5dM0RAoDhAKCjXzv0OLMSTCwfQksi5FXqWlSoIQCghY/N
AakPa+OVsh/Xok9Lg9xfhvE=
=zSZ3
-----END PGP SIGNATURE-----

--=-5hrRWiQkltvF0d1r7Ke/--

