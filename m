From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: Howto make reiser-3.6 a bit more standby friendly?
Date: Tue, 23 Aug 2005 08:21:50 -0600
Message-ID: <1124806910.10775.3.camel@localhost>
References: <194f62550508230539a1c81d9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-9VyCAZEIpWjmpQweV+m6"
Return-path: <reiserfs-list-return-25622-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f62550508230539a1c81d9@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: reiserfs-list@namesys.com

--=-9VyCAZEIpWjmpQweV+m6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2005-08-23 at 14:39 +0200, Clemens Eisserer wrote:
> Hi there,
>=20
> I am currently tinkering a idn-router which a harddrive which should
> mostly be in stand-by.
> However it seems the drive is rather unimpressed by a 5s timeout
> setting specified with hdparm and goes in standby very seldom although
> the computer is runnig 100% idle (even no isdn-services started or
> anything else).
>=20
> Could this be because of some journal-writeback stuff or anything like
> that? Is there a way to tune ReiserFS for more standby-friendliness?

Check out a script called laptop-mode.  It adjusts various parameters
including /proc/sys/vm/laptop_mode.  I use Reiser 3 on my laptop and
laptop_mode seems to work pretty well.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-9VyCAZEIpWjmpQweV+m6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDCzD+G8fHaOLTWwgRAgROAJwKcNLTy7rBnVI1USJowQZNffihHwCeO+P3
Qd8xRrq5vVqee5ScQFrvth8=
=ZXdh
-----END PGP SIGNATURE-----

--=-9VyCAZEIpWjmpQweV+m6--

