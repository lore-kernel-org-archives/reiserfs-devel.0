From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Fix reiserfs oops on small fs
Date: Thu, 18 Nov 2004 12:49:29 +0100
Message-ID: <20041118114928.GD2767@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="eheScQNz3K90DVRs"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: linux-fsdevel@vger.kernel.org


--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello!

  Attached patch fixes oops of reiserfs on a filesystem with just one
bitmap block - current code always tries to return second bitmap even if
there's not any. Could someone review it please so that it can be merged
in mainline?
	
								Honza

--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="quota-new-2.6.10-rc2-mm1-4-reisersmall.diff"

Fix block allocation code of reiserfs to give correct bitmap numbers
for small filesystems (with just one bitmap block).

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupNX /home/jack/.kerndiffexclude linux-2.6.10-rc2-mm1-3-reiserdebug/fs/reiserfs/bitmap.c linux-2.6.10-rc2-mm1-4-reisersmall/fs/reiserfs/bitmap.c
--- linux-2.6.10-rc2-mm1-3-reiserdebug/fs/reiserfs/bitmap.c	2004-11-16 16:57:33.000000000 +0100
+++ linux-2.6.10-rc2-mm1-4-reisersmall/fs/reiserfs/bitmap.c	2004-11-16 17:01:47.000000000 +0100
@@ -229,6 +229,9 @@ static int bmap_hash_id(struct super_blo
     unsigned long hash;
     unsigned bm;
 
+    /* If there is only one bitmap, we have no choice... */
+    if (SB_BMAP_NR(s) == 1)
+	return 0;
     if (id <= 2) {
 	bm = 1;
     } else {
@@ -613,7 +616,7 @@ dirid_groups (reiserfs_blocknr_hint_t *h
 	/* give a portion of the block group to metadata */
 	if (hint->inode)
 	    hash += sb->s_blocksize/2;
-	hint->search_start = hash;
+	hint->search_start = hash >= SB_BLOCK_COUNT(sb) ? SB_BLOCK_COUNT(sb)-1 : hash;
     }
 }
 
@@ -642,7 +645,7 @@ oid_groups (reiserfs_blocknr_hint_t *hin
 	    bm = bmap_hash_id(hint->inode->i_sb, oid);
 	    hash = bm * (hint->inode->i_sb->s_blocksize << 3);
 	}
-	hint->search_start = hash;
+	hint->search_start = hash >= SB_BLOCK_COUNT(hint->inode->i_sb) ? SB_BLOCK_COUNT(hint->inode->i_sb)-1 : hash;
     }
 }
 

--eheScQNz3K90DVRs--
