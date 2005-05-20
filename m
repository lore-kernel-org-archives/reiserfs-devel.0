From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] Fix quota transaction size
Date: Fri, 20 May 2005 18:20:53 +0200
Message-ID: <20050520162053.GB27866@atrey.karlin.mff.cuni.cz>
References: <20050519094015.GC1871@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050519094015.GC1871@atrey.karlin.mff.cuni.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org
Cc: George Ronkin <gronkin@nerdvana.com>, mason@suse.com, akpm@osdl.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

>   Hello,
> 
>   attached patch improves the estimates on the number of credits needed
> for a quota operation. This is needed as currently quota overflows the
> maximum size of a transaction if 1KB blocksize is used. Please apply.
> 
  Sorry for replying to myself but I just found out that this patch did
not compile without CONFIG_QUOTA. Attached patch was tested to compile
also without it.

								Honza


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="quota-2.6.12-rc4-2-lesscredits.diff"

Improve estimates on the number of needed credits for quota transaction.
Now we distinguish blocks that might need to be allocated and blocks that
only need to be rewritten. Also we distinguish deleting of a quota structure
and creating of a new one.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-1-reiserbigtrans/fs/ext3/inode.c linux-2.6.12-rc4-2-credits/fs/ext3/inode.c
--- linux-2.6.12-rc4-1-reiserbigtrans/fs/ext3/inode.c	2005-05-18 15:10:55.000000000 +0200
+++ linux-2.6.12-rc4-2-credits/fs/ext3/inode.c	2005-05-18 15:18:12.000000000 +0200
@@ -2763,7 +2763,8 @@ int ext3_setattr(struct dentry *dentry, 
 
 		/* (user+group)*(old+new) structure, inode write (sb,
 		 * inode block, ? - but truncate inode update has it) */
-		handle = ext3_journal_start(inode, 4*EXT3_QUOTA_INIT_BLOCKS+3);
+		handle = ext3_journal_start(inode, 2*(EXT3_QUOTA_INIT_BLOCKS+
+					EXT3_QUOTA_DEL_BLOCKS)+3);
 		if (IS_ERR(handle)) {
 			error = PTR_ERR(handle);
 			goto err_out;
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-1-reiserbigtrans/fs/ext3/super.c linux-2.6.12-rc4-2-credits/fs/ext3/super.c
--- linux-2.6.12-rc4-1-reiserbigtrans/fs/ext3/super.c	2005-05-18 15:10:55.000000000 +0200
+++ linux-2.6.12-rc4-2-credits/fs/ext3/super.c	2005-05-18 15:18:12.000000000 +0200
@@ -2246,7 +2246,7 @@ static int ext3_dquot_drop(struct inode 
 	int ret, err;
 
 	/* We may delete quota structure so we need to reserve enough blocks */
-	handle = ext3_journal_start(inode, 2*EXT3_QUOTA_INIT_BLOCKS);
+	handle = ext3_journal_start(inode, 2*EXT3_QUOTA_DEL_BLOCKS);
 	if (IS_ERR(handle))
 		return PTR_ERR(handle);
 	ret = dquot_drop(inode);
@@ -2296,7 +2296,7 @@ static int ext3_release_dquot(struct dqu
 	handle_t *handle;
 
 	handle = ext3_journal_start(dquot_to_inode(dquot),
-					EXT3_QUOTA_INIT_BLOCKS);
+					EXT3_QUOTA_DEL_BLOCKS);
 	if (IS_ERR(handle))
 		return PTR_ERR(handle);
 	ret = dquot_release(dquot);
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-1-reiserbigtrans/fs/reiserfs/inode.c linux-2.6.12-rc4-2-credits/fs/reiserfs/inode.c
--- linux-2.6.12-rc4-1-reiserbigtrans/fs/reiserfs/inode.c	2005-05-18 15:10:59.000000000 +0200
+++ linux-2.6.12-rc4-2-credits/fs/reiserfs/inode.c	2005-05-18 15:18:12.000000000 +0200
@@ -2798,10 +2798,10 @@ int reiserfs_setattr(struct dentry *dent
 		    struct reiserfs_transaction_handle th;
 
 		    /* (user+group)*(old+new) structure - we count quota info and , inode write (sb, inode) */
-		    journal_begin(&th, inode->i_sb, 4*REISERFS_QUOTA_INIT_BLOCKS+2);
+		    journal_begin(&th, inode->i_sb, 2*(REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_DEL_BLOCKS)+2);
                     error = DQUOT_TRANSFER(inode, attr) ? -EDQUOT : 0;
 		    if (error) {
-			journal_end(&th, inode->i_sb, 4*REISERFS_QUOTA_INIT_BLOCKS+2);
+			journal_end(&th, inode->i_sb, 2*(REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_DEL_BLOCKS)+2);
 			goto out;
 		    }
 		    /* Update corresponding info in inode so that everything is in
@@ -2811,7 +2811,7 @@ int reiserfs_setattr(struct dentry *dent
 		    if (attr->ia_valid & ATTR_GID)
 			inode->i_gid = attr->ia_gid;
 		    mark_inode_dirty(inode);
-		    journal_end(&th, inode->i_sb, 4*REISERFS_QUOTA_INIT_BLOCKS+2);
+		    journal_end(&th, inode->i_sb, 2*(REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_DEL_BLOCKS)+2);
 		}
         }
         if (!error)
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-1-reiserbigtrans/fs/reiserfs/namei.c linux-2.6.12-rc4-2-credits/fs/reiserfs/namei.c
--- linux-2.6.12-rc4-1-reiserbigtrans/fs/reiserfs/namei.c	2005-05-18 15:10:59.000000000 +0200
+++ linux-2.6.12-rc4-2-credits/fs/reiserfs/namei.c	2005-05-18 15:18:12.000000000 +0200
@@ -829,8 +829,10 @@ static int reiserfs_rmdir (struct inode 
 
 
     /* we will be doing 2 balancings and update 2 stat data, we change quotas
-     * of the owner of the directory and of the owner of the parent directory */
-    jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 + 2 * (REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_TRANS_BLOCKS);
+     * of the owner of the directory and of the owner of the parent directory.
+     * The quota structure is possibly deleted only on last iput => outside
+     * of this transaction */
+    jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 + 4 * REISERFS_QUOTA_TRANS_BLOCKS;
 
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
+    jbegin_count = JOURNAL_PER_BALANCE_CNT * 2 + 2 + 4 * REISERFS_QUOTA_TRANS_BLOCKS;
 
     reiserfs_write_lock(dir->i_sb);
     retval = journal_begin(&th, dir->i_sb, jbegin_count) ;
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-1-reiserbigtrans/fs/reiserfs/super.c linux-2.6.12-rc4-2-credits/fs/reiserfs/super.c
--- linux-2.6.12-rc4-1-reiserbigtrans/fs/reiserfs/super.c	2005-05-18 15:10:59.000000000 +0200
+++ linux-2.6.12-rc4-2-credits/fs/reiserfs/super.c	2005-05-18 15:18:12.000000000 +0200
@@ -1857,9 +1857,9 @@ static int reiserfs_dquot_drop(struct in
 
     /* We may delete quota structure so we need to reserve enough blocks */
     reiserfs_write_lock(inode->i_sb);
-    journal_begin(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS);
+    journal_begin(&th, inode->i_sb, 2*REISERFS_QUOTA_DEL_BLOCKS);
     ret = dquot_drop(inode);
-    journal_end(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS);
+    journal_end(&th, inode->i_sb, 2*REISERFS_QUOTA_DEL_BLOCKS);
     reiserfs_write_unlock(inode->i_sb);
     return ret;
 }
@@ -1896,9 +1896,9 @@ static int reiserfs_release_dquot(struct
     int ret;
 
     reiserfs_write_lock(dquot->dq_sb);
-    journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS);
+    journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_DEL_BLOCKS);
     ret = dquot_release(dquot);
-    journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS);
+    journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_DEL_BLOCKS);
     reiserfs_write_unlock(dquot->dq_sb);
     return ret;
 }
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-1-reiserbigtrans/include/linux/dqblk_v1.h linux-2.6.12-rc4-2-credits/include/linux/dqblk_v1.h
--- linux-2.6.12-rc4-1-reiserbigtrans/include/linux/dqblk_v1.h	2004-10-18 23:54:07.000000000 +0200
+++ linux-2.6.12-rc4-2-credits/include/linux/dqblk_v1.h	2005-05-18 15:18:12.000000000 +0200
@@ -11,6 +11,12 @@
 /* Root squash turned on */
 #define V1_DQF_RSQUASH 1
 
