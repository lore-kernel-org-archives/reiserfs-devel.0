From: Christian Trefzer <ctrefzer@gmx.de>
Subject: [FYI] [SOLVED] building against Linus' current git: unresolved symbol
Date: Sat, 3 Jun 2006 16:06:18 +0200
Message-ID: <20060603140618.GA16625@zeus.uziel.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <reiserfs-list-return-28720-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks,=20

the patch below is required on top of reiser4-for-2.6.16-4 to actually
use reiser4 as a module with Linus' current git tree, mostly
2.6.17-rc5-git10. Otherwise the symbol "handle_ra_miss" cannot be
resolved, thus the module won't be loaded. Just pointing this out, to
avoid problems with early patches against 2.6.17 : )

Kind regards,
Chris


diff --git a/mm/readahead.c b/mm/readahead.c
index 0f142a4..2494c2a 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -573,6 +573,7 @@ void handle_ra_miss(struct address_space
 	ra->flags &=3D ~RA_FLAG_INCACHE;
 	ra->cache_hit =3D 0;
 }
+EXPORT_SYMBOL_GPL(handle_ra_miss);
=20
 /*
  * Given a desired number of PAGE_CACHE_SIZE readahead pages, return a

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iQIVAwUBRIGXWl2m8MprmeOlAQI8XRAAs0bcaDUFaX7D9uKHtrFTPOVGV1+tg+QZ
eXUGP6EaW3ESi4DLsoGOVNLDTx9NVWDRl/JLncZH7WElel0R3OX8mdF/qo5UzfJz
0Ol551znhvM6pRHXbzAmbxdl9SNLhW+3eXye/YnVG1YBR8I1xFOUUyIWauNQIIUd
0D/Nba/JUDuT3G6j0SeNNZJjVnWLC1kFSu2wCz5O9OnZ9CHMK/EtbAwshKquuUK1
cZanvMvSCLBmps+rKBtEKRH0Ta8aTXtCU1n6L5PBOtbTAVngQ1zJ5A3slhcerTRR
3SLOOV3cnxdSWC45Fs/SHRy/o6NZqb3cy2fthGxAFlU7egu3mXSE/cq9AU8HZ+IT
UgK6pmjfupLMMvOCzy+In+8pw8ErtpfjULBOtLmxjrHmKlcstAt51/eYeDGjLICc
++5HZ1jDNl6DgW8TboQpYm1nPp8LuYaZoQaO/u/yfvEapAuD97c9wSRD17VLFfbk
aMbOJtxwD2C0HjXhx5+8tneniqBm6qwR9YyupAAo+XiLBNOYYUByDoG+pWB9tnXX
1IK/30A1PTHPpVVWJ0AMeOqtKlg/oMVgl0Tug/nYOX/KDNJ98pp+2rx6n2DXvol2
WhZ4EYeHCiShQSzLxAufi2FSfXQI/02ucm7QpyRVXdYlsY4IMU3EVTZ/49itzcpV
QbJBhgY/9vc=
=ZYeS
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

