From: Bennett Todd <bet@rahul.net>
Subject: OT: package scripts (was Re: software packaging and ReiserFS v4)
Date: Fri, 5 Sep 2003 16:39:50 -0400
Message-ID: <20030905203950.GA12183@rahul.net>
References: <20030903165409.GD4714@rahul.net> <3F565A8F.4010209@botz.org> <20030903213742.GA13146@rahul.net> <3F58D2CD.3050801@mrs.umn.edu> <20030905194413.GA19041@matchmail.com> <20030905201806.GV31864@vestdata.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <reiserfs-list-return-15584-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030905201806.GV31864@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2003-09-05T16:18:06 Ragnar Kj?rstad:
> I think if scripts were to be removed from the packaging system
> you would have to add a package-feature for every single thing
> that scripts are currently used for.

Ok, you've convinced me to this extent: when I get to a point where
I have to add such capabilities to my new packaging tool, they will
be added by the ability to invoke canned reusable scripts that are
part of the packaging system, not one-off per-package scripts.

-Bennett

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE/WPSWHZWg9mCTffwRAuESAJ9MJchx/uxo0EcacOX87HFmlqLnvgCgqJ7v
eqc82pRs5uTEGW9J0PV4eUk=
=61yI
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
