From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 4/5] reiser4: discard support: add assertions to all code written within this feature.
Date: Tue,  6 May 2014 09:30:22 +0400
Message-ID: <1399354223-5334-5-git-send-email-intelfx100@gmail.com>
References: <1399354223-5334-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=epVrCm2Ya3eyXNVQKs0QiffBlF42IlUhcZzoH4unjRk=;
        b=IcB5Hqv5ww5Xvba+m9e4J5ogJndvWoWfMrWARh1hX+npUmCr/k7czqbadzMN0/TsVY
         cTnElbVsUleNuKtb233YWSWgoBam/n4lE5t6qrkYz0k0qD1SZ8HEL6qChmFaWT+lWfSb
         ED+S8N+B0NelkZEgWK9eRtBf2rRnZ4+DCQB9OXsbUDG7TZ2bFzY/cUv/5GiV84VQKzMq
         AjJ4aaOk2caKGmTFoQ8y9SN93s64vUnyI8LoxY+dQaUrxWXru9Duk8OBfuodo9Qa3FbD
         n4x0npZRHsPh5wXtWAIbI04gIJFNFJ8ZYTlsQQC9Mhhf2pg9MqDW4ituB+xkpmvIfioV
         v4UQ==
In-Reply-To: <1399354223-5334-1-git-send-email-intelfx100@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Signed-off-by: Ivan Shapovalov <intelfx100@gmail.com>
---
 fs/reiser4/discard.c             | 38 +++++++++++++++++++++++++++++++++++++-
 fs/reiser4/plugin/space/bitmap.c |  5 ++++-
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/fs/reiser4/discard.c b/fs/reiser4/discard.c
index cf4c8f9..81d2de5 100644
--- a/fs/reiser4/discard.c
+++ b/fs/reiser4/discard.c
@@ -73,6 +73,8 @@ struct discard_set_entry {
 
 static void discard_set_entry_init(discard_set_entry *entry)
 {
+	assert("intelfx-11", entry != NULL);
+
 	entry->start = 0;
 	entry->end = 0;
 	INIT_LIST_HEAD(&entry->link);
@@ -95,6 +97,8 @@ static discard_set_entry *discard_set_entry_alloc(void)
 
 static void discard_set_entry_free(discard_set_entry *entry)
 {
+	assert("intelfx-12", entry != NULL);
+
 	kfree(entry);
 }
 
@@ -106,6 +110,11 @@ static int discard_set_entry_merge(discard_set_entry *to,
                                    reiser4_block_nr start,
                                    reiser4_block_nr end)
 {
+	assert("intelfx-13", to != NULL);
+
+	assert("intelfx-16", to->start < to->end);
+	assert("intelfx-17", start < end);
+
 	if (to->start <= end && start <= to->end) {
 		reiser4_log("discard",
 		            "Merging extents: [%llu; %llu) and [%llu; %llu)",
@@ -128,6 +137,8 @@ static int discard_set_entry_merge(discard_set_entry *to,
 static int discard_set_entry_merge_entry(discard_set_entry *to,
                                          discard_set_entry *from)
 {
+	assert("intelfx-18", from != NULL);
+
 	return discard_set_entry_merge(to, from->start, from->end);
 }
 
@@ -144,6 +155,9 @@ static int discard_set_entry_compare(void* priv UNUSED_ARG,
 {
 	discard_set_entry *entry_a, *entry_b;
 
+	assert("intelfx-19", a != NULL);
+	assert("intelfx-20", b != NULL);
+
 	entry_a = discard_list_entry(a);
 	entry_b = discard_list_entry(b);
 
@@ -172,6 +186,8 @@ static int discard_set_entry_compare(void* priv UNUSED_ARG,
 static int __discard_extent(struct block_device *bdev, sector_t start,
                             sector_t len)
 {
+	assert("intelfx-21", bdev != NULL);
+
 	reiser4_log("discard", "DISCARDING: [%llu; %llu)",
 	            (unsigned long long)start,
 	            (unsigned long long)(start + len));
@@ -237,7 +253,11 @@ static int discard_extent(discard_set_entry *e)
 		if (granularity > 1) {
 			unit_len_blk = unit_sec + granularity - 1;
 			sector_div(unit_len_blk, sec_per_blk);
-			unit_len_blk += 1 - unit_start_blk;
+			++unit_len_blk;
+
+			assert("intelfx-22", unit_len_blk > unit_start_blk);
+
+			unit_len_blk -= unit_start_blk;
 		} else {
 			unit_len_blk = 1;
 		}
@@ -304,6 +324,8 @@ static int __discard_list(struct list_head *list)
 	int ret;
 	int extent_count = 0;
 
+	assert("intelfx-23", list != NULL);
+
 	list_for_each(pos, list) {
 		entry = discard_list_entry(pos);
 
@@ -322,6 +344,8 @@ static int __discard_list(struct list_head *list)
 
 void discard_set_init(txn_atom *atom)
 {
+	assert("intelfx-24", atom != NULL);
+
 	INIT_LIST_HEAD(&atom->discard_set);
 }
 
@@ -330,6 +354,8 @@ void discard_set_destroy(txn_atom *atom)
 	struct list_head *pos, *tmp;
 	discard_set_entry *entry;
 
+	assert("intelfx-25", atom != NULL);
+
 	list_for_each_safe(pos, tmp, &atom->discard_set) {
 		entry = discard_list_entry(pos);
 		list_del_init(pos);
@@ -339,6 +365,9 @@ void discard_set_destroy(txn_atom *atom)
 
 void discard_set_merge(txn_atom *from, txn_atom *to)
 {
+	assert("intelfx-26", from != NULL);
+	assert("intelfx-27", to != NULL);
+
 	list_splice_tail_init(&from->discard_set, &to->discard_set);
 }
 
@@ -353,6 +382,8 @@ int discard_atom(txn_atom *atom)
 		return 0;
 	}
 
+	assert("intelfx-28", atom != NULL);
+
 	if (list_empty(&atom->discard_set)) {
 		spin_unlock_atom(atom);
 		return 0;
@@ -404,6 +435,11 @@ extern int discard_set_add_extent(txn_atom *atom,
 		return 0;
 	}
 
+	assert("intelfx-29", atom != NULL);
+	assert("intelfx-30", new_entry != NULL);
+	assert("intelfx-31", start != NULL);
+	assert("intelfx-32", len != NULL && *len > 0);
+
 	if (*new_entry == NULL) {
 		/*
 		 * Optimization: try to merge new extent into the last one.
diff --git a/fs/reiser4/plugin/space/bitmap.c b/fs/reiser4/plugin/space/bitmap.c
index 19a234b..d8ff542 100644
--- a/fs/reiser4/plugin/space/bitmap.c
+++ b/fs/reiser4/plugin/space/bitmap.c
@@ -1263,6 +1263,9 @@ int reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
 	bmap_off_t end_offset;
 	const bmap_off_t max_offset = bmap_bit_count(super->s_blocksize);
 
+	assert("intelfx-9", start != NULL);
+	assert("intelfx-10", ergo(len != NULL, *len > 0));
+
 	if (len != NULL) {
 		check_block_range(start, len);
 		end = *start + *len - 1;
@@ -1284,7 +1287,7 @@ int reiser4_check_blocks_bitmap(const reiser4_block_nr * start,
 	++end_offset;
 
 	assert("intelfx-4", end_bmap >= bmap);
-	assert("intelfx-5", ergo(end_bmap == bmap, end_offset > offset));
+	assert("intelfx-5", ergo(end_bmap == bmap, end_offset >= offset));
 
 	for (; bmap < end_bmap; bmap++, offset = 0) {
 		if (!check_blocks_one_bitmap(bmap, offset, max_offset, desired)) {
-- 
1.9.2

