From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [RFC] Pathname Semantics with //
Date: Thu, 9 Sep 2004 14:41:02 -0600
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040909204102.GB27331@schnapps.adilger.int>
References: <200409091933.06100.christian.mayrhuber@gmx.net> <20040909201301.1165215D64@mail03.powweb.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8a48p4KKsB+A/3VY"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040909201301.1165215D64@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Dabbs <david@dabbs.net>
Cc: 'Christian Mayrhuber' <christian.mayrhuber@gmx.net>, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com


--8a48p4KKsB+A/3VY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Christian Mayrhuber wrote:
> What about using // as some URI entry point?

One problem that using "//" may have (thought it is personally my favourite
option right now) is that "realpath(3)" may cause the "//" to be eaten, and
this is used by many programs to "resolve" pathnames to remvoe symlinks,
bogus "/./" etc.  This may need a small fix in glibc, but at least it is
still central instead of teaching a million apps about different sematics.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://members.shaw.ca/adilger/             http://members.shaw.ca/golinux/


--8a48p4KKsB+A/3VY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBQL/epIg59Q01vtYRAgrRAJ9ZkXqb1R6zF1rtRkDDD7QhXWU5eQCfS1Op
3q+mVp8Ur9VAKhKB1yTIXD0=
=/FAH
-----END PGP SIGNATURE-----

--8a48p4KKsB+A/3VY--
