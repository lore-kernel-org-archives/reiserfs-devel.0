From: Lares Moreau <lares.moreau@gmail.com>
Subject: Re: Versioning Plugin
Date: Sat, 12 Nov 2005 15:57:35 -0700
Message-ID: <1131836255.30126.9.camel@localhost>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511111656.04891.pvh@uvic.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-j3qiELpGhyC6YUTAPj0q"
Return-path: <reiserfs-list-return-26889-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200511111656.04891.pvh@uvic.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Cc: reiserfs-list@namesys.com

--=-j3qiELpGhyC6YUTAPj0q
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Has a ;real' revision control system been considered? Something that
doesn't need to copy the entire file on change.  Taking the techiques
learned from CVS/Subverion et.al. and implimenting a variation of the
versioning database within the file system.

On Fri, 2005-11-11 at 16:56 -0800, Peter van Hardenberg wrote:
> On November 11, 2005 05:59 am, John Gilmore wrote:
> > Does anybody remember GoBack? It was a versioning
> > system for windows 95/98 that was incredibly flexible and useful. Track=
ed
> > all changes to the whole disk. Old versions of a file? no problem. grab=
 an
> > old version of a directory for referance temporarily? easy. Got a virus=
?
> > revert the whole HD, and then grab the newer copies of your documents a=
nd
> > saved games as needed.
>=20
> My thoughts on this:
>=20
> The versioning would be an audit plugin. When the file is modified, tag t=
he=20
> current version, copy it into a sub-directory (oh, I don't know, say=20
> file/.revisions/<number/date>), and disable write access to it. You might=
 not=20
> even need extended filesystem attributes for this, but they would be hand=
y=20
> for tagging particular versions.
>=20
> Copy-on-write would make this action extremely cheap, only adding a coupl=
e of=20
> extra writes to make it work.
>=20
> Given working resource directories, COW, and the ability to set plugins, =
this=20
> might be a relatively easy hack to implement. Given an efficient xpath sh=
ell,=20
> you could even create a view of your drive on a particular day.=20
>=20
> If you had a file that was changing often, perhaps you could set an attri=
bute=20
> on that file which told it only to clone the file every once in a while.=20
>=20
> Come to think of it, a userspace daemon could run in the background and=20
> replace the need for a plugin, which is probably the better solution. The=
n=20
> you just need COW and files which can contain resources.
>=20
> -pvh
>=20
--=20
Lares Moreau <lares.moreau@gmail.com>  | LRU: 400755 http://counter.li.org
Gentoo x86 Arch Tester                 |               ::0 Alberta, Canada
Public Key: 0D46BB6E @ subkeys.pgp.net |           Encrypted Mail Prefered
Key fingerprint =3D 0CA3 E40D F897 7709 3628  C5D4 7D94 483E 0D46 BB6E

--=-j3qiELpGhyC6YUTAPj0q
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDdnNffZRIPg1Gu24RAjqkAKDAFKIV/IxPNYWE0MoRBTyVKlwPcACfZzcm
ArQn/7EZyNuZUQImd74g5no=
=D40J
-----END PGP SIGNATURE-----

--=-j3qiELpGhyC6YUTAPj0q--

