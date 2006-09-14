From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: [PATCH] reiser4: fix readv
Date: Thu, 14 Sep 2006 11:28:29 +0200
Message-ID: <20060914092829.GA13737@hermes.uziel.local>
References: <200609132212.54871.vs@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <reiserfs-list-return-29879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200609132212.54871.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: akpm@osdl.org, reiserfs-list@namesys.com

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hi Vladimir,

this fixes a bunch of random user space oddities for me. Just patched
2.6.18-rc6-mm2 with this, and some annoyances I could not trace back to
a change in user space just went bye-bye.

Thanks a lot!
Chris

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iQIVAwUBRQkgu6nY3eLOiwZcAQqr8g/+L70ZU3iCiy9aeM+VA4ZG27x/cwIYsXm3
v2MJBCnY5BcZ+7AJm4Jgwdi7//QbX9p7IWBGXwVnHJXpmu3UTQOj2mFnRocL/Aei
nPQdn2m2cWoMy6tXKorKmCLbgi03PZ2HuwXJ29YcuNScGiVUluZx/0/6fH8OxeoX
1F92ByxzRPs8GjgEz6zf6X/Iq4t6asDayWAnMTYHaSp7LK5b44Km+C77docEhg97
aAEypMeQ8W9oiJ375208+rYhCgrAqO79X7PTNFxjYPnDqVwdpSMkskwu189RPzM8
yNRayptsSn/nOlED2D4BF8JoeFHiXkyQgqCCr0FkEXOZUV83CNi9LaMHE1f0hvlo
sDf8wjyYfVa5YESiyWC3oZEhYFSkR5qf0vTHq51VcwEOImdgQtzMkpkDo948DJwS
KDQeqLOvL9OExGy0qtRT+iFj0YSBLJcklxTMF2X/xPsT2IBhREfYB38sO7YSKFgs
TEfEl0Wf1IH6WoxOJAXGiFJViC9JA0BWRCMZfI2xqtmZ1Nu19KJJczGa7CvH56xR
CoiM4lrny30DR3AVHuQS71n6iwb2gR/dfOtw4+Gwenh0NcOlT2yTUsmGuEqanA5V
EAd8X/h08DrbBdBWiACzy8KBBXD2l72wg1rwOzxPb2jCewhvMKwBkmMpjdc1Fv3l
Uu2Uggu85jI=
=8nzQ
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--

