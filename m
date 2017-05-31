From: Tahsin Erdogan <tahsin@google.com>
Subject: [PATCH 19/28] ext4: ext4_xattr_delete_inode() should return accurate errors
Date: Wed, 31 May 2017 01:15:08 -0700
Message-ID: <20170531081517.11438-19-tahsin@google.com>
References: <20170531081517.11438-1-tahsin@google.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hblV040ApgESv8EpuaFu6A8yMgm5VuBlogllYx0TbHo=;
        b=LML1EEX+ihOFp1yMEOkPb6XyuE6Fa/Enwtc3Iktpfy7gl7EjNwpWxL7H2b5uKbMpnR
         BrLhqxW4XnDqotNfSlndJz0PuG884AjkZPoELfwPa2dzbHFsVgSDSQG/T+7fGWBv3kR3
         urCgQCubtBzln1BMDEq2RFDaaWcnbmn0YJjDaHWAZ+wjIYZC3E9QNCseyeostLiEpi+4
         TqTalzOBMrm+BsMtysh981BrSx1dxDst9W8J+J7B5IgdVZ2C10W1LWPxBLsuWrca6xje
         TZnGuy6sr7EhTx6FhKQjJ3zaBoRJ5+iSyQJnUDluFVpgBYal6ZPzgh5Gklnk7t3nrK1G
         5/8Q==
In-Reply-To: <20170531081517.11438-1-tahsin@google.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Dave Kleikamp <shaggy@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Mark Fasheh <mfasheh@versity.com>, Joel Becker <jlbec@evilplan.org>, Jens Axboe <axboe@fb.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Mike Christie <mchristi@redhat.com>, Fabian Frederick <fabf@skynet.be>, linux-ext4@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, Tahsin Erdogan <tahsin@google.com>

In a few places the function returns without trying to pass the actual
error code to the caller. Fix those.

Signed-off-by: Tahsin Erdogan <tahsin@google.com>
---
 fs/ext4/xattr.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index 1d354e447842..230e0aa76777 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -2026,7 +2026,8 @@ ext4_xattr_delete_inode(handle_t *handle, struct inode *inode,
 		if (!entry->e_value_inum)
 			continue;
 		ea_ino = le32_to_cpu(entry->e_value_inum);
-		if (ext4_expand_ino_array(lea_ino_array, ea_ino) != 0) {
+		error = ext4_expand_ino_array(lea_ino_array, ea_ino);
+		if (error) {
 			brelse(iloc.bh);
 			goto cleanup;
 		}
@@ -2037,20 +2038,22 @@ ext4_xattr_delete_inode(handle_t *handle, struct inode *inode,
 delete_external_ea:
 	if (!EXT4_I(inode)->i_file_acl) {
 		/* add xattr inode to orphan list */
-		ext4_xattr_inode_orphan_add(handle, inode, credits,
-						*lea_ino_array);
+		error = ext4_xattr_inode_orphan_add(handle, inode, credits,
+						    *lea_ino_array);
 		goto cleanup;
 	}
 	bh = sb_bread(inode->i_sb, EXT4_I(inode)->i_file_acl);
 	if (!bh) {
 		EXT4_ERROR_INODE(inode, "block %llu read error",
 				 EXT4_I(inode)->i_file_acl);
+		error = -EIO;
 		goto cleanup;
 	}
 	if (BHDR(bh)->h_magic != cpu_to_le32(EXT4_XATTR_MAGIC) ||
 	    BHDR(bh)->h_blocks != cpu_to_le32(1)) {
 		EXT4_ERROR_INODE(inode, "bad block %llu",
 				 EXT4_I(inode)->i_file_acl);
+		error = -EFSCORRUPTED;
 		goto cleanup;
 	}
 
@@ -2059,7 +2062,8 @@ ext4_xattr_delete_inode(handle_t *handle, struct inode *inode,
 		if (!entry->e_value_inum)
 			continue;
 		ea_ino = le32_to_cpu(entry->e_value_inum);
-		if (ext4_expand_ino_array(lea_ino_array, ea_ino) != 0)
+		error = ext4_expand_ino_array(lea_ino_array, ea_ino);
+		if (error)
 			goto cleanup;
 		entry->e_value_inum = 0;
 	}
@@ -2067,7 +2071,7 @@ ext4_xattr_delete_inode(handle_t *handle, struct inode *inode,
 	/* add xattr inode to orphan list */
 	error = ext4_xattr_inode_orphan_add(handle, inode, credits,
 					*lea_ino_array);
-	if (error != 0)
+	if (error)
 		goto cleanup;
 
 	if (!IS_NOQUOTA(inode))
@@ -2077,7 +2081,7 @@ ext4_xattr_delete_inode(handle_t *handle, struct inode *inode,
 		error = ext4_journal_extend(handle, credits);
 		if (error > 0)
 			error = ext4_journal_restart(handle, credits);
-		if (error != 0) {
+		if (error) {
 			ext4_warning(inode->i_sb,
 				"couldn't extend journal (err %d)", error);
 			goto cleanup;
-- 
2.13.0.219.gdb65acc882-goog

