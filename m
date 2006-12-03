From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 5/10] Reiser4: release d_ref (fix)
Date: Sun, 03 Dec 2006 14:50:49 +0100
Message-ID: <4572D639.8030406a@free.fr>
References: <4571D852.3080401@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4571D852.3080401@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

(From Andrew Wade <andrew.j.wade@gmail.com>)

Fix erronous call to reiser4_txn_restart_current, should
be txn_restart_current.
---
fs/reiser4/plugin/item/extent_file_ops.c |    2 +-
1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiser4/plugin/item/extent_file_ops.c b/fs/reiser4/plugin/item/extent_file_ops.c
index 7afbca3..6e1ac01 100644
--- a/fs/reiser4/plugin/item/extent_file_ops.c
+++ b/fs/reiser4/plugin/item/extent_file_ops.c
@@ -1356,7 +1356,7 @@ static int extent_readpage_filler(void *data, struct page *page)

out:
	/* Calls to this function may be intermingled with VM writeback. */
-	reiser4_txn_restart_current();
+	txn_restart_current();
	return result;
}

-- 1.4.4.1.gaed4 





