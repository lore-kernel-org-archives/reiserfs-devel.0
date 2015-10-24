From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 2/3] reiser4: call account_page_redirty() on re-dirtying pages before giving them to entd.
Date: Sun, 25 Oct 2015 02:02:19 +0300
Message-ID: <1445727740-12361-3-git-send-email-intelfx100@gmail.com>
References: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=f2noSozdud3+Lgdd6Chi8SDdjEU2jitHbQE7VC/UrQk=;
        b=NLNj0K93D6+VP6sAnPGYRABSDehVU0kCUglP8JKoduz+Wy3j/cslZLYILOOmBNMujw
         kW4Jn9OtGhHvSYfh86MfskJguFky+6+QpzNY3z6ROI1GH/rY215e/32jVgDJGkOZR67S
         uDIfDVRS+qfkYsfl5ZwjQV+Dd3Xt2X5xAcGKy/SNujgqiwyl7RLz2aBM+VMJl8wBdelm
         bFsQ99roF6YwT3D4lsTb9wjmemqS5sII1Ju/Gbak9v8mxVzeVz3ywNfAkoNxAXZolXw7
         o1oN9E7FLjm0Un1q6E4tmcZWEG3haTb0qQwOEoMt4Z+M0FBZbBBAy4RK0ub7NVlzmxzO
         JvKA==
In-Reply-To: <1445727740-12361-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>

I guess we want that to rollback effects of account_page_dirtied()
in set_page_dirty_notag().

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/entd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/reiser4/entd.c b/fs/reiser4/entd.c
index bff4bfa..c254e71 100644
--- a/fs/reiser4/entd.c
+++ b/fs/reiser4/entd.c
@@ -303,6 +303,7 @@ int write_page_by_ent(struct page *page, struct writeback_control *wbc)
 	 * write it - it will remain dirty
 	 */
 	set_page_dirty_notag(page);
+	account_page_redirty(page);
 
 	/*
 	 * pin inode in memory, unlock page, entd_flush will iput. We can not
-- 
2.6.2

