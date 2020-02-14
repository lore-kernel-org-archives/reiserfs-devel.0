From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 073/186] reiserfs: Fix spurious unlock in reiserfs_fill_super() error handling
Date: Fri, 14 Feb 2020 11:15:22 -0500
Message-ID: <20200214161715.18113-73-sashal@kernel.org>
References: <20200214161715.18113-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581697129;
        bh=fXnsoQjwnpZgRXM5im4681pzskBGblpLjTDxl2J7dKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=v58LRw2iTdZJhfMwZMSZctRsKQXP80yyOCzLX/+UaecDAKIEkcRb1ahz/+Nx5b5kl
         9eJbARPp8TW/zHRph65BWQ+mmbmT6YwbprqlNwkF9ZabcLQwGbxQuMxmSmDNLg+slM
         zqnHI//S5OtgCRd/C1y6E7tBVeb4YIJwizIv4WOk=
In-Reply-To: <20200214161715.18113-1-sashal@kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Jan Kara <jack@suse.cz>, Sasha Levin <sashal@kernel.org>, reiserfs-devel@vger.kernel.org

From: Jan Kara <jack@suse.cz>

[ Upstream commit 4d5c1adaf893b8aa52525d2b81995e949bcb3239 ]

When we fail to allocate string for journal device name we jump to
'error' label which tries to unlock reiserfs write lock which is not
held. Jump to 'error_unlocked' instead.

Fixes: f32485be8397 ("reiserfs: delay reiserfs lock until journal initialization")
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/reiserfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 5208d85dd30c5..9caf3948417c0 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1954,7 +1954,7 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
 		if (!sbi->s_jdev) {
 			SWARN(silent, s, "", "Cannot allocate memory for "
 				"journal device name");
-			goto error;
+			goto error_unlocked;
 		}
 	}
 #ifdef CONFIG_QUOTA
-- 
2.20.1

