From: liqui-D-read <liquid@nano.cz>
Subject: reiserfs+LVM+loopAES
Date: 07 Nov 2002 11:21:31 +0100
Message-ID: <1036664491.13120.38.camel@ceros>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-jSOP/GcPGEpSNkukAXro"
Return-path: <reiserfs-list-return-11941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-mailing-list <reiserfs-list@namesys.com>


--=-jSOP/GcPGEpSNkukAXro
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



hello

i've got a following setup:=20

Linux base 2.4.19 #2 Thu Nov 7 09:57:09 CET 2002 i686 unknown

it's debian woody 3.0

there's a LVM and loopAES in kernel also.

the LVM disc is mounted via loop to make an encryption.

everything worked fine, but one day i wasn't able to read some data from
that filesystem. so unmounted it and ... attached it via losetup.

(sorry for offtopic ... now comes the real part)

root@base:/tmp# reiserfsck --fix-fixable /dev/loop1=20

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will check consistency of the filesystem on /dev/loop1
Will fix what can be fixed w/o --rebuild-tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
###########
reiserfsck --fix-fixable started at Thu Nov  7 10:59:36 2002
###########
Replaying journal..
0 transactions replayed
Checking S+tree../  4 (of   6)/ 18 (of 127)/138 (of 155)bit 90843826,
bitsize 90840576
reiserfsck: bitmap.c:160: reiserfs_bitmap_test_bit: Assertion
`bit_number < bm->bm_bit_size' failed.
Aborted

kernel doesn't report any bugs/errors

i don't know if it isn't a LVM or AESloop bug, but i've got last
versions of both.

please help :)

l.


--=-jSOP/GcPGEpSNkukAXro
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9yj6qrdjTrLvTST4RAs5OAJ45bTuQ3SSysyPMYfmmilPSr2GJaACfYkfa
p3LvRT2o3Ah6I0Xia7HlTPQ=
=ubYq
-----END PGP SIGNATURE-----

--=-jSOP/GcPGEpSNkukAXro--

