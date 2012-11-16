From: Jan Kara <jack@suse.cz>
Subject: [PATCH 3/4] reiserfs: Protect reiserfs_quota_write() with write lock
Date: Fri, 16 Nov 2012 12:33:39 +0100
Message-ID: <1353065620-27279-4-git-send-email-jack@suse.cz>
References: <1353065620-27279-1-git-send-email-jack@suse.cz>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1353065620-27279-1-git-send-email-jack@suse.cz>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, Jan Kara <"jack@suse.cz>, stable"@vger.kernel.org#>, =@suse.cz, 3.0@suse.cz

Calls into reiserfs journalling code and reiserfs_get_block() need to
be protected with write lock. We remove write lock around calls to high
level quota code in the next patch so these paths would suddently become
unprotected.

CC: stable@vger.kernel.org # >= 3.0
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index e59d6dd..c101704 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2338,7 +2338,9 @@ static ssize_t reiserfs_quota_write(struct super_block *sb, int type,
 		tocopy = sb->s_blocksize - offset < towrite ?
 		    sb->s_blocksize - offset : towrite;
 		tmp_bh.b_state = 0;
+		reiserfs_write_lock(sb);
 		err = reiserfs_get_block(inode, blk, &tmp_bh, GET_BLOCK_CREATE);
+		reiserfs_write_unlock(sb);
 		if (err)
 			goto out;
 		if (offset || tocopy != sb->s_blocksize)
@@ -2354,10 +2356,12 @@ static ssize_t reiserfs_quota_write(struct super_block *sb, int type,
 		flush_dcache_page(bh->b_page);
 		set_buffer_uptodate(bh);
 		unlock_buffer(bh);
+		reiserfs_write_lock(sb);
 		reiserfs_prepare_for_journal(sb, bh, 1);
 		journal_mark_dirty(current->journal_info, sb, bh);
 		if (!journal_quota)
 			reiserfs_add_ordered_list(inode, bh);
+		reiserfs_write_unlock(sb);
 		brelse(bh);
 		offset = 0;
 		towrite -= tocopy;
-- 
1.7.1

