From: Greg KH <gregkh@suse.de>
Subject: [08/20] reiserfs: Force inode evictions before umount to avoid crash
Date: Tue, 10 Jan 2012 12:06:59 -0800
Message-ID: <20120110200850.467676402@clark.kroah.org>
References: <20120110200902.GA5674@kroah.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120110200902.GA5674@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org, alan@lxorguk.ukuu.org.uk, reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Jan Kara <jack@suse.cz>

2.6.32-longterm review patch.  If anyone has any objections, please let me know.

------------------

From: Jeff Mahoney <jeffm@suse.com>

commit a9e36da655e54545c3289b2a0700b5c443de0edd upstream.

This patch fixes a crash in reiserfs_delete_xattrs during umount.

When shrink_dcache_for_umount clears the dcache from
generic_shutdown_super, delayed evictions are forced to disk. If an
evicted inode has extended attributes associated with it, it will
need to walk the xattr tree to locate and remove them.

But since shrink_dcache_for_umount will BUG if it encounters active
dentries, the xattr tree must be released before it's called or it will
crash during every umount.

This patch forces the evictions to occur before generic_shutdown_super
by calling shrink_dcache_sb first. The additional evictions caused
by the removal of each associated xattr file and dir will be automatically
handled as they're added to the LRU list.

CC: reiserfs-devel@vger.kernel.org
Signed-off-by: Jeff Mahoney <jeffm@suse.com>
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 fs/reiserfs/super.c |   24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -445,16 +445,20 @@ int remove_save_link(struct inode *inode
 static void reiserfs_kill_sb(struct super_block *s)
 {
 	if (REISERFS_SB(s)) {
-		if (REISERFS_SB(s)->xattr_root) {
-			d_invalidate(REISERFS_SB(s)->xattr_root);
-			dput(REISERFS_SB(s)->xattr_root);
-			REISERFS_SB(s)->xattr_root = NULL;
-		}
-		if (REISERFS_SB(s)->priv_root) {
-			d_invalidate(REISERFS_SB(s)->priv_root);
-			dput(REISERFS_SB(s)->priv_root);
-			REISERFS_SB(s)->priv_root = NULL;
-		}
+		/*
+		 * Force any pending inode evictions to occur now. Any
+		 * inodes to be removed that have extended attributes
+		 * associated with them need to clean them up before
+		 * we can release the extended attribute root dentries.
+		 * shrink_dcache_for_umount will BUG if we don't release
+		 * those before it's called so ->put_super is too late.
+		 */
+		shrink_dcache_sb(s);
+
+		dput(REISERFS_SB(s)->xattr_root);
+		REISERFS_SB(s)->xattr_root = NULL;
+		dput(REISERFS_SB(s)->priv_root);
+		REISERFS_SB(s)->priv_root = NULL;
 	}
 
 	kill_block_super(s);

