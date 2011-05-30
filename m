From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: [PATCH] reiserfs: NULL pointer deference in open_xa_dir()
Date: Mon, 30 May 2011 16:43:14 +0300
Message-ID: <20110530134314.GA4574@swordfish.minsk.epam.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=TNeIQEjMAjvFHuR0fAThw4i7NswaU8ZMo0G3ITe+SdM=;
        b=u2xlNVErCH/URmRIAJ4BCY1jIJrosOH7SWFjDif67eztuNKKJbbaYIsrdLroI6j+Rf
         xUKRYNfJuQihd8Cd5VeLERxewSGG7MeE0q0owMOva+3ca28smNQRFtOD04u7D3cyPQ8H
         IKvgST/AEjUW65V0+RQ8o9q6f574AaM986lDM=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Sage Weil <sage@newdream.net>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Commit
> commit cc350c2764a657ee012efd5bd260a6cd5be2f877
> reiserfs: remove unnecessary dentry_unhash from rmdir, dir rename
> Reiserfs does not have problems with references to unlinked directories.

removed dentry_unhash() from rmdir, dir rename functions. That 
caused 
NULL pointer dereference at open_xa_dir+0x3f/01b3

Trace:
?xattr_unlink()
reiserfs_for_each_xattr()
?mutex_lock_nested()
?get_parent_ip()
reiserfs_delete_xattrs()
reiserfs_evict_inode()
[..]

Patch reverts cc350c2764a657ee012efd5bd260a6cd5be2f877. The difference
is that reiserfs_rmdir() calls dentry_unhash() only for xattr dirs, since
(as commit message states) references to unlinked non-xattrs directories 
are handled by reiserfs.

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

---

 fs/reiserfs/namei.c |    7 +++++++
 fs/reiserfs/xattr.c |    1 +
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 1186626..3d3cc6c 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -831,6 +831,10 @@ static int reiserfs_rmdir(struct inode *dir, struct dentry *dentry)
 	INITIALIZE_PATH(path);
 	struct reiserfs_dir_entry de;
 
+	/* This is the xattr dir, handle specially. */
+	if (S_ISDIR(dentry->d_inode->i_mode))
+		dentry_unhash(dentry);
+
 	/* we will be doing 2 balancings and update 2 stat data, we change quotas
 	 * of the owner of the directory and of the owner of the parent directory.
 	 * The quota structure is possibly deleted only on last iput => outside
@@ -1225,6 +1229,9 @@ static int reiserfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	unsigned long savelink = 1;
 	struct timespec ctime;
 
+	if (new_dentry->d_inode && S_ISDIR(new_dentry->d_inode->i_mode))
+		dentry_unhash(new_dentry);
+
 	/* three balancings: (1) old name removal, (2) new name insertion
 	   and (3) maybe "save" link insertion
 	   stat data updates: (1) old directory,
diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index e8a62f4..50f1abc 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -98,6 +98,7 @@ static int xattr_rmdir(struct inode *dir, struct dentry *dentry)
 
 	reiserfs_mutex_lock_nested_safe(&dentry->d_inode->i_mutex,
 					I_MUTEX_CHILD, dir->i_sb);
+	dentry_unhash(dentry);
 	error = dir->i_op->rmdir(dir, dentry);
 	if (!error)
 		dentry->d_inode->i_flags |= S_DEAD;


