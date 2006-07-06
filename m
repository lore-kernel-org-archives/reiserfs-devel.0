From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: ReiserFS v3 choking when free space falls below 10%?
Date: Thu, 06 Jul 2006 08:43:58 -0700
Message-ID: <1152200638.30139.45.camel@ipso.snappymail.ca>
References: <1151602916.32453.40.camel@ipso.snappymail.ca>
	 <1151608355.6335.79.camel@tribesman.namesys.com>
	 <1151612146.11510.4.camel@ipso.snappymail.ca>
	 <44A55271.7050501@namesys.com> <44A55591.6060500@suse.com>
	 <1152059846.30139.11.camel@ipso.snappymail.ca>
	 <44AB25EE.8030702@namesys.com>
	 <20060706125856.fdac1d16.pegasus@nerv.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-FL1zY20ylTQN8AB0+zwa"
Return-path: <reiserfs-list-return-28916-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060706125856.fdac1d16.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jure =?UTF-8?Q?Pe=C4=8Dar?= <pegasus@nerv.eu.org>
Cc: reiserfs-list@namesys.com

--=-FL1zY20ylTQN8AB0+zwa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2006-07-06 at 12:58 +0200, Jure Pe=C4=8Dar wrote:
> On Tue, 04 Jul 2006 19:37:34 -0700
> Hans Reiser <reiser@namesys.com> wrote:
>=20
> > Mike Benoit wrote:
> >=20
> > >Hi Jeff,
> > >
> > > I just tried the patch you suggested and it didn't make a
> > > difference.
> > >The load still spikes as soon as the free space falls below ~10%.
> > >
> > >
> > Jeff, please audit your code for what happens when all the bitmap
> > blocks reach 90% full.  Could you discuss your design and code in
> > that regard for our benefit?
> >=20
> > Mike, thanks so much for going to this much effort.  It is rather
> > likely this is a problem affecting many users.
>=20
> I run my busy mailservers with 0.5-2% free space (that's still a couple o=
f gigabytes) and have no problems. It's true that I haven't touched the ker=
nel & reiserfs there (2.4.21), so it does not have any additions to the rei=
serfs v3 code since then. It just works, so I don't have any desire to fix =
it :)
>=20
>=20

My desktop machine (v2.6.16, same as my MythTV box) is running with 9%
free space right now and it is not experiencing any slow down. I think
the problem is caused by the usage pattern of MythTV and how it
simultaneously streams one or more large files to the HD in relatively
small chunks over a long period of time.

--=20
Mike Benoit <ipso@snappymail.ca>

--=-FL1zY20ylTQN8AB0+zwa
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBErS+9MhKjsejwBhgRAsGmAJ4qySbN0PH0dxt1tr0iiaeRKcoNkQCghoCt
93oVZbv7Y1kcekHE9OtvbUc=
=Ir9k
-----END PGP SIGNATURE-----

--=-FL1zY20ylTQN8AB0+zwa--

