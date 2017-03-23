From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] reiserfs: avoid a -Wmaybe-uninitialized warning
Date: Thu, 23 Mar 2017 16:06:13 +0100
Message-ID: <20170323150627.347589-1-arnd@arndb.de>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

The latest gcc-7.0.1 snapshot warns about an unintialized variable use:

In file included from fs/reiserfs/lbalance.c:8:0:
fs/reiserfs/lbalance.c: In function 'leaf_item_bottle.isra.3':
fs/reiserfs/reiserfs.h:1279:13: error: '*((void *)&n_ih+8).v' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  v2->v = (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offset);
           ~~^~~
fs/reiserfs/reiserfs.h:1279:13: error: '*((void *)&n_ih+8).v' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  v2->v = (v2->v & cpu_to_le64(15ULL << 60)) | cpu_to_le64(offset);

This happens because the offset/type pair that is stored in
ih.key.u.k_offset_v2 is actually uninitialized when we call
set_le_ih_k_offset() and set_le_ih_k_type(). After we have called both,
all data is correct, but the first of the two reads uninitialized data
for the type field and writes it back before it gets overwritten.

This works around the warning by initializing the k_offset_v2 through
the slightly larger memcpy().

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/reiserfs/lbalance.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/lbalance.c b/fs/reiserfs/lbalance.c
index 249594a821e0..8eed8f5f6881 100644
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -475,7 +475,7 @@ static void leaf_item_bottle(struct buffer_info *dest_bi,
 			 * 'cpy_bytes'; create new item header;
 			 * n_ih = new item_header;
 			 */
-			memcpy(&n_ih, ih, SHORT_KEY_SIZE);
+			memcpy(&n_ih, ih, KEY_SIZE);
 
 			/* Endian safe, both le */
 			n_ih.ih_version = ih->ih_version;
-- 
2.9.0

