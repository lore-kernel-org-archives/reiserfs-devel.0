From: Bob Vincent <bob@html.com>
Subject: Patch for 2.6.5
Date: Sat, 17 Apr 2004 09:34:38 -0400
Message-ID: <20040417133438.GA12585@pillars.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_server.pillars-12595-1082208878-0001-2"
Return-path: <reiserfs-list-return-18020-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=_server.pillars-12595-1082208878-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

After downloading
http://ftp.kernel.org/pub/linux/kernel/v2.6/linux-2.6.5.tar.bz2 and
applying the patches in
http://thebsh.namesys.com/snapshots/LATEST/all.diff.gz, the attached
additional patch allowed a clean compile.

Not sure if it's *right*, but it does compile and run.

-- 
Robert August Vincent II
(pronounced "Bob" or "Bob-Vee")
The web is like Usenet, but
the elephants are untrained.

--=_server.pillars-12595-1082208878-0001-2
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="all.2.6.5.diff"

Only in linux-2.6.5-reiser4-patched: .config
Only in linux-2.6.5-reiser4: Makefile.orig
Only in linux-2.6.5-reiser4/arch/ppc/kernel: process.c.orig
diff -urbw linux-2.6.5-reiser4/arch/sparc/kernel/init_task.c linux-2.6.5-reiser4-patched/arch/sparc/kernel/init_task.c
--- linux-2.6.5-reiser4/arch/sparc/kernel/init_task.c	2004-04-17 00:07:51.000000000 -0400
+++ linux-2.6.5-reiser4-patched/arch/sparc/kernel/init_task.c	2004-04-16 11:24:55.000000000 -0400
@@ -24,4 +24,4 @@
 union thread_union init_thread_union
 	__attribute__((section (".text")))
 	__attribute__((aligned (THREAD_SIZE)))
-	= { INIT_THREAD_INFO(init_task) };
+  = { INIT_THREAD_INFO(init_task, init_thread_union.thread_info) };
Only in linux-2.6.5-reiser4/arch/sparc/kernel: init_task.c.orig
Only in linux-2.6.5-reiser4/arch/sparc/kernel: init_task.c.rej
Only in linux-2.6.5-reiser4/fs: fs-writeback.c.orig
diff -urbw linux-2.6.5-reiser4/fs/reiser4/as_ops.c linux-2.6.5-reiser4-patched/fs/reiser4/as_ops.c
--- linux-2.6.5-reiser4/fs/reiser4/as_ops.c	2004-04-17 00:07:51.000000000 -0400
+++ linux-2.6.5-reiser4-patched/fs/reiser4/as_ops.c	2004-04-16 11:30:29.000000000 -0400
@@ -567,7 +567,7 @@
 	/* work around infinite loop in pdflush->sync_sb_inodes. */
 	/* Problem: ->writepages() is supposed to submit io for the pages from
 	 * ->io_pages list and to clean this list. */
-	mapping->dirtied_when = jiffies|1;
+	mapping->host->dirtied_when = jiffies|1;
 	spin_lock(&inode_lock);
 	list_move(&mapping->host->i_list, &mapping->host->i_sb->s_dirty);
 	spin_unlock(&inode_lock);
diff -urbw linux-2.6.5-reiser4/fs/reiser4/plugin/item/tail.c linux-2.6.5-reiser4-patched/fs/reiser4/plugin/item/tail.c
--- linux-2.6.5-reiser4/fs/reiser4/plugin/item/tail.c	2004-04-17 00:07:51.000000000 -0400
+++ linux-2.6.5-reiser4-patched/fs/reiser4/plugin/item/tail.c	2004-04-16 11:30:47.000000000 -0400
@@ -463,18 +463,24 @@
 	}
 
 	inode = mapping->host;
-	if (get_key_offset(&f->key) > inode->i_size)
+	if (get_key_offset(&f->key) > inode->i_size) {
+		assert("vs-1649", f->user == 1);
 		INODE_SET_FIELD(inode, i_size, get_key_offset(&f->key));
+	}
+	if (f->user != 0) {
+		/* this was writing data from user space. Update timestamps, therefore. Othrewise, this is tail
+		   conversion where we should not update timestamps */
 	inode->i_ctime = inode->i_mtime = CURRENT_TIME;
 	result = reiser4_update_sd(inode);
 	if (result)
 		return result;
+	}
 
 	/* FIXME-VS: this is temporary: the problem is that bdp takes inodes
 	   from sb's dirty list and it looks like nobody puts there inodes of
 	   files which are built of tails */
 	if (back_to_dirty) {
-		mapping->dirtied_when = jiffies|1;
+		mapping->host->dirtied_when = jiffies|1;
 		spin_lock(&inode_lock);
 		list_move(&inode->i_list, &inode->i_sb->s_dirty);
 		spin_unlock(&inode_lock);
Only in linux-2.6.5-reiser4/include/asm-ppc: thread_info.h.orig
Only in linux-2.6.5-reiser4/include/linux: mm.h.orig
Only in linux-2.6.5-reiser4/include/linux: sched.h.orig

--=_server.pillars-12595-1082208878-0001-2--
