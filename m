From: Tom Rix <trix@redhat.com>
Subject: [PATCH] reiserfs: remove unused iter variable
Date: Fri, 31 Mar 2023 08:03:25 -0400
Message-ID: <20230331120325.1855111-1-trix@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680264210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Wx3vtf0mWAsv14OEzo/oiyKAqTl2ZYLXwnoN7IpbtAc=;
        b=eTJtRXJxTlK3Bw9sGgJJeziPerAICVCWw9eE6Lm6xD0/pqkQGlgtrx5OKqF9hshnIvM8ro
        cl8zCJKfO0pSJehxxp+N1DeVuFlIdEWbRKGjisAhmgPoiMO2tR4+NEeXFr2GWEv8DAt6Fn
        d6qi+PSAC7x6zP6lrxAU8rnfVb34Vaw=
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: nathan@kernel.org, ndesaulniers@google.com, axboe@kernel.dk, akpm@linux-foundation.org, bvanassche@acm.org, jack@suse.cz, yi.zhang@huawei.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Tom Rix <trix@redhat.com>

clang with W=1 reports
fs/reiserfs/stree.c:1265:6: error: variable
  'iter' set but not used [-Werror,-Wunused-but-set-variable]
        int iter = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/reiserfs/stree.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 84c12a1947b2..ce5003986789 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -1262,7 +1262,6 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
 
 #ifdef CONFIG_REISERFS_CHECK
 	char mode;
-	int iter = 0;
 #endif
 
 	BUG_ON(!th->t_trans_id);
@@ -1274,7 +1273,6 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
 		removed = 0;
 
 #ifdef CONFIG_REISERFS_CHECK
-		iter++;
 		mode =
 #endif
 		    prepare_for_delete_or_cut(th, inode, path,
-- 
2.27.0

