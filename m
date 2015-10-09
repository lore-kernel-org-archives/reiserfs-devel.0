From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty before marking them writeback.
Date: Fri,  9 Oct 2015 14:16:57 +0300
Message-ID: <1444389417-14929-4-git-send-email-intelfx100@gmail.com>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7ubuVioqBBRTvz3YHi/d4SzjIp+KTtdd1OyqFn6HyfI=;
        b=bi3dhbxDd+/woPIcH4P9FWytqqQ+zuc9LQ5QuWUooFbKWnSEpYtKua8O15b0L9MPRt
         jHMJFyY0b8j9XkrvzsuxGGnLpqg0KskuEvp3m1LYxkhf/L4/DRx6ZtITOmLlgxVLD2HL
         79LJSJNKUGsWQxd8DIrKUn2QQemzSxO61qsA84bcsQmlsQNeEJW0IH2Jws4WiaTi3XCr
         SZm/l8dgQ4r7jXFE6fJeIpBCcrH+hdEUkcbMGV+Zv7S6J07ynqH6rbCIeK4/FoW1oTqe
         Czt8mmhZ/zfL0glAGWPXUd395kAmcg8yGGgo85Wk3F4wPpVfum5eWfvZIWmwz3cleJj5
         pQQg==
In-Reply-To: <1444389417-14929-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>, Oleg Drokin <green@linuxhacker.ru>

Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists.sourceforge.net/msg02745.html

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

Lustre seemed to encounter the same oops and fixed it in a different way, removing
set_page_writeback() altogether:
https://lkml.org/lkml/2015/7/30/806

We cannot just remove the call to set_page_writeback() at least because later
we wait on PG_Writeback flag of that page (in jwait_io())... What is meant by
"synchronous write" in that Lustre patch? Is our write "synchronous" in the
same sense? I don't know VFS well. Cc'ing Oleg.

 fs/reiser4/wander.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
index ce20d50..0e2c105 100644
--- a/fs/reiser4/wander.c
+++ b/fs/reiser4/wander.c
@@ -782,7 +782,9 @@ static int write_jnodes_to_disk_extent(
 					node_plugin_by_node(JZNODE(cur))->csum(JZNODE(cur), 0);
 				zrelse(JZNODE(cur));
 			}
+
 			ClearPageError(pg);
+			set_page_dirty_notag(pg);
 			set_page_writeback(pg);
 
 			if (get_current_context()->entd) {
-- 
2.6.0

