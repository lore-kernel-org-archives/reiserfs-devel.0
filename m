From: Adrian Bunk <bunk@stusta.de>
Subject: [2.6 patch] fs/reiserfs/stree.c: make MAX_KEY static
Date: Fri, 13 May 2005 02:48:00 +0200
Message-ID: <20050513004800.GZ3603@stusta.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24053-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Al Viro <viro@www.linux.org.uk>, reiserfs-dev@namesys.com, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Since MAX_KEY no longer has any user in other files, it can be made 
static.

Signed-off-by: Adrian Bunk <bunk@stusta.de>

---

This patch was already sent on:
- 1 May 2005

--- linux-2.6.12-rc3-mm2-full/fs/reiserfs/stree.c.old	2005-05-01 15:33:11.000000000 +0200
+++ linux-2.6.12-rc3-mm2-full/fs/reiserfs/stree.c	2005-05-01 15:33:19.000000000 +0200
@@ -223,7 +223,7 @@
 const struct reiserfs_key  MIN_KEY = {0, 0, {{0, 0},}};
 
 /* Maximal possible key. It is never in the tree. */
-const struct reiserfs_key  MAX_KEY = {
+static const struct reiserfs_key  MAX_KEY = {
 	__constant_cpu_to_le32(0xffffffff),
 	__constant_cpu_to_le32(0xffffffff),
 	{{__constant_cpu_to_le32(0xffffffff),

