From: Vladimir Saveliev <vs@namesys.com>
Subject: [PATCH] reiserfs: return -EIO instead of calling BUG() when rename
	goes wrong
Date: Thu, 24 Feb 2005 16:00:52 +0300
Message-ID: <1109250052.3097.477.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-QFXYTCsn2Tru+sdcT0Bt"
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@osdl.org>
Cc: reiserfs-list@namesys.com

--=-QFXYTCsn2Tru+sdcT0Bt
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

Please, apply this patch.

--=-QFXYTCsn2Tru+sdcT0Bt
Content-Disposition: attachment; filename=reiserfs-rename-do-not-oops.patch
Content-Type: text/plain; name=reiserfs-rename-do-not-oops.patch; charset=KOI8-R
Content-Transfer-Encoding: 7bit


This patch makes reiserfs to return -EIO when rename-ing went wrong
instead of calling BUG().


 fs/reiserfs/namei.c |   30 +++++++++++++++++++++++-------
 1 files changed, 23 insertions(+), 7 deletions(-)

diff -puN fs/reiserfs/namei.c~reiserfs-rename-do-not-oops fs/reiserfs/namei.c
--- linux-2.6.11-rc3-mm2/fs/reiserfs/namei.c~reiserfs-rename-do-not-oops	2005-02-24 13:56:20.000000000 +0300
+++ linux-2.6.11-rc3-mm2-vs/fs/reiserfs/namei.c	2005-02-24 15:59:13.000000000 +0300
@@ -1255,7 +1255,6 @@ static int reiserfs_rename (struct inode
         return retval;
     }
 
-
     /* add new entry (or find the existing one) */
     retval = reiserfs_add_entry (&th, new_dir, new_dentry->d_name.name, new_dentry->d_name.len, 
 				 old_inode, 0);
@@ -1283,8 +1282,13 @@ static int reiserfs_rename (struct inode
 
     while (1) {
 	// look for old name using corresponding entry key (found by reiserfs_find_entry)
-	if (search_by_entry_key (new_dir->i_sb, &old_de.de_entry_key, &old_entry_path, &old_de) != NAME_FOUND)
-	    BUG ();
+	if ((retval = search_by_entry_key (new_dir->i_sb, &old_de.de_entry_key,
+					   &old_entry_path, &old_de)) != NAME_FOUND) {
+	    pathrelse(&old_entry_path);
+	    journal_end(&th, old_dir->i_sb, jbegin_count);
+	    reiserfs_write_unlock(old_dir->i_sb);
+	    return -EIO;
+	}
 
 	copy_item_head(&old_entry_ih, get_ih(&old_entry_path)) ;
 
@@ -1296,16 +1300,28 @@ static int reiserfs_rename (struct inode
 				      &new_entry_path, &new_de);
 	// reiserfs_add_entry should not return IO_ERROR, because it is called with essentially same parameters from
         // reiserfs_add_entry above, and we'll catch any i/o errors before we get here.
-	if (retval != NAME_FOUND_INVISIBLE && retval != NAME_FOUND)
-	    BUG ();
+	if (retval != NAME_FOUND_INVISIBLE && retval != NAME_FOUND) {
+	    pathrelse(&new_entry_path);
+	    pathrelse(&old_entry_path);
+	    journal_end(&th, old_dir->i_sb, jbegin_count);
+	    reiserfs_write_unlock(old_dir->i_sb);
+	    return -EIO;
+	}
 
 	copy_item_head(&new_entry_ih, get_ih(&new_entry_path)) ;
 
 	reiserfs_prepare_for_journal(old_inode->i_sb, new_de.de_bh, 1) ;
 
 	if (S_ISDIR(old_inode->i_mode)) {
-	    if (search_by_entry_key (new_dir->i_sb, &dot_dot_de.de_entry_key, &dot_dot_entry_path, &dot_dot_de) != NAME_FOUND)
-		BUG ();
+	    if ((retval = search_by_entry_key (new_dir->i_sb, &dot_dot_de.de_entry_key,
+					       &dot_dot_entry_path, &dot_dot_de)) != NAME_FOUND) {
+		pathrelse(&dot_dot_entry_path);
+		pathrelse(&new_entry_path);
+		pathrelse(&old_entry_path);
+		journal_end(&th, old_dir->i_sb, jbegin_count);
+		reiserfs_write_unlock(old_dir->i_sb);
+		return -EIO;
+	    }
 	    copy_item_head(&dot_dot_ih, get_ih(&dot_dot_entry_path)) ;
 	    // node containing ".." gets into transaction
 	    reiserfs_prepare_for_journal(old_inode->i_sb, dot_dot_de.de_bh, 1) ;

_

--=-QFXYTCsn2Tru+sdcT0Bt--

