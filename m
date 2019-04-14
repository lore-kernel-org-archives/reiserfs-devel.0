From: Bharath Vedartham <linux.bhar@gmail.com>
Subject: [PATCH] fs/reiserfs/journal.c: Make remove_journal_hash static
Date: Sun, 14 Apr 2019 16:54:38 +0530
Message-ID: <20190414112438.GA23266@bharath12345-Inspiron-5559>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=8bh7E92XwAQY9Rdt0I1FjHX4WCuQLkN46aALYSHpo68=;
        b=PI1GqRip2CPbVtvq39Ix+q/D9uJvG7psnU60Ew+qfhmxytg189GtDF7U0y+yK0FPbm
         CST1lKgXywnptMMsb9v3hEmO+8ntAm9IqvrAeDgEL7SX/UdDYhtIFn6vI4BUYI/f6C7c
         vtokqAjhLIQXe4gLPkx1h9c166TfUEVbjf4u3mePpI+aTxXpzuAT9HVKwWEnFPlbR+Ig
         S5xM0op2xWQMDw7bx+/mL/dAKxjNJQdGrM07I9V79Lm9KigKNhRiqIx2L3/mb3quAMNC
         mfRPgDzn11gvfxoW2xYpTDCsrTH2Ku3hJ43LHkzTfCHG0/FMzhGfP1Sjpq4f+9bZNAij
         zAzQ==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: keescook@chromium.org, jack@suse.cz, arnd@arndb.de, akpm@linux-foundation.org
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

This fixes the -WDecl sparse warning in journal.c. Function was declared
as static void but the definition was void.

Signed-off-by: Bharath Vedartham <linux.bhar@gmail.com>
---
 fs/reiserfs/journal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 8a76f9d..36346dc 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -1844,7 +1844,7 @@ static int flush_used_journal_lists(struct super_block *s,
  * removes any nodes in table with name block and dev as bh.
  * only touchs the hnext and hprev pointers.
  */
-void remove_journal_hash(struct super_block *sb,
+static void remove_journal_hash(struct super_block *sb,
 			 struct reiserfs_journal_cnode **table,
 			 struct reiserfs_journal_list *jl,
 			 unsigned long block, int remove_freed)
-- 
2.7.4

