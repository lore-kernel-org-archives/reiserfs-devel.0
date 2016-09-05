From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] Prevent Oops when mounting forward-incompatible volumes.
Date: Mon,  5 Sep 2016 18:13:21 +0200
Message-ID: <1473092001-9402-1-git-send-email-edward.shishkin@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=QcN5yEx2hsfaIzTmdotJdx5j/4JbrPxLXfJykOzV1rY=;
        b=uRrroEmqPUnrWb1t2Osj7ua2eLwazBUPO0LjdYoxihNM/pdH6CMqpw5cnnsUvEeNkn
         7Kf0i2N+L1iJVSvGtfF7cQvdz/X0mcx+SUbzmyhUFiMHqOqTlfbZHskzUrAchWyu11Q9
         1bT/7RpoSOIjxxOYtQYiUzzGGwqRTDG9nFevE+G4dLHVlwy4yo3OihbI/Uml3QD2l+Z9
         obisJ4XRjIq8zUCFTMb+VubPowaGrKuZDYNQ1K36SYUPD/0Mr9zBFzAwhZf8sQWv0VWS
         lybI+UYvs+VkV7un+ildf6BHNF7YxxwBYDCIRjkX0zBnL5xthLrqKTFEQTLKCHlu1QnW
         zibw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 init_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init_super.c b/init_super.c
index bd1644b..fb37605 100644
--- a/init_super.c
+++ b/init_super.c
@@ -639,7 +639,7 @@ int reiser4_init_read_super(struct super_block *super, int silent)
 		}
 
 		sbinfo->df_plug =
-			disk_format_plugin_by_id(
+			disk_format_plugin_by_unsafe_id(
 				le16_to_cpu(get_unaligned(&master_sb->disk_plugin_id)));
 		if (sbinfo->df_plug == NULL) {
 			if (!silent)
-- 
2.7.4

