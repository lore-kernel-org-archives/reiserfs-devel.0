From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 4/6] reiser4: discard: don't be overly smart when gluing extents in discard_sorted_merged_extents().
Date: Sat, 13 Dec 2014 00:10:30 +0300
Message-ID: <1418418632-18396-5-git-send-email-intelfx100@gmail.com>
References: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u6Vv3jscJpuYqte1EwsJUISjA9fEwxNq93rSCuNcMFI=;
        b=I/3uqFvSvp8hHZbd+I/Ptf46L1r5pQEnffWBRUxaAZz57MNoeiONyA5+EOEdmpeIQQ
         DbxkKWYA4oVi2GHBCnnWJICZAvAT5QRlCy8CDym5vmhHO+SEw5pY2DTZe6bnwHOdz4uv
         NZwqYugCItpgW7477L7GXiEwbgSUq0tnQ3trB2UsEN9/U1AhHV210MHYKhtOqcvl2Y0+
         RrxgRbm3YaKFXQbUaVFQXDhTC7yhvx1qMHcYV41LTDmjiSoVI8U9fhcaUsPHxP+ie35F
         nAqyPaAKXyhkHUbwNPVYVifwMbd9tnuBL3V+EMv8nDaXK6rROHgnCO3fQntaGLwuzsJ0
         d/JA==
In-Reply-To: <1418418632-18396-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

@tailp, @alen and @end must be updated simultaneously because there are expressions
involving combinations of these variables.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/discard.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
index a8c5336..86ff6e4 100644
--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -366,18 +366,10 @@ static int discard_sorted_merged_extents(struct list_head *head)
 					/*
 					 * jump to the glued extent
 					 */
-					if (end + tailp < next_start + next_len) {
-						/*
-						 * the glued extent doesn't
-						 * fit into the tail padding,
-						 * so update the last one
-						 */
-						tailp = extent_get_tailp(next_start + next_len,
-									 d_off, d_uni);
-						alen += (next_start + next_len - end);
-					}
 					pos = next;
+					alen += (next_start + next_len - end);
 					end = next_start + next_len;
+					tailp = extent_get_tailp(end, d_off, d_uni);
 					/*
 					 * try to glue more extents
 					 */
-- 
2.1.3

