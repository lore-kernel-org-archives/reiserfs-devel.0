From: higuita <higuita@GMX.net>
Subject: Re: reiserfsck (v3): out of disk space
Date: Tue, 22 Feb 2011 23:08:03 +0000
Message-ID: <20110222230803.6c1fccce@Couracado.homelinux.net>
References: <20110222030056.3379d223@Couracado.homelinux.net>
	<4D638E2F.9030305@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 boundary="Sig_/UGC72wRrhZAyquapTtNEUuC"; protocol="application/pgp-signature"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D638E2F.9030305@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

--Sig_/UGC72wRrhZAyquapTtNEUuC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi again

	Thank you for the reply!

On Tue, 22 Feb 2011 11:21:35 +0100, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> > 	As recomended, i run the rebuild-tree (first time
> > without the --scan-whole-partition) and got the error "out
> > of disk space" in the end...
> Could you build and try reiserfsprogs-3.6.20?

	Done, but no luck, the output is still the same, still
gives the "out of disk space" in the end of the rebuild:

 ./fsck.reiserfs --rebuild-tree  /dev/sdb7 =20
reiserfsck 3.6.20
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by reiserfsprogs=
/COPYING.
*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **
** something is broken and MAKE A BACKUP  before using it. **
** If you have bad sectors on a drive  it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive  to the good one -- dd_rescue is  a good tool for **
** that -- and only then run this program.                 **
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will rebuild the filesystem on (/dev/sdb7)
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Y=
es
Replaying journal..
Reiserfs journal '/dev/sdb7' in blocks [18..8211]: 0 transactions replayed
###########
reiserfsck --rebuild-tree started at Tue Feb 22 21:21:48 2011
###########
Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 44998008 blocks marked used
Skipping 9584 blocks (super block, journal, bitmaps) 44988424 blocks will b=
e read
0%..
block 4269056: The number of items (1) is incorrect, should be (0) - correc=
ted
block 4269056: The free space (0) is incorrect, should be (4072) - corrected
pass0: block 4269056: no correct item is found. Leave block untouched.
..20%
pass0: block 10243584: no correct item is found. Leave block untouched.
....
block 16628504: The number of items (22) is incorrect, should be (0) - corr=
ected
block 16628504: The free space (1815) is incorrect, should be (4072) - corr=
ected
pass0: block 16628504: no correct item is found. Leave block untouched.
40%block 19311136: The number of items (6) is incorrect, should be (0) - co=
rrected
block 19311136: The free space (2281) is incorrect, should be (4072) - corr=
ected
pass0: block 19311136: no correct item is found. Leave block untouched.
.
block 19966124: The number of items (2048) is incorrect, should be (1) - co=
rrected
block 19966124: The free space (2048) is incorrect, should be (2000) - corr=
ected
pass0: vpf-10110: block 19966124, item (0): Unknown item type found [134217=
729 657408 0x8000001 ??? (15)] - deleted
pass0: block 19966124: no correct item is found. Leave block untouched.
..
pass0: block 24833118: no correct item is found. Leave block untouched.
.
block 25407788: The number of items (1536) is incorrect, should be (1) - co=
rrected
block 25407788: The free space (300) is incorrect, should be (3792) - corre=
cted
pass0: vpf-10110: block 25407788, item (0): Unknown item type found [694031=
36 85724160 0x2ed0000 ??? (9)] - deleted
pass0: block 25407788: no correct item is found. Leave block untouched.
block 26219204: The number of items (7) is incorrect, should be (1) - corre=
cted
block 26219204: The free space (0) is incorrect, should be (3024) - correct=
ed
pass0: vpf-10110: block 26219204, item (0): Unknown item type found [314010=
7008 3076072448 0xb53f00 ??? (15)] - deleted
pass0: block 26219204: no correct item is found. Leave block untouched.
60%
block 27540926: The number of items (1284) is incorrect, should be (1) - co=
rrected
block 27540926: The free space (512) is incorrect, should be (4048) - corre=
cted
pass0: vpf-10110: block 27540926, item (0): Unknown item type found [168427=
56 69892 0x1010101 ??? (15)] - deleted
pass0: block 27540926: no correct item is found. Leave block untouched.
..
pass0: block 31942258: no correct item is found. Leave block untouched.
block 32231127: The number of items (14) is incorrect, should be (0) - corr=
ected
block 32231127: The free space (1998) is incorrect, should be (4072) - corr=
ected
pass0: block 32231127: no correct item is found. Leave block untouched.
..
block 34225196: The number of items (256) is incorrect, should be (1) - cor=
rected
block 34225196: The free space (33807) is incorrect, should be (4048) - cor=
rected
pass0: vpf-10110: block 34225196, item (0): Unknown item type found [247523=
2323 192 0xd284fa89 ??? (8)] - deleted
pass0: block 34225196: no correct item is found. Leave block untouched.
80%
block 36309055: The number of items (83) is incorrect, should be (0) - corr=
ected
block 36309055: The free space (0) is incorrect, should be (4072) - correct=
ed
pass0: block 36309055: no correct item is found. Leave block untouched.
..
block 39752011: The number of items (7) is incorrect, should be (1) - corre=
cted
block 39752011: The free space (0) is incorrect, should be (4048) - correct=
ed
pass0: vpf-10200: block 39752011, item 0: The item [11869226 45345 0x900010=
0 EXT (1)] with wrong offset is deleted
pass0: block 39752011: no correct item is found. Leave block untouched.
pass0: block 39757191: no correct item is found. Leave block untouched.
block 40328404: The number of items (15364) is incorrect, should be (1) - c=
orrected
block 40328404: The free space (20924) is incorrect, should be (976) - corr=
ected
pass0: vpf-10700: block 40328404, item 0: The item with wrong offset or len=
gth found [883290112 201335811 0x603021 DRCT (2)], len 3072 - deleted
pass0: block 40328404: no correct item is found. Leave block untouched.
..
pass0: block 43955712: no correct item is found. Leave block untouched.
block 43971720: The number of items (7) is incorrect, should be (1) - corre=
cted
block 43971720: The free space (25) is incorrect, should be (4048) - correc=
ted
pass0: vpf-10700: block 43971720, item 0: The item with wrong offset or len=
gth found [369147936 11938893 0x7009923 DRCT (2)], len 0 - deleted
pass0: block 43971720: no correct item is found. Leave block untouched.
pass0: block 44557229: no correct item is found. Leave block untouched.
pass0: block 44661495: no correct item is found. Leave block untouched.
block 44863841: The number of items (3840) is incorrect, should be (1) - co=
rrected
block 44863841: The free space (0) is incorrect, should be (3792) - correct=
ed
pass0: vpf-10110: block 44863841, item (0): Unknown item type found [268496=
896 268501007 0xff001 ??? (15)] - deleted
pass0: block 44863841: no correct item is found. Leave block untouched.
100%                       left 0, 10320 /sec
675769 directory entries were hashed with "r5" hash.
Flushing..finished
	Selected hash: "r5"
	Read formatted blocks: 44988424
	Read leaves (corrected/empty/wrong hash): 158045 (0/21/0)
	Objectids found: 675414
