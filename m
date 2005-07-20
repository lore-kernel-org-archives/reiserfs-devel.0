From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Fastest way to "find / -mtime +7".....
Date: Wed, 20 Jul 2005 12:26:44 -0400
Message-ID: <20050720162644.GC6704@schatzie.adilger.int>
References: <FD5AA849-D432-4881-B70F-E71369520749@surfcity.net> <1121798933.15596.13.camel@localhost> <20050719200902.GM1508@vestdata.no> <1121810424.15596.19.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Return-path: <reiserfs-list-return-25213-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1121810424.15596.19.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Ragnar =?utf-8?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Ed Walker <ewalker@surfcity.net>, reiserfs-list@namesys.com

--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 19, 2005  16:00 -0600, Jonathan Briggs wrote:
> How about some kind of stat-data readahead logic?  If the first two or
> three directory entries are stat'd, queue up the rest (or next
> hundred/thousand) of them.  If the disk queue is given the whole pile of
> stat requests at once instead of one at a time, it should be able to
> sort them into a reasonable order.
>=20
> This might even be a VFS thing to do instead of per-FS.

This is something I would be very interested in.  Having a pipeline of
stats generated when an app does readdir + in-order stat would help
reduce latency a great deal for network filesystems.

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.


--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFC3ntEpIg59Q01vtYRAr0ZAKCXgUleLBC+UyUtYLpeF6KHgOMKggCcCGYN
9XLhnNPwinuuDW2ms9URdoA=
=ho5d
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
