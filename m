From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: handle cnode allocation failure gracefully
Date: Tue, 29 Nov 2005 16:44:03 -0500
Message-ID: <20051129214403.GA3840@locomotive.unixthugs.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>


 If an external device is used for a journal, by default it will use the
 entire device. The reiserfs journal code allocates structures per journal
 block when it mounts the file system. If the journal device is too large, and
 memory cannot be allocated for the structures, it will continue and ultimately
 panic when it can't pull one off the free list.

 This patch handles the allocation failure gracefully and prints an error
 message at mount time.

 Changes: Updated error message to be more descriptive to the user.

 Discussed and approved on ReiserFS Mailing List, Nov 28.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>

diff -ruNpX dontdiff a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
--- a/fs/reiserfs/journal.c	2005-09-16 11:42:58.000000000 -0400
+++ b/fs/reiserfs/journal.c	2005-11-23 19:14:17.000000000 -0500
@@ -2757,6 +2757,15 @@ int journal_init(struct super_block *p_s
 	journal->j_cnode_used = 0;
 	journal->j_must_wait = 0;
 
+	if (journal->j_cnode_free == 0) {
+        	reiserfs_warning(p_s_sb, "journal-2004: Journal cnode memory "
+		                 "allocation failed (%ld bytes). Journal is "
+		                 "too large for available memory. Usually "
+		                 "this is due to a journal that is too large.",
+		                 sizeof (struct reiserfs_journal_cnode) * num_cnodes);
+        	goto free_and_return;
+	}
+
 	init_journal_hash(p_s_sb);
 	jl = journal->j_current_jl;
 	jl->j_list_bitmap = get_list_bitmap(p_s_sb, jl);
-- 
Jeff Mahoney
SuSE Labs
