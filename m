From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 5/8] reiserfs: add check for an invalid ih_entry_count
Date: Wed, 30 Dec 2020 08:04:33 -0500
Message-ID: <20201230130436.3637579-5-sashal@kernel.org>
References: <20201230130436.3637579-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609333483;
        bh=WO2KPEZbeyzTZKyjeEAJA2KKDxrJLItX5oNbYHF33j0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tAte072aKZZ73ZbhJus+L9T0+ro3mT/g8NE+V/7/QC8Ln9243RFlxkhklS1fUPHOl
         9lW7nGQpPUhIkPmTMh3/L8DPhDLmyXu4xYFijUMMOmajhU/PhDFs2mgZU1tZve5fyj
         DP09HAZDxLpt692RtjkvrqplMixZ0efeeRb+YZ3n1dfV+1amrxeFi3PR4bovUhBKft
         yFauV75qDs3IqO9VuKERFKjdh10iMnpZ68UhDFa3wGp6mFzG2Vlq65JAj8kzRtO3jZ
         ZVlAPa2jKTrlaIcixkCVrA1E8Cf9dowjzJqiCmvhLXh4KqtosRUtoEh0dDDRLVhYLJ
         PJzf8AoB6m/rw==
In-Reply-To: <20201230130436.3637579-1-sashal@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Rustam Kovhaev <rkovhaev@gmail.com>, syzbot+83b6f7cf9922cae5c4d7@syzkaller.appspotmail.com, Jan Kara <jack@suse.cz>, Sasha Levin <sashal@kernel.org>, reiserfs-devel@vger.kernel.org

From: Rustam Kovhaev <rkovhaev@gmail.com>

[ Upstream commit d24396c5290ba8ab04ba505176874c4e04a2d53c ]

when directory item has an invalid value set for ih_entry_count it might
trigger use-after-free or out-of-bounds read in bin_search_in_dir_item()

ih_entry_count * IH_SIZE for directory item should not be larger than
ih_item_len

Link: https://lore.kernel.org/r/20201101140958.3650143-1-rkovhaev@gmail.com
Reported-and-tested-by: syzbot+83b6f7cf9922cae5c4d7@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=83b6f7cf9922cae5c4d7
Signed-off-by: Rustam Kovhaev <rkovhaev@gmail.com>
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/reiserfs/stree.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 2946713cb00d6..5229038852ca1 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -454,6 +454,12 @@ static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
 					 "(second one): %h", ih);
 			return 0;
 		}
+		if (is_direntry_le_ih(ih) && (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE))) {
+			reiserfs_warning(NULL, "reiserfs-5093",
+					 "item entry count seems wrong %h",
+					 ih);
+			return 0;
+		}
 		prev_location = ih_location(ih);
 	}
 
-- 
2.27.0

