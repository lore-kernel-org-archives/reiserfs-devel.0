From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 3/3] [v2] reiserfs: remove obsolete print_time function
Date: Wed, 20 Jun 2018 16:25:04 +0200
Message-ID: <20180620142522.27639-3-arnd@arndb.de>
References: <20180620142522.27639-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180620142522.27639-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: y2038@lists.linaro.org, Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Before linux-2.4.6, print_time() was used to pretty-print an inode
time when running reiserfs in user space, after that it has become
obsolete and is still a bit incorrect: It behaves differently on 32-bit
and 64-bit machines, and uses a static buffer to hold a string, which
could lead to undefined behavior if we ever called this from multiple
places simultaneously.

Since we always want to treat the timestamps as 'unsigned' anyway,
simply printing them as an integer is both simpler and safer while
avoiding the deprecated time_t type.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: after a second look, I decided to remove it instead of fixing it.
---
 fs/reiserfs/item_ops.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/fs/reiserfs/item_ops.c b/fs/reiserfs/item_ops.c
index e3c558d1b78c..3a5a752d96c7 100644
--- a/fs/reiserfs/item_ops.c
+++ b/fs/reiserfs/item_ops.c
@@ -33,30 +33,22 @@ static int sd_is_left_mergeable(struct reiserfs_key *key, unsigned long bsize)
 	return 0;
 }
 
-static char *print_time(time_t t)
-{
-	static char timebuf[256];
-
-	sprintf(timebuf, "%ld", t);
-	return timebuf;
-}
-
 static void sd_print_item(struct item_head *ih, char *item)
 {
 	printk("\tmode | size | nlinks | first direct | mtime\n");
 	if (stat_data_v1(ih)) {
 		struct stat_data_v1 *sd = (struct stat_data_v1 *)item;
 
-		printk("\t0%-6o | %6u | %2u | %d | %s\n", sd_v1_mode(sd),
+		printk("\t0%-6o | %6u | %2u | %d | %u\n", sd_v1_mode(sd),
 		       sd_v1_size(sd), sd_v1_nlink(sd),
 		       sd_v1_first_direct_byte(sd),
-		       print_time(sd_v1_mtime(sd)));
+		       sd_v1_mtime(sd));
 	} else {
 		struct stat_data *sd = (struct stat_data *)item;
 
-		printk("\t0%-6o | %6llu | %2u | %d | %s\n", sd_v2_mode(sd),
+		printk("\t0%-6o | %6llu | %2u | %d | %u\n", sd_v2_mode(sd),
 		       (unsigned long long)sd_v2_size(sd), sd_v2_nlink(sd),
-		       sd_v2_rdev(sd), print_time(sd_v2_mtime(sd)));
+		       sd_v2_rdev(sd), sd_v2_mtime(sd));
 	}
 }
 
-- 
2.9.0

