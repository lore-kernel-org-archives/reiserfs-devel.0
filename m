From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch] reiser4: fix handling ENOSPC cryptcompress
Date: Fri, 25 Apr 2008 22:17:40 +0400
Message-ID: <48122044.9000509@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030104060400060006010506"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------030104060400060006010506
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Andrew, these bugs were caught when testing
reiser4 on a small partition. Please, apply.

Thanks,
Edward.

--------------030104060400060006010506
Content-Type: text/x-patch;
 name="reiser4-fix-handling-enospc-cryptcompress.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-handling-enospc-cryptcompress.patch"

Problem:
Processes fall into infinite loop
when running in no-space-left-on-device situation.

Fixup:
Fixed leak of checkin_mutex in do_write_cryptcompress();
---
 linux-2.6.25-mm1/fs/reiser4/plugin/file/cryptcompress.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

--- linux-2.6.25-mm1/fs/reiser4/plugin/file/cryptcompress.c.orig
+++ linux-2.6.25-mm1/fs/reiser4/plugin/file/cryptcompress.c
@@ -2707,7 +2707,8 @@
 		if (result)
 			goto out;
 		if (cont->state == PSCHED_ASSIGNED_NEW)
-			goto out_no_release;
+			/* done_lh was called in write_pschedule_hook */
+			goto out_no_longterm_lock;
 
 		result = prepare_logical_cluster(inode, pos, count, &clust,
 						 LC_APPOV);
@@ -2779,9 +2780,9 @@
 	} while (count);
  out:
 	done_lh(&hint->lh);
-	mutex_unlock(&info->checkin_mutex);
 	save_file_hint(file, hint);
- out_no_release:
+ out_no_longterm_lock:
+	mutex_unlock(&info->checkin_mutex);
 	kfree(hint);
 	put_cluster_handle(&clust);
 	assert("edward-195",

--------------030104060400060006010506--
