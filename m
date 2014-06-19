From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: reiser4progs: possible off-by-one in librepair/twig_scan.c?
Date: Fri, 20 Jun 2014 03:18:40 +0400
Message-ID: <1559792.K1g2CRjlCX@intelfx-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3254033.Bj7G0xAVyh"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:mime-version
         :content-type;
        bh=G7g5VGlOVeV3IIxsb6Xc76NZHo0c1vvwozNewU85nqQ=;
        b=sFddY5pA/LcjrZ7xSs1D4tiUO3SIuJXIW+0DtzTZY1zOjEKvxpcl1zYfmp7wVDv1ZO
         6c1iY1BGqA4PcbYLFfdNZYH3h/kjEI96I+GjhQRQBfJ0cIHRgBf+zVxy3PGmqfzqQQEv
         4zq10o3QpfasGFse6wWeJ6HNeaa97ozkkUwAayNhsC84N1+1NiKNztYAywyhhBCAhrau
         kLWe8R8Lp/PXMutYl0CkhsmZz6HqfdfyKleYV2j9yR/EjLxQvgpbiybU0YxmRbSvOlNY
         xwvZnr2CmjHCw0/ehNQvg7Rw2aydwl+SzXDBOa4gPDY6I1Sxr9XnzrZBCmfwjPLbZ6QL
         uQ7w==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>


--nextPart3254033.Bj7G0xAVyh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

I've got a strange fsck complaint while testing the rewritten discard.
The fsck log is here (not line-wrapped):

=3D=3D=3D=3DLOG=3D=3D=3D=3D

$ fsck.reiser4 /dev/disk/by-label/linux-build=20
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/disk/by-label/linux-build block device.               =
                                                                       =
                                                                       =
          =20
Will check the consistency of the Reiser4 SuperBlock.                  =
                                                                       =
                                                                       =
          =20
Will check the consistency of the Reiser4 FileSystem.                  =
                                                                       =
                                                                       =
          =20
Continue?                                                              =
                                                                       =
                                                                       =
          =20
(Yes/No): y
***** fsck.reiser4 started at Fri Jun 20 02:49:22 2014
Reiser4 fs was detected on /dev/disk/by-label/linux-build.             =
                                                                       =
                                                                       =
          =20
Master super block (16):=20
magic:          ReIsEr4=20
blksize:        4096=20
format:         0x0 (format40)=20
uuid:           73831051-68e1-4848-b9ea-83f9703558b6=20
label:          linux-build=20
=20
Format super block (17):=20
plugin:         format40=20
description:    Disk-format plugin.=20
version:        0=20
magic:          ReIsEr40FoRmAt=20
mkfs id:        0x143b8ccd=20
flushes:        0=20
blocks:         2621440=20
free blocks:    542951=20
root block:     69897=20
tail policy:    0x2 (smart)=20
next oid:       0x21c6d1=20
file count:     182200=20
tree height:    4=20
key policy:     LARGE=20
=20
=20
CHECKING THE STORAGE TREE                                              =
                                                                       =
                                                                       =
          =20
        Read nodes 239320                                              =
                                                                       =
                                                                       =
          =20
        Nodes left in the tree 239320=20
                Leaves of them 236133, Twigs of them 3136=20
        Time interval: Fri Jun 20 02:49:22 2014 - Fri Jun 20 02:49:29 2=
014=20
CHECKING EXTENT REGIONS.                                               =
                                                                       =
                                                                       =
          =20
FSCK: extent40_repair.c: 96: extent40_check_layout: Node (2618486), ite=
m (9), unit (10), [20d7ef:4(FB):766d6c696e757a:20da66:0]: points out of=
 the fs, region [2621239..2621439].                                    =
          =20
        Read twigs 3136                                                =
                                                                       =
                                                                       =
          =20
        Invaid extent pointers 1=20
        Time interval: Fri Jun 20 02:49:29 2014 - Fri Jun 20 02:49:29 2=
014=20
CHECKING THE SEMANTIC TREE                                             =
                                                                       =
                                                                       =
          =20
        Found 189973 objects (some could be encountered more then once)=
.                                                                      =
                                                                       =
          =20
        Time interval: Fri Jun 20 02:49:29 2014 - Fri Jun 20 02:49:33 2=
014=20
FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and rea=
lly used block bitmap differ.                                          =
                                                                       =
          =20
***** fsck.reiser4 finished at Fri Jun 20 02:49:33 2014
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs op=
tion to fix them.

=3D=3D=3D=3DEND LOG=3D=3D=3D=3D

This seems invalid to me: why a [2621239; 2621439] region would be inva=
lid
in a filesystem with 2621440 blocks?
Also, the file in question is intact and does not appear to be corrupte=
d,
because this is my current vmlinuz. :)

The following patch against reiser4progs shows precise location of this=
 check.

diff --git a/librepair/twig_scan.c b/librepair/twig_scan.c
index 39b747c..ca8607a 100644
=2D-- a/librepair/twig_scan.c
+++ b/librepair/twig_scan.c
@@ -19,7 +19,7 @@ static errno_t cb_item_region_check(blk_t start, uint=
64_t count, void *data) {
 =09/* This must be fixed at the first pass. */
 =09if (start >=3D ts->bm_met->total ||=20
 =09    count > ts->bm_met->total ||
=2D=09    start >=3D ts->bm_met->total - count)
+=09    start > ts->bm_met->total - count)
 =09{
 =09=09ts->stat.bad_unfm_ptrs++;
 =09=09return RE_FATAL;

--nextPart3254033.Bj7G0xAVyh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EABEIAAYFAlOjb9QACgkQxUKljSIMAnCUNgD/Wq9OJ/ArpoVhgR2HiOCgurlR
AttLqJDNWFkUk8rOBjABAMzvG4s9wQC+Bl2uU9x+NHUYZumrc9xlTzSMypzyxtq9
=JLHq
-----END PGP SIGNATURE-----

--nextPart3254033.Bj7G0xAVyh--

