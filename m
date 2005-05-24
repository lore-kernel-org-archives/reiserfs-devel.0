From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Improve quota credit estimates for reiserfs
Date: Tue, 24 May 2005 13:33:28 +0200
Message-ID: <20050524113328.GD20958@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="SO98HVl1bnMOfKZd"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: reiserfs-list@namesys.com, akpm@osdl.org


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello,

  attached patch makes reiserfs use improved quota credits estimates. It
also teaches reiserfs to reserve a space in a transaction only if some
quota mount options were specified. Please apply.

								Honza

-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs

--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="quota-2.6.12-rc4-5-credits-reiser.diff"

Use improved credits estimates for quota operations. Also reserve space
for a quota operation in a transaction only if filesystem was mounted with
some quota option.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-4-credits-ext3/fs/reiserfs/file.c linux-2.6.12-rc4-5-credits-reiser/fs/reiserfs/file.c
--- linux-2.6.12-rc4-4-credits-ext3/fs/reiserfs/file.c	2005-05-18 15:10:59.000000000 +0200
+++ linux-2.6.12-rc4-5-credits-reiser/fs/reiserfs/file.c	2005-05-24 11:25:59.000000000 +0200
@@ -201,7 +201,7 @@ static int reiserfs_allocate_blocks_for_
     /* If we came here, it means we absolutely need to open a transaction,
        since we need to allocate some blocks */
     reiserfs_write_lock(inode->i_sb); // Journaling stuff and we need that.
-    res = journal_begin(th, inode->i_sb, JOURNAL_PER_BALANCE_CNT * 3 + 1 + 2 * REISERFS_QUOTA_TRANS_BLOCKS); // Wish I know if this number enough
+    res = journal_begin(th, inode->i_sb, JOURNAL_PER_BALANCE_CNT * 3 + 1 + 2 * REISERFS_QUOTA_TRANS_BLOCKS(inode->i_sb)); // Wish I know if this number enough
     if (res)
         goto error_exit;
     reiserfs_update_inode_transaction(inode) ;
@@ -576,7 +576,7 @@ error_exit:
         int err;
         // update any changes we made to blk count
         reiserfs_update_sd(th, inode);
