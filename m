From: Fabian Frederick <fabf@skynet.be>
Subject: [PATCH 1/1] fs/reiserfs/journal.c: fix sparse context imbalance warning
Date: Thu, 18 Sep 2014 20:12:38 +0200
Message-ID: <1411063958-11570-1-git-send-email-fabf@skynet.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Fabian Frederick <fabf@skynet.be>, reiserfs-devel@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Andrew Morton <akpm@linux-foundation.org>

Merge conditional unlock/lock in the same condition to avoid sparse warning:
fs/reiserfs/journal.c:703:36: warning: context imbalance in 'add_to_chunk' - unexpected unlock

Cc: reiserfs-devel@vger.kernel.org
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 fs/reiserfs/journal.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index a88b1b3..d571e17 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -699,11 +699,13 @@ static int add_to_chunk(struct buffer_chunk *chunk, struct buffer_head *bh,
 	chunk->bh[chunk->nr++] = bh;
 	if (chunk->nr >= CHUNK_SIZE) {
 		ret = 1;
-		if (lock)
+		if (lock) {
 			spin_unlock(lock);
-		fn(chunk);
-		if (lock)
+			fn(chunk);
 			spin_lock(lock);
+		} else {
+			fn(chunk);
+		}
 	}
 	return ret;
 }
-- 
1.9.1
