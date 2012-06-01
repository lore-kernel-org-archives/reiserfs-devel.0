From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/5] reiserfs: remove useless superblock dirtying
Date: Fri,  1 Jun 2012 17:18:06 +0300
Message-ID: <1338560288-10727-4-git-send-email-dedekind1@gmail.com>
References: <1338560288-10727-1-git-send-email-dedekind1@gmail.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1338560288-10727-1-git-send-email-dedekind1@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux FS Maling List <linux-fsdevel@vger.kernel.org>, Linux Kernel Maling List <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The 'reiserfs_resize()' function marks the superblock as dirty by assigning 1
to 's_dirt' and then calls 'journal_mark_dirty()' which does the same. Thus,
we can remove the assignment from 'reiserfs_resize()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/reiserfs/resize.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/resize.c b/fs/reiserfs/resize.c
index 9a17f63..3ce02cf 100644
--- a/fs/reiserfs/resize.c
+++ b/fs/reiserfs/resize.c
@@ -200,7 +200,6 @@ int reiserfs_resize(struct super_block *s, unsigned long block_count_new)
 					  (bmap_nr_new - bmap_nr)));
 	PUT_SB_BLOCK_COUNT(s, block_count_new);
 	PUT_SB_BMAP_NR(s, bmap_would_wrap(bmap_nr_new) ? : bmap_nr_new);
-	s->s_dirt = 1;
 
 	journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB(s));
 
-- 
1.7.7.6

