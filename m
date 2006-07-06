From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 06 Jul 2006 11:27:19 -0700
Message-ID: <1152210439.30139.59.camel@ipso.snappymail.ca>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>
	 <1151608355.6335.79.camel@tribesman.namesys.com>
	 <1151612146.11510.4.camel@ipso.snappymail.ca>
	 <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>
	 <1152059846.30139.11.camel@ipso.snappymail.ca>
	 <44AB25EE.8030702@namesys.com>
	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>
	 <1152200638.30139.45.camel@ipso.snappymail.ca>  <44AD5020.6050803@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-DLmkc1m59DflsJxRN7iB"
Return-path: <reiserfs-list-return-28923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44AD5020.6050803@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: Jure =?UTF-8?Q?Pe=C4=8Dar?= <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

--=-DLmkc1m59DflsJxRN7iB
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2006-07-06 at 14:02 -0400, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Mike Benoit wrote:
> > My desktop machine (v2.6.16, same as my MythTV box) is running with 9%
> > free space right now and it is not experiencing any slow down. I think
> > the problem is caused by the usage pattern of MythTV and how it
> > simultaneously streams one or more large files to the HD in relatively
> > small chunks over a long period of time.
>=20
> Ok, if you run into the problem again, can you dump the metadata before
> freeing the space? The code itself looks sound, and I'm wondering if
> you've managed to create pathological fragmentation that's mucking
> things up. Being able to see the fs metadata would confirm or disprove
> that theory, and help in fixing it.

Will do, I've started a bunch of recordings so I should start seeing the
problem again by tonight or tomorrow morning. Is there any other data
you would like me to collect? Additional oprofile reports, vmstat
information before the problem occurs and/or after?

Let me know.

Thanks.

--=20
Mike Benoit <ipso@snappymail.ca>

--=-DLmkc1m59DflsJxRN7iB
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBErVYHMhKjsejwBhgRAhx2AJ0YJqo/29C1aOthkKOvaNBC0P/8nQCfeP3R
7fE/S6aqTD7ScfxHlQ+mmBw=
=Tqrr
-----END PGP SIGNATURE-----

--=-DLmkc1m59DflsJxRN7iB--

