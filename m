From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 3/3] reiser4: discard: handle incomplete erase units at the end of a partition.
Date: Fri, 13 Feb 2015 08:02:58 +0300
Message-ID: <1423803778-19698-4-git-send-email-intelfx100@gmail.com>
References: <1423803778-19698-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=krxc/1Yqy0i6HxaUfAMr8R8AWWZ7f64z7NNPK4b89Xo=;
        b=ajHYBt4WfZRePY2FcNJ852XzUbgCgGT9gkgLZdTfGNk9rV2aO7o9ThtJxg18aIxM7O
         LhBqJEQnXRr/8+35vxPNxlCfdREqDrCfBzteO+DJqqjpEgWOghxqn1YHGaUaI9P2AiOL
         g74t29+zLFO4xoK6ZFhG1IDY7SsSLaj12wQSWG1qbXp2Aqa2s4taHP51/8Myq69v27S9
         6WWHMaDS01DrBPc/nE8fR8unmFAGzcUQVyI7HxmvnX057R40j3rPq1M+X8ha/RkbYjvl
         h7F75npHFY7w4oksDtp5XY8uP54W6/3qjf42ko6rw0cQlSEnr/i6ztL9lzNlVa1k4dZ7
         T9Kg==
In-Reply-To: <1423803778-19698-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/discard.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
index 10c1707..6163ea2 100644
--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -542,7 +542,8 @@ static int discard_precise_extents(struct list_head *head)
 					last_padding_end = end;
 					last_padding_clean = 1;
 
-				} else if (try_allocate_blocks(end, tailp)) {
+				} else if (end + tailp <= reiser4_block_count(sb) &&
+					   try_allocate_blocks(end, tailp)) {
 					/*
 					 * tail padding is clean,
 					 * pad the tail
-- 
2.3.0

