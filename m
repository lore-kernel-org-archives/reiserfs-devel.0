From: Daniel Egger <degger@fhm.edu>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: 27 Jul 2003 16:16:49 +0200
Message-ID: <1059315409.10692.215.camel@sonja>
References: <3F1EF7DB.2010805@namesys.com>
	 <1059062380.29238.260.camel@sonja>
	 <16160.4704.102110.352311@laputa.namesys.com>
	 <1059093594.29239.314.camel@sonja>
	 <16161.10863.793737.229170@laputa.namesys.com>
	 <1059142851.6962.18.camel@sonja>  <3F23CCBC.9070600@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-uLKTo2MwKam99kLUiMM7"
Return-path: <reiserfs-list-return-15074-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F23CCBC.9070600@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

--=-uLKTo2MwKam99kLUiMM7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Son, 2003-07-27 um 14.59 schrieb Hans Reiser:

> I thought that close was fine, it was putting it in the same block that=20
> was the problem?

This looks fine for normal harddrives put on flash you'd probably like
to write the data evenly over the free space in some already formatted
section still leaving the oportunity to format some other sectors to not
run out of space.

> Again, I think this is best solved in the device layer.

A device layer that shuffles around sectors would have interesting
semantics, like hardly being portable because one would have to use
exactly the same device driver with the same parameters to use the
filesystem and thus retrieve the data.

--=20
Servus,
       Daniel

--=-uLKTo2MwKam99kLUiMM7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/I97Rchlzsq9KoIYRAhBGAJ9ZHkpGRFX2UMi+GJcynuxVJGWt3ACggGE+
bNFnUATVQw/U056ePZLXErY=
=uLle
-----END PGP SIGNATURE-----

--=-uLKTo2MwKam99kLUiMM7--

