From: Rustam Kovhaev <rkovhaev@gmail.com>
Subject: [PATCH] reiserfs: add check for an invalid ih_entry_count
Date: Sun,  1 Nov 2020 06:09:58 -0800
Message-ID: <20201101140958.3650143-1-rkovhaev@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9og09u1zo9NX9D44RRZapG5HLQMVJBUImJCPrX7E10=;
        b=XBh/ZQG09VwZL2EiUVzXO6QoYMWPFNyQYMfhzBF87zIMxDKw/abftzYZmS6wvWLkbS
         g7P2btAbHk+L2gY3o938IL/n3CQPr3ao8xbur4ni1agGW4PpkVC/AtOHgUgTvn13Q57A
         OEdeSwKAUBJVOZ6jggwWuREPbU+2R8JCK4v4wHDtQtOr1aX1rSx+CHw00EY4KWF7gWJx
         s9JrWfTd9NRMreR8tY6zF23u/nzMQFTcIGAdb+cbQOeswmQjsYiYr513w8dx7skmOWKx
         V6yjWK6ab2pFmq1MkJG9VLBexCPbmSk+maswIuLhitqmUXIN2oBm7+0cZbYfOIF5bLN7
         ZHDw==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: alex.shi@linux.alibaba.com, jack@suse.cz, akpm@linux-foundation.org, yeyunfeng@huawei.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, Rustam Kovhaev <rkovhaev@gmail.com>

when directory item has an invalid value set for ih_entry_count it might
trigger use-after-free or out-of-bounds read in bin_search_in_dir_item()

ih_entry_count * IH_SIZE for directory item should not be larger than
ih_item_len

Reported-and-tested-by: syzbot+83b6f7cf9922cae5c4d7@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=83b6f7cf9922cae5c4d7
Signed-off-by: Rustam Kovhaev <rkovhaev@gmail.com>
---
 fs/reiserfs/stree.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 8bf88d690729..476a7ff49482 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -454,6 +454,12 @@ static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
 					 "(second one): %h", ih);
 			return 0;
 		}
+		if (is_direntry_le_ih(ih) && (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE))) {
+			reiserfs_warning(NULL, "reiserfs-5093",
+					 "item entry count seems wrong %h",
+					 ih);
+			return 0;
+		}
 		prev_location = ih_location(ih);
 	}
 
-- 
2.28.0

