From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: bug+fix in reiserfsck - reiserfscore/journal.c
Date: Fri, 27 Feb 2004 15:53:13 +0300
Message-ID: <200402271553.13461.vitaly@namesys.com>
References: <004301c3fcdf$b3932f60$e91ba8c0@thk.local>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_52zPAz4z2uFfMrn"
Return-path: <reiserfs-list-return-16961-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <004301c3fcdf$b3932f60$e91ba8c0@thk.local>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Thorsten Kohfeldt <thorsten.kohfeldt@gmx.de>, reiserfs-list@namesys.com

--Boundary-00=_52zPAz4z2uFfMrn
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello, 

On Friday 27 February 2004 06:13, Thorsten Kohfeldt wrote:
> To whom it may (should!) concern,                                       
> 26/27-FEB-2004
>
> after having been annoyed for quite some time by corrupt /var file systems
> after (simulated) powerloss in a SuSE 9.0 setup with reiserfs, I finally
> tracked the problem down to a nasty bug in reiserfsck -
> reiserfscore/journal.c
>
> Turned out that the journal is not always correctly replayed by reiserfsck
> !
>
> This may be the case when the filesystem has not experienced a lot of
> transactions after it has been mounted and so there are more than one
> mount_id to be found in the journal. In that case, the function
> replay_journal() might accidentally step over the transactions it is
> supposed to replay and that way those transactions are completely and
> forever ignored.
>
> The following fix prevents the search loop from stepping too far:
> (check also the MIME attachment down below)
> The diff is valid for SuSE 9.0 reiserfsprogs 3.6.9+ and also valid for
> reiserfsprogs 3.6.13.
>
> ############# snip ##############
> --- reiserfsprogs-3.6.13/reiserfscore/journal.c 2004-02-17
> 13:06:23.000000000 +0100 +++ replayFix/reiserfscore/journal.c 2004-02-27
> 00:11:44.000000000 +0100 @@ -784,7 +784,9 @@
>   if (control.mount_id == cur.mount_id && control.trans_id == 0 &&
>       control.desc_blocknr == 0)
>       break;
> -
> + if (cur.mount_id == control.mount_id && cur.trans_id == control.trans_id
> + 1) +     break;
> +
>   ret = next_transaction (fs, &cur, newest);
>
>   if (ret != TRANS_FOUND)
> @@ -792,8 +794,9 @@
>      }
>
>      while (ret == TRANS_FOUND) {
> - if (control.mount_id != cur.mount_id || control.trans_id != 0 ||
> -     control.desc_blocknr != 0)
> + if ((control.mount_id != cur.mount_id || control.trans_id != 0 ||
> +      control.desc_blocknr != 0) &&
> +     (cur.mount_id != control.mount_id || cur.trans_id != control.trans_id
> + 1)) {
>       ret = next_transaction (fs, &cur, newest);
>
> @@ -821,7 +824,8 @@
>          replayed ++;
>      }
>
> -    reiserfs_warning (stderr, "%d transactions replayed\n", replayed);
> +    reiserfs_warning (stderr, "Journal in %s (1st block: %d) - %d
> transactions replayed\n", +     fs->fs_j_file_name,
> get_jp_journal_1st_block (sb_jp (fs->fs_ondisk_sb)), replayed);
>
>      mark_buffer_dirty (fs->fs_super_bh);
>      bwrite (fs->fs_super_bh);
> ############# pins ##############
>
> The fix was extensively tested by copying mounted reiser filesystems to
> (XOR- !) loop devices and then reiserfsck-ing them.
> The fixed reiserfsck version always created the same results or, when the
> bugged version did replay 0 transactions, the fixed version replayed the
> correct amount of transactions.
>
> The unfortunate thing about the SuSE setup is, that reiserfsck is executed
> before the filesystem gets mounted. The kernel "mount" code itself seems to
> know the trick, but that doesn't help if reiserfsck is discarding those
> transactions before the mount can perform its correct replay!
> Only the root filesystem gets replayed correctly because it will be mounted
> read-only first. On initiation of a mount, the log will always be replayed
> even if the mount is supposed to be read-only in order to achieve
> consistency as early as possible !
>
> For a quick fix of a SuSE 9.0 system, install the reiserfs(progs) source
> with yast2, untar the (source only) attachment to a directory of your
> choice and run ./createSuSEreiserfs. Then install the new reiserfsck into
> /sbin/. IMPORTANT NOTE: Make sure that /sbin/reiserfsck AND
> /sbin/fsck.reiserfs are hardlinked to each other again (ls -li shows the
> same inode) ! The boot code calls fsck.reiserfs instead of reiserfsck.

yes, there is the bug in replaying, thank you for hitting it. After some 
simplifications and tests I got the following patch, would you test it 
also please.

-- 
Thanks,
Vitaly Fertman
--Boundary-00=_52zPAz4z2uFfMrn
Content-Type: text/x-diff;
  charset="koi8-r";
  name="reiserfsprogs_jreplay.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="reiserfsprogs_jreplay.patch"

===== reiserfscore/journal.c 1.34 vs edited =====
--- 1.34/reiserfsprogs/reiserfscore/journal.c	Tue Feb 17 15:20:46 2004
+++ edited/reiserfscore/journal.c	Fri Feb 27 15:46:54 2004
@@ -179,7 +179,6 @@
 }
 
 #define TRANS_FOUND     1
