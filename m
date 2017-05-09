From: jeffm@suse.com
Subject: [PATCH 2/4] reiserfs: use snprintf for buffer formatting
Date: Tue,  9 May 2017 16:50:11 -0400
Message-ID: <20170509205013.568-3-jeffm@suse.com>
References: <20170509205013.568-1-jeffm@suse.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20170509205013.568-1-jeffm@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Jeff Mahoney <jeffm@suse.com>

From: Jeff Mahoney <jeffm@suse.com>

We use a fixed-length buffer for formatting messages but don't do
any bounds checking on it.  This patch makes proper use of snprintf
and bounds tracking to ensure that we don't overflow.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/prints.c | 213 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 138 insertions(+), 75 deletions(-)

diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index 2f6a7b42fa31..1af3febb0419 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -6,6 +6,7 @@
 #include <linux/fs.h>
 #include "reiserfs.h"
 #include <linux/string.h>
+#include <linux/ctype.h>
 #include <linux/buffer_head.h>
 
 #include <stdarg.h>
@@ -76,83 +77,111 @@ static char *le_type(struct reiserfs_key *key)
 }
 
 /* %k */
-static void sprintf_le_key(char *buf, struct reiserfs_key *key)
+static int snprintf_le_key(char *buf, size_t size, struct reiserfs_key *key)
 {
-	if (key)
-		sprintf(buf, "[%d %d %s %s]", le32_to_cpu(key->k_dir_id),
+	if (!key)
+		return snprintf(buf, size, "[NULL]");
+
+	return snprintf(buf, size, "[%d %d %s %s]", le32_to_cpu(key->k_dir_id),
 			le32_to_cpu(key->k_objectid), le_offset(key),
 			le_type(key));
-	else
-		sprintf(buf, "[NULL]");
 }
 
 /* %K */
-static void sprintf_cpu_key(char *buf, struct cpu_key *key)
+static int snprintf_cpu_key(char *buf, size_t size, struct cpu_key *key)
 {
-	if (key)
-		sprintf(buf, "[%d %d %s %s]", key->on_disk_key.k_dir_id,
+	if (!key)
+		return snprintf(buf, size, "[NULL]");
+
+	return snprintf(buf, size, "[%d %d %s %s]", key->on_disk_key.k_dir_id,
 			key->on_disk_key.k_objectid, reiserfs_cpu_offset(key),
 			cpu_type(key));
-	else
-		sprintf(buf, "[NULL]");
 }
 
-static void sprintf_de_head(char *buf, struct reiserfs_de_head *deh)
+static int snprintf_de_head(char *buf, size_t size,
+			    struct reiserfs_de_head *deh)
 {
-	if (deh)
-		sprintf(buf,
-			"[offset=%d dir_id=%d objectid=%d location=%d state=%04x]",
+	if (!deh)
+		return snprintf(buf, size, "[NULL]");
+
+	return snprintf(buf, size,
+		        "[offset=%d dir_id=%d objectid=%d location=%d state=%04x]",
 			deh_offset(deh), deh_dir_id(deh), deh_objectid(deh),
 			deh_location(deh), deh_state(deh));
-	else
-		sprintf(buf, "[NULL]");
-
 }
 
-static void sprintf_item_head(char *buf, struct item_head *ih)
+static int snprintf_item_head(char *buf, size_t size, struct item_head *ih)
 {
-	if (ih) {
-		strcpy(buf,
-		       (ih_version(ih) == KEY_FORMAT_3_6) ? "*3.6* " : "*3.5*");
-		sprintf_le_key(buf + strlen(buf), &(ih->ih_key));
-		sprintf(buf + strlen(buf), ", item_len %d, item_location %d, "
-			"free_space(entry_count) %d",
-			ih_item_len(ih), ih_location(ih), ih_free_space(ih));
-	} else
-		sprintf(buf, "[NULL]");
+	const char *key_format;
+	int used = 0;
+	if (!ih)
+		return snprintf(buf, size, "[NULL]");
+
+	key_format = (ih_version(ih) == KEY_FORMAT_3_6) ? "*3.6*" : "*3.5*";
+	used += snprintf(buf, size, "%s", key_format);
+	if (used > size)
+		return used;
+
+	used += snprintf_le_key(buf + used, size - used, &(ih->ih_key));
+	if (used > size)
+		return used;
+
+	used += snprintf(buf + used, size - used,
+			 ", item_len %d, item_location %d, free_space(entry_count) %d",
+			 ih_item_len(ih), ih_location(ih), ih_free_space(ih));
+	return used;
 }
 
-static void sprintf_direntry(char *buf, struct reiserfs_dir_entry *de)
+static int snprintf_direntry(char *buf, size_t size,
+			     struct reiserfs_dir_entry *de)
 {
 	char name[20];
 
-	memcpy(name, de->de_name, de->de_namelen > 19 ? 19 : de->de_namelen);
-	name[de->de_namelen > 19 ? 19 : de->de_namelen] = 0;
-	sprintf(buf, "\"%s\"==>[%d %d]", name, de->de_dir_id, de->de_objectid);
+	if (!de)
+		return snprintf(buf, size, "[NULL]");
+
+	if (de->de_name) {
+		memcpy(name, de->de_name, de->de_namelen > 19 ? 19 : de->de_namelen);
+		name[de->de_namelen > 19 ? 19 : de->de_namelen] = 0;
+	} else
+		strcpy(name, "[NULL]");
+	return snprintf(buf, size, "\"%s\"==>[%d %d]",
+			name, de->de_dir_id, de->de_objectid);
 }
 
-static void sprintf_block_head(char *buf, struct buffer_head *bh)
+static int snprintf_block_head(char *buf, size_t size, struct buffer_head *bh)
 {
-	sprintf(buf, "level=%d, nr_items=%d, free_space=%d rdkey ",
-		B_LEVEL(bh), B_NR_ITEMS(bh), B_FREE_SPACE(bh));
+	if (!bh)
+		return snprintf(buf, size, "[NULL]");
+
+	return snprintf(buf, size,
+			"level=%d, nr_items=%d, free_space=%d rdkey ",
+			B_LEVEL(bh), B_NR_ITEMS(bh), B_FREE_SPACE(bh));
 }
 
-static void sprintf_buffer_head(char *buf, struct buffer_head *bh)
+static int snprintf_buffer_head(char *buf, size_t size, struct buffer_head *bh)
 {
-	sprintf(buf,
-		"dev %pg, size %zd, blocknr %llu, count %d, state 0x%lx, page %p, (%s, %s, %s)",
-		bh->b_bdev, bh->b_size,
-		(unsigned long long)bh->b_blocknr, atomic_read(&(bh->b_count)),
-		bh->b_state, bh->b_page,
-		buffer_uptodate(bh) ? "UPTODATE" : "!UPTODATE",
-		buffer_dirty(bh) ? "DIRTY" : "CLEAN",
-		buffer_locked(bh) ? "LOCKED" : "UNLOCKED");
+	if (!bh)
+		return snprintf(buf, size, "[NULL]");
+
+	return snprintf(buf, size,
+			"dev %pg, size %zd, blocknr %llu, count %d, state 0x%lx, page %p, (%s, %s, %s)",
+			bh->b_bdev, bh->b_size,
+			(unsigned long long)bh->b_blocknr,
+			atomic_read(&bh->b_count),
+			bh->b_state, bh->b_page,
+			buffer_uptodate(bh) ? "UPTODATE" : "!UPTODATE",
+			buffer_dirty(bh) ? "DIRTY" : "CLEAN",
+			buffer_locked(bh) ? "LOCKED" : "UNLOCKED");
 }
 
-static void sprintf_disk_child(char *buf, struct disk_child *dc)
+static int snprintf_disk_child(char *buf, size_t size, struct disk_child *dc)
 {
-	sprintf(buf, "[dc_number=%d, dc_size=%u]", dc_block_number(dc),
-		dc_size(dc));
+	if (!dc)
+		return snprintf(buf, size, "[NULL]");
+
+	return snprintf(buf, size, "[dc_number=%d, dc_size=%u]",
+			dc_block_number(dc), dc_size(dc));
 }
 
 static char *is_there_reiserfs_struct(char *fmt, int *what)
@@ -160,8 +189,14 @@ static char *is_there_reiserfs_struct(char *fmt, int *what)
 	char *k = fmt;
 
 	while ((k = strchr(k, '%')) != NULL) {
-		if (k[1] == 'k' || k[1] == 'K' || k[1] == 'h' || k[1] == 't' ||
-		    k[1] == 'z' || k[1] == 'b' || k[1] == 'y' || k[1] == 'a') {
+		if (k[1] == 'k' || k[1] == 'K' || k[1] == 't' ||
+		    k[1] == 'b' || k[1] == 'y' || k[1] == 'a') {
+			*what = k[1];
+			break;
+		}
+
+		/* We can't gobble up normal qualifiers */
+		if ((k[1] == 'z' || k[1] == 'h') && !isalpha(k[2])) {
 			*what = k[1];
 			break;
 		}
@@ -190,6 +225,8 @@ static void prepare_error_buf(const char *fmt, va_list args)
 	char *k;
 	char *p = error_buf;
 	int what;
+	int left = sizeof(error_buf);
+	int bytes = 0;
 
 	spin_lock(&error_lock);
 
@@ -198,46 +235,72 @@ static void prepare_error_buf(const char *fmt, va_list args)
 	while ((k = is_there_reiserfs_struct(fmt1, &what)) != NULL) {
 		*k = 0;
 
-		p += vsprintf(p, fmt1, args);
+		bytes = vsnprintf(p, left, fmt1, args);
+		if (bytes >= left)
+			goto out;
+
+		p += bytes;
+		left -= bytes;
 
 		switch (what) {
-		case 'k':
-			sprintf_le_key(p, va_arg(args, struct reiserfs_key *));
-			break;
-		case 'K':
-			sprintf_cpu_key(p, va_arg(args, struct cpu_key *));
+		case 'k': {
+			struct reiserfs_key *key;
+			key = va_arg(args, struct reiserfs_key *);
+			bytes = snprintf_le_key(p, left, key);
 			break;
-		case 'h':
-			sprintf_item_head(p, va_arg(args, struct item_head *));
+		}
+		case 'K': {
+			struct cpu_key *key;
+			key = va_arg(args, struct cpu_key *);
+			bytes = snprintf_cpu_key(p, left, key);
 			break;
-		case 't':
-			sprintf_direntry(p,
-					 va_arg(args,
-						struct reiserfs_dir_entry *));
+		}
+		case 'h': {
+			struct item_head *ih;
+			ih = va_arg(args, struct item_head *);
+			bytes = snprintf_item_head(p, left, ih);
 			break;
-		case 'y':
-			sprintf_disk_child(p,
-					   va_arg(args, struct disk_child *));
+		}
+		case 't': {
+			struct reiserfs_dir_entry *de;
+			de = va_arg(args, struct reiserfs_dir_entry *);
+			bytes = snprintf_direntry(p, left, de);
 			break;
-		case 'z':
-			sprintf_block_head(p,
-					   va_arg(args, struct buffer_head *));
+		}
+		case 'y': {
+			struct disk_child *dc;
+			dc = va_arg(args, struct disk_child *);
+			bytes = snprintf_disk_child(p, left, dc);
 			break;
-		case 'b':
-			sprintf_buffer_head(p,
-					    va_arg(args, struct buffer_head *));
+		}
+		case 'z': {
+			struct buffer_head *bh;
+			bh = va_arg(args, struct buffer_head *);
+			bytes = snprintf_block_head(p, left, bh);
 			break;
-		case 'a':
-			sprintf_de_head(p,
-					va_arg(args,
-					       struct reiserfs_de_head *));
+		}
+		case 'b': {
+			struct buffer_head *bh;
+			bh = va_arg(args, struct buffer_head *);
+			bytes = snprintf_buffer_head(p, left, bh);
 			break;
 		}
+		case 'a': {
+			struct reiserfs_de_head *deh;
+			deh = va_arg(args, struct reiserfs_de_head *);
+			bytes = snprintf_de_head(p, left, deh);
+			break;
+		}};
+
+		if (bytes >= left)
+			goto out;
 
-		p += strlen(p);
+		p += bytes;
+		left -= bytes;
 		fmt1 = k + 2;
 	}
-	vsprintf(p, fmt1, args);
+out:
+	vsnprintf(p, left, fmt1, args);
 	spin_unlock(&error_lock);
 
 }
-- 
2.11.0

