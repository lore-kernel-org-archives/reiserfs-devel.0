From: sean finney <seanius@seanius.net>
Subject: reiserfsprogs: options for recovering from reiserfsck/"Not enough
	allocable blocks"
Date: Tue, 23 Jan 2007 14:29:09 +0100
Message-ID: <1169558949.5468.40.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-44xx7Pc2nCVXX/EmEalO"
Return-path: <reiserfs-list-return-30439-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-44xx7Pc2nCVXX/EmEalO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

hi folks,

first, some background:

the server:

reiserfsprogs-3.6.19-1mdk
Mandrakelinux release 10.2 (Limited Edition 2005) for i586
Linux 2.6.11-6mdk i686

the partition in question:

~250 GB md(raid1)/lvm reisers partition. =20

what happened:

during all that crazy cross-europe stormy weather last week, there was a
power outage and this server came up with some filesystem problems.  the
filesystem mounted, but some files couldn't be deleted/listed/etc.
fscking led to "you must run with rebuild-tree (cringe)", and re-running
it gave the following:

(sorry for the line-wrapping)=20

[root@nnnn /]# fsck.reiserfs --rebuild-tree /dev/mapper/vg0-backup
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **

<snip>

Will rebuild the filesystem (/dev/mapper/vg0-backup) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you
do):Yes
Replaying journal..
Reiserfs journal '/dev/mapper/vg0-backup' in blocks [18..8211]: 0
transactions replayed
###########
reiserfsck --rebuild-tree started at Tue Jan 23 10:32:54 2007
###########

Pass 0:
####### Pass 0 #######
Loading on-disk bitmap .. ok, 73257983 blocks marked used
Skipping 10446 blocks (super block, journal, bitmaps) 73247537 blocks
will be read
0%block 1444048: The number of items (1792) is incorrect, should be (1)
- corrected
block 1444048: The free space (38084) is incorrect, should be (4048) -
correctedpass0: vpf-10110: block 1444048, item (0): Unknown item type
found [808466737 667936 0x421117 ??? (15)] - deleted
block 1584107: The number of items (1536) is incorrect, should be (1) -
corrected

<snip maybe 200 or so entries>

block 73233074: The free space (749) is incorrect, should be (4072) -
corrected
                                              left 0, 9774 /sec
2 directory entries were hashed with not set hash.
8277276 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 73247537
                Leaves among those 308680
                        - leaves all contents of which could not be
saved and deleted 29
                Objectids found 2876806

Pass 1 (will try to insert 308651 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....pass1: block 72549223, item 0, entry
60: The entry "continuous_measuremunt_20021031150614.txt" of the
[3326546 6081821 0xd2c5200 DIR (3)] is hashed with not set whereas
proper hash is "r5" - deleted
Not enough allocable blocks, checking bitmap...there are 1 allocable
blocks, btwout of disk space
Aborted (core dumped)



and so goes the saga.  being a good netizen, i've done some preliminary
googling before coming to you.  it seems there are two common
suggestions for when this happens:

(1) extend the device (and the fs?) and re-run.  unfortunately this
isn't really an option for me as that's pretty much all the disk space
on the system, and it's in LVM on an existing raid1 device (which would
really complicate things and i've had bad experiences with removing
logical volumes from an LVM volume group at a later point)

(2) reiserfsprogs 3.6.20, which may have a fix?  doesn't look released
yet, and i'm not sure how stable/dangerous it is.

also, i've heard mention of --scan-whole-partition.  would that be
advisable in this situation with 3.6.19?  are there any other
suggestions?

any help would be much appreciated,
	sean



--=-44xx7Pc2nCVXX/EmEalO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBFtg2lynjLPm522B0RAv6JAJ0bpJ8yP6Men+qA3KReksbOaYMAfgCfVMqT
P8DKl1pI6RIOFf3J/2yJMiU=
=fpMM
-----END PGP SIGNATURE-----

--=-44xx7Pc2nCVXX/EmEalO--

