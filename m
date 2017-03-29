From: Kees Cook <keescook@chromium.org>
Subject: [RESEND][PATCH] reiserfs: Use designated initializers
Date: Wed, 29 Mar 2017 14:04:19 -0700
Message-ID: <20170329210419.GA40066@beast>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=KT+s54FhzY3Fg20NYOjZ6R/1wLbNwI/xhrF/5SgUDkw=;
        b=b1m/S50Xr/CYmkS1hzuU7jXQQBlvpdJEUwKGY3jK6o5GKKSZDmNHsgeuKwVGOCsw6t
         DlKZo6H1Ew0z3CnRD34jvfherAK3+4+JilWTde4rn0BjRr6APLMzC78WYPC6WQ8nZitd
         8IBP7j1wzXKm5GGKm2Hs2M+pP8YldiTOV3WdI=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

Prepare to mark sensitive kernel structures for randomization by making
sure they're using designated initializers. These were identified during
allyesconfig builds of x86, arm, and arm64, with most initializer fixes
extracted from grsecurity.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/reiserfs/item_ops.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/reiserfs/item_ops.c b/fs/reiserfs/item_ops.c
index aca73dd73906..e3c558d1b78c 100644
--- a/fs/reiserfs/item_ops.c
+++ b/fs/reiserfs/item_ops.c
@@ -724,18 +724,18 @@ static void errcatch_print_vi(struct virtual_item *vi)
 }
 
 static struct item_operations errcatch_ops = {
-	errcatch_bytes_number,
-	errcatch_decrement_key,
-	errcatch_is_left_mergeable,
-	errcatch_print_item,
-	errcatch_check_item,
-
-	errcatch_create_vi,
-	errcatch_check_left,
-	errcatch_check_right,
-	errcatch_part_size,
-	errcatch_unit_num,
-	errcatch_print_vi
+	.bytes_number = errcatch_bytes_number,
+	.decrement_key = errcatch_decrement_key,
+	.is_left_mergeable = errcatch_is_left_mergeable,
+	.print_item = errcatch_print_item,
+	.check_item = errcatch_check_item,
+
+	.create_vi = errcatch_create_vi,
+	.check_left = errcatch_check_left,
+	.check_right = errcatch_check_right,
+	.part_size = errcatch_part_size,
+	.unit_num = errcatch_unit_num,
+	.print_vi = errcatch_print_vi
 };
 
 #if ! (TYPE_STAT_DATA == 0 && TYPE_INDIRECT == 1 && TYPE_DIRECT == 2 && TYPE_DIRENTRY == 3)
-- 
2.7.4


-- 
Kees Cook
Pixel Security
