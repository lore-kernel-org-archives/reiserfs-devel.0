From: Craig Shelley <craig@microtron.org.uk>
Subject: Re: A Word of Warning about Linux Software Raid
Date: Sun, 13 Aug 2006 22:02:01 +0100
Message-ID: <1155502922.23465.5.camel@localhost.localdomain>
References: <1155319786.8121.43.camel@localhost.localdomain>
	 <20060811213450.cf67e32e.reiser4@blinkenlights.ch>
	 <20060812123342.BEFC03BE@philou.gramoulle.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zrjnkCyyhZ5ospQRUxpF"
Return-path: <reiserfs-list-return-29590-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060812123342.BEFC03BE@philou.gramoulle.local>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-zrjnkCyyhZ5ospQRUxpF
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, 2006-08-12 at 14:33 +0200, Philippe Gramoull=E9 wrote:
> Hello,
>=20
> On Fri, 11 Aug 2006 21:34:50 +0200
> Adrian Ulrich <reiser4@blinkenlights.ch> wrote:
>=20
>   | > It seems that the kernel does not check the integrity of the data o=
n mirrored raid, =20
>   |=20
>   | It does if you tell the kernel to do so:
>   |=20
>   | # echo check > /sys/block/md0/md/sync_action=20
>=20
> I have just upgraded from an older kernel to be able to use such a functi=
onality but :

I too have just upgraded, kernel from 2.6.14.3 to 2.6.17.8, and from
debian sarge to etch, and things are much nicer. Debconf even asked how
often/when the I would prefer the disks to be checked.
I also set up smartmontools since this newer kernel supports the SMART
on SATA.

Thanks for pointing this out.

Regards,

--=20
Craig Shelley
EMail: craig@microtron.org.uk
Jabber: shell@jabber.earth.li

--=-zrjnkCyyhZ5ospQRUxpF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBE35NJ5OI9vmOoVqERAphKAJ9iFhytNAi4uglgrcyvIATnEgIowwCeMXRi
pL779AxUJ3+04oE4PZ7BjeY=
=mbM7
-----END PGP SIGNATURE-----

--=-zrjnkCyyhZ5ospQRUxpF--

