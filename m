From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: enable attrs by default if safe
Date: Wed, 22 Jun 2005 15:50:36 -0400
Message-ID: <20050622195036.GA23996@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24476-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS List <reiserfs-list@namesys.com>


 The following patch enables attrs by default if the reiserfs_attrs_cleared
 bit is set in the superblock. This allows chattr-type attrs to be used
 without any further action by the user.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
 
diff -ruNpX dontdiff linux-2.6.12-rc6/fs/reiserfs/super.c linux-2.6.12-rc6.devel/fs/reiserfs/super.c
--- linux-2.6.12-rc6/fs/reiserfs/super.c	2005-06-13 14:34:58.000000000 -0400
+++ linux-2.6.12-rc6.devel/fs/reiserfs/super.c	2005-06-22 17:34:55.000000000 -0400
@@ -884,6 +884,8 @@ static void handle_attrs( struct super_b
 				reiserfs_warning(s, "reiserfs: cannot support attributes until flag is set in super-block" );
 				REISERFS_SB(s) -> s_mount_opt &= ~ ( 1 << REISERFS_ATTRS );
 		}
+	} else if (le32_to_cpu( rs -> s_flags ) & reiserfs_attrs_cleared) {
+		REISERFS_SB(s)->s_mount_opt |= REISERFS_ATTRS;
 	}
 }
 
-- 
Jeff Mahoney
SuSE Labs
