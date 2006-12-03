From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 4/10] Reiser4: release d_ref
Date: Sun, 03 Dec 2006 14:50:36 +0100
Message-ID: <4572D62C.9080103a@free.fr>
References: <4571D852.3080401@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30294-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4571D852.3080401@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

(From Andrew Wade <andrew.j.wade@gmail.com>)

Hello Alexander,

In addition to your patch, I've also applied the patch below. With
these two patches the fs is much more stable for me.

However, something is holding a d_ref across the calls to
reiser4_writepage. It's not clear to me that this is allowed so my
patch may not be a full fix.

Andrew Wade
---
fs/reiser4/plugin/item/extent_file_ops.c |   12 +++++++++---
1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/reiser4/plugin/item/extent_file_ops.c b/fs/reiser4/plugin/item/extent_file_ops.c
index af4c89e..7afbca3 100644
--- a/fs/reiser4/plugin/item/extent_file_ops.c
+++ b/fs/reiser4/plugin/item/extent_file_ops.c
@@ -1313,20 +1313,22 @@ static int extent_readpage_filler(void *data, struct page *page)
				      TWIG_LEVEL, CBK_UNIQUE, NULL);
		if (result != CBK_COORD_FOUND) {
			unset_hint(hint);
-			return result;
+			goto out;
		}
		ext_coord->valid = 0;
	}

	if (zload(ext_coord->coord.node)) {
		unset_hint(hint);
-		return RETERR(-EIO);
+		result = RETERR(-EIO);
+		goto out;
	}
	if (!item_is_extent(&ext_coord->coord)) {
		/* tail conversion is running in parallel */
		zrelse(ext_coord->coord.node);
		unset_hint(hint);
-		return RETERR(-EIO);
+		result = RETERR(-EIO);
+		goto out;
	}

	if (ext_coord->valid == 0)
@@ -1351,6 +1353,10 @@ static int extent_readpage_filler(void *data, struct page *page)
	} else
		unset_hint(hint);
	zrelse(ext_coord->coord.node);
+
+out:
+	/* Calls to this function may be intermingled with VM writeback. */
+	reiser4_txn_restart_current();
	return result;
}

-- 1.4.4.1.gaed4 





