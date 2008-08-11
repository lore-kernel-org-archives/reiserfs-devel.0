From: Ryan Hope <rmh3093@gmail.com>
Subject: [PATCH 3/3][reiser4] dont get radix-tree dirty tagging out of sync
Date: Mon, 11 Aug 2008 18:40:09 -0400
Message-ID: <48A0BFC9.40502@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=K6ZVcYwfAuVHqqUXFJSvfCMeNnktB798H2rxS54jbm0=;
        b=eoxL13tQ1D419AKSsmg11GrLV8JwEXclaM9RH/67Q/oajukSth77iI0bleJNTx6Rgo
         k1kZ7CB1bN4leztR0zrolx/rkN/5gnOlDHM2k+SUDskwWTTIEPw1gkgl4gi/uA4XQka5
         9z8Vc6/wybU6deI7liR/8YiNnVJsByO3ZqSEE=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@linux-foundation.org>, Edward Shishkin <edward.shishkin@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

This was item #14 on the todo list for reiser4 inclusion in mainline:

diff --git a/fs/reiser4/page_cache.c b/fs/reiser4/page_cache.c
index fe71368..a662c25 100644
--- a/fs/reiser4/page_cache.c
+++ b/fs/reiser4/page_cache.c
@@ -467,15 +467,14 @@ int reiser4_set_page_dirty_internal(struct page *page)
  	BUG_ON(mapping == NULL);

  	if (!TestSetPageDirty(page)) {
+		spin_lock_irq(&mapping->tree_lock);
  		if (mapping_cap_account_dirty(mapping))
  			inc_zone_page_state(page, NR_FILE_DIRTY);
-
+		radix_tree_tag_set(&mapping->page_tree,
+			page_index(page), PAGECACHE_TAG_DIRTY);
  		__mark_inode_dirty(mapping->host, I_DIRTY_PAGES);
+		spin_unlock_irq(&mapping->tree_lock);
  	}
-
-	/* znode must be dirty ? */
-	if (mapping->host == reiser4_get_super_fake(mapping->host->i_sb))
-		assert("", JF_ISSET(jprivate(page), JNODE_DIRTY));
  	return 0;
  }

-Ryan
