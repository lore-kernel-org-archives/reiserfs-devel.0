From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.4 30/33] reiserfs: Fix memory leak in reiserfs_parse_options()
Date: Sun, 18 Oct 2020 15:27:25 -0400
Message-ID: <20201018192728.4056577-30-sashal@kernel.org>
References: <20201018192728.4056577-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603049284;
        bh=4urMCYdTXLt4wCaEBuuT4e20rgwEIUjK9HnD1rTAkGs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L/owCLSZzrzgSAcKHwyWQsdEg7fGPx8dlaZik7ZZ0Y4NCJ00vmzjr1kgsnXTVUTxj
         GutSjWKBYrjBGAY1zfm8DqOAArwDKC5rYVzHWni7bMMhya/hi2ipspHRqzK4rp0v8b
         AAoGxjYYdSdELtNKvVkFJPtWAd8FRlaBEuYl/51w=
In-Reply-To: <20201018192728.4056577-1-sashal@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Jan Kara <jack@suse.cz>, syzbot+c9e294bbe0333a6b7640@syzkaller.appspotmail.com, Sasha Levin <sashal@kernel.org>, reiserfs-devel@vger.kernel.org

From: Jan Kara <jack@suse.cz>

[ Upstream commit e9d4709fcc26353df12070566970f080e651f0c9 ]

When a usrjquota or grpjquota mount option is used multiple times, we
will leak memory allocated for the file name. Make sure the last setting
is used and all the previous ones are properly freed.

Reported-by: syzbot+c9e294bbe0333a6b7640@syzkaller.appspotmail.com
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/reiserfs/super.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index f9796fd515315..503d8c06e0d93 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1232,6 +1232,10 @@ static int reiserfs_parse_options(struct super_block *s,
 						 "turned on.");
 				return 0;
 			}
+			if (qf_names[qtype] !=
+			    REISERFS_SB(s)->s_qf_names[qtype])
+				kfree(qf_names[qtype]);
+			qf_names[qtype] = NULL;
 			if (*arg) {	/* Some filename specified? */
 				if (REISERFS_SB(s)->s_qf_names[qtype]
 				    && strcmp(REISERFS_SB(s)->s_qf_names[qtype],
@@ -1261,10 +1265,6 @@ static int reiserfs_parse_options(struct super_block *s,
 				else
 					*mount_options |= 1 << REISERFS_GRPQUOTA;
 			} else {
-				if (qf_names[qtype] !=
-				    REISERFS_SB(s)->s_qf_names[qtype])
-					kfree(qf_names[qtype]);
-				qf_names[qtype] = NULL;
 				if (qtype == USRQUOTA)
 					*mount_options &= ~(1 << REISERFS_USRQUOTA);
 				else
-- 
2.25.1

