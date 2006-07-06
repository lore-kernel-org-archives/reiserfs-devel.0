From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 06 Jul 2006 11:47:14 -0700
Message-ID: <1152211635.30139.72.camel@ipso.snappymail.ca>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>
	 <1151608355.6335.79.camel@tribesman.namesys.com>
	 <1151612146.11510.4.camel@ipso.snappymail.ca>
	 <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>
	 <1152059846.30139.11.camel@ipso.snappymail.ca>
	 <44AB25EE.8030702@namesys.com>
	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>
	 <1152200638.30139.45.camel@ipso.snappymail.ca> <44AD5020.6050803@suse.com>
	 <44AD5287.4090208@namesys.com>  <44AD5430.1090701@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-NyXpFB7obGnTu51cgfuS"
Return-path: <reiserfs-list-return-28925-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44AD5430.1090701@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: Hans Reiser <reiser@namesys.com>, Jure =?UTF-8?Q?Pe=C4=8Dar?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

--=-NyXpFB7obGnTu51cgfuS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2006-07-06 at 14:19 -0400, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hans Reiser wrote:
> > There should be no possible fragmentation that would increase CPU usage
> > like that.  With the current algorithms, in which you check one field i=
n
> > the bitmap to see if it has any free blocks, it should not be possible
> > for scanning bitmaps to take so much time......
> >=20
> > There must be a bug in there.
>=20
> I'm sure there is, but it's a bug that others don't seem to be seeing,
> including myself, and Mike reported he's not experiencing the problem
> anymore. Given my current workload, unless I can readily reproduce it
> locally, this takes a low priority for me.

Jeff, I'm sure there are at least 5 other people seeing the same or
similar symptoms of the problem on the MythTV mailing list:

http://www.gossamer-threads.com/lists/mythtv/users/208573?do=3Dpost_view_th=
readed

The common factors are high load and ReiserFS.

So far I can re-create the problem at will, I just need to record enough
programs so my free space falls below 10% for it to happen. However
since the box that is experiencing the issue does recordings for other
people I have to clear off enough space so the problem goes away between
trying to track down the bug. Unfortunately I got a little delete happy
this last round and deleted 70gb worth of data.=20

So I've setup 40hrs of recording to be done in 20hrs (two tuners) which
should trigger the problem again by tonight or tomorrow morning at the
latest. Once that happens I will take a metadata snapshot and email it
off to you.

I'll be sure to not free up so much space from now on so I can re-create
the problem in just a couple hours in case you need to me to collect
additional data.

If I get a chance I'll attempt to make a script that re-creates the
problem too.

--=20
Mike Benoit <ipso@snappymail.ca>

--=-NyXpFB7obGnTu51cgfuS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBErVqyMhKjsejwBhgRAlkuAKCkZtlI6h+L5cpNz7wb+m9y6CcKzACfZdN2
P/qjwWVDigYDezNcSikUOtE=
=08fe
-----END PGP SIGNATURE-----

--=-NyXpFB7obGnTu51cgfuS--

