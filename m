From: Lares Moreau <lares.moreau@gmail.com>
Subject: Re: More from the Weekday Warriors
Date: Fri, 11 Nov 2005 10:23:03 -0700
Message-ID: <1131729783.6861.22.camel@localhost>
References: <200511092347.32743.pvh@uvic.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-08Kd7Nrkum4ug286fgHq"
Return-path: <reiserfs-list-return-26863-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511092347.32743.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Peter van Hardenberg <pvh@uvic.ca>
Cc: reiserfs-list@namesys.com

--=-08Kd7Nrkum4ug286fgHq
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2005-11-09 at 23:47 -0800, Peter van Hardenberg wrote:
> Question for the Day:
> ---------------------------
> What files need modification to add a new plugin which does not require i=
node=20
> extensions?
>=20
> How can I set the plugins governing a file from userspace? Can it be done=
 from=20
> within fourdot? My experiments were unsuccessful.
>=20
> What would a "hello world" plugin look like? It would be valuable to have=
 one=20
> lying around for future developers. We have discussed creating one, but I=
=20
> feel as though "plugging" and "unplugging" plugins requires a huge amount=
 of=20
> work right now and that would reduce its utility. Perhaps it would make s=
ense=20
> if it were distributed as a patch with a plugin developer's guide.

A 'hello world' plugin would be useful indeed to new devs/weekend
warriors,  As for 'plugging' and 'unplugging', we must remember that
reiser4 is coldplug, not hotplug. A hello_world.patch would be great. As
for the PITA factor, I don't feel it is a significant issue, as if you
are hacking the code, you expect things to break and take some time.

I have found in my travels a simple hello_world fs[1] written by Ravi
Kiran[2].  If there could be a page with examples, like [3] for reiser4,
it would be a great benifit to reiser4 as well as the entire fs-dev
community.

As an aside, Geocities.. ICK, we (as a whole) need to get this person a
real web provider IMO.

[1] http://www.geocities.com/ravikiran_uvs/articles/rkfs.html
[2] uvsravikiran@gmail.com
[3] http://www.geocities.com/ravikiran_uvs/
--=20
Lares Moreau <lares.moreau@gmail.com>  | LRU: 400755 http://counter.li.org
Gentoo x86 Arch Tester                 |               ::0 Alberta, Canada
Public Key: 0D46BB6E @ subkeys.pgp.net |           Encrypted Mail Prefered
Key fingerprint =3D 0CA3 E40D F897 7709 3628  C5D4 7D94 483E 0D46 BB6E

--=-08Kd7Nrkum4ug286fgHq
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDdNN3fZRIPg1Gu24RAvBtAJ9xhmooyHFYn253bn5ny43msmvWywCdEPRC
QXIGK75QrBnQUBQM+SE6/+g=
=EXAG
-----END PGP SIGNATURE-----

--=-08Kd7Nrkum4ug286fgHq--

