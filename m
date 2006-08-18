From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: ReiserFS v3 choking when free space falls below 10% - FIXED
Date: Fri, 18 Aug 2006 10:25:36 -0700
Message-ID: <1155921936.2798.6.camel@ipso.snappymail.ca>
References: <200608181641.48052.bbutscheidt@yahoo.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-iyq1IJ3H9tYq97Q8hZSC"
Return-path: <reiserfs-list-return-29628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608181641.48052.bbutscheidt@yahoo.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Bernd Butscheidt <bbutscheidt@yahoo.de>
Cc: reiserfs-list@namesys.com

--=-iyq1IJ3H9tYq97Q8hZSC
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Interesting that you sent this today. Just last night I really started
to notice slow down on my MythTV box. It had been going on for a while,
but I finally got fed up last night enough to look in to it, and what I
found was this:

 0  1    324   4904  10184  67328    0    0  1408  1060 1033  1393 17  5
5 73
 0  1    324   5204  10248  66924    0    0  1284  3372  872  1324 16  5
23 57
 0  1    324   5288  10264  66748    0    0  1280  1696  856  1361 13  2
23 62
 1  1    324   5076  10228  67016    0    0  1032  2264  872  1399 16  2
46 37
 0  3    324   5160  10212  67136    0    0  1428  2064 1007  1398 14  4
21 61
 0  1    324   4896  10272  67168    0    0  1124  1712  867  1358 15  5
21 59
 0  1    324   5024  10256  67160    0    0  1412  2328 1013  1379 16  4
21 59
 0  1    324   5100  10252  67012    0    0  1024  1704  848  1378 14  4
40 43
 0  1    324   5584  10196  66552    0    0  1284  1672  856  1360 13  4
28 55
 0  1    324   5608  10200  66816    0    0  1168  2344  940  1489 17  4
27 52
 0  0    324   5880  10280  66400    0    0  1288  3192 1092  1447 20  4
31 45
 1  0    324   5824  10160  66564    0    0  1152  1996  997  1366 14  3
27 56
 1  0    324   5716  10144  66680    0    0  1280  1616  855  1364 16  3
12 70
 0  0    324   6220  10084  66140    0    0  1152  1960  991  1351 14  4
19 63
 0  0    324   6120  10076  66356    0    0  1416  2184 1122  1556 19  4
48 29

Why is IO wait so high when its only reading/writing combined less then
4mb/sec? Before the patch there was a "cut off point" where the box just
died, but now it seems like the box is just always slow. Could the patch
be causing even more fragmentation then before, so while the corner case
of virtually bringing the box to its knees is fixed, it is just always
slow now?

BTW: The vmstat output was with 25gb free, I've seen it happen with as
much as 40gb free too. :(

I really hope Reiser4 gets in to the kernel soon, hopefully allocate on
flush greatly reduces the fragmentation caused by Myth.

On Fri, 2006-08-18 at 16:41 +0200, Bernd Butscheidt wrote:
> Hello,
>=20
> I'm hope I'm doing this right here,
>=20
> The question is:
>=20
> Is or since when is the the patch which helped Mike Benoit integrated to =
the=20
> kernel source?
>=20
> Greetings
> bernd_b
--=20
Mike Benoit <ipso@snappymail.ca>

--=-iyq1IJ3H9tYq97Q8hZSC
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBE5fgQMhKjsejwBhgRAiDEAJ9DrSLtsmoJnOmu8KtxQYbH2UiVywCgncIv
cg05xzzG8bjtNRiLwfZLB1w=
=Vi9A
-----END PGP SIGNATURE-----

--=-iyq1IJ3H9tYq97Q8hZSC--

