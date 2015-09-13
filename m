From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 3/3] reiser4: report an error on checksum engine load failure.
Date: Mon, 14 Sep 2015 02:08:40 +0300
Message-ID: <1442185720-25185-3-git-send-email-intelfx100@gmail.com>
References: <1442185720-25185-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DESOhlc/o+GjtOJjlnAKeUHo210P1i5UQM+/MlVwUHw=;
        b=O/F8BW+uSJbzk6VdbaOiUr4HT08/f2cFY5AGe4FbF01oDIegdvmMawcahMApBBzoCT
         zb+axxsKo7vZ/CorADZsPLix9NWhwGCaLmQp4zXpwEqrMPtJbphUhjoRXcNbAV7meGON
         jtyQwQeQ6sxcyMYwUVgfxVh53HD8AuqtPcYCuQB1RMhKlNuMEGgAFYjTbpVRT+HrYM7B
         MDSlUyXqG7Pdm17+OxQgPfv/RTwxEHPhFri7xe9j2yRCvBQCof9gIHIapWjArC+2XdIZ
         +WpmAwRTtrISl3HxbvDrs61lkAFsQta/+fuen8WppnXZSnoioltfJfJ17xWVa4HsEnvg
         FT0Q==
In-Reply-To: <1442185720-25185-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>

It is apparently not possible to specify explicit module dependencies.
For well-formed setups this is not a problem because
crypto_alloc_shash() uses request_module() internally, but if one needs
reiser4, say, in initramfs, then the checksum module must be added
manually.

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/checksum.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/reiser4/checksum.c b/fs/reiser4/checksum.c
index 73d40f0..2a35f42 100644
--- a/fs/reiser4/checksum.c
+++ b/fs/reiser4/checksum.c
@@ -7,8 +7,10 @@ int reiser4_init_csum_tfm(struct crypto_shash **tfm)
 	struct crypto_shash *new_tfm;
 
 	new_tfm = crypto_alloc_shash("crc32c", 0, 0);
-	if (IS_ERR(new_tfm))
+	if (IS_ERR(new_tfm)) {
+		warning("intelfx-81", "Could not load crc32c driver");
 		return PTR_ERR(new_tfm);
+	}
 
 	*tfm = new_tfm;
 	return 0;
-- 
2.5.1

