From: Jeff Layton <jlayton@kernel.org>
Subject: [PATCH v2 08/92] fs: new helper: simple_rename_timestamp
Date: Wed,  5 Jul 2023 14:58:11 -0400
Message-ID: <20230705185812.579118-3-jlayton__47934.7734175221$1688583582$gmane$org@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688583549;
        bh=96h56beXLMAvkoYPxw1Hf+1T9dWrr7543/fVCrKiiH8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SV/pROPiikvWgbuJG9o5j/mdUiyRGcRaEJl1K0hVl0eCHK9Ob+YmgZ0cOVDNwxcd0
         s3XXK3FiPaVML6VBfbeTny5HiSuKA0KEKAjFDlBtEkXvpck7V4KUAdjnzKCg5fiugt
         aiOuDDRaoB7EF/ycBMYU5USexpq/ceGXPIb8HpDBW4vIvyY547qmZyivJt5T6PXA4H
         rtd7d3FTcpVX0DGPx74bauINVbOI0AHI9Zym6FoqdyCXdEJPTgmmD/blFQIJoOkcln
         fC0uEV1EXwoGgwuuPieKxDXph4tQwZUYbTrLEd3zCpi9KdekgoBzBb9kt9un4ZFr7M
         0DXS4Kyxlm/3g==
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jk@ozlabs.org, arnd@arndb.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com, surenb@google.com, dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca, leon@kernel.org, bwarrum@linux.ibm.com, rituagar@linux.ibm.com, ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com, dsterba@suse.com, dhowells@redhat.com, marc.dionne@auristor.com, viro@zeniv.linux.org.uk, raven@themaw.net, luisbg@kernel.org, salah.triki@gmail.com, aivazian.tigran@gmail.com, ebiederm@xmission.com, kees

A rename potentially involves updating 4 different inode timestamps. Add
a function that handles the details sanely, and convert the libfs.c
callers to use it.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/libfs.c         | 36 +++++++++++++++++++++++++++---------
 include/linux/fs.h |  2 ++
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index a7e56baf8bbd..9ee79668c909 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -692,6 +692,31 @@ int simple_rmdir(struct inode *dir, struct dentry *dentry)
 }
 EXPORT_SYMBOL(simple_rmdir);
 
+/**
+ * simple_rename_timestamp - update the various inode timestamps for rename
+ * @old_dir: old parent directory
+ * @old_dentry: dentry that is being renamed
+ * @new_dir: new parent directory
+ * @new_dentry: target for rename
+ *
+ * POSIX mandates that the old and new parent directories have their ctime and
+ * mtime updated, and that inodes of @old_dentry and @new_dentry (if any), have
+ * their ctime updated.
+ */
+void simple_rename_timestamp(struct inode *old_dir, struct dentry *old_dentry,
+			     struct inode *new_dir, struct dentry *new_dentry)
+{
+	struct inode *newino = d_inode(new_dentry);
+
+	old_dir->i_mtime = inode_set_ctime_current(old_dir);
+	if (new_dir != old_dir)
+		new_dir->i_mtime = inode_set_ctime_current(new_dir);
+	inode_set_ctime_current(d_inode(old_dentry));
+	if (newino)
+		inode_set_ctime_current(newino);
+}
+EXPORT_SYMBOL_GPL(simple_rename_timestamp);
+
 int simple_rename_exchange(struct inode *old_dir, struct dentry *old_dentry,
 			   struct inode *new_dir, struct dentry *new_dentry)
 {
@@ -707,11 +732,7 @@ int simple_rename_exchange(struct inode *old_dir, struct dentry *old_dentry,
 			inc_nlink(old_dir);
 		}
 	}
-	old_dir->i_ctime = old_dir->i_mtime =
-	new_dir->i_ctime = new_dir->i_mtime =
-	d_inode(old_dentry)->i_ctime =
-	d_inode(new_dentry)->i_ctime = current_time(old_dir);
-
+	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(simple_rename_exchange);
@@ -720,7 +741,6 @@ int simple_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 		  struct dentry *old_dentry, struct inode *new_dir,
 		  struct dentry *new_dentry, unsigned int flags)
 {
-	struct inode *inode = d_inode(old_dentry);
 	int they_are_dirs = d_is_dir(old_dentry);
 
 	if (flags & ~(RENAME_NOREPLACE | RENAME_EXCHANGE))
@@ -743,9 +763,7 @@ int simple_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 		inc_nlink(new_dir);
 	}
 
-	old_dir->i_ctime = old_dir->i_mtime = new_dir->i_ctime =
-		new_dir->i_mtime = inode->i_ctime = current_time(old_dir);
-
+	simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
 	return 0;
 }
 EXPORT_SYMBOL(simple_rename);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index bdfbd11a5811..14e38bd900f1 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2979,6 +2979,8 @@ extern int simple_open(struct inode *inode, struct file *file);
 extern int simple_link(struct dentry *, struct inode *, struct dentry *);
 extern int simple_unlink(struct inode *, struct dentry *);
 extern int simple_rmdir(struct inode *, struct dentry *);
+void simple_rename_timestamp(struct inode *old_dir, struct dentry *old_dentry,
+			     struct inode *new_dir, struct dentry *new_dentry);
 extern int simple_rename_exchange(struct inode *old_dir, struct dentry *old_dentry,
 				  struct inode *new_dir, struct dentry *new_dentry);
 extern int simple_rename(struct mnt_idmap *, struct inode *,
-- 
2.41.0

