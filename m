From: Laurent Riffard <laurent.riffard@free.fr>
Subject: [PATCH 6/10] Reiser4: fix calls to kmem_cache_destroy
Date: Sun, 03 Dec 2006 14:50:58 +0100
Message-ID: <4572D642.70303@free.fr>
References: <4571D852.3080401@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30286-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4571D852.3080401@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Since Linux v2.6.19-rc1, kmem_cache_destroy() returns void because there
is very little filesystem driver code can do upon failed
kmem_cache_destroy().

This patch updates Reiser4 code to reflect this change. BTW, we do not
test anymore for null argument since kmem_cache_destroy does this check.
---
fs/reiser4/super_ops.c |    6 +-----
1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/fs/reiser4/super_ops.c b/fs/reiser4/super_ops.c
index 0f39702..04fa72d 100644
--- a/fs/reiser4/super_ops.c
+++ b/fs/reiser4/super_ops.c
@@ -589,11 +589,7 @@ static struct file_system_type reiser4_fs_type = {

void destroy_reiser4_cache(kmem_cache_t **cachep)
{
-	int result;
-
-	BUG_ON(*cachep == NULL);
-	result = kmem_cache_destroy(*cachep);
-	BUG_ON(result != 0);
+	kmem_cache_destroy(*cachep);
	*cachep = NULL;
}

-- 1.4.4.1.gaed4 


