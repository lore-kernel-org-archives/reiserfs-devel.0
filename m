From: Paul Gear <paul@gear.dyndns.org>
Subject: Corrupt reiser3 fs
Date: Sun, 12 Jun 2005 08:42:58 +1000
Message-ID: <42AB68F2.8030904@gear.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig4296A45E6ACCD7329796CA8E"
Return-path: <reiserfs-list-return-24367-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------enig4296A45E6ACCD7329796CA8E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi folks,

After filling my reiserfs with backups, i ended up with a corrupt
filesystem.  I'm running Debian 3.1 (sarge), kernel 2.6.8-2-k7, and
reiserfsprogs 3.6.19-1.

I don't care about this filesystem and will just recreate it, but i
thought i'd offer folks the opportunity to debug before i trash it.

Here's my fsck output with all the noise cut out:

---------8<----------------------------------------

enoch:/tmp # fsck.reiserfs --rebuild-tree /dev/hdc1
...
111392 directory entries were hashed with "r5" hash.
        "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 19333032
                Leaves among those 32365
                        - corrected leaves 35
                        - leaves all contents of which could not be
saved and deleted 5
                pointers in indirect items to wrong area 25647 (zeroed)
                Objectids found 104921

Pass 1 (will try to insert 32360 leaves):
####### Pass 1 #######
Looking for allocable blocks .. finished
0%....20%....40%....60%...                                  left 8239,
234 /sec
The problem has occurred looks like a hardware problem (perhaps
memory). Send us the bug report only if the second run dies at
the same place with the same block number.

build_the_tree: Nothing but leaves are expected. Block 10905053 - unknown

Aborted

---------8<----------------------------------------

Kernel messages reported during this fsck are as follows:

---------8<----------------------------------------

ReiserFS: hdc1: found reiserfs format "3.6" with standard journal
ReiserFS: hdc1: using ordered data mode
ReiserFS: hdc1: journal params: device hdc1, size 8192, journal first
block 18, max trans len 1024, max batch 900, max commit age 30, max
trans age 30
ReiserFS: hdc1: checking transaction log (hdc1)
ReiserFS: warning: is_tree_node: node level 0 does not match to the
expected one 65534
ReiserFS: hdc1: warning: vs-5150: search_by_key: invalid format found in
block 0. Fsck?
ReiserFS: hdc1: warning: vs-13070: reiserfs_read_locked_inode: i/o
failure occurred trying to find stat data of [1 2 0x0 SD]
ReiserFS: hdc1: Using r5 hash to sort names
ReiserFS: warning: is_tree_node: node level 0 does not match to the
expected one 65534
ReiserFS: hdc1: warning: vs-5150: search_by_key: invalid format found in
block 0. Fsck?
ReiserFS: hdc1: warning: vs-2140: finish_unfinished: search_by_key
returned -2

---------8<----------------------------------------

There is no problem with memory (my other two hard disks and all of my
desktop programs are working fine), or, to my knowledge, the hard disk
or cable (since i can do a full dd of the hard disk to /dev/null).

Anyone interested in taking a look at it, or should i just write it off
as stray gamma rays from Saturn and trash it?  :-)

-- 
Paul
<http://paulgear.webhop.net>
--
Did you know?  Microsoft Internet Explorer and Outlook have a poor track
record for security <http://www.kb.cert.org/vuls/id/713878>.  Why not
try one of the more secure alternatives from <http://mozilla.org>?

--------------enig4296A45E6ACCD7329796CA8E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFCq2j3Y1u5R057COQRAmJiAKC9in0aW3w4vhx/kV6kFuml0Oiy7ACeIEgJ
5GpKF2tNVAWQQCqobqbZs/E=
=Z6HD
-----END PGP SIGNATURE-----

--------------enig4296A45E6ACCD7329796CA8E--
