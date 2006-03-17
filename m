From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: kernel BUG at /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail_conversion.c:29
Date: Fri, 17 Mar 2006 10:31:27 +0100
Message-ID: <20060317093127.GB11648@hermes.uziel.local>
References: <20060315075034.GC17577@zeus.uziel.local> <200603161028.38749.zam@namesys.com> <20060316171928.GA22618@zeus.uziel.local> <200603162035.01567.zam@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Return-path: <reiserfs-list-return-28293-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200603162035.01567.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 16, 2006 at 08:35:01PM +0300, Alexander Zarochentsev wrote:
> I looked one more time at my second patch and realized now that is it
> not needed, it solves problem which can't happen.  I was thinking too
> much trying to invent a situation where the first patch fails :)

Well, so I'll leave the first one applied instead, presuming that this
is the one you will merge into "mainstream" reiser4 code?


Thanks,=20
Chris

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iQIVAwUBRBqB7V2m8MprmeOlAQJavA//arJizw8tDCjavzlKsMhEXWt3rQ/rnY6E
TwzwB1wBvYn/dU3OEZtXk+EsHgivmvzpmh5P1Lqkokh88PpmavPIH5zEeehCYOrF
uGGmcA516da3stQpVkKKTIRpGp8wOeyMorXGDOsbbrhyLZDBtrAtkC+4VMwtPCH8
b23PM/GzGoxJ8KT3Op5YItd1V3wu9Fgd+bmiTEHrLpdVoiB6o/McwhS70XrbpDaJ
YrTOdW/D3GmZjwnUkJNs2AkrMot9+AXYdx/UZa3jjDPiGKXDyNwwZ6VvpFf/LhC2
XzDNrPNzMa6H2wT9ZaynvXV+hQvv8AoDz/HUjSleJovf3uV7eY+xFG50S6L5xYPK
ZAaIjnamYCS2VjLQ8TVA+6f9VebJMXqaoly2nhrWKrYAonfmGD9/n675X64bMaFv
4jzYGCjdawYVghMCmXnigxL+dHSywkoDTx9koeyc5zjaPYMsuqzOhpcHUAJ7OOIT
tJnGIIWZQUT7/OTRRbVpwMAbRqKmXXSvr7d1hrulpDL759NNx/+0Nimicq9wb0nk
lLyVoAuqBubWrONcXl0Y7P17QipRFaNViW/moIYUAj/G/S/63n/xELeBN/zK0M0L
KcuGMnM5CLdFdNlXjCTogNiddvKhNan1LoJRR3YWipK1ZIhy3osBcshVbu3ViC13
UVSzFXeVzFk=
=CRvY
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--