+/* Numbers of blocks needed for updates */
+#define V1_INIT_ALLOC 1
+#define V1_INIT_REWRITE 1
+#define V1_DEL_ALLOC 0
+#define V1_DEL_REWRITE 2
+
 /* Special information about quotafile */
 struct v1_mem_dqinfo {
 };
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-1-reiserbigtrans/include/linux/dqblk_v2.h linux-2.6.12-rc4-2-credits/include/linux/dqblk_v2.h
--- linux-2.6.12-rc4-1-reiserbigtrans/include/linux/dqblk_v2.h	2004-10-18 23:53:46.000000000 +0200
+++ linux-2.6.12-rc4-2-credits/include/linux/dqblk_v2.h	2005-05-18 15:18:12.000000000 +0200
@@ -10,6 +10,12 @@
 /* id numbers of quota format */
 #define QFMT_VFS_V0 2
 
+/* Numbers of blocks needed for updates */
+#define V2_INIT_ALLOC 4
+#define V2_INIT_REWRITE 2
+#define V2_DEL_ALLOC 0
+#define V2_DEL_REWRITE 6
+
 /* Inmemory copy of version specific information */
 struct v2_mem_dqinfo {
 	unsigned int dqi_blocks;
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-1-reiserbigtrans/include/linux/ext3_jbd.h linux-2.6.12-rc4-2-credits/include/linux/ext3_jbd.h
--- linux-2.6.12-rc4-1-reiserbigtrans/include/linux/ext3_jbd.h	2005-05-18 15:11:06.000000000 +0200
+++ linux-2.6.12-rc4-2-credits/include/linux/ext3_jbd.h	2005-05-20 17:10:23.000000000 +0200
@@ -77,11 +77,14 @@
 #define EXT3_QUOTA_TRANS_BLOCKS 2
 /* Amount of blocks needed for quota insert/delete - we do some block writes
  * but inode, sb and group updates are done only once */
-#define EXT3_QUOTA_INIT_BLOCKS (DQUOT_MAX_WRITES*\
-				(EXT3_SINGLEDATA_TRANS_BLOCKS-3)+3)
+#define EXT3_QUOTA_INIT_BLOCKS (DQUOT_INIT_ALLOC*\
+		(EXT3_SINGLEDATA_TRANS_BLOCKS-3)+3+DQUOT_INIT_REWRITE)
+#define EXT3_QUOTA_DEL_BLOCKS (DQUOT_DEL_ALLOC*\
+		(EXT3_SINGLEDATA_TRANS_BLOCKS-3)+3+DQUOT_DEL_REWRITE)
 #else
 #define EXT3_QUOTA_TRANS_BLOCKS 0
 #define EXT3_QUOTA_INIT_BLOCKS 0
