From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: snapshot 2004.03.26 + linux 2.6.5 = build error
Date: Mon, 5 Apr 2004 16:45:41 +0400
Message-ID: <16497.21749.932806.34057@laputa.namesys.com>
References: <20040404161030.GA21978@raptus.homelinux.org>
	<200404051540.58430.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17716-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404051540.58430.rmeijer@internet.gr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Raymond A. Meijer" <rmeijer@internet.gr>
Cc: reiserfs-list@namesys.com

Raymond A. Meijer writes:
 > On Sunday 04 April 2004 19:10, Domenico Andreoli wrote:
 > 
 > > today i applied latest snapshot to linux kernel 2.6.5 and tried to
 > > build it.
 > >
 > > patch didn't apply cleanly, there were some hunks and a reject on
 > > arch/sparc/kernel/init_task.c which looked trivial to fix.
 > >
 > > problem arrived on reiser4 kernel module (i'm using as module with no
 > > problems), build error follows:
 > >
 > >
 > >   CC [M]  fs/reiser4/as_ops.o
 > > fs/reiser4/as_ops.c: In function `move_inode_out_from_sync_inodes_loop':
 > > fs/reiser4/as_ops.c:570: error: structure has no member named
 > > `dirtied_when' make[4]: *** [fs/reiser4/as_ops.o] Error 1
 > 
 > Exactly the same error here, compiling it into the kernel.
 > 
 > Any suggestions? On 2.6.4 it patched & compiled pretty much cleanly and worked 
 > like a charm...

Try this:

----------------------------------------------------------------------
===== as_ops.c 1.69 vs edited =====
--- 1.69/as_ops.c	Thu Feb 19 20:12:42 2004
+++ edited/as_ops.c	Mon Apr  5 16:43:30 2004
@@ -567,7 +565,7 @@
 	/* work around infinite loop in pdflush->sync_sb_inodes. */
 	/* Problem: ->writepages() is supposed to submit io for the pages from
 	 * ->io_pages list and to clean this list. */
-	mapping->dirtied_when = jiffies|1;
+	mapping->host->dirtied_when = jiffies|1;
 	spin_lock(&inode_lock);
 	list_move(&mapping->host->i_list, &mapping->host->i_sb->s_dirty);
 	spin_unlock(&inode_lock);
===== plugin/item/tail.c 1.167 vs edited =====
--- 1.167/plugin/item/tail.c	Thu Apr  1 13:20:44 2004
+++ edited/plugin/item/tail.c	Mon Apr  5 16:43:07 2004
@@ -474,7 +474,7 @@
 	   from sb's dirty list and it looks like nobody puts there inodes of
 	   files which are built of tails */
 	if (back_to_dirty) {
-		mapping->dirtied_when = jiffies|1;
+		inode->dirtied_when = jiffies|1;
 		spin_lock(&inode_lock);
 		list_move(&inode->i_list, &inode->i_sb->s_dirty);
 		spin_unlock(&inode_lock);
----------------------------------------------------------------------
 > 
 > 
 > Thanks,

Nikita.

 > 
 > Ray
