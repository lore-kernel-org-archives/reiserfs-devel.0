From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch] reiser4: fix handling ENOSPC unix_file
Date: Fri, 25 Apr 2008 22:17:52 +0400
Message-ID: <48122050.3000509@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090800070000020505020804"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vladimir Saveliev <Vladimir.Saveliev@sun.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090800070000020505020804
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



--------------090800070000020505020804
Content-Type: text/x-patch;
 name="reiser4-fix-handling-enospc-unix_file.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-handling-enospc-unix_file.patch"

Problem:
Processes fall into infinite loop
when running in no-space-left-on-device situation.

Fixups:
1. fixed leak of exclusive access in write_unix_file();
2. fixed leak of inode's flag REISER4_PART_IN_CONV in tail2extent();
---
 linux-2.6.25-mm1/fs/reiser4/plugin/file/file.c            |    8 ++-
 linux-2.6.25-mm1/fs/reiser4/plugin/file/tail_conversion.c |   29 +++++++++-----
 2 files changed, 26 insertions(+), 11 deletions(-)

--- linux-2.6.25-mm1/fs/reiser4/plugin/file/file.c.orig
+++ linux-2.6.25-mm1/fs/reiser4/plugin/file/file.c
@@ -2207,8 +2207,11 @@
 					}
 					if (uf_info->container ==  UF_CONTAINER_TAILS) {
 						result = tail2extent(uf_info);
-						if (result)
+						if (result) {
+							drop_exclusive_access(uf_info);
+							context_set_commit_async(ctx);
 							break;
+						}
 					}
 				}
 				drop_exclusive_access(uf_info);
@@ -2250,7 +2253,7 @@
 			current->backing_dev_info = NULL;
 			drop_access(uf_info);
 			context_set_commit_async(ctx);
-			return result;
+			break;
 		}
 		drop_access(uf_info);
 		ea = NEITHER_OBTAINED;
@@ -2321,6 +2324,7 @@
 		    !rofs_inode(inode)) {
 			result = extent2tail(file, uf_info);
 			if (result != 0) {
+				context_set_commit_async(ctx);
 				warning("nikita-3233",
 					"Failed (%d) to convert in %s (%llu)",
 					result, __FUNCTION__,
--- linux-2.6.25-mm1/fs/reiser4/plugin/file/tail_conversion.c.orig
+++ linux-2.6.25-mm1/fs/reiser4/plugin/file/tail_conversion.c
@@ -133,9 +133,11 @@
 
 	for (i = 0; i < nr_pages; i++) {
 		if (pages[i] == NULL) {
+#if REISER4_DEBUG
 			unsigned j;
 			for (j = i + 1; j < nr_pages; j++)
 				assert("vs-1620", pages[j] == NULL);
+#endif
 			break;
 		}
 		page_cache_release(pages[i]);
@@ -348,8 +350,10 @@
 	while (done == 0) {
 		memset(pages, 0, sizeof(pages));
 		result = reserve_tail2extent_iteration(inode);
-		if (result != 0)
+		if (result != 0) {
+			reiser4_inode_clr_flag(inode, REISER4_PART_IN_CONV);
 			goto out;
+		}
 		if (first_iteration) {
 			reiser4_inode_set_flag(inode, REISER4_PART_MIXED);
 			reiser4_update_sd(inode);
@@ -494,11 +498,9 @@
 							  REISER4_PART_MIXED));
 		}
 	}
-
-	reiser4_inode_clr_flag(inode, REISER4_PART_IN_CONV);
-
 	if (result == 0) {
 		/* file is converted to extent items */
+		reiser4_inode_clr_flag(inode, REISER4_PART_IN_CONV);
 		assert("vs-1697", reiser4_inode_get_flag(inode,
 							 REISER4_PART_MIXED));
 
@@ -507,16 +509,21 @@
 	} else {
 		/*
 		 * conversion is not complete. Inode was already marked as
-		 * REISER4_PART_CONV and stat-data were updated at the first
+		 * REISER4_PART_MIXED and stat-data were updated at the first
 		 * iteration of the loop above.
 		 */
-	      error:
+	error:
 		release_all_pages(pages, sizeof_array(pages));
-		warning("nikita-2282", "Partial conversion of %llu: %i",
+		reiser4_inode_clr_flag(inode, REISER4_PART_IN_CONV);
+		warning("edward-1548", "Partial conversion of %llu: %i",
 			(unsigned long long)get_inode_oid(inode), result);
 	}
 
-      out:
+ out:
+	/* this flag should be cleared, otherwise get_exclusive_access_careful()
+	   will fall into infinite loop */
+	assert("edward-1549", !reiser4_inode_get_flag(inode,
+						      REISER4_PART_IN_CONV));
 	return result;
 }
 
@@ -703,7 +710,7 @@
 	}
 	/*
 	 * conversion is not complete. Inode was already marked as
-	 * REISER4_PART_MIXED and stat-data were updated at the first *
+	 * REISER4_PART_MIXED and stat-data were updated at the first
 	 * iteration of the loop above.
 	 */
 	warning("nikita-2282",
@@ -711,6 +718,10 @@
 		(unsigned long long)get_inode_oid(inode), i,
 		num_pages, result);
 
+	/* this flag should be cleared, otherwise get_exclusive_access_careful()
+	   will fall into infinite loop */
+	assert("edward-1550", !reiser4_inode_get_flag(inode,
+						      REISER4_PART_IN_CONV));
 	return result;
 }
 

--------------090800070000020505020804--
