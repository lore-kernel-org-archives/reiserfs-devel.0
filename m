From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 3/10] Reiser4: fix use after free in jrelse_tail
Date: Sun, 03 Dec 2006 14:50:25 +0100
Message-ID: <4572D621.4040800a@free.fr>
References: <4571D852.3080401@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30292-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4571D852.3080401@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

(From Andrew Wade <andrew.j.wade@gmail.com>)

"[nikita-1936] assertion failed: reiser4_no_counters_are_held()" turned
out to be a bug in the debugging code. I've applied the patch below and
haven't had a recurrence.
---
fs/reiser4/jnode.c |    4 ++--
1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/reiser4/jnode.c b/fs/reiser4/jnode.c
index e814712..8e4c026 100644
--- a/fs/reiser4/jnode.c
+++ b/fs/reiser4/jnode.c
@@ -999,10 +999,10 @@ void jrelse_tail(jnode * node /* jnode to release references to */ )
{
	assert("nikita-489", atomic_read(&node->d_count) > 0);
	atomic_dec(&node->d_count);
-	/* release reference acquired in jload_gfp() or jinit_new() */
-	jput(node);
	if (jnode_is_unformatted(node) || jnode_is_znode(node))
		LOCK_CNT_DEC(d_refs);
+	/* release reference acquired in jload_gfp() or jinit_new() */
+	jput(node);
}

/* drop reference to node data. When last reference is dropped, data are
-- 1.4.4.1.gaed4 





