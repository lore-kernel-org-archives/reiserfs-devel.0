From: Fabian Frederick <fabf@skynet.be>
Subject: [PATCH V2] fs/reiserfs/stree.c: remove obsolete __constant
Date: Sat, 3 May 2014 22:33:24 +0200
Message-ID: <20140503223324.4357f591dc8994b74f456440@skynet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: reiserfs-devel@vger.kernel.org, akpm <akpm@linux-foundation.org>

__constant_cpu_to_le32 converted to cpu_to_le32

Cc: reiserfs-devel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
V2: Cc email fixed

 fs/reiserfs/stree.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index b14706a..615cd9a 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -228,10 +228,10 @@ const struct reiserfs_key MIN_KEY = { 0, 0, {{0, 0},} };
 
 /* Maximal possible key. It is never in the tree. */
 static const struct reiserfs_key MAX_KEY = {
-	__constant_cpu_to_le32(0xffffffff),
-	__constant_cpu_to_le32(0xffffffff),
-	{{__constant_cpu_to_le32(0xffffffff),
-	  __constant_cpu_to_le32(0xffffffff)},}
+	cpu_to_le32(0xffffffff),
+	cpu_to_le32(0xffffffff),
+	{{cpu_to_le32(0xffffffff),
+	  cpu_to_le32(0xffffffff)},}
 };
 
 /* Get delimiting key of the buffer by looking for it in the buffers in the path, starting from the bottom
-- 
1.8.4.5

