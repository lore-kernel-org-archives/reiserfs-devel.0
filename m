From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH 8/8] reiserfs: Use flush_dcache_folio() in reiserfs_quota_write()
Date: Fri, 16 Dec 2022 20:53:47 +0000
Message-ID: <20221216205348.3781217-9-willy@infradead.org>
References: <20221216205348.3781217-1-willy@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=kQv6RkxWyrCYRrHEjnn1N2LGczjsV+6qdNwSrNRRtbU=; b=vJZOeBvvwLhtV+tp9GJPBIkpAD
        m+hu5Q/y7ap8jXA4EiUWFjHXHpyv4f0Gb0WrusF5L2FOvg4EnYw5FymANmCzDj8LrCH/Y49tmv9IV
        rBJdCZcyROe99BuAS6YQGgNA4uRSK5n/FXhijtvJrQoefLz9hNLfemhRd74xRr9/krW6VBp/r5Hud
        uWJBxMZooi5zEydMpBjhEa6Jw7Wu/G3q++6UdYXnlg5LMqTM8TD+/lRDb/P9SexcfMc8yUDojYw4p
        cpOhVCV+4WDhO+EXfXXHFS6KXKeHRvB6sorFpP+zvRTw95ZGswvMlzdZYZp65cO662lvIogCo4XAG
        +Kuav7cg==;
In-Reply-To: <20221216205348.3781217-1-willy@infradead.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Ira Weiny <ira.weiny@intel.com>

Remove a use of b_page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/reiserfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 929acce6e731..ab9502381b40 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2567,7 +2567,7 @@ static ssize_t reiserfs_quota_write(struct super_block *sb, int type,
 		}
 		lock_buffer(bh);
 		memcpy(bh->b_data + offset, data, tocopy);
-		flush_dcache_page(bh->b_page);
+		flush_dcache_folio(bh->b_folio);
 		set_buffer_uptodate(bh);
 		unlock_buffer(bh);
 		reiserfs_write_lock(sb);
-- 
2.35.1

