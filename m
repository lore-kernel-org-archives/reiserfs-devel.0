From: Till Gerken <till@tantalo.net>
Subject: Problem mounting ReiserFS as root partition
Date: Sun, 15 Jun 2003 15:08:39 +0200
Message-ID: <200306151508.57384.till@tantalo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14551-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

I encountered a very strange problem that I was not able to solve so far. I=
=20
did not find anything similar on the web either.

I am not able to mount my ReiserFS partition as root partition with any ker=
nel=20
later than 2.4.20-pre11. When trying, I get

read_super_block: can't find a reiserfs filesystem on (dev 03:00, block 64,=
=20
size 1024)

The same with block 8 and then a kernel panic.

I have tested this with 2.4.20 and 2.4.21 kernels, both compiled with exact=
ly=20
the same configuration as my current 2.4.20-pre11 kernel. Only the=20
2.4.20-pre11 kernel is able to mount this partition as root partition.

I have booted from a Knoppix CD using a 2.4.20-xfs kernel and it was able t=
o=20
mount the partition. Unfortunately I could not test if it is able to mount =
it=20
as root partition during boot.

reiserfsck does not report any problems, reiserfsck --rebuild-sb tells me t=
hat=20
the super block is ok. I tested this with various versions of the tools up =
to=20
3.6.6.

I would be grateful for any hints.

Till
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE+7G/pFwwirB11AGMRAvUhAJ9elrxZHfF7MACxTEocbPN8NBZ6ugCeKSgM
5lMNJkbNMgNF/cLM68iVVto=3D
=3DuSiR
=2D----END PGP SIGNATURE-----

