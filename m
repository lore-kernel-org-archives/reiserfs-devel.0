From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] reiserfs: use designated initializers
Date: Fri, 16 Dec 2016 17:04:35 -0800
Message-ID: <20161217010435.GA140601@beast>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=e6luwXuIHQ02Nea0wiRwlqm7XD9e3pGflsMbi42cia8=;
        b=IPXwU1EHhNmHAb8KBp+OCkq/cZNCGAcSTJFMiMgnq9T1OOfLQJalS8beJOJsreXZcq
         cl5OYJ7ZyjQH2j8Ss6UPhNkPbszqvgTvqin7VT6x3o0uhx8FXTYZIqnVrfwMCBlr03yp
         v7Y9HT3SmsTi1d2ifIthori+NLgSSYUhRR8PU=
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: reiserfs-devel@vger.kernel.org

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
Nexus Security
