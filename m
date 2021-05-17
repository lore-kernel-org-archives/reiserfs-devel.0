From: Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v2] reiserfs: add check for invalid 1st journal block
Date: Mon, 17 May 2021 15:15:45 +0300
Message-ID: <20210517121545.29645-1-paskripkin@gmail.com>
References: <20210517101523.GB31755@quack2.suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bpg0yo4zd9e4wgCvkS6BR8yRBmNDCnC7ieiyGUPdPVc=;
        b=X38FB1g+bA2WdLtLPEg2NrmkK7EeNXvscBt99RlP9vSpFsTCT0EfGbprIgtlTHJC1U
         cCdyfaURALQ6G74244t8XorpFu9r8ryPDahUDciszM9qN+zmhgZu7M6J3hMWUoTMcthr
         bnB3L/xVvYEFREK2DCg3twRsZ9dGLpJGDOiO9fbhbuPoRHoXWIaOMDT312XvryD0az17
         u3Yf0qTKtW4BUEXBsJ0p9R0V37Dx1iTsgJ2SNMkki+TG0/X1exxVCweVk60B5sYZSXrt
         UwKzbMVNDNjQ0QLT63sFdAxqdSJBhfWeXLAe2vXWMCCcHgdS5q63Q25Oji2hI1UC+Pdi
         2BnQ==
In-Reply-To: <20210517101523.GB31755@quack2.suse.cz>
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

Reported-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes in v2:
  Added necessary !SB_ONDISK_JOURNAL_DEVICE(sb) in "if"

---
 fs/reiserfs/journal.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 9edc8e2b154e..0834b101c316 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2758,6 +2758,20 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
 		goto free_and_return;
 	}
 
+	/*
+	 * Sanity check to see if journal first block is correct.
+	 * If journal first block is invalid it can cause
+	 * zeroing important superblock members.
+	 */
+	if (!SB_ONDISK_JOURNAL_DEVICE(sb) &&
+	    SB_ONDISK_JOURNAL_1st_BLOCK(sb) < SB_JOURNAL_1st_RESERVED_BLOCK(sb)) {
+		reiserfs_warning(sb, "journal-1393",
+				 "journal 1st super block is invalid: 1st reserved block %d, but actual 1st block is %d",
+				 SB_JOURNAL_1st_RESERVED_BLOCK(sb),
+				 SB_ONDISK_JOURNAL_1st_BLOCK(sb));
+		goto free_and_return;
+	}
+
 	if (journal_init_dev(sb, journal, j_dev_name) != 0) {
 		reiserfs_warning(sb, "sh-462",
 				 "unable to initialize journal device");
-- 
2.31.1

