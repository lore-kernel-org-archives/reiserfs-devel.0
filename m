From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] Fix for reiserfsck mishandling hash=0
Date: Wed, 15 Sep 2004 09:52:20 -0400
Message-ID: <41484914.1000109@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000209090202000205050705"
Return-path: <reiserfs-list-return-21764-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------000209090202000205050705
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hey all -

When reiserfsck traverses the tree looking for errors, one of the checks
it performs is to see if the hash on disk matches the expected hash,
computed from the filename.

However, the handling of hash = 0 is broken in reiserfsck. In the
kernel, hash = 0 is considered special and is adjusted to 0x80.
reiserfsck doesn't perform this adjustment, and yields fatal errors with
~ instructions to use --rebuild-tree, even though no such error exists.

reiserfs_add_entry() in the semantic rebuild uses the correct
adjustment, from hash_value()

This filename has hash = 0:
G60V0AAT6HJ0000000000000001IC8TRGDUN604xDOCCM2IFN304Q~GM~M2

Attached is a patch to good_name(), allowing reiserfsprogs to properly
handle filenames with hash = 0.

Please apply.

- -Jeff
- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBSEkULPWxlyuTD7IRAouvAKCaPDwiKW47iUD9zkBOtdCsLpofywCfXZNX
5v0/2Z1LB+EYRFNrByTRJDI=
=K18H
-----END PGP SIGNATURE-----

--------------000209090202000205050705
Content-Type: text/plain;
 name="reiserfsprogs-hash0.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiserfsprogs-hash0.diff"

diff -rup reiserfsprogs-3.6.18/reiserfscore/node_formats.c reiserfsprogs-3.6.18.devel/reiserfscore/node_formats.c
--- reiserfsprogs-3.6.18/reiserfscore/node_formats.c	2004-05-28 07:42:43.000000000 -0400
+++ reiserfsprogs-3.6.18.devel/reiserfscore/node_formats.c	2004-09-15 09:05:16.681478544 -0400
@@ -527,9 +527,13 @@ int known_hashes (void)
 }
 
 
-#define good_name(hashfn,name,namelen,deh_offset) \
-(GET_HASH_VALUE ((hashfn) (name, namelen)) == GET_HASH_VALUE (deh_offset))
-
+#define good_name(hashfn,name,namelen,deh_offset)               \
+({                                                              \
+    __u32 __x = (GET_HASH_VALUE ((hashfn) (name, namelen)));    \
+    if (__x == 0)                                               \
+        __x = 128;                                              \
+    __x == GET_HASH_VALUE (deh_offset);                         \
+})
 
 /* this also sets hash function */
 int is_properly_hashed (reiserfs_filsys_t * fs,

--------------000209090202000205050705--
