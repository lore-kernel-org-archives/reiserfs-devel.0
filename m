From: Eric Biggers <ebiggers3@gmail.com>
Subject: [PATCH] reiserfs: fix buffer overflow with long warning messages
Date: Sat,  7 Jul 2018 13:36:21 -0700
Message-ID: <20180707203621.30922-1-ebiggers3@gmail.com>
References: <001a1139d0ba06bddf056a063986@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pWOaJJsKOwAs3FSzoE3Egr6s0KjWTFaI72jfqShHQic=;
        b=e12wyR4RV7Zbsj84XGJZfGmh0lpac990ZLf6fhBMwcYfS6+j3aTDxXh+F7Nj86gH/y
         3x+fswWMkLSYlbSgXPgeGn2WFAC3zMulVJXjgQikBeq4Jb7dN/1JBCo5YAdKT++kBO7R
         z/FxKcVc46zrGxRowoZXnMSl4X56Li8D+G4uOlkdeUzSrZjY8Xl7WlG5Nznckha/P3Mq
         DZ+56FcAFNAA5C3dROt3zCV5AfhSADf1/b5/OwJ6jhSBfSZ+tgnWVs+R6aGFByquFvKS
         hHG4cm7iZ5ea9iCnOM0Q38HOROVwbpHl4kHEmJflRe2dSP4eMsLmgx/43BkQ61/Q409r
         kKmg==
In-Reply-To: <001a1139d0ba06bddf056a063986@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Jeff Mahoney <jeffm@suse.com>, Jan Kara <jack@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Biggers <ebiggers@google.com>

From: Eric Biggers <ebiggers@google.com>

ReiserFS prepares log messages into a 1024-byte buffer with no bounds
checks.  Long messages, such as the "unknown mount option" warning when
userspace passes a crafted mount options string, overflow this buffer.
This causes KASAN to report a global-out-of-bounds write.

Fix it by truncating messages to the buffer size.

Reported-by: syzbot+b890b3335a4d8c608963@syzkaller.appspotmail.com
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/reiserfs/prints.c | 141 +++++++++++++++++++++++++------------------
 1 file changed, 81 insertions(+), 60 deletions(-)

diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index 7e288d97adcbb..9fed1c05f1f4d 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -76,83 +76,99 @@ static char *le_type(struct reiserfs_key *key)
 }
 
 /* %k */
-static void sprintf_le_key(char *buf, struct reiserfs_key *key)
+static int scnprintf_le_key(char *buf, size_t size, struct reiserfs_key *key)
 {
 	if (key)
-		sprintf(buf, "[%d %d %s %s]", le32_to_cpu(key->k_dir_id),
-			le32_to_cpu(key->k_objectid), le_offset(key),
-			le_type(key));
+		return scnprintf(buf, size, "[%d %d %s %s]",
+				 le32_to_cpu(key->k_dir_id),
+				 le32_to_cpu(key->k_objectid), le_offset(key),
+				 le_type(key));
 	else
-		sprintf(buf, "[NULL]");
+		return scnprintf(buf, size, "[NULL]");
 }
 
 /* %K */
-static void sprintf_cpu_key(char *buf, struct cpu_key *key)
+static int scnprintf_cpu_key(char *buf, size_t size, struct cpu_key *key)
 {
 	if (key)
-		sprintf(buf, "[%d %d %s %s]", key->on_disk_key.k_dir_id,
-			key->on_disk_key.k_objectid, reiserfs_cpu_offset(key),
-			cpu_type(key));
+		return scnprintf(buf, size, "[%d %d %s %s]",
+				 key->on_disk_key.k_dir_id,
+				 key->on_disk_key.k_objectid,
+				 reiserfs_cpu_offset(key), cpu_type(key));
 	else
-		sprintf(buf, "[NULL]");
+		return scnprintf(buf, size, "[NULL]");
 }
 
