From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v2 72/92] reiserfs: convert to ctime accessor functions
Date: Wed,  5 Jul 2023 15:01:37 -0400
Message-ID: <20230705190309.579783-70-jlayton@kernel.org>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688583914;
        bh=VDsHkKotGHF3rbDJV684a/iwEaoS4qQlMTVEzxa0ezs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DepHFp8A8vg0TRpOOrMGMOV8hm44msFe5IlcCTRq1gSum6eu4OmruzNXY5RXJkgLl
         looBizoIhLiJLQdNZMrR+v75b+2QepWsGjg1Q5K8ox4l686bIZvLBJLC12fjiMkNpU
         BtSFh15yBnuyirgXBN7aMu1PfKgKNcwG2BgULoNpKxNvLkU0NsaTL7LVGwqDV7DJQP
         uA743xMrxTt0EkSUgWHYacvxpwKvooiz6R0B0U4KEQUpXlHEw0X/yTnZHk1im9Apv5
         5Gn30irCk5gPjGk1BN3CA92mDntY0AT4YDtfwdA1GOPwxAlNp3rpyji3JED+d5vtQ6
         nGwQvIA/hvkew==
In-Reply-To: <20230705190309.579783-1-jlayton@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

In later patches, we're going to change how the inode's ctime field is
used. Switch to using accessor functions instead of raw accesses of
inode->i_ctime.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/reiserfs/inode.c     | 12 +++++-------
 fs/reiserfs/ioctl.c     |  4 ++--
 fs/reiserfs/namei.c     | 11 ++++++-----
 fs/reiserfs/stree.c     |  4 ++--
 fs/reiserfs/super.c     |  2 +-
 fs/reiserfs/xattr.c     |  5 +++--
 fs/reiserfs/xattr_acl.c |  2 +-
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 77bd3b27059f..86e55d4bb10d 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -1259,9 +1259,8 @@ static void init_inode(struct inode *inode, struct treepath *path)
 		inode->i_size = sd_v1_size(sd);
 		inode->i_atime.tv_sec = sd_v1_atime(sd);
 		inode->i_mtime.tv_sec = sd_v1_mtime(sd);
-		inode->i_ctime.tv_sec = sd_v1_ctime(sd);
+		inode_set_ctime(inode, sd_v1_ctime(sd), 0);
 		inode->i_atime.tv_nsec = 0;
-		inode->i_ctime.tv_nsec = 0;
 		inode->i_mtime.tv_nsec = 0;
 
 		inode->i_blocks = sd_v1_blocks(sd);
@@ -1314,8 +1313,7 @@ static void init_inode(struct inode *inode, struct treepath *path)
 		i_gid_write(inode, sd_v2_gid(sd));
 		inode->i_mtime.tv_sec = sd_v2_mtime(sd);
 		inode->i_atime.tv_sec = sd_v2_atime(sd);
-		inode->i_ctime.tv_sec = sd_v2_ctime(sd);
-		inode->i_ctime.tv_nsec = 0;
+		inode_set_ctime(inode, sd_v2_ctime(sd), 0);
 		inode->i_mtime.tv_nsec = 0;
 		inode->i_atime.tv_nsec = 0;
 		inode->i_blocks = sd_v2_blocks(sd);
@@ -1374,7 +1372,7 @@ static void inode2sd(void *sd, struct inode *inode, loff_t size)
 	set_sd_v2_gid(sd_v2, i_gid_read(inode));
 	set_sd_v2_mtime(sd_v2, inode->i_mtime.tv_sec);
 	set_sd_v2_atime(sd_v2, inode->i_atime.tv_sec);
-	set_sd_v2_ctime(sd_v2, inode->i_ctime.tv_sec);
+	set_sd_v2_ctime(sd_v2, inode_get_ctime(inode).tv_sec);
 	set_sd_v2_blocks(sd_v2, to_fake_used_blocks(inode, SD_V2_SIZE));
 	if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode))
 		set_sd_v2_rdev(sd_v2, new_encode_dev(inode->i_rdev));
@@ -1394,7 +1392,7 @@ static void inode2sd_v1(void *sd, struct inode *inode, loff_t size)
 	set_sd_v1_nlink(sd_v1, inode->i_nlink);
 	set_sd_v1_size(sd_v1, size);
 	set_sd_v1_atime(sd_v1, inode->i_atime.tv_sec);
-	set_sd_v1_ctime(sd_v1, inode->i_ctime.tv_sec);
+	set_sd_v1_ctime(sd_v1, inode_get_ctime(inode).tv_sec);
 	set_sd_v1_mtime(sd_v1, inode->i_mtime.tv_sec);
 
 	if (S_ISCHR(inode->i_mode) || S_ISBLK(inode->i_mode))
@@ -1986,7 +1984,7 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
 
 	/* uid and gid must already be set by the caller for quota init */
 
-	inode->i_mtime = inode->i_atime = inode->i_ctime = current_time(inode);
+	inode->i_mtime = inode->i_atime = inode_set_ctime_current(inode);
 	inode->i_size = i_size;
 	inode->i_blocks = 0;
 	inode->i_bytes = 0;
diff --git a/fs/reiserfs/ioctl.c b/fs/reiserfs/ioctl.c
index 6bf9b54e58ca..dd33f8cc6eda 100644
--- a/fs/reiserfs/ioctl.c
+++ b/fs/reiserfs/ioctl.c
@@ -55,7 +55,7 @@ int reiserfs_fileattr_set(struct mnt_idmap *idmap,
 	}
 	sd_attrs_to_i_attrs(flags, inode);
 	REISERFS_I(inode)->i_attrs = flags;
