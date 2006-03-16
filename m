From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: kernel BUG at /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail_conversion.c:29
Date: Thu, 16 Mar 2006 18:19:28 +0100
Message-ID: <20060316171928.GA22618@zeus.uziel.local>
References: <20060315075034.GC17577@zeus.uziel.local> <200603151111.49826.zam@namesys.com> <20060315194013.GA13074@zeus.uziel.local> <200603161028.38749.zam@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <reiserfs-list-return-28291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200603161028.38749.zam@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi zam,

On Thu, Mar 16, 2006 at 10:28:37AM +0300, Alexander Zarochentsev wrote:
>=20
> I guess it was in release_unix_file where get_exclusive_access is called=
=20
> outside reiser4_context.
>=20
> can you please replace the old patch by the attached one?

Sure I can, but so far I did not have any further trouble after applying
your first patch. It seems to me that exchanging the two patches won't
bring the BUG back, so I will report in a few days with something along
the lines of "thank you very much". You will, on the other hand,
definitely hear from me if the thing BUGs on me again ; )

Thanks for your time!

Chris


--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iQIVAwUBRBmeH12m8MprmeOlAQJKyg//eAGGunAZ2cp77mY08AFjCg5hyfPNrOIc
M+bSyPC3wowVr6v1CDKLRr2zJWGbAYx2zjZntUC0jGrUIHYn0pqP5KYNjkJ21LPI
silc1y0QnVIIOeQpVxXMU1iaaPaqRxaArFZ84D3Ggv9mfQNSBU2TRIH+S1fHBBx8
ZntOwnU5YoVjb24RF3WP8NvEWoLaF58ECbUlfvh971PLvaNub9HjII7i4zJNGt8g
IqpRYF+FFrHIcZcmOpIWy2cqBtuLzdJ1DXwFs3cRB8tQ9KsfuNl5joScbA8sodOF
MPQi+4QERhvIfHNjHBeKITyjTRZCG19TtRdVCWTW6VNXfNogxKZ/ND4he48vKyK/
Mw462ySSj1Zi3Wb+kf+r6ot7B2cN/LXYFHWP6HZ2D3tihQu0T0hVivUhu11akaHa
61u2BMLfep2zItENbAvQBfl4gx6cD1Kw48NEZslnAQ8R+uVfSOmDwAGVcMg6mi4x
ek2bjKqHnEWkqhx+SIPi7tjlQ7CgdAxWSID3XoL+0Tx0l3Kb+qx0CgbmJveVZHQB
XnWht2COPrFqxzNPmMzWyYxFhQXBj4NhT1mYrG1wTwAQ0+8ocRSHQRnuwLCjrd5A
oXKNenD4OsRdX3ZqlroXfHuwglqp+zQtO+yUMGSk+amaq6+VmLQHIelKsjsPuIyu
m8dXmafMq3o=
=PW23
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--

