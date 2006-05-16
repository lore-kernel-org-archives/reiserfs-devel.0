From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: Recent patch frenzy, conflicts and Oopses
Date: Tue, 16 May 2006 16:02:04 +0200
Message-ID: <20060516140204.GC18524@hermes.uziel.local>
References: <20060515130450.GB8977@zeus.uziel.local> <200605161432.21209.zam@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Return-path: <reiserfs-list-return-28631-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200605161432.21209.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2006 at 02:32:20PM +0400, Alexander Zarochentsev wrote:
>=20
> The patch disables the BUG() but reiser4 can deadlock.  However the=20
> deadlock requires 3 processes to use the same EA/NEA semaphore. =20
>=20
> better patches are there:=20
>=20
> ftp.kernel.org:/pub/linux/kernel/people/akpm/patches/2.6/2.6.17-rc4/2.6.1=
7-rc4-mm1/broken-out/
> reiser4-have-get_exclusive_access-restart-transaction.patch
> reiser4-add-missing-txn_restart-before-get_nonexclusive_access-calls.patch
>=20

Thanks a bunch for clarification! It seems I am not the only one on this
list who got confused by bug reports and different approaches to fix
those.

Kind regards,
Chris

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iQIVAwUBRGnbW12m8MprmeOlAQIYMBAAhJar3pUCuOEsa0On4x0/QX6jGQUL0Kt7
WZWmLfKYulvHntrWY9k/2L5hD+RUvxDCi2eChlJhxYi3TYF5aZHwGkgIqHCAr2gh
gBZOKcbFTl0xj3pH0WUH/TA6eFVQMhid4bOFvTi+BTzL/kCpih6doywCreEKR45N
DpNjJLMhnvFCOdITlV92K3VVbL80nHh/I9mDak7KHidFuMKAWohoMp93+/cWi85d
qiokmng6m4jxb65pOtbVJW08VPxCNk7stoD7sSBrygfUxmA1SB3BvvC8DtdzdpjY
oB108JDBI4C89De+ybVIZiUYNvYvkJs3jwIFtv9nL1yykVFMzFcaRO/eWk8TA7QX
AldxOa1TljevN6jeCg6oZZTSCnkX1ltIqeL8o6xjWtwkWIlxlY+DhN9yvwGDpzZO
Fxdrei29DsB6ZCp3T+8x2iapLzkvdtK2K/P+zOuLib1rAW8nfhsHkOMm2n/4UBmu
wM7meGf5Yq6NW6/BB9pkXIbmwf0ElpJ7x7slQY+fILh5Gi5/6hza4mJY1XRZ2Ixp
WaFgIAYO3FUMXyaHU+J5yjkvRL64DShQEVNdYpuMjOCaTvRzc1iqSI8cs8ELwbZi
xhOmaduPtXrUAKb3StzoAZ/DxXwrADolIrpXiBR0UiSJcU+scxzbhnumGcIGe2Xh
KZZwNDgcQRo=
=LIaT
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--