-static void sprintf_de_head(char *buf, struct reiserfs_de_head *deh)
+static int scnprintf_de_head(char *buf, size_t size,
+			     struct reiserfs_de_head *deh)
 {
 	if (deh)
-		sprintf(buf,
-			"[offset=%d dir_id=%d objectid=%d location=%d state=%04x]",
-			deh_offset(deh), deh_dir_id(deh), deh_objectid(deh),
-			deh_location(deh), deh_state(deh));
+		return scnprintf(buf, size,
+				 "[offset=%d dir_id=%d objectid=%d location=%d state=%04x]",
+				 deh_offset(deh), deh_dir_id(deh),
+				 deh_objectid(deh), deh_location(deh),
+				 deh_state(deh));
 	else
-		sprintf(buf, "[NULL]");
+		return scnprintf(buf, size, "[NULL]");
 
 }
 
-static void sprintf_item_head(char *buf, struct item_head *ih)
+static int scnprintf_item_head(char *buf, size_t size, struct item_head *ih)
 {
 	if (ih) {
-		strcpy(buf,
-		       (ih_version(ih) == KEY_FORMAT_3_6) ? "*3.6* " : "*3.5*");
-		sprintf_le_key(buf + strlen(buf), &(ih->ih_key));
-		sprintf(buf + strlen(buf), ", item_len %d, item_location %d, "
-			"free_space(entry_count) %d",
-			ih_item_len(ih), ih_location(ih), ih_free_space(ih));
+		char *p = buf;
+		char * const end = buf + size;
+
+		p += scnprintf(p, end - p, "%s",
+			       (ih_version(ih) == KEY_FORMAT_3_6) ?
+			       "*3.6* " : "*3.5*");
+
+		p += scnprintf_le_key(p, end - p, &ih->ih_key);
+
+		p += scnprintf(p, end - p,
+			       ", item_len %d, item_location %d, free_space(entry_count) %d",
+			       ih_item_len(ih), ih_location(ih),
+			       ih_free_space(ih));
+		return p - buf;
 	} else
-		sprintf(buf, "[NULL]");
+		return scnprintf(buf, size, "[NULL]");
 }
 
-static void sprintf_direntry(char *buf, struct reiserfs_dir_entry *de)
+static int scnprintf_direntry(char *buf, size_t size,
+			      struct reiserfs_dir_entry *de)
 {
 	char name[20];
 
 	memcpy(name, de->de_name, de->de_namelen > 19 ? 19 : de->de_namelen);
 	name[de->de_namelen > 19 ? 19 : de->de_namelen] = 0;
-	sprintf(buf, "\"%s\"==>[%d %d]", name, de->de_dir_id, de->de_objectid);
+	return scnprintf(buf, size, "\"%s\"==>[%d %d]",
+			 name, de->de_dir_id, de->de_objectid);
 }
 
-static void sprintf_block_head(char *buf, struct buffer_head *bh)
+static int scnprintf_block_head(char *buf, size_t size, struct buffer_head *bh)
 {
-	sprintf(buf, "level=%d, nr_items=%d, free_space=%d rdkey ",
-		B_LEVEL(bh), B_NR_ITEMS(bh), B_FREE_SPACE(bh));
+	return scnprintf(buf, size,
+			 "level=%d, nr_items=%d, free_space=%d rdkey ",
+			 B_LEVEL(bh), B_NR_ITEMS(bh), B_FREE_SPACE(bh));
 }
 
-static void sprintf_buffer_head(char *buf, struct buffer_head *bh)
+static int scnprintf_buffer_head(char *buf, size_t size, struct buffer_head *bh)
 {
-	sprintf(buf,
-		"dev %pg, size %zd, blocknr %llu, count %d, state 0x%lx, page %p, (%s, %s, %s)",
-		bh->b_bdev, bh->b_size,
-		(unsigned long long)bh->b_blocknr, atomic_read(&(bh->b_count)),
-		bh->b_state, bh->b_page,
-		buffer_uptodate(bh) ? "UPTODATE" : "!UPTODATE",
-		buffer_dirty(bh) ? "DIRTY" : "CLEAN",
-		buffer_locked(bh) ? "LOCKED" : "UNLOCKED");
+	return scnprintf(buf, size,
+			 "dev %pg, size %zd, blocknr %llu, count %d, state 0x%lx, page %p, (%s, %s, %s)",
+			 bh->b_bdev, bh->b_size,
+			 (unsigned long long)bh->b_blocknr,
+			 atomic_read(&(bh->b_count)),
+			 bh->b_state, bh->b_page,
+			 buffer_uptodate(bh) ? "UPTODATE" : "!UPTODATE",
+			 buffer_dirty(bh) ? "DIRTY" : "CLEAN",
+			 buffer_locked(bh) ? "LOCKED" : "UNLOCKED");
 }
 
