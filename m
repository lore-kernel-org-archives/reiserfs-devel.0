From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Check journal_begin() return codes
Date: Thu, 19 May 2005 11:42:37 +0200
Message-ID: <20050519094237.GD1871@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="yVhtmJPUSI46BTXb"
Return-path: <reiserfs-list-return-24082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: akpm@osdl.org

--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello,

  attached patch makes quota code in reiserfs properly check the return
code of journal_begin() and journal_end() functions. The patch is to be
applied after the previous patch fixing the quota transaction size.
Please apply.

								Honza

--yVhtmJPUSI46BTXb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="quota-2.6.12-rc4-3-transstart.diff"

Check return values of journal_begin() and journal_end() in the quota code
for reiserfs.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rup linux-2.6.12-rc4-quotareserve/fs/reiserfs/inode.c linux-2.6.12-rc4-transstart/fs/reiserfs/inode.c
--- linux-2.6.12-rc4-quotareserve/fs/reiserfs/inode.c	Sat May 14 16:53:01 2005
+++ linux-2.6.12-rc4-transstart/fs/reiserfs/inode.c	Sat May 14 17:08:02 2005
@@ -2798,7 +2798,9 @@ int reiserfs_setattr(struct dentry *dent
 		    struct reiserfs_transaction_handle th;
 
 		    /* (user+group)*(old+new) structure - we count quota info and , inode write (sb, inode) */
-		    journal_begin(&th, inode->i_sb, 2*(REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_DEL_BLOCKS)+2);
+		    error = journal_begin(&th, inode->i_sb, 2*(REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_DEL_BLOCKS)+2);
+		    if (error)
+			goto out;
                     error = DQUOT_TRANSFER(inode, attr) ? -EDQUOT : 0;
 		    if (error) {
 			journal_end(&th, inode->i_sb, 2*(REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_DEL_BLOCKS)+2);
@@ -2811,7 +2813,7 @@ int reiserfs_setattr(struct dentry *dent
 		    if (attr->ia_valid & ATTR_GID)
 			inode->i_gid = attr->ia_gid;
 		    mark_inode_dirty(inode);
-		    journal_end(&th, inode->i_sb, 2*(REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_DEL_BLOCKS)+2);
+		    error = journal_end(&th, inode->i_sb, 2*(REISERFS_QUOTA_INIT_BLOCKS+REISERFS_QUOTA_DEL_BLOCKS)+2);
 		}
         }
         if (!error)
diff -rup linux-2.6.12-rc4-quotareserve/fs/reiserfs/super.c linux-2.6.12-rc4-transstart/fs/reiserfs/super.c
--- linux-2.6.12-rc4-quotareserve/fs/reiserfs/super.c	Sat May 14 17:01:56 2005
+++ linux-2.6.12-rc4-transstart/fs/reiserfs/super.c	Sat May 14 17:16:15 2005
@@ -1839,13 +1839,18 @@ static int reiserfs_statfs (struct super
 static int reiserfs_dquot_initialize(struct inode *inode, int type)
 {
     struct reiserfs_transaction_handle th;
-    int ret;
+    int ret, err;
 
     /* We may create quota structure so we need to reserve enough blocks */
     reiserfs_write_lock(inode->i_sb);
-    journal_begin(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS);
+    ret = journal_begin(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS);
+    if (ret)
+	goto out;
     ret = dquot_initialize(inode, type);
-    journal_end(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS);
+    err = journal_end(&th, inode->i_sb, 2*REISERFS_QUOTA_INIT_BLOCKS);
+    if (!ret && err)
+	ret = err;
+out:
     reiserfs_write_unlock(inode->i_sb);
     return ret;
 }
@@ -1853,13 +1858,18 @@ static int reiserfs_dquot_initialize(str
 static int reiserfs_dquot_drop(struct inode *inode)
 {
     struct reiserfs_transaction_handle th;
-    int ret;
+    int ret, err;
 
     /* We may delete quota structure so we need to reserve enough blocks */
     reiserfs_write_lock(inode->i_sb);
-    journal_begin(&th, inode->i_sb, 2*REISERFS_QUOTA_DEL_BLOCKS);
+    ret = journal_begin(&th, inode->i_sb, 2*REISERFS_QUOTA_DEL_BLOCKS);
+    if (ret)
+	goto out;
     ret = dquot_drop(inode);
-    journal_end(&th, inode->i_sb, 2*REISERFS_QUOTA_DEL_BLOCKS);
+    err = journal_end(&th, inode->i_sb, 2*REISERFS_QUOTA_DEL_BLOCKS);
+    if (!ret && err)
+	ret = err;
+out:
     reiserfs_write_unlock(inode->i_sb);
     return ret;
 }
@@ -1867,12 +1877,17 @@ static int reiserfs_dquot_drop(struct in
 static int reiserfs_write_dquot(struct dquot *dquot)
 {
     struct reiserfs_transaction_handle th;
-    int ret;
+    int ret, err;
 
     reiserfs_write_lock(dquot->dq_sb);
-    journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_TRANS_BLOCKS);
+    ret = journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_TRANS_BLOCKS);
+    if (ret)
+	goto out;
     ret = dquot_commit(dquot);
-    journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_TRANS_BLOCKS);
+    err = journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_TRANS_BLOCKS);
+    if (!ret && err)
+	ret = err;
+out:
     reiserfs_write_unlock(dquot->dq_sb);
     return ret;
 }
@@ -1880,12 +1895,17 @@ static int reiserfs_write_dquot(struct d
 static int reiserfs_acquire_dquot(struct dquot *dquot)
 {
     struct reiserfs_transaction_handle th;
-    int ret;
+    int ret, err;
 
     reiserfs_write_lock(dquot->dq_sb);
-    journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS);
+    ret = journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS);
+    if (ret)
+	goto out;
     ret = dquot_acquire(dquot);
-    journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS);
+    err = journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_INIT_BLOCKS);
+    if (!ret && err)
+	ret = err;
+out:
     reiserfs_write_unlock(dquot->dq_sb);
     return ret;
 }
@@ -1893,12 +1913,17 @@ static int reiserfs_acquire_dquot(struct
 static int reiserfs_release_dquot(struct dquot *dquot)
 {
     struct reiserfs_transaction_handle th;
-    int ret;
+    int ret, err;
 
     reiserfs_write_lock(dquot->dq_sb);
-    journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_DEL_BLOCKS);
+    ret = journal_begin(&th, dquot->dq_sb, REISERFS_QUOTA_DEL_BLOCKS);
+    if (ret)
+	goto out;
     ret = dquot_release(dquot);
-    journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_DEL_BLOCKS);
+    err = journal_end(&th, dquot->dq_sb, REISERFS_QUOTA_DEL_BLOCKS);
+    if (!ret && err)
+	ret = err;
+out:
     reiserfs_write_unlock(dquot->dq_sb);
     return ret;
 }
@@ -1918,13 +1943,18 @@ static int reiserfs_mark_dquot_dirty(str
 static int reiserfs_write_info(struct super_block *sb, int type)
 {
     struct reiserfs_transaction_handle th;
-    int ret;
+    int ret, err;
 
     /* Data block + inode block */
     reiserfs_write_lock(sb);
-    journal_begin(&th, sb, 2);
+    ret = journal_begin(&th, sb, 2);
+    if (ret)
+	goto out;
     ret = dquot_commit_info(sb, type);
-    journal_end(&th, sb, 2);
+    err = journal_end(&th, sb, 2);
+    if (!ret && err)
+	ret = err;
+out:
     reiserfs_write_unlock(sb);
     return ret;
 }

--yVhtmJPUSI46BTXb--
