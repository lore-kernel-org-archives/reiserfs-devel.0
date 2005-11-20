From: rvalles <rvalles@es.gnu.org>
Subject: Re: need opinions from sysadmins on where reiser4progs should install
Date: Sun, 20 Nov 2005 05:07:23 +0100
Message-ID: <18027.1762343638$1132459729@news.gmane.org>
References: <4376E891.6070506@namesys.com> <20051117160643.75B2412D0@philou.gramoulle.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <reiserfs-list-return-27030-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20051117160643.75B2412D0@philou.gramoulle.local>
Sender: <tux@148.Red-217-126-33.pooles.rima-tde.net>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2005 at 05:06:43PM +0100, Philippe Gramoull=C3=A9 wrote:
> So should a crash occur and /usr becomes corrupted, well, at least / is m=
ounted and i could
> reiserfsck partitions right away, handy when the server is several thousa=
nd kilometers away :)
>=20
> I expect to do the same for reiser4progs, so i wish that reiser4progs uti=
lities would install
> in /, and as such /sbin seems the best choice _to me_

When I run make install on something and haven't specified a prefix on
configure, I expect /usr/local to be used. If I wanted /, I'd have
specified that on configure time. If it installed in / by default, it
would, often, hit the "sacred package-system managed area" of the VFS
tree annoying people like me to a very great extend, so please don't.

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFDf/Z6rD81VR3MDtoRAv8rAJ9CJOBp9Xj0U2yQkDPfCsVSJkPTMgCdFHeG
hGyFp4dkNIwPZz8Y9pDlVxU=
=ySD3
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
