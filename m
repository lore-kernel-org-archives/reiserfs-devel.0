From: Vadim Shakirov <shakirov@ispras.ru>
Subject: [PATCH] reiserfs: added check in case of bad disk in search_by_entry_key
Date: Sun, 11 Sep 2022 18:05:51 +0300
Message-ID: <20220911150551.34520-1-shakirov@ispras.ru>
References: <0>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <0>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: Vadim@vger.kernel.org, Shakirov@vger.kernel.org, linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, Shakirov Vadim <shakirov@ispras.ru>

From: Vadim Shakirov

Syzkaller has detected a bug in the search_by_entry_key function when the disk is bad.
For example, when we mount a disk using the search_by_key function, we are looking for an item_head that describes the .privroot directory. On the correct disk, either the desired position will be found, or the position following the desired element will be returned (since the key by which we are looking for may have an offset greater than that of the sought item_head), and using PATH_LAST_POSITION(path)-- the desired element is found.

But in the case of a bad disk, it may happen the item_head of the stat-file of the directory exists, but the item_head itself of the directory file does not exist. In this case, after ITEM_NOT_FOUND is returned from searh_by_key and PATH_LAST_POSITION(path)-- is executed, the location will point to the item_head of the stat file in this directory - dir_id and object_id will match, and the offset of the stat file is 0. And then we will treat the item_head of the stat file as if it were the item_head of a directory.

Signed-off-by: Shakirov Vadim <shakirov@ispras.ru>
---
 fs/reiserfs/namei.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 1594687582f0..c6db8db6a391 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -133,6 +133,12 @@ int search_by_entry_key(struct super_block *sb, const struct cpu_key *key,
 		}
 		PATH_LAST_POSITION(path)--;
 
+		if (!is_direntry_le_ih(tp_item_head(path)) ||
+		    COMP_SHORT_KEYS(&(tp_item_head(path))->ih_key, key)) {
+			pathrelse(path);
+			return IO_ERROR;
+		}
+
 	case ITEM_FOUND:
 		break;
 
-- 
2.25.1

