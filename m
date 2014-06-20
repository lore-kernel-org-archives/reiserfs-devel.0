From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv5 3/4] reiser4: add reiser4_debug(): a conditional equivalent of reiser4_log().
Date: Sat, 21 Jun 2014 00:39:57 +0400
Message-ID: <1403296798-11742-4-git-send-email-intelfx100@gmail.com>
References: <1403296798-11742-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LOATE+8NGMD4Ek49f3L3VnMUFqwscrD5856TUhA7yeQ=;
        b=ByVz1396ISIxpf04p5dCroH+bAG7dcBaRxsVGqUXu2ZLrrtVi39PkYRhyDOSXdfnH6
         gvlwyX/GmlWcawnkLwsIdOjQ80jFET0gvNTckVipObInbcWyVtQrymu7xQ2AQ6rnSy3O
         YovQMvFA6KS60XzN5o2zTy6fQ/lv+c/vaw00kdrrn80ZHVbTRoGUFodGj1rLfxjaiURV
         mHW+myluAZPK1IBL+Np/wqhbgr9A1xBzKs/qvha8dtysrNBxJiN77g7HAFnR/sD4pe7k
         RgujkwcrSTJ+gdvea2kOzxCfRO6RF5VUMdh+NI4IjvSuMZUHLCeVD6BLevnr5z+ZjD4v
         u3NQ==
In-Reply-To: <1403296798-11742-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/debug.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/reiser4/debug.h b/fs/reiser4/debug.h
index 060921f..281bf78 100644
--- a/fs/reiser4/debug.h
+++ b/fs/reiser4/debug.h
@@ -46,6 +46,9 @@
 /* version of info that only actually prints anything when _d_ebugging
     is on */
 #define dinfo(format, ...) printk(format , ## __VA_ARGS__)
+/* a conditional equivalent of reiser4_log */
+#define reiser4_debug(label, format, ...)				\
+	reiser4_log(label, format, ## __VA_ARGS__)
 /* macro to catch logical errors. Put it into `default' clause of
     switch() statement. */
 #define impossible(label, format, ...) 			\
@@ -77,6 +80,7 @@ extern void call_on_each_assert(void);
 #else
 
 #define dinfo(format, args...) noop
+#define reiser4_debug(label, format, args...) noop
 #define impossible(label, format, args...) noop
 #define assert(label, cond) noop
 #define check_me(label, expr)	((void) (expr))
-- 
2.0.0

