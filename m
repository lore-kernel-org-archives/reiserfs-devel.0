From: Oleg Drokin <green@namesys.com>
Subject: Re: crash after kernel: clm-6004: convert tail failed inode ... error -28
Date: Fri, 21 Jun 2002 20:28:16 +0400
Message-ID: <20020621202816.A868@namesys.com>
References: <200206211552.g5LFqqc07539@klee.cb.uni-bonn.de> <20020621195906.A1333@namesys.com> <1024675773.13539.6.camel@tiny> <200206211622.g5LGMPc07743@klee.cb.uni-bonn.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
Return-path: <reiserfs-list-return-10782-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200206211622.g5LGMPc07743@klee.cb.uni-bonn.de>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Harald van Pee <pee@iskp.uni-bonn.de>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline

Hello!

On Fri, Jun 21, 2002 at 06:22:24PM +0200, Harald van Pee wrote:

> > This was fixed in 2.4.19-pre3.  The problem was that I didn't restart
> > the transaction before freeing the block.
> Does a patch against 2.4.18 exists?

Something like this attached.

Bye,
    Oleg

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=koi8-r
Content-Disposition: attachment; filename="09-tailconv_nospace_nowarn.diff"

--- linux/fs/reiserfs/inode.c.orig	Fri Feb  1 09:26:39 2002
+++ linux/fs/reiserfs/inode.c	Fri Feb  1 09:27:09 2002
@@ -748,7 +748,8 @@
 
 		retval = convert_tail_for_hole(inode, bh_result, tail_offset) ;
 		if (retval) {
-		    printk("clm-6004: convert tail failed inode %lu, error %d\n", inode->i_ino, retval) ;
+		    if ( retval != -ENOSPC )
+			printk("clm-6004: convert tail failed inode %lu, error %d\n", inode->i_ino, retval) ;
 		    if (allocated_block_nr)
 			reiserfs_free_block (&th, allocated_block_nr);
 		    goto failure ;

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=koi8-r
Content-Disposition: attachment; filename="23-truncate-fix.diff"

--- linux-2.4.18/fs/reiserfs/inode.c.orig	Wed Feb 27 15:39:24 2002
+++ linux-2.4.18/fs/reiserfs/inode.c	Wed Feb 27 16:49:22 2002
@@ -785,8 +785,12 @@
 		if (retval) {
 		    if ( retval != -ENOSPC )
 			printk("clm-6004: convert tail failed inode %lu, error %d\n", inode->i_ino, retval) ;
-		    if (allocated_block_nr)
+		    if (allocated_block_nr) {
+			/* the bitmap, the super, and the stat data == 3 */
+			journal_begin(&th, inode->i_sb, 3) ;
 			reiserfs_free_block (&th, allocated_block_nr);
+			transaction_started = 1 ;
+		    }
 		    goto failure ;
 		}
 		goto research ;

--FL5UXtIhxfXey3p5--
