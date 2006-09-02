From: Andrew James Wade <andrew.j.wade@gmail.com>
Subject: [patch] Fix use after free in jrelse_tail
Date: Fri, 1 Sep 2006 20:35:56 -0400
Message-ID: <200609012035.58725.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608211935.35024.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Reply-To: andrew.j.wade@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29788-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608211935.35024.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

Hello Alexander,

"[nikita-1936] assertion failed: reiser4_no_counters_are_held()"
turned out to be a bug in the debugging code. I've applied the patch
below and haven't had a recurrence.

Cheers,
Andrew Wade

signed-off-by <andrew.j.wade@gmail.com>

diff -rupN a/fs/reiser4/jnode.c b/fs/reiser4/jnode.c
--- a/fs/reiser4/jnode.c	2006-09-01 16:44:51.000000000 -0400
+++ b/fs/reiser4/jnode.c	2006-09-01 16:58:06.000000000 -0400
@@ -999,10 +999,10 @@ void jrelse_tail(jnode * node /* jnode t
 {
 	assert("nikita-489", atomic_read(&node->d_count) > 0);
 	atomic_dec(&node->d_count);
-	/* release reference acquired in jload_gfp() or jinit_new() */
-	jput(node);
 	if (jnode_is_unformatted(node) || jnode_is_znode(node))
 		LOCK_CNT_DEC(d_refs);
+	/* release reference acquired in jload_gfp() or jinit_new() */
+	jput(node);
 }
 
 /* drop reference to node data. When last reference is dropped, data are
