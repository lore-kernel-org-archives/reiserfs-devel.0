From: Matt McCutchen <matt@mattmccutchen.net>
Subject: Re: PROBLEM: "BUG" and hang with reiserfs, ACLs
Date: Tue, 08 Jul 2008 16:43:24 -0400
Message-ID: <1215549804.2371.1.camel@localhost>
References: <1215544656.2307.23.camel@localhost> <4873C458.9070305@suse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-md4Ij4gdcBtCDUehu231"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4873C458.9070305@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org


--=-md4Ij4gdcBtCDUehu231
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-07-08 at 15:47 -0400, Jeff Mahoney wrote:
> Matt McCutchen wrote:
> > When I run the rsync 3.0.3 test suite on a newly created reiserfs
> > filesystem mounted with ACLs enabled, I get a kernel BUG (stack trace
> > below) and all processes accessing the filesystem hang.

> Can you try to reproduce with the patch I posted this afternoon? The
> subject is "[PATCH] reiserfs: discard prealloc in
> reiserfs_delete_inode." I have another one, but I'm not sure if it's
> actually needed.

With that patch, the problem is gone.  Are there any additional issues
to be addressed with the patch, or should I go ahead and encourage the
Fedora people to include it in their kernel?

Thanks!

Matt

--=-md4Ij4gdcBtCDUehu231
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkhz0WkACgkQC+xSYN/Rlfs82ACfYJ4fQJHFY6PElEpV7OQlQo5d
NM4An1oMY5TOM2jifijHZ8zV9WJN+uio
=+Rzh
-----END PGP SIGNATURE-----

--=-md4Ij4gdcBtCDUehu231--

