From: Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] reiserfs: add check for invalid 1st journal block
Date: Sat, 15 May 2021 00:23:35 +0300
Message-ID: <20210514212335.9709-1-paskripkin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1X1qqR18ibDA8Udwd1HR4GJ3nNYqAECGtnk+wa5BBMA=;
        b=sJzyUdaa48kevw7fWKwm3u85jFi14ga/9QrErXb/7J/hKcdKHIErYxCwVjGZltJP2P
         9erRSLtiGS6shwMNRcfn353dgqq56LQ3Yg7cUechC3twDwChmKuKvl6kstWEkTtaUO/p
         jh/fT2S7UCl0vRGCpUVdVw2jaq30GM5oWJ5MPZ1j8pA6i+gTubTq570GxhG0IyHjYpfB
         RL+q2LwPCrhq5OA2quUy3PapIZgmMx4QdN/9msCTv9ulxGR+/ast+ta+dHX6+D+aKFKg
         vLdBDZw7lrzVfm+XUtU28Eg+Jtsmb4O6MqBH/ZVmpnkDMA8UJZKMN0WOTxdj8i4wACQx
         QcNw==
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jack@suse.cz, tiantao6@hisilicon.com, rdunlap@infradead.org
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>, syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com

syzbot reported divide error in reiserfs.
The problem was in incorrect journal 1st block.

Syzbot's reproducer manualy generated wrong superblock
with incorrect 1st block. In journal_init() wasn't
any checks about this particular case.

For example, if 1st journal block is before superblock
1st block, it can cause zeroing important superblock members
in do_journal_end().

Reported-and-tested-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 fs/reiserfs/journal.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 9edc8e2b154e..d58f24a08385 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2758,6 +2758,19 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
 		goto free_and_return;
 	}
 
+	/*
+	 * Sanity check to see is journal first block correct.
+	 * If journal first block is invalid it can cause
+	 * zeroing important superblock members.
+	 */
+	if (SB_ONDISK_JOURNAL_1st_BLOCK(sb) < SB_JOURNAL_1st_RESERVED_BLOCK(sb)) {
+		reiserfs_warning(sb, "journal-1393",
+			"journal 1st super block is invalid: 1st reserved block %d, but actual 1st block is %d",
+			SB_JOURNAL_1st_RESERVED_BLOCK(sb),
+			SB_ONDISK_JOURNAL_1st_BLOCK(sb));
+		goto free_and_return;
+	}
+
 	if (journal_init_dev(sb, journal, j_dev_name) != 0) {
 		reiserfs_warning(sb, "sh-462",
 				 "unable to initialize journal device");
-- 
2.31.1

