From: Arjan van de Ven <arjan@linux.intel.com>
Subject: [patch] lockdep: annotate vfs_rmdir for filesystems that take
	i_mutex in delete_inode
Date: Wed, 26 Jul 2006 08:32:04 +0200
Message-ID: <1153895524.2896.2.camel@laptopd505.fenrus.org>
References: <9a8748490607251516j1433306ek9c64cc84c0838f7b@mail.gmail.com>
	 <20060725223327.b6d039b2.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030412AbWGZGeX@vger.kernel.org>
In-Reply-To: <20060725223327.b6d039b2.akpm@osdl.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: Ingo Molnar <mingo@elte.hu>, reiserfs-list@namesys.com, reiserfs-dev@namesys.com, viro@ftp.linux.org.uk, viro@zeniv.linux.org.uk, reiser@namesys.com, linux-kernel@vger.kernel.org, Jesper Juhl <jesper.juhl@gmail.com>


> The VFS takes the directory i_mutex and reiserfs_delete_inode() takes the
> to-be-deleted file's i_mutex.
> 
> That's notabug and lockdep will need to be taught about it.

Actually the annotation is in vfs_rmdir() since that is where the parent
is taken (this may sound odd but the I_MUTEX_* ordering rules require
the parent taking to be annotated rather than the child)

Signed-off-by: Arjan van de Ven <arjan@linux.intel.com>

Index: linux-2.6.18-rc2-git5/fs/namei.c
===================================================================
--- linux-2.6.18-rc2-git5.orig/fs/namei.c
+++ linux-2.6.18-rc2-git5/fs/namei.c
@@ -1967,7 +1967,7 @@ int vfs_rmdir(struct inode *dir, struct 
 
 	DQUOT_INIT(dir);
 
-	mutex_lock(&dentry->d_inode->i_mutex);
+	mutex_lock_nested(&dentry->d_inode->i_mutex, I_MUTEX_PARENT);
 	dentry_unhash(dentry);
 	if (d_mountpoint(dentry))
 		error = -EBUSY;
