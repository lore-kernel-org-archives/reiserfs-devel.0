From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [Fwd: [Fwd: Re: [reiserfs-list] reiserfs_read_inode2: dead inode read fromdisk]]
Date: Tue, 30 Apr 2002 15:24:55 +0400
Message-ID: <15566.32519.720961.804204@laputa.namesys.com>
References: <3CCE78B2.CBC6D238@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10203-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CCE78B2.CBC6D238@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Basil A. Evseenko" <evseenko@msiu.ru>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello, Basil,

messages about read_inode2() and do_truncate() you see are harmless, so
you can safely ignore them.

Details (if you are interested) are the following:

1. file is being deleted by unlink(2). iput() removes inode from hash
table and sleeps doing IO truncating file body. On-disk inode
(stat-data) is still intact. Last directory entry for this file is
already removed.

2. NFS client sends request for this file. iget() looks for inode in
hash table and doesn't find it, because it is already removed by
iput(). 

3. Hence new inode is created. On-disk inode is read from the
disk. Function that reads inode from disk (reiserfs_read_inode2())
issues a warning if nlink==0 (this warning was added for exactly this
situation). If nlink is 0 ("dead inode...") we return error. Problem is
that though error is returned and inode is marked bad, iput() on this
new inode will still call reiserfs_delete_inode() that will complain
that it there is no on-disk inode because unlink() ultimately managed to
finish.

Note that (2) is only possible through NFS, or some other access
mechanism bypassing directory lookups.

Inlined here is a patch against linux-2.4.19-pre7 that was only
superficially tested. Use on your own discretion. Latest 2.5 kernel have
this bug fixed.

Please report success/failures to the list.

Nikita.

Oleg wrote:
 > 
 > Hello!
 > 
 > On Mon, Apr 29, 2002 at 03:13:35PM +0400, Basil A. Evseenko wrote:
 > 
 > > clm-6004: convert tail failed inode 2300597, error -122
 > 
 > This one failed because of disk quota exceed. Safe to ignore I assume.
 > 
 > > vs-13075: reiserfs_read_inode2: dead inode read from disk [3547658 9266355 0x0 SD]. This is likely to be race with knfsd. Ignore
 > 
 > This one is safe, as it told you already.
 > 
 > > vs-2100: add_save_link:search_by_key ([-1 9266355 0x1001 DIRECT]) returned 1
 > > PAP-5660: reiserfs_do_truncate: wrong result -1 of search for [3547658 9266355 0xfffffffffffffff DIRECT]
 > > vs-5355: reiserfs_delete_solid_item: [3547658 9266355 0x0 SD] not found
 > 
 > This one seems to be some kind of race. We have yet to found a way to reproduce.
 > But it's quite safe, anyway.
 > 
 > Bye,
 >     Oleg
 > 
 > 

----------------------------------------------------------------------
--- linux-2.4.19-pre7/fs/reiserfs/inode.c.orig	Tue Apr 30 14:03:25 2002
+++ linux-2.4.19-pre7/fs/reiserfs/inode.c	Tue Apr 30 14:07:04 2002
@@ -1137,8 +1137,15 @@
     return;
 }
 
+/* We need to clear inode key in private part of inode to avoid races between
+   blocking iput, knfsd and file deletion with creating of safelinks.*/
+static void reiserfs_make_bad_inode(struct inode *inode) {
+    memset(INODE_PKEY(inode), 0, KEY_SIZE);
+    make_bad_inode(inode);
+}
+
 void reiserfs_read_inode(struct inode *inode) {
-    make_bad_inode(inode) ;
+    reiserfs_make_bad_inode(inode) ;
 }
 
 
@@ -1158,7 +1165,7 @@
     int retval;
 
     if (!p) {
-	make_bad_inode(inode) ;
+	reiserfs_make_bad_inode(inode) ;
 	return;
     }
 
@@ -1178,13 +1185,13 @@
 	reiserfs_warning ("vs-13070: reiserfs_read_inode2: "
                     "i/o failure occurred trying to find stat data of %K\n",
                     &key);
-	make_bad_inode(inode) ;
+	reiserfs_make_bad_inode(inode) ;
 	return;
     }
     if (retval != ITEM_FOUND) {
 	/* a stale NFS handle can trigger this without it being an error */
 	pathrelse (&path_to_sd);
-	make_bad_inode(inode) ;
+	reiserfs_make_bad_inode(inode) ;
 	inode->i_nlink = 0;
 	return;
     }
@@ -1211,7 +1218,7 @@
 			      "dead inode read from disk %K. "
 			      "This is likely to be race with knfsd. Ignore\n", 
 			      &key );
-	    make_bad_inode( inode );
+	    reiserfs_make_bad_inode( inode );
     }
 
     reiserfs_check_path(&path_to_sd) ; /* init inode should be relsing */

----------------------------------------------------------------------
