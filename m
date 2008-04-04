From: Zan Lynx <zlynx@acm.org>
Subject: Re: bad block management
Date: Fri, 04 Apr 2008 10:12:09 -0600
Message-ID: <1207325530.7624.2.camel@localhost>
References: <16413477.post@talk.nabble.com>
	 <alpine.DEB.1.10.0804012050350.7128@sheep.housecafe.de>
	 <47F28DE5.1060402@emc.com>  <47F29257.3000502@suse.com>
	 <1207268072.379391.7.camel@localhost>
	 <02D8FA59-0FF5-444C-BAAF-17A4BEA847AF@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-OUdpAqJ4BRLuR+LIqQqy"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <02D8FA59-0FF5-444C-BAAF-17A4BEA847AF@telegraphics.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Toby Thain <toby@telegraphics.com.au>
Cc: Jeff Mahoney <jeffm@suse.com>, ric@emc.com, Christian Kujau <lists@nerdbynature.de>, kgp <jyotiv@tataelxsi.co.in>, reiserfs-devel@vger.kernel.org


--=-OUdpAqJ4BRLuR+LIqQqy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2008-04-04 at 00:21 -0400, Toby Thain wrote:
> On 3-Apr-08, at 8:14 PM, Zan Lynx wrote:

> > A RAID media verify or a badblocks -n run can usually fix these.
>=20
> Only if your RAID uses CRCs (most don't).
>=20
> ZFS is the real answer to undetected corruption.

If one hard disk returns a CRC read error for a block but the other
RAID-1 mirror disk or the parity disk(s) return good blocks, the array
controller should know which data is good and which is bad in order to
rewrite a good copy.
--=20
Zan Lynx <zlynx@acm.org>

--=-OUdpAqJ4BRLuR+LIqQqy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEABECAAYFAkf2U1kACgkQolqWs/Y4NLyEOwCfStlBt2OHk2KaPcBaWrJuPFYT
agIAnifBddDqW6w7ZdlzMtQVEs1mIFwS
=uJRa
-----END PGP SIGNATURE-----

--=-OUdpAqJ4BRLuR+LIqQqy--