-#define TRANS_LAST      2
 #define TRANS_NOT_FOUND 0
 
 /* trans is a valid transaction. Look for valid transaction with smallest
@@ -229,8 +228,6 @@
 	trans->commit_blocknr = commit_expected (fs, next_d_bh);
 	trans->next_trans_offset = next_desc_expected (fs, next_d_bh) - j_start;
 	found = TRANS_FOUND;
-	if (break_trans.trans_id == get_desc_trans_id (next_d_bh))
-	    found = TRANS_LAST;
     }
 
     brelse (d_bh);
@@ -335,10 +332,7 @@
 
     while (1) {
 	action (fs, &oldest);	
-	if (ret == TRANS_LAST)
-	    break;
-	ret = next_transaction (fs, &oldest, newest);	
-	if (ret == TRANS_NOT_FOUND)
+	if ((ret = next_transaction (fs, &oldest, newest)) == TRANS_NOT_FOUND)
 	    break;
     }
 }
@@ -786,29 +780,21 @@
     replayed = 0;
     ret = TRANS_FOUND;
     
-    while (cur.mount_id != control.mount_id || cur.trans_id != control.trans_id) {
-	if (control.mount_id == cur.mount_id && control.trans_id == 0 && 
-	    control.desc_blocknr == 0)
+    /* Looking to the first valid not replayed transaction. */
+    while (1) {
+	if (cur.mount_id == control.mount_id && 
+	    cur.trans_id > control.trans_id)
 	    break;
-	
-	ret = next_transaction (fs, &cur, newest);
-	
-	if (ret != TRANS_FOUND)
+
+	if ((ret = next_transaction (fs, &cur, newest)) != TRANS_FOUND)
 	    break;
     }
-
+    
     while (ret == TRANS_FOUND) {
-	if (control.mount_id != cur.mount_id || control.trans_id != 0 || 
-	    control.desc_blocknr != 0) 
-	{
-	    ret = next_transaction (fs, &cur, newest);
-	    
-	    if (ret == TRANS_NOT_FOUND)
-		break;
-	    
-	    if (cur.mount_id != control.mount_id || cur.trans_id != control.trans_id + 1)
-		break;	    
-	}
+	/* If not the next transaction to be replaied, break out here. */
+	if (cur.mount_id != control.mount_id || 
+	    cur.trans_id != control.trans_id + 1)
+	    break;
 	
 	if (!transaction_check_content(fs, &cur)) {
 	    reiserfs_warning (stderr, "Trans broken: mountid %lu, transid %lu, desc %lu, "
@@ -825,9 +811,16 @@
 	update_journal_header (bh, cur);
 	control = cur;
         replayed ++;
+
+	ret = next_transaction (fs, &cur, newest);
     }
 
-    reiserfs_warning (stderr, "%d transactions replayed\n", replayed);
+    reiserfs_warning (stderr, "Reiserfs journal '%s' in blocks [%u..%u]: %d "
+		      "transactions replayed\n", fs->fs_j_file_name, 
+		      get_jp_journal_1st_block(sb_jp(fs->fs_ondisk_sb)),
+		      get_jp_journal_1st_block(sb_jp(fs->fs_ondisk_sb)) + 
+		      get_jp_journal_size(sb_jp(fs->fs_ondisk_sb)) + 1,
+		      replayed);
 	
     mark_buffer_dirty (fs->fs_super_bh);
     bwrite (fs->fs_super_bh);

--Boundary-00=_52zPAz4z2uFfMrn--

