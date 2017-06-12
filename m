From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.11 067/150] reiserfs: Make flush bios explicitely sync
Date: Mon, 12 Jun 2017 17:24:34 +0200
Message-ID: <20170612152522.285972584@linuxfoundation.org>
References: <20170612152519.404936272@linuxfoundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170612152519.404936272@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>

4.11-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jan Kara <jack@suse.cz>

commit d8747d642ec4ce96adf17ae35652a5e4015cfe02 upstream.

Commit b685d3d65ac7 "block: treat REQ_FUA and REQ_PREFLUSH as
synchronous" removed REQ_SYNC flag from WRITE_{FUA|PREFLUSH|...}
definitions.  generic_make_request_checks() however strips REQ_FUA and
REQ_PREFLUSH flags from a bio when the storage doesn't report volatile
write cache and thus write effectively becomes asynchronous which can
lead to performance regressions

Fix the problem by making sure all bios which are synchronous are
properly marked with REQ_SYNC.

Fixes: b685d3d65ac791406e0dfd8779cc9b3707fea5a3
CC: reiserfs-devel@vger.kernel.org
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 fs/reiserfs/journal.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -1112,7 +1112,7 @@ static int flush_commit_list(struct supe
 		depth = reiserfs_write_unlock_nested(s);
 		if (reiserfs_barrier_flush(s))
 			__sync_dirty_buffer(jl->j_commit_bh,
-					REQ_PREFLUSH | REQ_FUA);
+					REQ_SYNC | REQ_PREFLUSH | REQ_FUA);
 		else
 			sync_dirty_buffer(jl->j_commit_bh);
 		reiserfs_write_lock_nested(s, depth);
@@ -1271,7 +1271,7 @@ static int _update_journal_header_block(
 
 		if (reiserfs_barrier_flush(sb))
 			__sync_dirty_buffer(journal->j_header_bh,
-					REQ_PREFLUSH | REQ_FUA);
+					REQ_SYNC | REQ_PREFLUSH | REQ_FUA);
 		else
 			sync_dirty_buffer(journal->j_header_bh);
 


