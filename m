From: Sage Weil <sage@newdream.net>
Subject: [PATCH 09/26] reiserfs: remove unnecessary dentry_unhash from rmdir, dir rename
Date: Fri, 27 May 2011 13:42:02 -0700
Message-ID: <1306528939-30636-10-git-send-email-sage@newdream.net>
References: <1306528939-30636-1-git-send-email-sage@newdream.net>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1306528939-30636-1-git-send-email-sage@newdream.net>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hch@infradead.org, viro@ZenIV.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, Sage Weil <sage@newdream.net>, reiserfs-devel@vger.kernel.org

Reiserfs does not have problems with references to unlinked directories.

CC: reiserfs-devel@vger.kernel.org
Signed-off-by: Sage Weil <sage@newdream.net>
---
 fs/reiserfs/namei.c |    5 -----
 fs/reiserfs/xattr.c |    1 -
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 76c8164..1186626 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -831,8 +831,6 @@ static int reiserfs_rmdir(struct inode *dir, struct dentry *dentry)
 	INITIALIZE_PATH(path);
 	struct reiserfs_dir_entry de;
 
-	dentry_unhash(dentry);
-
 	/* we will be doing 2 balancings and update 2 stat data, we change quotas
 	 * of the owner of the directory and of the owner of the parent directory.
 	 * The quota structure is possibly deleted only on last iput => outside
@@ -1227,9 +1225,6 @@ static int reiserfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	unsigned long savelink = 1;
 	struct timespec ctime;
 
-	if (new_dentry->d_inode && S_ISDIR(new_dentry->d_inode->i_mode))
-		dentry_unhash(new_dentry);
-
 	/* three balancings: (1) old name removal, (2) new name insertion
 	   and (3) maybe "save" link insertion
 	   stat data updates: (1) old directory,
diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 50f1abc..e8a62f4 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -98,7 +98,6 @@ static int xattr_rmdir(struct inode *dir, struct dentry *dentry)
 
 	reiserfs_mutex_lock_nested_safe(&dentry->d_inode->i_mutex,
 					I_MUTEX_CHILD, dir->i_sb);
-	dentry_unhash(dentry);
 	error = dir->i_op->rmdir(dir, dentry);
 	if (!error)
 		dentry->d_inode->i_flags |= S_DEAD;
-- 
1.7.0

