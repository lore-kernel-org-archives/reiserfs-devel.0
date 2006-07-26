From: Arjan van de Ven <arjan@linux.intel.com>
Subject: [patch] lockdep: annotate vfs_rmdir for filesystems that take
	i_mutex in delete_inode
Date: Wed, 26 Jul 2006 08:47:21 +0200
Message-ID: <1153896441.2896.11.camel@laptopd505.fenrus.org>
References: <9a8748490607251516j1433306ek9c64cc84c0838f7b@mail.gmail.com>
	 <20060725223327.b6d039b2.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030209AbWGZGtb@vger.kernel.org>
In-Reply-To: <20060725223327.b6d039b2.akpm@osdl.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: Ingo Molnar <mingo@elte.hu>, reiserfs-list@namesys.com, reiserfs-dev@namesys.com, viro@ftp.linux.org.uk, viro@zeniv.linux.org.uk, reiser@namesys.com, linux-kernel@vger.kernel.org, Jesper Juhl <jesper.juhl@gmail.com>

On Tue, 2006-07-25 at 22:33 -0700, Andrew Morton wrote:
> On Wed, 26 Jul 2006 00:16:42 +0200
> The VFS takes the directory i_mutex and reiserfs_delete_inode() takes the
> to-be-deleted file's i_mutex.
> 
> That's notabug and lockdep will need to be taught about it.

[2nd try, now with coffee]

This is another 3 level locking ordering:
do_rmdir takes the mutex of the parent directory
vfs_rmdir takes the mutex of the victim
shrink_dcache_parent ends up in the reiser delete_inode which takes the
mutex of dead children of the victim

the I_MUTEX ordering rules are

I_MUTEX_PARENT -> I_MUTEX_CHILD -> <normal>

do_rmdir already has I_MUTEX_PARENT, delete_inode does <normal> so
vfs_rmdir needs I_MUTEX_CHILD (which is also logical)

Signed-off-by: Arjan van de Ven <arjan@linux.intel.com>

Index: linux-2.6.18-rc2-git5/fs/namei.c
===================================================================
--- linux-2.6.18-rc2-git5.orig/fs/namei.c
+++ linux-2.6.18-rc2-git5/fs/namei.c
@@ -1967,7 +1967,7 @@ int vfs_rmdir(struct inode *dir, struct 
 
 	DQUOT_INIT(dir);
 
-	mutex_lock(&dentry->d_inode->i_mutex);
+	mutex_lock_nested(&dentry->d_inode->i_mutex, I_MUTEX_CHILD);
 	dentry_unhash(dentry);
 	if (d_mountpoint(dentry))
 		error = -EBUSY;
