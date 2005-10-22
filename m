From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: Reiser4 + laptop -> ouch
Date: Sat, 22 Oct 2005 17:08:19 +0100
Message-ID: <1129997299.7270.7.camel@teratron.lan.etheus.net>
References: <43537D56.3020208@eastwind.ru> <op.sysz7pxnth1vuj@localhost>
	 <200510182209.19370.zam@namesys.com> <op.syxzvsesth1vuj@localhost>
	 <b14e81f00510201300k74c3d428rfac2dbb2969e3e3d@mail.gmail.com>
	 <1e1a7e1b0510210438s57beb1b8ra6d359610704d72a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-QBcsWwFDpWfpX4RcbGNj"
Return-path: <reiserfs-list-return-26604-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1e1a7e1b0510210438s57beb1b8ra6d359610704d72a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-QBcsWwFDpWfpX4RcbGNj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2005-10-21 at 21:38 +1000, James Rayner wrote:=20
> Suspend2 has been improved substantially, and works for most people,
> if they put a few minutes of their time into setting it up properly.
> It has been cleaned up substantially and wont do 'funky things' like
> you suggest.
>=20
> An -mm kernel is more likely to do funky things, then a well patched
> suspend2 + reiser4. Try archck, http://iphitus.loudas.com/archck.php

I can confirm that this combination works VERY reliably for me. I also
have the fbsplash patches, which gives that extra polished feel.

I have been using reiser4 since it's release and have had no serious
problems with the fs that I didn't cause myself. The issues encountered
were when I filled up the root partition, things were not handled
particularly gracefully (system started to crawl, very difficult to free
up some space).=20
The only other thing was when I accidentally did a fsck.reiser4
--build-sb --build-fs /dev/hda instead of /dev/hda1. After about 30
minutes of running, I realised. After manually rebuilding the partition
table and re-running fsck.reiser4 /dev/hda1, the filesystem mostly
survived, with only a few corrupt files.

Well done reiser4!

--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-QBcsWwFDpWfpX4RcbGNj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDWmPz5OI9vmOoVqERAn11AJ90ggryy6TMmTvOXZRERpWt4FI+pACglqoE
NbvY7zpvgsa3ZWI2dbT6dIc=
=1fx+
-----END PGP SIGNATURE-----

--=-QBcsWwFDpWfpX4RcbGNj--

