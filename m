From: edward.shishkin@gmail.com
Subject: [PATCH 2/3] Reiser4: use __GFP_REPEAT flag for costly memory allocation
Date: Thu, 26 Jan 2017 13:23:36 +0100
Message-ID: <1485433417-10554-2-git-send-email-edward.shishkin@gmail.com>
References: <1485433417-10554-1-git-send-email-edward.shishkin@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lvuwdSh9s4SG7xfCCe3rBGWYmSUz1euVGJ8XE0mKHWQ=;
        b=hKD9yOfgFXc6+HABIC+rJRi8pKbG6RKiLMF1Db1db8593C5yAHuma0/fQKnZ5lfTHQ
         qFWv4SZHXc922F9BUuiQThSwhlJnWhn8nU2Vlq9lIB4sLxi5gm4Rw+Hz/ghWCa5XH7Ok
         DVHHEvgMffihxMwVYU8uHl3bKDr48TdfbgLf5yhqd9Di2S77jjrIeB10nfH1Sa1qyIWA
         3IjZayoIJf7MF98KijSXBDOjQ/Uz7NG5gi0jukydYNTeD5/kockuBQe2/NRykY/VPsOO
         LcaLfrXUhX3402qybpDL4zi9pNWgwCZeFuRODEyK97zhXwGWP2Rrn4TupGtbHOL4ebc5
         uOGA==
In-Reply-To: <1485433417-10554-1-git-send-email-edward.shishkin@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Edward Shishkin <edward.shishkin@gmail.com>

From: Edward Shishkin <edward.shishkin@gmail.com>

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 tree.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tree.c b/tree.c
index 08574ca..e4712c4 100644
--- a/tree.c
+++ b/tree.c
@@ -1827,6 +1827,12 @@ int reiser4_init_tree(reiser4_tree * tree	/* pointer to structure being
 	assert("nikita-308", height > 0);
 	assert("nikita-309", nplug != NULL);
 	assert("zam-587", tree->super != NULL);
+	assert("edward-171", get_current_context() != NULL);
+	/*
+	 * We'll perform costly memory allocations for znode hash table, etc.
+	 * So, set proper allocation flags
+	 */
+	get_current_context()->gfp_mask |= (__GFP_NOWARN | __GFP_REPEAT);
 
 	tree->root_block = *root_block;
 	tree->height = height;
-- 
2.7.4

