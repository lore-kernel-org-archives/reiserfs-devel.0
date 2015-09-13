From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 2/3] reiser4: fix reiser4_init_csum_tfm() error path; return real (negative) error code.
Date: Mon, 14 Sep 2015 02:08:39 +0300
Message-ID: <1442185720-25185-2-git-send-email-intelfx100@gmail.com>
References: <1442185720-25185-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nZGPMv5KYtcSoEJkr8BHXpE17a4QYyD9GKVY0YBf0u8=;
        b=QYCnpsq73cg1yFHjSAwWw6cZkqyxnVZtGOHS8kEPu/eA/GgnwPTUKDsYUkuWIZIysu
         XIHXPmize4TraIMCy5venUPNMeE7wJF2+suM1/lxLAt/9TTUDpvtJqduUaZC00IUjnje
         xPustE6jJUXFuRadfj0JBLZufXIbVeLPuOoW217DJU2T3t+sUisgQUO1cQbqmkvPYtaN
         zsj9wB1MaRbxsJIvUNt2INbKTq69G+JqtGi8F2F80FP+8+xNT/nj7G2cx/+WS8luShIk
         FlT2dAjlf5uSWf5AQzbYSPZI3Cu2KS2I97tDU7g15ne5+ThG03xrEXZFVufE93vODcCY
         cwpQ==
In-Reply-To: <1442185720-25185-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---

This is responsible for the oops on mount reported by Jose (also experienced
by me). The problem is that IS_ERR() works only for negative error codes,
so somewhere in the VFS an error path is incorrectly not taken.

 fs/reiser4/checksum.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/fs/reiser4/checksum.c b/fs/reiser4/checksum.c
index a5052b0..73d40f0 100644
--- a/fs/reiser4/checksum.c
+++ b/fs/reiser4/checksum.c
@@ -4,11 +4,13 @@
 
 int reiser4_init_csum_tfm(struct crypto_shash **tfm)
 {
-	*tfm = crypto_alloc_shash("crc32c", 0, 0);
-	if (IS_ERR(*tfm)) {
-		*tfm = NULL;
-		return 1;
-	}
+	struct crypto_shash *new_tfm;
+
+	new_tfm = crypto_alloc_shash("crc32c", 0, 0);
+	if (IS_ERR(new_tfm))
+		return PTR_ERR(new_tfm);
+
+	*tfm = new_tfm;
 	return 0;
 }
 
-- 
2.5.1