+#define EXT3_QUOTA_DEL_BLOCKS 0
 #endif
 
 int
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-1-reiserbigtrans/include/linux/quota.h linux-2.6.12-rc4-2-credits/include/linux/quota.h
--- linux-2.6.12-rc4-1-reiserbigtrans/include/linux/quota.h	2005-03-03 18:58:41.000000000 +0100
+++ linux-2.6.12-rc4-2-credits/include/linux/quota.h	2005-05-18 15:18:12.000000000 +0200
@@ -138,8 +138,11 @@ struct if_dqinfo {
 #include <linux/dqblk_v2.h>
 
 /* Maximal numbers of writes for quota operation (insert/delete/update)
- * (over all formats) - info block, 4 pointer blocks, data block */
-#define DQUOT_MAX_WRITES	6
+ * (over VFS all formats) */
+#define DQUOT_INIT_ALLOC max(V1_INIT_ALLOC, V2_INIT_ALLOC)
+#define DQUOT_INIT_REWRITE max(V1_INIT_REWRITE, V2_INIT_REWRITE)
+#define DQUOT_DEL_ALLOC max(V1_DEL_ALLOC, V2_DEL_ALLOC)
+#define DQUOT_DEL_REWRITE max(V1_DEL_REWRITE, V2_DEL_REWRITE)
 
 /*
  * Data for one user/group kept in memory
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-1-reiserbigtrans/include/linux/reiserfs_fs.h linux-2.6.12-rc4-2-credits/include/linux/reiserfs_fs.h
--- linux-2.6.12-rc4-1-reiserbigtrans/include/linux/reiserfs_fs.h	2005-05-18 15:11:10.000000000 +0200
+++ linux-2.6.12-rc4-2-credits/include/linux/reiserfs_fs.h	2005-05-20 17:09:22.000000000 +0200
@@ -1645,10 +1645,12 @@ struct reiserfs_journal_header {
 #define JOURNAL_PER_BALANCE_CNT (3 * (MAX_HEIGHT-2) + 9)
 #ifdef CONFIG_QUOTA
 #define REISERFS_QUOTA_TRANS_BLOCKS 2	/* We need to update data and inode (atime) */
-#define REISERFS_QUOTA_INIT_BLOCKS (DQUOT_MAX_WRITES*(JOURNAL_PER_BALANCE_CNT+2)+1)	/* 1 balancing, 1 bitmap, 1 data per write + stat data update */
+#define REISERFS_QUOTA_INIT_BLOCKS (DQUOT_INIT_ALLOC*(JOURNAL_PER_BALANCE_CNT+2)+DQUOT_INIT_REWRITE+1)	/* 1 balancing, 1 bitmap, 1 data per write + stat data update */
+#define REISERFS_QUOTA_DEL_BLOCKS (DQUOT_DEL_ALLOC*(JOURNAL_PER_BALANCE_CNT+2)+DQUOT_DEL_REWRITE+1)	/* same as with INIT */
 #else
 #define REISERFS_QUOTA_TRANS_BLOCKS 0
 #define REISERFS_QUOTA_INIT_BLOCKS 0
+#define REISERFS_QUOTA_DEL_BLOCKS 0
 #endif
 
 /* both of these can be as low as 1, or as high as you want.  The min is the

--cWoXeonUoKmBZSoM--
