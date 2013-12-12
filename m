From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH] reiser4: add module alias for 'reiser4' filesystem
Date: Thu, 12 Dec 2013 09:58:18 +0400
Message-ID: <1386827898-29764-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=Wi5yoHJJe9zGtgxSavYYh0Qgn3n60sXbhXOEBX+4mt4=;
        b=bDVvfu880vHlQUps9I1ZQ6V5EXPU9VWEY9qhsigUsCzOWbYsVtN5yxI5SKSzqqFmwV
         pKjfZNtySUAdOnrHaWXfMFxmngOcsY6DeS7RBvGiI60v+y1lAaP+W7s2fTVA9kfSsZEp
         YFDAXM9CMN8hlBIsaysxJfYd4oZaCQffutXp98B6++yljZwgJpNsMAUMEEbtGZvMZQ1P
         E5vxlboq0PuELcQgYwAZ771691emoT2trxS4+dCuHU06rJgVgP5uJdbfn300k9ztH2xn
         tns8vGhsLt9N93Eh+iBtQOo68QuSH9db763HEgqbaDfVXcx/QPQDizeFWVt6+ZRKfZbp
         z3Ug==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

---
 fs/reiser4/super_ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index ad13cc5..da89851 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -764,6 +764,8 @@ static void __exit done_reiser4(void)
 module_init(init_reiser4);
 module_exit(done_reiser4);
 
+MODULE_ALIAS_FS("reiser4");
+
 MODULE_DESCRIPTION("Reiser4 filesystem");
 MODULE_AUTHOR("Hans Reiser <Reiser@Namesys.COM>");
 
-- 
1.8.5.1

