From: Bernd Schubert <bernd-schubert@web.de>
Subject: large files
Date: Mon, 17 May 2004 21:48:32 +0200
Sender: Bernd Schubert <Bernd.Schubert@tc.pci.uni-heidelberg.de>
Message-ID: <200405172148.33162.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_RcRqAy8T/TKnp2d";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18739-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Reiserfs mail-list <Reiserfs-List@namesys.com>

--Boundary-02=_RcRqAy8T/TKnp2d
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

Hello,

I'm currently testing our new server and though it will primarily not serve=
=20
really large files (about 40-60 users will have a quota of 25GB each on a 2=
TB=20
array), I'm still testing the performance for large files.

So I created an about 300GB fil and the problem is to remove it now.=20
Removing it took much more than 15 minutes. Here's the the relevant top lin=
e:

 5012 root      18   0   368  368   312 D    21.9  0.0   5:48 rm

Since I didn't expect it to take so much time, I didn't measure the time to=
=20
delete this file.

system specifications:
	- dual opteron 242 (1600 MHz)
	- linux-2.4.26 with all patches from Chris, no further patches
	- reiserfs-3.6 format

The partition with the 300GB file has a size of 1.7TB.


Any ideas whats going on?=20


Thanks,
	Bernd


=2D-=20
Bernd Schubert
Physikalisch Chemisches Institut / Theoretische Chemie
Universit=E4t Heidelberg
INF 229
69120 Heidelberg
e-mail: bernd.schubert@pci.uni-heidelberg.de

--Boundary-02=_RcRqAy8T/TKnp2d
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAqRcRC8BUnAF+ydYRAurnAKCDmDteLQlc5bWg/AXwm0rt7KoY+wCfZ8OO
MuEek9eBRSbLzMQoAhg0daY=
=1v9S
-----END PGP SIGNATURE-----

--Boundary-02=_RcRqAy8T/TKnp2d--
