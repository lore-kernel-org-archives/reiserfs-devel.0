From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 11/45] reiserfs: add check for invalid 1st journal block
Date: Tue,  6 Jul 2021 07:27:15 -0400
Message-ID: <20210706112749.2065541-11-sashal@kernel.org>
References: <20210706112749.2065541-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625570884;
        bh=dVBJfQRirVoOIzRNPs88vxExJ0Go3B8dpqE3QDSy/mw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fs+yZ+OS3phuozim1/teBeLGWgU2V0YhWs0dCx9yWUo7J14zRERdC1hkhqPn+XRoH
         rWqrq9EMXY1+pLPoY7jAcEAyI0GNepqT4n96tUxUuKf+3WdJvDHJzvmNtQMWB28gGw
         KFTRevd02OOfFmFZoyYifX20ImVc8y6Bje6dDREeJ5lBT9MewC1HjX2xr+n0mO5vFF
         o0z3vTgW0EYBD+Eah4nxgE16PonBq8b4lALcXdUrRlvZWnDkduDf18Pd0Y/t3pv4Q7
         RpQHZXuGKi99Tg7fQ/nBiYWTpnCZqSiOs6HPPIVvxoaQUQC/cmWn0NXW3OUIOriJLd
         /5EO2DLJv1MEA==
In-Reply-To: <20210706112749.2065541-1-sashal@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Pavel Skripkin <paskripkin@gmail.com>, syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com, Jan Kara <jack@suse.cz>, Sasha Levin <sashal@kernel.org>, reiserfs-devel@vger.kernel.org

From: Pavel Skripkin <paskripkin@gmail.com>

[ Upstream commit a149127be52fa7eaf5b3681a0317a2bbb772d5a9 ]

syzbot reported divide error in reiserfs.
The problem was in incorrect journal 1st block.

Syzbot's reproducer manualy generated wrong superblock
with incorrect 1st block. In journal_init() wasn't
any checks about this particular case.

For example, if 1st journal block is before superblock
1st block, it can cause zeroing important superblock members
in do_journal_end().

Link: https://lore.kernel.org/r/20210517121545.29645-1-paskripkin@gmail.com
Reported-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/reiserfs/journal.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 2be907231375..1a6e6343fed3 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2769,6 +2769,20 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
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
2.30.2

