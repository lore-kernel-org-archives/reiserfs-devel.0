From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: Creating large numbers of files
Date: Mon, 10 Jan 2005 16:18:53 -0700
Message-ID: <20050110231853.GB8098@schnapps.adilger.int>
References: <1105395827.2871.ezmlm@namesys.com> <41E302ED.9040606@discreet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <reiserfs-list-return-23109-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41E302ED.9040606@discreet.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Dan Labute <dan@discreet.com>
Cc: reiserfs-list@namesys.com

--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 10, 2005  17:34 -0500, Dan Labute wrote:
> I'm a developer trying to create large numbers of *empty* files=20
> (~100000).  What is the fastest way to perform such an operation other=20
> than a simple open().  Will using multiple threads to perform concurrent=
=20
> operations help significantly, or am I just awell-off using a single thre=
ad?

If you call 'mknod("/path/to/file", S_IFREG | 0666, 0)' from a program
it avoids the overhead of doing both an open and a close.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://members.shaw.ca/adilger/             http://members.shaw.ca/golinux/


--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFB4w1dpIg59Q01vtYRAp8nAKCAhXsxe7XFP4Etzq68hxxQUdXEnACg74OO
uIE61dt2zEyYMIIG3Bus1V4=
=6oIW
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
