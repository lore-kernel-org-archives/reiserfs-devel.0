From: joshk@triplehelix.org (Joshua Kwan)
Subject: [2.6.8] Strange FS corruption on sparc64
Date: Fri, 20 Aug 2004 17:01:12 -0700
Message-ID: <20040821000112.GM8070@triplehelix.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3VRmKSg17yJg2MZg"
Return-path: <reiserfs-list-return-20446-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--3VRmKSg17yJg2MZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I've been tasking my UP sparc64 for a few days now to build lots of
kernels for Debian. However, during the build, it must have stumbled
across some inconsistency in my reiser3 filesystem:

ReiserFS: sda2: warning: vs-8115: get_num_ver: not directory item
ReiserFS: sda2: warning: vs-8115: get_num_ver: not directory item
ReiserFS: sda2: warning: vs-8115: get_num_ver: not directory item
ReiserFS: sda2: warning: vs-8115: get_num_ver: not directory item

Then, the build failed with

find: install-sparc64/drivers/sound/sb_ess.hsb_ess.cgus_midi.c: No such fil=
e or directory

It looks like somehow these files got their names concatenated together?
Is this a fluke problem; can I restart and have it go away, or mark sectors
as bad, etc., or is it something sparc64 dependent that should really be
fixed. Googling implies that it has been fixed long ago.

The machine has been up for only about a day and a half. It is running
the 2.6.8 kernel with a few patches used throughout Debian kernel
packages that do not affect reiserfs. What should I look at next?

Please CC, as I'm not subscribed to this list.

Thanks

--=20
Joshua Kwan

--3VRmKSg17yJg2MZg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: http://triplehelix.org/~joshk/pubkey_gpg.asc

iQIVAwUBQSaQxqOILr94RG8mAQJKlxAAilayvaF6UO4KKxkSORuVi0GtjMkKrqqf
5E2tQE18o+oLdn5UV7x2ADmOHDCQhq6Se/rQNiQ0aELl9qBTp4F6nzzuJk/h5cwa
b/U/6LsGKtWwnO4Ho8tKBmCxPPepdVpmRSjl3bPmFpq0VuVMxaaU7ynt1pWA4uUs
zLm77oxGJh2CPEsP8wfpN8wUmFhw0cuFrsvdxDEsLgMHQFNgZoIIlFV6DPLOwr5/
qqEe+0MggkM/9CLfk1M0BFs+8k4YykIzUrArvI+QtV39lJOvH248Xs45F9PqATFn
RJp2bq93pE1FgUgTsqoT3W6LvvNXA/cSaXlhM4+hc016qAPmmSLrtP0QnpyfPI7j
fe6p6mJVrLuVOmQd0f5fmPdPIAoXuyV0/Es13oGfa8CYwA/PNWOQDRQnEVT6IZXX
L/MVxwB0CvJjfwTYpPaq6gcACb1MBWSjx+DkBwO18RC6sVwLdBjF+tuN+XljXf32
Jbfj4oy1hZ0OCx3VXcrffBdTiyxvgeYNg53rad4dsC7wVmGto+eJIu9dON3/RoGo
AAMZvuPyamMeVOcuwoGSvyBFnPeyVoJo5h0u9eCHdTxYXleATK+ewF9ucfMtWd8Y
JYfJQwFlGatGrqGJIC8CLdE394/kL/yBNTYONt/lpkEQjNKFLmxXjl3zi9QG9520
ut6wYEiV4eY=
=gb/F
-----END PGP SIGNATURE-----

--3VRmKSg17yJg2MZg--
