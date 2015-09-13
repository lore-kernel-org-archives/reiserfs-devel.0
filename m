From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 1/3] reiser4: fix filesystem init error path.
Date: Mon, 14 Sep 2015 02:08:38 +0300
Message-ID: <1442185720-25185-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=6d1qI/0A5qvaGeLUG0b/r+NYLGOVAlZE8wWDaoDP2Xw=;
        b=seeN/2IGVp1fhPi+UmBTUgEkZc3uAYoddV9Wyk7e2cktzXYW0H6jkEqo745BeLvNx8
         JR/nijf2zmIdrmGXKLzy51H7pJY5B3G+jeRgWEeTLGvot0zYs5JfV4TvLOaTceDRnthH
         JrZixdSr61/M+W7dXPbQbf92t+kVeQw1edUXXmbYqrFXEnb5fxfbSw3cVBTw68YCtSYt
         U94pxjNJ7rGWy6y0uXVEK6gF4hyObEBwWZ3gGrSgBPR6be9o7Q6a64BpCLg+GBIoHzpY
         ZjyidjIS2mPI8gQDo2gawPY4G80qx7UFs9OR9Wb7hAA4wyvxS+RzalT6YQ2sCT+W03iI
         wK8g==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/super_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index 76c16af..2afaf3b 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -623,9 +623,9 @@ static int fill_super(struct super_block *super, void *data, int silent)
 	reiser4_done_txnmgr(&sbinfo->tmgr);
  failed_init_read_super:
  failed_init_super_data:
+ failed_init_csum_tfm:
 	reiser4_done_fs_info(super);
  failed_init_sinfo:
- failed_init_csum_tfm:
 	reiser4_exit_context(&ctx);
 	return result;
 }
-- 
2.5.1