-static void sprintf_disk_child(char *buf, struct disk_child *dc)
+static int scnprintf_disk_child(char *buf, size_t size, struct disk_child *dc)
 {
-	sprintf(buf, "[dc_number=%d, dc_size=%u]", dc_block_number(dc),
-		dc_size(dc));
+	return scnprintf(buf, size, "[dc_number=%d, dc_size=%u]",
+			 dc_block_number(dc), dc_size(dc));
 }
 
 static char *is_there_reiserfs_struct(char *fmt, int *what)
@@ -189,55 +205,60 @@ static void prepare_error_buf(const char *fmt, va_list args)
 	char *fmt1 = fmt_buf;
 	char *k;
 	char *p = error_buf;
+	char * const end = &error_buf[sizeof(error_buf)];
 	int what;
 
 	spin_lock(&error_lock);
 
-	strcpy(fmt1, fmt);
+	if (WARN_ON(strscpy(fmt_buf, fmt, sizeof(fmt_buf)) < 0)) {
+		strscpy(error_buf, "format string too long", end - error_buf);
+		goto out_unlock;
+	}
 
 	while ((k = is_there_reiserfs_struct(fmt1, &what)) != NULL) {
 		*k = 0;
 
-		p += vsprintf(p, fmt1, args);
+		p += vscnprintf(p, end - p, fmt1, args);
 
 		switch (what) {
 		case 'k':
-			sprintf_le_key(p, va_arg(args, struct reiserfs_key *));
+			p += scnprintf_le_key(p, end - p,
+					      va_arg(args, struct reiserfs_key *));
 			break;
 		case 'K':
-			sprintf_cpu_key(p, va_arg(args, struct cpu_key *));
+			p += scnprintf_cpu_key(p, end - p,
+					       va_arg(args, struct cpu_key *));
 			break;
 		case 'h':
-			sprintf_item_head(p, va_arg(args, struct item_head *));
+			p += scnprintf_item_head(p, end - p,
+						 va_arg(args, struct item_head *));
 			break;
 		case 't':
-			sprintf_direntry(p,
-					 va_arg(args,
-						struct reiserfs_dir_entry *));
+			p += scnprintf_direntry(p, end - p,
+						va_arg(args, struct reiserfs_dir_entry *));
 			break;
 		case 'y':
-			sprintf_disk_child(p,
-					   va_arg(args, struct disk_child *));
+			p += scnprintf_disk_child(p, end - p,
+						  va_arg(args, struct disk_child *));
 			break;
 		case 'z':
-			sprintf_block_head(p,
-					   va_arg(args, struct buffer_head *));
+			p += scnprintf_block_head(p, end - p,
+						  va_arg(args, struct buffer_head *));
 			break;
 		case 'b':
-			sprintf_buffer_head(p,
-					    va_arg(args, struct buffer_head *));
+			p += scnprintf_buffer_head(p, end - p,
+						   va_arg(args, struct buffer_head *));
 			break;
 		case 'a':
-			sprintf_de_head(p,
-					va_arg(args,
-					       struct reiserfs_de_head *));
+			p += scnprintf_de_head(p, end - p,
+					       va_arg(args, struct reiserfs_de_head *));
 			break;
 		}
 
-		p += strlen(p);
 		fmt1 = k + 2;
 	}
-	vsprintf(p, fmt1, args);
+	p += vscnprintf(p, end - p, fmt1, args);
+out_unlock:
 	spin_unlock(&error_lock);
 
 }
-- 
2.18.0

