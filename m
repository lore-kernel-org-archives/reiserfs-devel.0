From: Francesco Biscani <biscani@pd.astro.it>
Subject: Vanilla kernel patch
Date: Thu, 7 Oct 2004 14:02:27 +0200
Message-ID: <200410071402.33421.biscani@pd.astro.it>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart8451608.jL7mzrcy50";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22014-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--nextPart8451608.jL7mzrcy50
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

yesterday I threw together a patchset to enable reiser4 for the vanilla=20
2.6.9-rc3 kernel. Basically I just downloaded the broken-out -mm2 patch and=
=20
applied the reiser4 patches in the order described by the "patch-series"=20
file. I did this because -mm has been too unstable for me and I don't need =
al=20
the features that can be found in -cko or -klak or others patchsets.

I would like to know how many troubles I'm running into :) So far the kerne=
l=20
seems to go fine and dandy, and some fsck's did not reveal any problem. I h=
ad=20
to manually edit the reiser4-reget-something patch, which failed because it=
=20
wanted to use the write_lock function instead of the spin_lock function tha=
t=20
is found in vanilla -rc3. Also, I had to apply two non-reiser4 patches. The=
=20
first added the "i_sb_list" member to the inode structure (it was the=20
inodes-speedup patch), the second enabled generic acl and got rid of the=20
"undeclared function" warning gcc gave. Now all reiser4 stuff compiles with=
=20
no warnings at all.

What are the pitfalls I'm falling in, doing this? Is this safe or is there=
=20
stuff in -mm that is absolutely needed by reiser4?

Thanks!

=2D-=20
Dr. Francesco Biscani

Dipartimento di Astronomia
Universit=E0 di Padova

biscani@pd.astro.it

--nextPart8451608.jL7mzrcy50
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.10 (GNU/Linux)

iD8DBQBBZTBZsknZM9JqQs0RApaSAJ4yPIV6f8GjQz5RgF2JChSPuCe2vACfW9LP
mVseBz2p3FPFBfahcHKuy1E=
=1K5J
-----END PGP SIGNATURE-----

--nextPart8451608.jL7mzrcy50--