-        err = journal_end(th, inode->i_sb, JOURNAL_PER_BALANCE_CNT * 3 + 1 + 2 * REISERFS_QUOTA_TRANS_BLOCKS);
+        err = journal_end(th, inode->i_sb, JOURNAL_PER_BALANCE_CNT * 3 + 1 + 2 * REISERFS_QUOTA_TRANS_BLOCKS(inode->i_sb));
         if (err)
             res = err;
     }
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-4-credits-ext3/fs/reiserfs/inode.c linux-2.6.12-rc4-5-credits-reiser/fs/reiserfs/inode.c
--- linux-2.6.12-rc4-4-credits-ext3/fs/reiserfs/inode.c	2005-05-23 17:05:01.000000000 +0200
+++ linux-2.6.12-rc4-5-credits-reiser/fs/reiserfs/inode.c	2005-05-24 11:27:23.000000000 +0200
@@ -28,7 +28,7 @@ static int reiserfs_prepare_write(struct
 void reiserfs_delete_inode (struct inode * inode)
 {
     /* We need blocks for transaction + (user+group) quota update (possibly delete) */
-    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 * REISERFS_QUOTA_INIT_BLOCKS;
+    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 * REISERFS_QUOTA_INIT_BLOCKS(inode->i_sb);
     struct reiserfs_transaction_handle th ;
   
     reiserfs_write_lock(inode->i_sb);
@@ -591,7 +591,7 @@ int reiserfs_get_block (struct inode * i
        XXX in practically impossible worst case direct2indirect()
        can incur (much) more than 3 balancings.
        quota update for user, group */
-    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 1 + 2 * REISERFS_QUOTA_TRANS_BLOCKS;
+    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 1 + 2 * REISERFS_QUOTA_TRANS_BLOCKS(inode->i_sb);
     int version;
     int dangle = 1;
     loff_t new_offset = (((loff_t)block) << inode->i_sb->s_blocksize_bits) + 1 ;
@@ -2796,14 +2796,15 @@ int reiserfs_setattr(struct dentry *dent
 
                 if (!error) {
 		    struct reiserfs_transaction_handle th;
+		    int jbegin_count = 2*(REISERFS_QUOTA_INIT_BLOCKS(inode->i_sb)+REISERFS_QUOTA_DEL_BLOCKS(inode->i_sb))+2;
 
 		    /* (user+group)*(old+new) structure - we count quota info and , inode write (sb, inode) */
-		    error = journal_begin(&th, inode->i_sb, 4*REISERFS_QUOTA_INIT_BLOCKS+2);
+		    error = journal_begin(&th, inode->i_sb, jbegin_count);
  		    if (error)
  			goto out;
                     error = DQUOT_TRANSFER(inode, attr) ? -EDQUOT : 0;
 		    if (error) {
-			journal_end(&th, inode->i_sb, 4*REISERFS_QUOTA_INIT_BLOCKS+2);
+			journal_end(&th, inode->i_sb, jbegin_count);
 			goto out;
 		    }
 		    /* Update corresponding info in inode so that everything is in
@@ -2813,7 +2814,7 @@ int reiserfs_setattr(struct dentry *dent
 		    if (attr->ia_valid & ATTR_GID)
 			inode->i_gid = attr->ia_gid;
 		    mark_inode_dirty(inode);
-		    error = journal_end(&th, inode->i_sb, 4*REISERFS_QUOTA_INIT_BLOCKS+2);
+		    error = journal_end(&th, inode->i_sb, jbegin_count);
 		}
         }
         if (!error)
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-4-credits-ext3/fs/reiserfs/namei.c linux-2.6.12-rc4-5-credits-reiser/fs/reiserfs/namei.c
--- linux-2.6.12-rc4-4-credits-ext3/fs/reiserfs/namei.c	2005-05-18 15:10:59.000000000 +0200
+++ linux-2.6.12-rc4-5-credits-reiser/fs/reiserfs/namei.c	2005-05-24 11:25:59.000000000 +0200
@@ -586,7 +586,7 @@ static int reiserfs_create (struct inode
     int retval;
     struct inode * inode;
     /* We need blocks for transaction + (user+group)*(quotas for new inode + update of quota for directory owner) */
-    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 * (REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_TRANS_BLOCKS);
+    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 * (REISERFS_QUOTA_INIT_BLOCKS(dir->i_sb)+REISERFS_QUOTA_TRANS_BLOCKS(dir->i_sb));
     struct reiserfs_transaction_handle th ;
     int locked;
 
@@ -653,7 +653,7 @@ static int reiserfs_mknod (struct inode 
     struct inode * inode;
     struct reiserfs_transaction_handle th ;
     /* We need blocks for transaction + (user+group)*(quotas for new inode + update of quota for directory owner) */
-    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 2 * (REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_TRANS_BLOCKS);
+    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 2 * (REISERFS_QUOTA_INIT_BLOCKS(dir->i_sb)+REISERFS_QUOTA_TRANS_BLOCKS(dir->i_sb));
     int locked;
 
     if (!new_valid_dev(rdev))
@@ -727,7 +727,7 @@ static int reiserfs_mkdir (struct inode 
     struct inode * inode;
     struct reiserfs_transaction_handle th ;
     /* We need blocks for transaction + (user+group)*(quotas for new inode + update of quota for directory owner) */
-    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 2 * (REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_TRANS_BLOCKS);
+    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 2 * (REISERFS_QUOTA_INIT_BLOCKS(dir->i_sb)+REISERFS_QUOTA_TRANS_BLOCKS(dir->i_sb));
     int locked;
 
 #ifdef DISPLACE_NEW_PACKING_LOCALITIES
@@ -829,8 +829,10 @@ static int reiserfs_rmdir (struct inode 
 
 
     /* we will be doing 2 balancings and update 2 stat data, we change quotas
-     * of the owner of the directory and of the owner of the parent directory */
-    jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 + 2 * (REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_TRANS_BLOCKS);
+     * of the owner of the directory and of the owner of the parent directory.
+     * The quota structure is possibly deleted only on last iput => outside
+     * of this transaction */
+    jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 + 4 * REISERFS_QUOTA_TRANS_BLOCKS(dir->i_sb);
 
     reiserfs_write_lock(dir->i_sb);
     retval = journal_begin(&th, dir->i_sb, jbegin_count) ;
@@ -913,9 +915,10 @@ static int reiserfs_unlink (struct inode
     inode = dentry->d_inode;
 
     /* in this transaction we can be doing at max two balancings and update
-       two stat datas, we change quotas of the owner of the directory and of
-       the owner of the parent directory */
-    jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 + 2 * (REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_TRANS_BLOCKS);
+     * two stat datas, we change quotas of the owner of the directory and of
+     * the owner of the parent directory. The quota structure is possibly
+     * deleted only on iput => outside of this transaction */
+    jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 + 4 * REISERFS_QUOTA_TRANS_BLOCKS(dir->i_sb);
 
     reiserfs_write_lock(dir->i_sb);
     retval = journal_begin(&th, dir->i_sb, jbegin_count) ;
@@ -1000,7 +1003,7 @@ static int reiserfs_symlink (struct inod
     struct reiserfs_transaction_handle th ;
     int mode = S_IFLNK | S_IRWXUGO;
     /* We need blocks for transaction + (user+group)*(quotas for new inode + update of quota for directory owner) */
-    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 2 * (REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_TRANS_BLOCKS);
+    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 2 * (REISERFS_QUOTA_INIT_BLOCKS(parent_dir->i_sb)+REISERFS_QUOTA_TRANS_BLOCKS(parent_dir->i_sb));
 
     if (!(inode = new_inode(parent_dir->i_sb))) {
 	return -ENOMEM ;
@@ -1076,7 +1079,7 @@ static int reiserfs_link (struct dentry 
     struct inode *inode = old_dentry->d_inode;
     struct reiserfs_transaction_handle th ;
     /* We need blocks for transaction + update of quotas for the owners of the directory */
-    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 2 * REISERFS_QUOTA_TRANS_BLOCKS;
+    int jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 2 * REISERFS_QUOTA_TRANS_BLOCKS(dir->i_sb);
 
     reiserfs_write_lock(dir->i_sb);
     if (inode->i_nlink >= REISERFS_LINK_MAX) {
@@ -1196,7 +1199,7 @@ static int reiserfs_rename (struct inode
        pointed initially and (5) maybe block containing ".." of
        renamed directory
        quota updates: two parent directories */
-    jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 5 + 4 * REISERFS_QUOTA_TRANS_BLOCKS;
+    jbegin_count = JOURNAL_PER_BALANCE_CNT * 3 + 5 + 4 * REISERFS_QUOTA_TRANS_BLOCKS(old_dir->i_sb);
 
     old_inode = old_dentry->d_inode;
     new_dentry_inode = new_dentry->d_inode;
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-4-credits-ext3/fs/reiserfs/super.c linux-2.6.12-rc4-5-credits-reiser/fs/reiserfs/super.c
--- linux-2.6.12-rc4-4-credits-ext3/fs/reiserfs/super.c	2005-05-23 17:08:32.000000000 +0200
+++ linux-2.6.12-rc4-5-credits-reiser/fs/reiserfs/super.c	2005-05-24 11:28:50.000000000 +0200
@@ -864,8 +864,9 @@ static int reiserfs_parse_options (struc
 	{"jdev",	.arg_required = 'j', .values = NULL},
 	{"nolargeio",	.arg_required = 'w', .values = NULL},
 	{"commit",	.arg_required = 'c', .values = NULL},
-	{"usrquota",},
-	{"grpquota",},
+	{"usrquota",	.setmask = 1<<REISERFS_QUOTA},
+	{"grpquota",	.setmask = 1<<REISERFS_QUOTA},
+	{"noquota",	.clrmask = 1<<REISERFS_QUOTA},
 	{"errors", 	.arg_required = 'e', .values = error_actions},
 	{"usrjquota",	.arg_required = 'u'|(1<<REISERFS_OPT_ALLOWEMPTY), .values = NULL},
 	{"grpjquota",	.arg_required = 'g'|(1<<REISERFS_OPT_ALLOWEMPTY), .values = NULL},
@@ -962,6 +963,7 @@ static int reiserfs_parse_options (struc
 		    return 0;
 		}
 		strcpy(REISERFS_SB(s)->s_qf_names[qtype], arg);
+		*mount_options |= 1<<REISERFS_QUOTA;
 	    }
 	    else {
 		if (REISERFS_SB(s)->s_qf_names[qtype]) {
@@ -993,7 +995,13 @@ static int reiserfs_parse_options (struc
 	reiserfs_warning(s, "reiserfs_parse_options: journalled quota format not specified.");
 	return 0;
     }
+    /* This checking is not precise wrt the quota type but for our purposes it is sufficient */
+    if (!(*mount_options & (1<<REISERFS_QUOTA)) && sb_any_quota_enabled(s)) {
+	reiserfs_warning(s, "reiserfs_parse_options: quota options must be present when quota is turned on.");
+	return 0;
+    }
 #endif
+
     return 1;
 }
 
@@ -1103,6 +1111,7 @@ static int reiserfs_remount (struct supe
   safe_mask |= 1 << REISERFS_ERROR_RO;
   safe_mask |= 1 << REISERFS_ERROR_CONTINUE;
   safe_mask |= 1 << REISERFS_ERROR_PANIC;
+  safe_mask |= 1 << REISERFS_QUOTA;
 
   /* Update the bitmask, taking care to keep
    * the bits we're not allowed to change here */
@@ -1843,11 +1852,11 @@ static int reiserfs_dquot_initialize(str
 
     /* We may create quota structure so we need to reserve enough blocks */
     reiserfs_write_lock(inode->i_sb);
-    ret = journal_begin(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS);
+    ret = journal_begin(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS(inode->i_sb));
     if (ret)
 	goto out;
     ret = dquot_initialize(inode, type);
-    err = journal_end(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS);
+    err = journal_end(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS(inode->i_sb));
     if (!ret && err)
 	ret = err;
 out:
@@ -1862,11 +1871,11 @@ static int reiserfs_dquot_drop(struct in
 
     /* We may delete quota structure so we need to reserve enough blocks */
     reiserfs_write_lock(inode->i_sb);
-    ret = journal_begin(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS);
+    ret = journal_begin(&th, inode->i_sb, 2*REISERFS_QUOTA_DEL_BLOCKS(inode->i_sb));
     if (ret)
  	goto out;
     ret = dquot_drop(inode);
-    err = journal_end(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS);
+    err = journal_end(&th, inode->i_sb, 2*REISERFS_QUOTA_DEL_BLOCKS(inode->i_sb));
     if (!ret && err)
 	ret = err;
 out:
@@ -1880,11 +1889,11 @@ static int reiserfs_write_dquot(struct d
     int ret, err;
 
     reiserfs_write_lock(dquot->dq_sb);
-    ret = journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_TRANS_BLOCKS);
+    ret = journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_TRANS_BLOCKS(dquot->dq_sb));
     if (ret)
 	goto out;
     ret = dquot_commit(dquot);
-    err = journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_TRANS_BLOCKS);
+    err = journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_TRANS_BLOCKS(dquot->dq_sb));
     if (!ret && err)
 	ret = err;
 out:
@@ -1898,11 +1907,11 @@ static int reiserfs_acquire_dquot(struct
     int ret, err;
 
     reiserfs_write_lock(dquot->dq_sb);
-    ret = journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS);
+    ret = journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS(dquot->dq_sb));
     if (ret)
 	goto out;
     ret = dquot_acquire(dquot);
-    err = journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS);
+    err = journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS(dquot->dq_sb));
     if (!ret && err)
 	ret = err;
 out:
@@ -1916,11 +1925,11 @@ static int reiserfs_release_dquot(struct
     int ret, err;
 
     reiserfs_write_lock(dquot->dq_sb);
-    ret = journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS);
+    ret = journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_DEL_BLOCKS(dquot->dq_sb));
     if (ret)
  	goto out;
     ret = dquot_release(dquot);
-    err = journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS);
+    err = journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_DEL_BLOCKS(dquot->dq_sb));
     if (!ret && err)
 	ret = err;
 out:
@@ -1991,6 +2000,8 @@ static int reiserfs_quota_on(struct supe
     int err;
     struct nameidata nd;
 
+    if (!(REISERFS_SB(sb)->s_mount_opt & (1<<REISERFS_QUOTA)))
+	return -EINVAL;
     err = path_lookup(path, LOOKUP_FOLLOW, &nd);
     if (err)
         return err;
Only in linux-2.6.12-rc4-5-credits-reiser/include/asm-um: elf.h
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-4-credits-ext3/include/linux/reiserfs_fs.h linux-2.6.12-rc4-5-credits-reiser/include/linux/reiserfs_fs.h
--- linux-2.6.12-rc4-4-credits-ext3/include/linux/reiserfs_fs.h	2005-05-18 15:11:10.000000000 +0200
+++ linux-2.6.12-rc4-5-credits-reiser/include/linux/reiserfs_fs.h	2005-05-24 11:25:59.000000000 +0200
@@ -1644,11 +1644,18 @@ struct reiserfs_journal_header {
 #define JOURNAL_MAX_TRANS_AGE 30
 #define JOURNAL_PER_BALANCE_CNT (3 * (MAX_HEIGHT-2) + 9)
 #ifdef CONFIG_QUOTA
-#define REISERFS_QUOTA_TRANS_BLOCKS 2	/* We need to update data and inode (atime) */
-#define REISERFS_QUOTA_INIT_BLOCKS (DQUOT_MAX_WRITES*(JOURNAL_PER_BALANCE_CNT+2)+1)	/* 1 balancing, 1 bitmap, 1 data per write + stat data update */
+/* We need to update data and inode (atime) */
+#define REISERFS_QUOTA_TRANS_BLOCKS(s) (REISERFS_SB(s)->s_mount_opt & (1<<REISERFS_QUOTA) ? 2 : 0)
+/* 1 balancing, 1 bitmap, 1 data per write + stat data update */
+#define REISERFS_QUOTA_INIT_BLOCKS(s) (REISERFS_SB(s)->s_mount_opt & (1<<REISERFS_QUOTA) ? \
+(DQUOT_INIT_ALLOC*(JOURNAL_PER_BALANCE_CNT+2)+DQUOT_INIT_REWRITE+1) : 0)
+/* same as with INIT */
+#define REISERFS_QUOTA_DEL_BLOCKS(s) (REISERFS_SB(s)->s_mount_opt & (1<<REISERFS_QUOTA) ? \
+(DQUOT_DEL_ALLOC*(JOURNAL_PER_BALANCE_CNT+2)+DQUOT_DEL_REWRITE+1) : 0)
 #else
-#define REISERFS_QUOTA_TRANS_BLOCKS 0
-#define REISERFS_QUOTA_INIT_BLOCKS 0
+#define REISERFS_QUOTA_TRANS_BLOCKS(s) 0
+#define REISERFS_QUOTA_INIT_BLOCKS(s) 0
+#define REISERFS_QUOTA_DEL_BLOCKS(s) 0
 #endif
 
 /* both of these can be as low as 1, or as high as you want.  The min is the
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-4-credits-ext3/include/linux/reiserfs_fs_sb.h linux-2.6.12-rc4-5-credits-reiser/include/linux/reiserfs_fs_sb.h
--- linux-2.6.12-rc4-4-credits-ext3/include/linux/reiserfs_fs_sb.h	2005-03-03 18:58:41.000000000 +0100
+++ linux-2.6.12-rc4-5-credits-reiser/include/linux/reiserfs_fs_sb.h	2005-05-24 11:25:59.000000000 +0200
@@ -467,6 +467,8 @@ enum reiserfs_mount_options {
     REISERFS_ERROR_RO,
     REISERFS_ERROR_CONTINUE,
 
+    REISERFS_QUOTA,		/* Some quota option specified */
+
     REISERFS_TEST1,
     REISERFS_TEST2,
     REISERFS_TEST3,
Files linux-2.6.12-rc4-4-credits-ext3/linux and linux-2.6.12-rc4-5-credits-reiser/linux differ

--SO98HVl1bnMOfKZd--
