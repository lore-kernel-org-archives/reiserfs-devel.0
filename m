From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: reiserfs_create: no enough blocks on device
Date: Mon, 2 Aug 2004 15:53:22 -0600
Message-ID: <20040802215322.GB1912@schnapps.adilger.int>
References: <20040802212341.24550.qmail@web50907.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Return-path: <reiserfs-list-return-19924-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040802212341.24550.qmail@web50907.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: sankarshana rao <san_wipro@yahoo.com>
Cc: reiserfs-list@namesys.com

--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 02, 2004  14:23 -0700, sankarshana rao wrote:
> I am trying to create a reiserfs filesystem using the
> command=20
> 'mkreiserfs  /dev/loop/0 100'.
> It always gives me the error=20
> "reiserfs_create: no enough blocks on device".
>=20
> I tried altering the block size, but it would not
> help..

You can't make a reiserfs filesystem smaller than about 40MB.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://members.shaw.ca/adilger/             http://members.shaw.ca/golinux/


--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBDrfSpIg59Q01vtYRAs6zAKDMsjhl5vOBkmd4iRDX4bVAtczv7wCfUW1m
8XTuEBhBagj/mfP8KPnqpRw=
=FZnm
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
