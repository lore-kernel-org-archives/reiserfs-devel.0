From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 02/05] reiserfs: make some warnings informational
Date: Fri, 16 Jun 2006 00:19:00 -0400
Message-ID: <20060616041900.GA5383@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28791-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


 In several places, reiserfs_warning is used when there is no warning, just
 a notice. This patch changes some of them to indicate that the message
 is merely informational.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

--
 fs/reiserfs/bitmap.c |    4 ++--
 fs/reiserfs/super.c  |   14 ++++++--------
 fs/reiserfs/xattr.c  |   10 ++++------
 3 files changed, 12 insertions(+), 16 deletions(-)

diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/bitmap.c linux-2.6.17-rc6-staging2/fs/reiserfs/bitmap.c
--- linux-2.6.17-rc6-staging1/fs/reiserfs/bitmap.c	2006-01-02 22:21:10.000000000 -0500
+++ linux-2.6.17-rc6-staging2/fs/reiserfs/bitmap.c	2006-06-15 20:59:42.000000000 -0400
@@ -40,7 +40,7 @@
 
 #define SET_OPTION(optname) \
    do { \
-        reiserfs_warning(s, "reiserfs: option \"%s\" is set", #optname); \
+        reiserfs_info(s, "block allocator option \"%s\" is set", #optname); \
         set_bit(_ALLOC_ ## optname , &SB_ALLOC_OPTS(s)); \
     } while(0)
 #define TEST_OPTION(optname, s) \
@@ -611,7 +611,7 @@ int reiserfs_parse_alloc_options(struct 
 		return 1;
 	}
 
-	reiserfs_warning(s, "allocator options = [%08x]\n", SB_ALLOC_OPTS(s));
+	reiserfs_info(s, "allocator options = [%08x]\n", SB_ALLOC_OPTS(s));
 	return 0;
 }
 
diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/super.c linux-2.6.17-rc6-staging2/fs/reiserfs/super.c
--- linux-2.6.17-rc6-staging1/fs/reiserfs/super.c	2006-06-15 20:58:48.000000000 -0400
+++ linux-2.6.17-rc6-staging2/fs/reiserfs/super.c	2006-06-15 20:59:42.000000000 -0400
@@ -1432,13 +1432,11 @@ static int read_super_block(struct super
 		/* magic is of non-standard journal filesystem, look at s_version to
 		   find which format is in use */
 		if (sb_version(rs) == REISERFS_VERSION_2)
-			reiserfs_warning(s,
-					 "read_super_block: found reiserfs format \"3.6\""
-					 " with non-standard journal");
+			reiserfs_info(s, "found reiserfs format \"3.6\""
+			              " with non-standard journal\n");
 		else if (sb_version(rs) == REISERFS_VERSION_1)
-			reiserfs_warning(s,
-					 "read_super_block: found reiserfs format \"3.5\""
-					 " with non-standard journal");
+			reiserfs_info(s, "found reiserfs format \"3.5\""
+			              " with non-standard journal\n");
 		else {
 			reiserfs_warning(s,
 					 "sh-2012: read_super_block: found unknown "
@@ -1531,8 +1529,8 @@ static __u32 find_hash_out(struct super_
 			if (reiserfs_rupasov_hash(s)) {
 				hash = YURA_HASH;
 			}
-			reiserfs_warning(s, "FS seems to be empty, autodetect "
-					 "is using the default hash");
+			reiserfs_info(s, "FS seems to be empty, autodetect "
+					 "is using the default hash\n");
 			break;
 		}
 		r5hash = GET_HASH_VALUE(r5_hash(de.de_name, de.de_namelen));
diff -ruNpX ../dontdiff linux-2.6.17-rc6-staging1/fs/reiserfs/xattr.c linux-2.6.17-rc6-staging2/fs/reiserfs/xattr.c
--- linux-2.6.17-rc6-staging1/fs/reiserfs/xattr.c	2006-04-21 15:18:51.000000000 -0400
+++ linux-2.6.17-rc6-staging2/fs/reiserfs/xattr.c	2006-06-15 20:59:42.000000000 -0400
@@ -1275,12 +1275,10 @@ int reiserfs_xattr_init(struct super_blo
 				}
 
 				if (dentry && dentry->d_inode)
-					reiserfs_warning(s,
-							 "Created %s on %s - reserved for "
-							 "xattr storage.",
-							 PRIVROOT_NAME,
-							 reiserfs_bdevname
-							 (inode->i_sb));
+					reiserfs_info(s, "Created %s - "
+					              "reserved for xattr "
+						      "storage.\n",
+						      PRIVROOT_NAME);
 			} else if (!dentry->d_inode) {
 				dput(dentry);
 				dentry = NULL;
