From: Bennett Todd <bet@rahul.net>
Subject: Re: typo: failed to genetate UUID? what's it?
Date: Wed, 14 Jan 2004 13:11:27 -0500
Message-ID: <20040114181127.GC557@rahul.net>
References: <4003FCB1.4030205@libero.it> <200401141349.37081.vitaly@namesys.com> <40053457.1070901@libero.it> <40053B49.3000508@namesys.com> <40053E4E.9020604@libero.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DIOMP1UsTsWJauNi"
Return-path: <reiserfs-list-return-16501-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40053E4E.9020604@libero.it>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Domenico Andreoli <cavok@libero.it>
Cc: reiserfs-list@namesys.com

--DIOMP1UsTsWJauNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

2004-01-14T08:04:14 Domenico Andreoli:
> i'm getting this error on a very simple initrd image i'm working on,
> where only required devices have been copied by hand. now i know that
> /dev/urandom is also required :))

By one of those amazing coincidences, "very simple initrd" is
something I'm wallowing in with glee just at the moment.

BusyBox built with uClibc is magnificent for "very simple initrd".

If you build your kernel to include devfs, and run busybox's devfsd,
all the normal paths show up in /dev by automagic.

When I switch to 2.6 I believe the corresponding automagic is udev.

-Bennett

--DIOMP1UsTsWJauNi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQFABYZOHZWg9mCTffwRAqswAKC2JaRhfcVTxYbjsswNslEAArV19wCgz60l
+P6Zdm1n19chcmw1O8s/ZaU=
=dW3u
-----END PGP SIGNATURE-----

--DIOMP1UsTsWJauNi--
