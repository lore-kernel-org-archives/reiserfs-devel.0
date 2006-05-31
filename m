From: rvalles <rvalles@es.gnu.org>
Subject: Re: reiser4 for 2.6.16 (version 3)
Date: Thu, 1 Jun 2006 01:59:20 +0200
Message-ID: <35513.9445317493$1149120680@news.gmane.org>
References: <1148923857.6482.12.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Return-path: <reiserfs-list-return-28710-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1148923857.6482.12.camel@tribesman.namesys.com>
Sender: <rvalles@eww.ath.cx.>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2006 at 09:30:57PM +0400, Vladimir V. Saveliev wrote:
> Hello
>=20
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-3.pat=
ch.gz contains the most recent reiser4 code which is considered stable insi=
de Namesys.
> This code is supposed to be in mm kernel next to 2.6.17-rc4-mm3.
>=20
> Please try it. Any feedback is welcome.
>=20

Finally, the "fsync/mmap >1minute writing to disk while halting all IO"
I reported a few weeks ago seems to be gone. Are you aware of that? what
caused it on the first place?

01:53:17 up 1 day, 23:59, 11 users,  load average: 0.37, 0.14, 0.21

This allows me to use a kernel newer than 2.6.12.6 for the first time.
Now, let's hope it stays ok and the bug doesn't show itself in just a
few hours.

Thank you all for your good work.
--=20
- Do you study theories? - Oh yes! Theories are fun. - How do you use them?=
 - When I must act, theories are too slow. To act, I must know.

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEfi3YfwaXC2yIZd8RAvrBAKCB0SbVAc0OM7ad+UWGToZw0lqHYwCdGN5b
XlY75mwTk4eAUbkBfehYXMM=
=t/Hk
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
