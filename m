From: Daniel Egger <degger@fhm.edu>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: 28 Jul 2003 15:06:59 +0200
Message-ID: <1059397619.31053.27.camel@sonja>
References: <3F1EF7DB.2010805@namesys.com>
	 <1059062380.29238.260.camel@sonja>
	 <16160.4704.102110.352311@laputa.namesys.com>
	 <1059093594.29239.314.camel@sonja>
	 <16161.10863.793737.229170@laputa.namesys.com>
	 <1059142851.6962.18.camel@sonja>  <3F23CCBC.9070600@namesys.com>
	 <1059315409.10692.215.camel@sonja>  <3F251A97.9010409@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-SOYFYk5ha6maqxsBoqsI"
Return-path: <reiserfs-list-return-15094-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F251A97.9010409@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

--=-SOYFYk5ha6maqxsBoqsI
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Mon, 2003-07-28 um 14.44 schrieb Hans Reiser:

> >This looks fine for normal harddrives put on flash you'd probably like
> >to write the data evenly over the free space in some already formatted
> >section still leaving the oportunity to format some other sectors to not
> >run out of space.

> I was not able to parse the sentence above.;-)

s/put/but/

As already mentioned the flash chips have to be erased before they can
be written. The erasesize is much larger than the typical block size
which means that although a block doesn't contain valid data it still
contains something which means that it cannot be written until it was
erased. That's why JFFS2 is using garbage collection to reclaim unused
but (at the moment) unusable space.

> No, you could be more clever than that.

Sure. :)

--=20
Servus,
       Daniel

--=-SOYFYk5ha6maqxsBoqsI
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/JR/ychlzsq9KoIYRAlbGAJ99MszvmC3oZ6r+o8z2RzxnYcyb1gCeJQ8h
mAvqFatTQHfyoFL08ut8EBU=
=SxsM
-----END PGP SIGNATURE-----

--=-SOYFYk5ha6maqxsBoqsI--

