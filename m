From: Chris Mason <mason@suse.com>
Subject: Re: Oops with in nfsd - 2.4.19-pre6
Date: 31 Oct 2002 15:38:19 -0500
Message-ID: <1036096699.14984.156.camel@tiny>
References: <20021029155907.74f4b3ac.philippe.gramoulle@mmania.com>
	<20021029181438.A21904@namesys.com> 
	<20021029162014.0d9b359f.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11873-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021029162014.0d9b359f.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Philippe =?ISO-8859-1?Q?Gramoull=E9?= <philippe.gramoulle@mmania.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Tue, 2002-10-29 at 10:20, Philippe Gramoull=E9 wrote:
>=20
> FYI,
>=20
> This in the log , before the oops :
>=20
>  journal-1413: journal_mark_dirty: j_len (1024) is too big
>=20
>
Ok, this patch goes on top of the quota patches because that is what
Philippe is currently running.  Merging with the pure kernel is trivial,
so I'll do that later.

Since Philippe is putting this onto production machines, I think he
should wait for someone from namesys to review before using the patch.

The idea is that during boundless operations (creating a hole, and
truncates), the journal code wasn't properly reserving log blocks.=20
There are two parts to the fix:

1) always reserve extra log blocks when
reiserfs_transaction_should_end() returns 0

2) always send the correct number of log blocks to
reiserfs_transaction_should_end()

#2 also makes hole creation significantly faster.  Before, it used the
number of blocks logged in the last transaction as the number if will
log in the next one, which means it might try to reserve 300 or so log
blocks.  This would usually force the current transcation to close,
leading to a small transaction and lower performance.

Anyway, here's the patch:

-chris

#
# against 2.4.19 + quota + nesting
#
# when testing for a transaction restart, make sure to bump the number
# of blocks allocated, otherwise by the time you get around to=20
# journal_mark_dirty, the blocks might have been used by a different
# writer
#
# when restarting the transaction in reiserfs_get_block and truncates,
# don't use th->t_blocks_allocated as the count for the new transaction.
# It gets incremented as the transation grows during the boundless op,
# and might get very very large.
#
diff -Nru a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
--- a/fs/reiserfs/inode.c	Thu Oct 31 15:21:49 2002
+++ b/fs/reiserfs/inode.c	Thu Oct 31 15:21:49 2002
@@ -232,9 +232,9 @@
 }
=20
 /*static*/ void restart_transaction(struct reiserfs_transaction_handle *th=
,
-				struct inode *inode, struct path *path) {
+				struct inode *inode, struct path *path,
+				int jbegin_count) {
   struct super_block *s =3D th->t_super ;
-  int len =3D th->t_blocks_allocated ;
=20
   /* we cannot restart while nested */
   if (th->t_refcount > 1) {
@@ -242,8 +242,8 @@
   }
   pathrelse(path) ;
   reiserfs_update_sd(th, inode) ;
-  journal_end(th, s, len) ;
-  journal_begin(th, s, len) ;
+  journal_end(th, s, th->t_blocks_allocated) ;
+  journal_begin(th, s, jbegin_count) ;
   reiserfs_update_inode_transaction(inode) ;
 }
=20
@@ -655,7 +655,7 @@
 	    ** some blocks.  releases the path, so we have to go back to
 	    ** research if we succeed on the second try
 	    */
-	    restart_transaction(&th, inode, &path) ;=20
+	    restart_transaction(&th, inode, &path, jbegin_count) ;=20
 	    repeat =3D _allocate_block(&th, inode,&allocated_block_nr,tag,create)=
;
=20
 	    if (repeat !=3D NO_DISK_SPACE && repeat !=3D QUOTA_EXCEEDED) {
@@ -856,8 +856,8 @@
 	** release the path so that anybody waiting on the path before
 	** ending their transaction will be able to continue.
 	*/
-	if (journal_transaction_should_end(&th, th.t_blocks_allocated)) {
-	  restart_transaction(&th, inode, &path) ;=20
+	if (journal_transaction_should_end(&th, jbegin_count)) {
+	  restart_transaction(&th, inode, &path, jbegin_count) ;=20
 	}
 	/* inserting indirect pointers for a hole can take a=20
 	** long time.  reschedule if needed
diff -Nru a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
--- a/fs/reiserfs/journal.c	Thu Oct 31 15:21:49 2002
+++ b/fs/reiserfs/journal.c	Thu Oct 31 15:21:49 2002
@@ -2011,6 +2011,12 @@
        SB_JOURNAL(th->t_super)->j_cnode_free < (JOURNAL_TRANS_MAX * 3)) {=20
     return 1 ;
   }
+ =20
+  /* we are allowing them to continue in the current transaction, so we
+   * have to bump the blocks allocated now.
+   */
+  th->t_blocks_allocated +=3D new_alloc;
+  SB_JOURNAL(th->t_super)->j_len_alloc +=3D new_alloc ;
   return 0 ;
 }
=20
diff -Nru a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
--- a/fs/reiserfs/stree.c	Thu Oct 31 15:21:49 2002
+++ b/fs/reiserfs/stree.c	Thu Oct 31 15:21:49 2002
@@ -1730,6 +1730,7 @@
 	n_new_file_size;/* New file size. */
     int                   n_deleted;      /* Number of deleted or truncate=
d bytes. */
     int retval;
+    int jbegin_count =3D th->t_blocks_allocated;
=20
     if ( ! (S_ISREG(p_s_inode->i_mode) || S_ISDIR(p_s_inode->i_mode) || S_=
ISLNK(p_s_inode->i_mode)) )
 	return;
@@ -1809,16 +1810,15 @@
 	** sure the file is consistent before ending the current trans
 	** and starting a new one
 	*/
-        if (journal_transaction_should_end(th, th->t_blocks_allocated)) {
-	  int orig_len_alloc =3D th->t_blocks_allocated ;
+        if (journal_transaction_should_end(th, jbegin_count)) {
 	  decrement_counters_in_path(&s_search_path) ;
=20
 	  if (update_timestamps) {
 	      p_s_inode->i_mtime =3D p_s_inode->i_ctime =3D CURRENT_TIME;
 	  }=20
 	  reiserfs_update_sd(th, p_s_inode) ;
-	  journal_end(th, p_s_inode->i_sb, orig_len_alloc) ;
-	  journal_begin(th, p_s_inode->i_sb, orig_len_alloc) ;
+	  journal_end(th, p_s_inode->i_sb, th->t_blocks_allocated) ;
+	  journal_begin(th, p_s_inode->i_sb, jbegin_count) ;
 	  reiserfs_update_inode_transaction(p_s_inode) ;
 	}
     } while ( n_file_size > ROUND_UP (n_new_file_size) &&


