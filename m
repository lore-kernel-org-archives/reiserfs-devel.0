From: Chris Mason <mason@suse.com>
Subject: Re: Howto mount without replay?
Date: 03 May 2002 07:37:45 -0400
Message-ID: <1020425865.1511.104.camel@tiny>
References: <Pine.LNX.4.44.0205022236450.22979-100000@mooru.gurulabs.com>
	<Pine.LNX.4.44.0205022252320.22979-100000@mooru.gurulabs.com> 
	<20020503103239.A6410@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10220-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020503103239.A6410@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Dax Kelson <dax@gurulabs.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>


This might work on 2.4.18, I think it was 2.4.16 based.  I'll port
forward a little later today.

-chris

Index: linux/fs/reiserfs/super.c
--- linux/fs/reiserfs/super.c Thu, 13 Dec 2001 10:46:27 -0500 
+++ linux(w)/fs/reiserfs/super.c Thu, 13 Dec 2001 15:05:06 -0500 
@@ -440,6 +440,8 @@
 	    set_bit (REISERFS_HASHED_RELOCATION, mount_options);
 	} else if (!strcmp (this_char, "test4")) {
 	    set_bit (REISERFS_TEST4, mount_options);
+	} else if (!strcmp (this_char, "noreplay")) {
+	    set_bit (REISERFS_NO_REPLAY, mount_options);
 	} else if (!strcmp (this_char, "nolog")) {
 	    reiserfs_warning("reiserfs: nolog mount option not supported yet\n");
 	} else if (!strcmp (this_char, "replayonly")) {
@@ -532,6 +534,14 @@
     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
     s->s_dirt = 0;
   } else {
+    /* if we are currently readonly, and were mounted with noreplay, 
+    ** we need to check if replay failed and the journal params are not
+    ** correctly set.  If so, we cannot allow a rw mount, horrible, horrible
+    ** things would happen
+    */
+    if (reiserfs_replay_error(s)) {
+      return -EIO ;
+    }
     s->u.reiserfs_sb.s_mount_state = sb_state(rs) ;
     s->s_flags &= ~MS_RDONLY ; /* now it is safe to call journal_begin */
     journal_begin(&th, s, 10) ;
Index: linux/fs/reiserfs/journal.c
--- linux/fs/reiserfs/journal.c Wed, 12 Dec 2001 11:10:14 -0500 
+++ linux(w)/fs/reiserfs/journal.c Thu, 13 Dec 2001 15:05:06 -0500 
@@ -87,6 +87,7 @@
 
 /* state bits for the journal */
 #define WRITERS_BLOCKED 1      /* set when new writers not allowed */
+#define REPLAY_ERROR 2      /* set when -o noreplay forces unclean mount */
 
 static int do_journal_end(struct reiserfs_transaction_handle *,struct super_block *,unsigned long nblocks,int flags) ;
 static int flush_journal_list(struct super_block *s, struct reiserfs_journal_list *jl, int flushall) ;
@@ -99,6 +100,10 @@
   memset(SB_JOURNAL(p_s_sb)->j_hash_table, 0, JOURNAL_HASH_SIZE * sizeof(struct reiserfs_journal_cnode *)) ;
 }
 
+int reiserfs_replay_error(struct super_block *s) {
+    return test_bit(REPLAY_ERROR, &SB_JOURNAL(s)->j_state) ;
+}
+
 /*
 ** clears BH_Dirty and sticks the buffer on the clean list.  Called because I can't allow refile_buffer to
 ** make schedule happen after I've freed a block.  Look at remove_from_transaction and journal_mark_freed for
@@ -1651,12 +1656,20 @@
     brelse(d_bh) ;
   }
 
-  if (continue_replay && is_read_only(p_s_sb->s_dev)) {
-    printk("clm-2076: device is readonly, unable to replay log\n") ;
-    return -1 ;
-  }
-  if (continue_replay && (p_s_sb->s_flags & MS_RDONLY)) {
-    printk("Warning, log replay starting on readonly filesystem\n") ;    
+  if (continue_replay) {
+    if (is_read_only(p_s_sb->s_dev)) {
+      printk("clm-2076: device is readonly, unable to replay log\n") ;
+      return -1 ;
+    }
+    if (reiserfs_noreplay(p_s_sb)) {
+      printk("-o noreplay used to force unclean mount.  FS set to readonly\n");
+      p_s_sb->s_flags |= MS_RDONLY ;
+      set_bit(REPLAY_ERROR, &SB_JOURNAL(p_s_sb)->j_state) ;
+      return 0 ;
+    }
+    if (p_s_sb->s_flags & MS_RDONLY) {
+      printk("Warning, log replay starting on readonly filesystem\n") ;    
+    }
   }
 
   /* ok, there are transactions that need to be replayed.  start with the first log block, find
@@ -2037,6 +2050,12 @@
     PROC_INFO_INC( p_s_sb, journal.journal_relock_writers );
     goto relock ;
   }
+
+  if (test_bit(REPLAY_ERROR, &SB_JOURNAL(p_s_sb)->j_state)) {
+    printk("clm-2100: calling journal_begin after replay errors\n") ;
+    BUG() ;
+  }
+  
 
   /* if there is no room in the journal OR
   ** if this transaction is too old, and we weren't called joinable, wait for it to finish before beginning 
Index: linux/include/linux/reiserfs_fs_sb.h
--- linux/include/linux/reiserfs_fs_sb.h Wed, 12 Dec 2001 11:10:14 -0500 
+++ linux(w)/include/linux/reiserfs_fs_sb.h Thu, 13 Dec 2001 15:05:06 -0500 
@@ -464,6 +464,7 @@
 #define REISERFS_NO_UNHASHED_RELOCATION 12
 #define REISERFS_HASHED_RELOCATION 13
 #define REISERFS_TEST4 14 
+#define REISERFS_NO_REPLAY 15 
 
 #define REISERFS_TEST1 11
 #define REISERFS_TEST2 12
@@ -478,6 +479,7 @@
 #define reiserfs_no_unhashed_relocation(s) ((s)->u.reiserfs_sb.s_mount_opt & (1 << REISERFS_NO_UNHASHED_RELOCATION))
 #define reiserfs_hashed_relocation(s) ((s)->u.reiserfs_sb.s_mount_opt & (1 << REISERFS_HASHED_RELOCATION))
 #define reiserfs_test4(s) ((s)->u.reiserfs_sb.s_mount_opt & (1 << REISERFS_TEST4))
+#define reiserfs_noreplay(s) ((s)->u.reiserfs_sb.s_mount_opt & (1 << REISERFS_NO_REPLAY))
 
 #define dont_have_tails(s) ((s)->u.reiserfs_sb.s_mount_opt & (1 << NOTAIL))
 #define replay_only(s) ((s)->u.reiserfs_sb.s_mount_opt & (1 << REPLAYONLY))
Index: linux/include/linux/reiserfs_fs.h
--- linux/include/linux/reiserfs_fs.h Thu, 13 Dec 2001 10:46:27 -0500 
+++ linux(w)/include/linux/reiserfs_fs.h Thu, 13 Dec 2001 15:11:09 -0500 
@@ -1506,6 +1506,7 @@
 void reiserfs_commit_for_inode(struct inode *) ;
 void reiserfs_update_inode_transaction(struct inode *) ;
 void reiserfs_wait_on_write_block(struct super_block *s) ;
+int reiserfs_replay_error(struct super_block *s) ;
 void reiserfs_block_writes(struct reiserfs_transaction_handle *th) ;
 void reiserfs_allow_writes(struct super_block *s) ;
 void reiserfs_check_lock_depth(char *caller) ;





