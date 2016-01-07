From: tim.gardner@canonical.com
Subject: [PATCH v4.4-rc8] fs/reiserfs: Squelch new_insert_key 'may be used uninitialized' warning
Date: Thu,  7 Jan 2016 11:24:36 -0700
Message-ID: <1452191076-12555-1-git-send-email-tim.gardner@canonical.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=t++AolT6IYqRErhHwTGdU3gCJSLCEZ80RWY7pufhHqo=;
        b=mkDO8vtFFpZV+Rrc6lKTc7HrHeF98k6aCLJ+YOhMEWn7bmr5mZ40KwDpsGzDvKplZZ
         wxURrou8X5TvPtVqJpfSUWJou6uLpq2pcqO/KNxL85yvgqv3oPIPJKejqNZn1qpj/H+G
         HDjL3x97VbVVf6hr+oX0cojV2VPn4J67Mfj1gIHKvs3EIgOCGBokhcYhxwhhh47Kz4JO
         6TWobIXFn1/1BhWOwiyRxAw1k2yEiAvEg/8E8jdy5SsqwY7HVshxlY9wbDCY2M+BBQ6x
         AJB7uaw3zXxZqUgcemNRgXj9Imo4bCJjg8GOhXGFdY5SEKng3+XBcPpCGUDJdiX1zmPb
         zKgA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tim Gardner <tim.gardner@canonical.com>

From: Tim Gardner <tim.gardner@canonical.com>

fs/reiserfs/ibalance.c: In function 'balance_internal':
fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
  memcpy(new_insert_key_addr, &new_insert_key, KEY_SIZE);

gcc version 5.3.1 20151219 (Ubuntu 5.3.1-4ubuntu1)

Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---

It seems unlikely in practice that new_insert_key will get used before being set,
but I can see how the compiler might think that.

 fs/reiserfs/ibalance.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/reiserfs/ibalance.c b/fs/reiserfs/ibalance.c
index b751eea..f16d50e 100644
--- a/fs/reiserfs/ibalance.c
+++ b/fs/reiserfs/ibalance.c
@@ -850,6 +850,8 @@ int balance_internal(struct tree_balance *tb,
 		return order;
 	}
 
+	memset(&new_insert_key, 0, sizeof(new_insert_key));
+
 	k = 0;
 	if (tb->lnum[h] > 0) {
 		/*
-- 
1.9.1

