From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 1/3] reiser4: remove last traces of JNODE_NEW in the debugging code.
Date: Sun, 25 Oct 2015 02:02:18 +0300
Message-ID: <1445727740-12361-2-git-send-email-intelfx100@gmail.com>
References: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QUC1LChT0jJr5aeLmUOmR/mU7H6bOhU1fP8IXmyIPR8=;
        b=nx6Uftp7P+wkSXfuZZu6s+k6odPfYwZCu7IzwN/GQ7j8ZoW4pfNoNmM2uN26SeDp74
         NCCnWuy/cP1HHh3rDAqCwIH5jDufZbm0UGLtXKcn01lM9fIiA3j5jtqKPpxD8q2xkKID
         k+BbN7lMGJOJJAEOt6viybNF7mp0i7hWoJqXmk3zxaJOQXF9dQj4af4MwDpeGKIF/lyn
         w38FFUhKDoNikPmUw8R1igKwttn2Uwssig9WTzWCZ5RFA+VkJrf7qyLu6QHZ2kAhF5Yx
         fy/e0CzYdfL4a5nt7iiCHe16K6XuPNDLfR6Stz9P+MdzXqZWo9DthZO5xzoip0JXHj1y
         0nOg==
In-Reply-To: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/jnode.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiser4/jnode.c b/fs/reiser4/jnode.c
index e0c9e0c..43af7e9 100644
--- a/fs/reiser4/jnode.c
+++ b/fs/reiser4/jnode.c
@@ -1846,7 +1846,7 @@ static void info_jnode(const char *prefix /* prefix to print */ ,
 	}
 
 	printk
-	    ("%s: %p: state: %lx: [%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s], level: %i,"
+	    ("%s: %p: state: %lx: [%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s], level: %i,"
 	     " block: %s, d_count: %d, x_count: %d, "
 	     "pg: %p, atom: %p, lock: %i:%i, type: %s, ", prefix, node,
 	     node->state,
@@ -1863,7 +1863,6 @@ static void info_jnode(const char *prefix /* prefix to print */ ,
 	     jnode_state_name(node, JNODE_RIP),
 	     jnode_state_name(node, JNODE_MISSED_IN_CAPTURE),
 	     jnode_state_name(node, JNODE_WRITEBACK),
-	     jnode_state_name(node, JNODE_NEW),
 	     jnode_state_name(node, JNODE_DKSET),
 	     jnode_state_name(node, JNODE_REPACK),
 	     jnode_state_name(node, JNODE_CLUSTER_PAGE),
-- 
2.6.2

