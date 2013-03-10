From: Ionut-Gabriel Radu <ihonius@gmail.com>
Subject: [PATCH] reiserfs: Use kstrdup instead of kmalloc/strcpy
Date: Sun, 10 Mar 2013 15:06:23 +0200
Message-ID: <1362920783-17093-1-git-send-email-ihonius@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=9uOyAoa61ZLKUdbIIiL0VHAkDUSC5GQVAUG8LCWrzfM=;
        b=0LIDIH/mOldbM0ZBFNwu3b2N9JyuKVt/MPNpRRmsJSh73EC0kOU3jJ2783R36W/fB4
         4R+VhWzNr81ueKA2mTZ8H05bcQnrs08Jv6niU9Z/cQWhIJZpk+MfZWkylof6qXxa5qyX
         ZhJyXLzG59pZXbIrgXftN9lrAzEWOxwbKilGQH+0Erfir/cLeV8Gg58CW02UDfKbQKl/
         rhWuwi568zD7l7aQkWTvQ0JfeZynHMqJMrZcSH1Wy6H1amtGCR6ItvosfQK2VeJeRUge
         uKjdWLDaxmmWYiMpuUZ6EkRCjSbhTK/f16wuQMYNgTe/O9m8z5RvyqnZrWRaeCAvb6IV
         RcWg==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk
Cc: jack@suse.cz, artem.bityutskiy@linux.intel.com, shaggy@kernel.org, akpm@linux-foundation.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Ionut-Gabriel Radu <ihonius@gmail.com>

Signed-off-by: Ionut-Gabriel Radu <ihonius@gmail.com>
---
 fs/reiserfs/super.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 194113b..f8a23c3 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1147,8 +1147,7 @@ static int reiserfs_parse_options(struct super_block *s, char *options,	/* strin
 							 "on filesystem root.");
 					return 0;
 				}
-				qf_names[qtype] =
-				    kmalloc(strlen(arg) + 1, GFP_KERNEL);
+				qf_names[qtype] = kstrdup(arg, GFP_KERNEL);
 				if (!qf_names[qtype]) {
 					reiserfs_warning(s, "reiserfs-2502",
 							 "not enough memory "
@@ -1156,7 +1155,6 @@ static int reiserfs_parse_options(struct super_block *s, char *options,	/* strin
 							 "quotafile name.");
 					return 0;
 				}
-				strcpy(qf_names[qtype], arg);
 				if (qtype == USRQUOTA)
 					*mount_options |= 1 << REISERFS_USRQUOTA;
 				else
-- 
1.7.10.4
