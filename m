From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv7 1/6] reiser4: fix reiser4_post_{commit,write_back}_hook() and their invocations.
Date: Thu, 31 Jul 2014 14:19:44 +0400
Message-ID: <1406801989-6884-2-git-send-email-intelfx100@gmail.com>
References: <1406801989-6884-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KPOUDbb1ZegEba8P9ym+7MzuuXA9kXa3sTtzIP5H2BA=;
        b=KVlRQOvgPqKGHlDz40mOif4Cb3zkr6o8P2R9NtX0soH4STca6VyaYjiSq6OStqnSEz
         twVpgzYgdUkzHoFGcDXdl+vS6AwRqWcnB3kWW4wZEn72PnRjKKXAI5kv0XhcycQhWCy7
         EPH37VNLAxrg6I/GdRShLLb7onPqU7lQAAcM43jWL2HkB4OapY9Q2fWrxWmBuAMnko0v
         EgqjW6IIKXmRw9mz9Mda2Kp285Khyt/NqeMsSDeUM2A6MwWl+4jwkkVHVg7/LXPvpDJC
         l2XU1rLcLCWVFCNbHrb7r+KgHa2d4ggfRYPZNtC+SqhI5UEdaA6FsSKe7e4BK3QSsY82
         OvKw==
In-Reply-To: <1406801989-6884-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

- let all hooks be called from one place (reiser4_write_logs())
- don't call reiser4_post_write_back_hook() twice
- fix reiser4_post_write_back_hook(): call the correct method of space allocator

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/block_alloc.c | 2 +-
 fs/reiser4/wander.c      | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/reiser4/block_alloc.c b/fs/reiser4/block_alloc.c
index 81ed96f..3a4b667 100644
--- a/fs/reiser4/block_alloc.c
+++ b/fs/reiser4/block_alloc.c
@@ -1150,7 +1150,7 @@ void reiser4_post_write_back_hook(void)
 {
 	assert("zam-504", get_current_super_private() != NULL);
 
-	sa_post_commit_hook();
+	sa_post_write_back_hook();
 }
 
 /*
diff --git a/fs/reiser4/wander.c b/fs/reiser4/wander.c
index 0b518c3..4e29de8 100644
--- a/fs/reiser4/wander.c
+++ b/fs/reiser4/wander.c
@@ -1140,7 +1140,6 @@ static int write_tx_back(struct commit_handle * ch)
 	int ret;
 	int barrier;
 
-	reiser4_post_commit_hook();
 	fq = get_fq_for_current_atom();
 	if (IS_ERR(fq))
 		return  PTR_ERR(fq);
@@ -1165,7 +1164,6 @@ static int write_tx_back(struct commit_handle * ch)
 		if (ret)
 			return ret;
 	}
-	reiser4_post_write_back_hook();
 	return 0;
 }
 
@@ -1251,6 +1249,7 @@ int reiser4_write_logs(long *nr_submitted)
 	spin_lock_atom(atom);
 	reiser4_atom_set_stage(atom, ASTAGE_POST_COMMIT);
 	spin_unlock_atom(atom);
+	reiser4_post_commit_hook();
 
 	ret = write_tx_back(&ch);
 	reiser4_post_write_back_hook();
-- 
2.0.3

