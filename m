From: Vadim <vadim_t@teleline.es>
Subject: vs-5150: search_by_key: invalid format found in block 30690. Fsck?
Date: Fri, 15 Aug 2003 19:39:02 +0200
Message-ID: <200308151939.03324.vadim_t@teleline.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15328-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs mailing list <reiserfs-list@namesys.com>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I just noticed quite a lot of those:

vs-5150: search_by_key: invalid format found in block 9170. Fsck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to=20
find stat data of [3614 3618 0x0 SD]
is_tree_node: node level 65448 does not match to the expected one=20
1
vs-5150: search_by_key: invalid format found in block 14568.=20
=46sck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to=20
find stat data of [8839 12110 0x0 SD]
is_tree_node: node level 17741 does not match to the expected one=20
1
vs-5150: search_by_key: invalid format found in block 26324.=20
=46sck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to=20
find stat data of [32635 32751 0x0 SD]
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 30690.=20
=46sck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to=20
find stat data of [39269 39617 0x0 SD]
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 30690.=20
=46sck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to=20
find stat data of [39269 39617 0x0 SD]
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 30690.=20
=46sck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to=20
find stat data of [39269 39617 0x0 SD]
is_tree_node: node level 0 does not match to the expected one 1
vs-5150: search_by_key: invalid format found in block 30690.=20
=46sck?
vs-13070: reiserfs_read_inode2: i/o failure occurred trying to=20
find stat data of [39269 39617 0x0 SD]

The disk seems to be good, no errors, kernel is 2.4.21 with LVM=20
1.0.7.

Why does this error happen? Is it a bug fixed in a later version?
BTW, it'd be nice if it told me what partition it happened on.
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/PRq2vCkUtBccqkoRAnCPAJ9+BXblT9ML5ljIgfKf3Bp1mZ9E9wCgohN+
3NMCsV5AMbNKnuU8S9HAgL8=3D
=3DGk0C
=2D----END PGP SIGNATURE-----

