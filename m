From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [reiser4] sub_from_sb_unallocated - error [zam528]
Date: Wed, 6 Nov 2002 22:50:25 +0300
Message-ID: <15817.29313.342186.859519@laputa.namesys.com>
References: <slrnasin32.45l.andreashappe@marvin.homelinux.net>
	<15817.24486.129650.130074@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11936-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <15817.24486.129650.130074@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Happe <andreashappe@gmx.net>
Cc: reiserfs-list@namesys.com, Reiserfs developers mail-list <Reiserfs-Dev@Namesys.COM>

Nikita Danilov writes:
 > Andreas Happe writes:
 >  > my computer crashed while copying a kernel tree from a reiserfs to a
 >  > reiser4 partition with the following message:
 >  > 
 >  > | Kernel panic: reiser4 panicked cowardly: <0> reiser4 [(pdflush(7)]:
 >  > | sub_from_sb_unallocated (fs/reiser4/block_alloc.c:161) [zam-528]
 >  > 
 >  > there are no new files on the reiser4 partition.
 >  > 
 >  > i'm using debian unstable, kernel 2.5.46 with reiser4 patch from
 >  > 5.11.2002.
 > 
 > Thank you for report. This bug is known. We are working on it right now.
 > I hope it will be fixed in the next snapshot.

In the meantime, can you please try attached patch.
(It should applied from within fs/reiser4 directory.)

 > 
 >  > 
 >  > Andreas
 >  > 
 >  > 
 > 

Nikita.
diff -Nru a/tree_mod.c b/tree_mod.c
--- a/tree_mod.c	Wed Nov  6 22:46:10 2002
+++ b/tree_mod.c	Wed Nov  6 22:46:10 2002
@@ -39,7 +39,7 @@
 	assert("nikita-930", brother != NULL);
 	assert("umka-264", level < REAL_MAX_ZTREE_HEIGHT);
 
-	retcode = assign_fake_blocknr(&blocknr, 1 /*formatted */ );
+	retcode = assign_fake_blocknr(&blocknr, BA_FORMATTED);
 	if (retcode == 0) {
 		result = zget(znode_get_tree(brother), &blocknr, NULL, level, GFP_KERNEL);
 		if (IS_ERR(result)) {
diff -Nru a/txnmgr.c b/txnmgr.c
--- a/txnmgr.c	Wed Nov  6 22:46:10 2002
+++ b/txnmgr.c	Wed Nov  6 22:46:10 2002
@@ -1951,7 +1951,7 @@
 			*/
 			/*reiser4_count_fake_deallocation ((__u64)1);
 			   reiser4_release_grabbed_space ((__u64)1); */
-			fake_allocated2free((__u64) 1, 1 /*formatted */ );
+			fake_allocated2free((__u64) 1, BA_FORMATTED);
 		}
 	}
 	assert("jmacd-5177", blocknr_entry == NULL);

