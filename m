From: Ben Martin <monkeyiq@users.sourceforge.net>
Subject: Selecting unixfile plugin
Date: Mon, 05 Jun 2006 17:06:20 +1000
Message-ID: <1149491181.3926.59.camel@sam>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-9DAWti/rMWNi0vH/vRBN"
Return-path: <reiserfs-list-return-28724-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-9DAWti/rMWNi0vH/vRBN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,
  After much digging around as to how to use the reiser4 compression
plugin I have found this message.
http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D113190018626958&w=3D2

I'm using 2.6.15 + resier4 + metas patches.

I'm trying to set the default plugin to cryptcompress for a directory in
a r4 filesystem.

It seems that the plugins/regular is thought to be a directory when I=20
echo "cryptcompress\0" >|plugins/regular

Trying various combinations of things inside regular/ like echoing into
label etc don't seem to have an effect when read back again.

It seems from the below link and grepping the 2.6.15 reiser4 patch that
echoing "cryptcompress" >| mydir/..../plugins/regular/label
should make new files in mydir use the cryptcompress plugin by defualt.
http://www.namesys.com/cryptcompress-related_plugins.html

The info like http://www.namesys.com/cryptcompress_design.html seems to
be targetted toward developers rather than users. Are there any
references or logs of command line interactions to enable and tweak
compression/crypto aimed at end user consumption?

Also from what I've seem a=20
sed s/metas/..../g=20
might be in order for
http://www.namesys.com/v4/pseudo.html



--=-9DAWti/rMWNi0vH/vRBN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBEg9fssIKOrI+5WvMRAlFAAKDCdEdKpRpT7hbylabtbSVPxw2KoQCgoAOh
Zo1Giz/bNr6qERzpOiq6tDI=
=UCxs
-----END PGP SIGNATURE-----

--=-9DAWti/rMWNi0vH/vRBN--