Pass 1 (will try to insert 158024 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....Not enough allocable blocks, checking bit=
map...there are 1 allocable blocks, btw

out of disk space
Aborted (core dumped)

	As it didnt work, i tried to increase the partition size by
a few GB... but as the resize_reiserfs cant run, the fsck didnt
saw any change.

	Any more ideas?

Thanks in advance
higuita
--=20
Naturally the common people don't want war... but after all it is the
leaders of a country who determine the policy, and it is always a=20
simple matter to drag the people along, whether it is a democracy, or
a fascist dictatorship, or a parliament, or a communist dictatorship.
Voice or no voice, the people can always be brought to the bidding of
the leaders. That is easy. All you have to do is tell them they are=20
being attacked, and denounce the pacifists for lack of patriotism and
exposing the country to danger.  It works the same in every country.
           -- Hermann Goering, Nazi and war criminal, 1883-1946

--Sig_/UGC72wRrhZAyquapTtNEUuC
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEARECAAYFAk1kQdQACgkQrv1jazsMcrNVcQCgpNeZ+Icccl87JpaCXK8O3piJ
VnAAmJr+Mpy/+Dq+Dz4CIYPEsxPZS1E=
=D5iY
-----END PGP SIGNATURE-----

--Sig_/UGC72wRrhZAyquapTtNEUuC--
