From: Andreas =?iso-8859-1?Q?Sch=E4fer?= <gentryx@gmx.de>
Subject: Re: reiser4 status (correction)
Date: Sat, 22 Jul 2006 00:29:17 +0200
Message-ID: <20060721222917.GA15944@wintermute>
References: <44BFFCB1.4020009@namesys.com> <44C043B5.3070501@slaphack.com> <44C093D2.1040703@namesys.com> <1153514509.6659.41.camel@ipso.snappymail.ca> <44C141C4.1030802@slaphack.com> <1153517853.6659.56.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Return-path: <reiserfs-list-return-29115-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1153517853.6659.56.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 14:37 Fri 21 Jul     , Mike Benoit wrote:
> No Linux file system that I'm aware of has a defragmentor, but they DO
> become fragmented, just not near as bad as FAT32 used to when MS created
> their defragmentor.

Forgotten ext2? ;-) Funny thing: If your ext3 got too fragmented:
convert it back to ext2, defrag and reconvert it again to ext3. All of
this can be done "in place", i.e. without moving the data to other
partitions etc.

-Andreas

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQFEwVU9xQzSAzXqsyYRAm9HAKCsbLtFYRrRLx0iA76j2q2qG9cewgCfWLKu
XhH0ceVNI8EQNvr3AyfEMQs=
=i3kI
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
