From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/3] reiserfs: use 64-bit values in print_time
Date: Tue, 19 Jun 2018 17:43:15 +0200
Message-ID: <20180619154343.3640484-3-arnd@arndb.de>
References: <20180619154343.3640484-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619154343.3640484-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>
Cc: y2038@lists.linaro.org, Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Inode timestamps are now 64-bit wide even on 32-bit machines, and reiserfs
interprets the 32-bit on-disk timestamps as unsigned when returning them
to user space with statx(), so for consistency we should print them
the same way in the emergency console logs.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/reiserfs/item_ops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/item_ops.c b/fs/reiserfs/item_ops.c
index e3c558d1b78c..d0ab3a763962 100644
--- a/fs/reiserfs/item_ops.c
+++ b/fs/reiserfs/item_ops.c
@@ -33,11 +33,11 @@ static int sd_is_left_mergeable(struct reiserfs_key *key, unsigned long bsize)
 	return 0;
 }
 
-static char *print_time(time_t t)
+static char *print_time(time64_t t)
 {
 	static char timebuf[256];
 
-	sprintf(timebuf, "%ld", t);
+	sprintf(timebuf, "%lld", t);
 	return timebuf;
 }
 
-- 
2.9.0