-	inode->i_ctime = current_time(inode);
+	inode_set_ctime_current(inode);
 	mark_inode_dirty(inode);
 	err = 0;
 unlock:
@@ -107,7 +107,7 @@ long reiserfs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			err = -EFAULT;
 			goto setversion_out;
 		}
-		inode->i_ctime = current_time(inode);
+		inode_set_ctime_current(inode);
 		mark_inode_dirty(inode);
 setversion_out:
 		mnt_drop_write_file(filp);
diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 405ac59eb2dd..9c5704be2435 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -572,7 +572,7 @@ static int reiserfs_add_entry(struct reiserfs_transaction_handle *th,
 	}
 
 	dir->i_size += paste_size;
-	dir->i_mtime = dir->i_ctime = current_time(dir);
+	dir->i_mtime = inode_set_ctime_current(dir);
 	if (!S_ISDIR(inode->i_mode) && visible)
 		/* reiserfs_mkdir or reiserfs_rename will do that by itself */
 		reiserfs_update_sd(th, dir);
@@ -966,7 +966,8 @@ static int reiserfs_rmdir(struct inode *dir, struct dentry *dentry)
 			       inode->i_nlink);
 
 	clear_nlink(inode);
-	inode->i_ctime = dir->i_ctime = dir->i_mtime = current_time(dir);
+	dir->i_mtime = inode_set_ctime_to_ts(dir,
+					     inode_set_ctime_current(inode));
 	reiserfs_update_sd(&th, inode);
 
 	DEC_DIR_INODE_NLINK(dir)
@@ -1070,11 +1071,11 @@ static int reiserfs_unlink(struct inode *dir, struct dentry *dentry)
 		inc_nlink(inode);
 		goto end_unlink;
 	}
-	inode->i_ctime = current_time(inode);
+	inode_set_ctime_current(inode);
 	reiserfs_update_sd(&th, inode);
 
 	dir->i_size -= (de.de_entrylen + DEH_SIZE);
-	dir->i_ctime = dir->i_mtime = current_time(dir);
+	dir->i_mtime = inode_set_ctime_current(dir);
 	reiserfs_update_sd(&th, dir);
 
 	if (!savelink)
@@ -1250,7 +1251,7 @@ static int reiserfs_link(struct dentry *old_dentry, struct inode *dir,
 		return err ? err : retval;
 	}
 
-	inode->i_ctime = current_time(inode);
+	inode_set_ctime_current(inode);
 	reiserfs_update_sd(&th, inode);
 
 	ihold(inode);
diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index ce5003986789..3676e02a0232 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -2004,7 +2004,7 @@ int reiserfs_do_truncate(struct reiserfs_transaction_handle *th,
 
 			if (update_timestamps) {
 				inode->i_mtime = current_time(inode);
-				inode->i_ctime = current_time(inode);
+				inode_set_ctime_current(inode);
 			}
 			reiserfs_update_sd(th, inode);
 
@@ -2029,7 +2029,7 @@ int reiserfs_do_truncate(struct reiserfs_transaction_handle *th,
 	if (update_timestamps) {
 		/* this is truncate, not file closing */
 		inode->i_mtime = current_time(inode);
-		inode->i_ctime = current_time(inode);
+		inode_set_ctime_current(inode);
 	}
 	reiserfs_update_sd(th, inode);
 
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 929acce6e731..7eaf36b3de12 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2587,7 +2587,7 @@ static ssize_t reiserfs_quota_write(struct super_block *sb, int type,
 		return err;
 	if (inode->i_size < off + len - towrite)
 		i_size_write(inode, off + len - towrite);
-	inode->i_mtime = inode->i_ctime = current_time(inode);
+	inode->i_mtime = inode_set_ctime_current(inode);
 	mark_inode_dirty(inode);
 	return len - towrite;
 }
diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 651027967159..6000964c2b80 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -466,12 +466,13 @@ int reiserfs_commit_write(struct file *f, struct page *page,
 static void update_ctime(struct inode *inode)
 {
 	struct timespec64 now = current_time(inode);
+	struct timespec64 ctime = inode_get_ctime(inode);
 
 	if (inode_unhashed(inode) || !inode->i_nlink ||
-	    timespec64_equal(&inode->i_ctime, &now))
+	    timespec64_equal(&ctime, &now))
 		return;
 
-	inode->i_ctime = current_time(inode);
+	inode_set_ctime_to_ts(inode, now);
 	mark_inode_dirty(inode);
 }
 
diff --git a/fs/reiserfs/xattr_acl.c b/fs/reiserfs/xattr_acl.c
index 138060452678..064264992b49 100644
--- a/fs/reiserfs/xattr_acl.c
+++ b/fs/reiserfs/xattr_acl.c
@@ -285,7 +285,7 @@ __reiserfs_set_acl(struct reiserfs_transaction_handle *th, struct inode *inode,
 	if (error == -ENODATA) {
 		error = 0;
 		if (type == ACL_TYPE_ACCESS) {
-			inode->i_ctime = current_time(inode);
+			inode_set_ctime_current(inode);
 			mark_inode_dirty(inode);
 		}
 	}
-- 
2.41.0

