From: Nikita Danilov <Nikita@Namesys.COM>
Subject: [PATCH]: reiser4 [2/8] export generic_forget_inode()
Date: Thu, 31 Oct 2002 19:03:01 +0300
Message-ID: <15809.21557.995835.880171@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11862-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <Torvalds@Transmeta.COM>
Cc: Linux Kernel Mailing List <Linux-Kernel@Vger.Kernel.ORG>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello, Linus,

    Following patch exports fs/inode.c:generic_forget_inode(). 

    Without this, file system that needs ->drop_inode() super block method
    would have to duplicate manipulations with &inode_unused, inodes_stat, and
    &inode_lock.

Please apply.
Nikita.
diff -rup -X dontdiff linus-bk-2.5/fs/inode.c linux-2.5-reiser4/fs/inode.c
--- linus-bk-2.5/fs/inode.c	Tue Oct 15 20:56:58 2002
+++ linux-2.5-reiser4/fs/inode.c	Mon Oct 21 13:43:49 2002
@@ -938,7 +938,7 @@ void generic_delete_inode(struct inode *
 }
 EXPORT_SYMBOL(generic_delete_inode);
 
-static void generic_forget_inode(struct inode *inode)
+void generic_forget_inode(struct inode *inode)
 {
 	struct super_block *sb = inode->i_sb;
 
@@ -965,6 +965,7 @@ static void generic_forget_inode(struct 
 	clear_inode(inode);
 	destroy_inode(inode);
 }
+EXPORT_SYMBOL(generic_forget_inode);
 
 /*
  * Normal UNIX filesystem behaviour: delete the
diff -rup -X dontdiff linus-bk-2.5/include/linux/fs.h linux-2.5-reiser4/include/linux/fs.h
--- linus-bk-2.5/include/linux/fs.h	Sat Oct 19 03:01:12 2002
+++ linux-2.5-reiser4/include/linux/fs.h	Tue Oct 29 12:41:00 2002
@@ -1200,7 +1200,7 @@ extern struct inode * igrab(struct inode
 extern ino_t iunique(struct super_block *, ino_t);
 extern int inode_needs_sync(struct inode *inode);
 extern void generic_delete_inode(struct inode *inode);
-
+extern void generic_forget_inode(struct inode *inode);
 extern struct inode *ilookup5(struct super_block *sb, unsigned long hashval,
 		int (*test)(struct inode *, void *), void *data);
 extern struct inode *ilookup(struct super_block *sb, unsigned long ino);
