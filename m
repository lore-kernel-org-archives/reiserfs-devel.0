From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: [FYI]: Two compiler warnings in fs/reiser4/plugin/object.c with gcc-4.1.0
Date: Tue, 16 May 2006 15:58:33 +0200
Message-ID: <20060516135833.GB18524@hermes.uziel.local>
References: <20060515130450.GB8977@zeus.uziel.local> <20060515145323.GC8977@zeus.uziel.local> <1147772124.6316.22.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3lcZGd9BuhuYXNfi"
Return-path: <reiserfs-list-return-28630-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1147772124.6316.22.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Christian Trefzer <ctrefzer@gmx.de>, reiserfs-list@namesys.com

--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2006 at 01:35:24PM +0400, Vladimir V. Saveliev wrote:
>=20
> What versions of linux and reiser4 do you compile?
>=20
Oh, and reiser4 was reiser4-for-2.6.16-2 plus a few fixes:

01-reiser4-for-2.6.16-2.patch
02-reiser4-avoid-out-of-memory-question-bug.patch
03-reiser4-radix-tree-direct-data-fix.patch
04-reiser4-fix-block-alloc-assertions.patch

This works reliably so far for quite some time.

I might look into applying anything reiser4-related from current -mm and
checking the differences in fs/reiser4 - some of the more recent reiser4
patches are related to other changes in Andrew's tree, though, and only
mean to make reiser4 play along.

Kind regards,
Chris

--3lcZGd9BuhuYXNfi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iQIVAwUBRGnaiF2m8MprmeOlAQLDlA/7BVgrD2RgYGK2Wz0thsYe43tRlEUAEcUI
xmgexBjDkCyilhiZhbcXmlGR6ygDHPHn/VneDxVAxv/qFDNLgIxCPNWjCS5VgWT+
+HlBx8o6CYgVEWDDe3czCbyY79pSb+3pwepwDxcXUB5B88+z2e6RdC1J6aQBSjhg
7wBFbyx5BFPk8gYuW9Fdp9cVZhIsMiOPLb8CMcU3wbrt9WQDZpeJUW97FBUuftq5
cwZXP/AuahWHVIs50twoDfxLLS0/S9zeUPrTxq4HKJxDPTU/X6tw2aRz7ccGRyDY
sSgyxpMuTE12zhvvmaTNTcDUuTsjkOCW3sdaKLEKdUWcftkw1Sq9ndK7uAu1Y4PW
GYAeo9tXqzcNn85J9Gngr+afmJIJrsJJ041yrsOUqXAiThFEoiZSoTISEFH0T8ar
rMRUY3zRWiISgUTozkj/1rqBn/38VMY45ez7GP8dS9pyieyvFqYNwhspBeojdOAc
bROORoB9dOZN4qHR8TL7SkgdKkQcxjtLF1zilTF53TX9wxYVW/DP2y0TlQ2qzkwj
1cFqGOCXKY0T3pOdI+6MttzUTekZoPEMWVnxkMun9/rYbYk5QTHmf/ThhOqWPQN4
WhevrjIFy4olCGDeLYP1SdWIqZYK9rf3Sknb93vVnUvdohvqNHWr87jfvUNcn7Z0
YlXuTpp6RvE=
=OQA1
-----END PGP SIGNATURE-----

--3lcZGd9BuhuYXNfi--

