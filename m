From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 2/3] reiser4: mark final deallocations in wandering log code as deferred.
Date: Mon,  8 Sep 2014 22:43:50 +0400
Message-ID: <1410201831-11722-3-git-send-email-intelfx100@gmail.com>
References: <1410201831-11722-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iUbGOq0jRvYFOR683xQL/hNvjK30tCUodWiArnDI7tQ=;
        b=UwzZvemXFGXokKpyDeUnHsdTWQcG6r3X7j17j0uQhV3k370EL9U1KtodR+hhohXu9h
         2RhWlMmnzkHmxwNZ1ypGhuqa4/tananJg9q8UIlRDZ8RXg4TVWIus/OKOGyehjNU2WXM
         Gx2+i3UPWfUI1byAg/4WGDae/6w1vFuanTtE6DbwmtozD8y9T7lNkCGoxpc2vbqKFH6B
         0vECOf4CJV6P+QpOUgRdYGxEQO9jAgoeSxnlaOAEuL1ZqobEyGjJBNEIUXQN+Xm1++kb
         wAlDHoI8dLAlhX3IgktL1oaa7ML05TH4lDqwIel9yGwNPJT1t0fgsnYYHINEXqNDsKN3
         dfkQ==
In-Reply-To: <1410201831-11722-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Now there is a clear semantic distinction between deferred and immediate
deallocations. Deferred mode is used to deallocate blocks that were previously
written, immediate mode is used to deallocate "just allocated" blocks in error
paths or if some previously allocated blocks turn out to be unneeded.

This way, we may get rid of discard-related hack in the deallocation routine,
i. e. treating immediate deallocations as deferred (which messes up
block accounting). This is done in the next commit.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/wander.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
index 04ddec6..fd5954a 100644
--- a/fs/reiser4/wander.c
+++ b/fs/reiser4/wander.c
@@ -482,8 +482,8 @@ static void dealloc_tx_list(struct commit_handle *ch)
 		jnode *cur = list_entry(ch->tx_list.next, jnode, capture_link);
 		list_del(&cur->capture_link);
 		ON_DEBUG(INIT_LIST_HEAD(&cur->capture_link));
-		reiser4_dealloc_block(jnode_get_block(cur), BLOCK_NOT_COUNTED,
-				      BA_FORMATTED);
+		reiser4_dealloc_block(jnode_get_block(cur), 0,
+				      BA_DEFER | BA_FORMATTED);
 
 		unpin_jnode_data(cur);
 		reiser4_drop_io_head(cur);
@@ -502,7 +502,7 @@ dealloc_wmap_actor(txn_atom * atom UNUSED_ARG,
 	assert("zam-500", *b != 0);
 	assert("zam-501", !reiser4_blocknr_is_fake(b));
 
-	reiser4_dealloc_block(b, BLOCK_NOT_COUNTED, BA_FORMATTED);
+	reiser4_dealloc_block(b, 0, BA_DEFER | BA_FORMATTED);
 	return 0;
 }
 
-- 
2.1.0

