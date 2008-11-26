From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Reiser4: remove simple_prepare_write usage
Date: Wed, 26 Nov 2008 18:05:56 +0100
Message-ID: <492D81F4.6010507@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward.shishkin@gmail.com>
Cc: Andrew Morton <akpm@osdl.org>, Randy Dunlap <randy.dunlap@oracle.com>

Reiser4 can't be built as a module when EXPORT_UNUSED_SYMBOL is not set.

It's broken because reiser4_write_extent is calling
simple_prepare_write() and commit
4e02ed4b4a2fae34aae766a5bb93ae235f60adb8 scheduled it for unexporting.

Signed-off-by: Laurent Riffard <laurent.riffard@free.fr>
---
 fs/reiser4/plugin/item/extent_file_ops.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/reiser4/plugin/item/extent_file_ops.c b/fs/reiser4/plugin/item/extent_file_ops.c
index ef3744e..1eb1ab7 100644
--- a/fs/reiser4/plugin/item/extent_file_ops.c
+++ b/fs/reiser4/plugin/item/extent_file_ops.c
@@ -1059,8 +1059,9 @@ ssize_t reiser4_write_extent(struct file *file, struct inode * inode,
 
 		lock_page(page);
 		if (!PageUptodate(page) && to_page != PAGE_CACHE_SIZE)
-			simple_prepare_write(file, page, page_off,
-					     page_off + to_page);
+			zero_user_segments(page, 0, page_off,
+			                   page_off + to_page,
+			                   PAGE_CACHE_SIZE);
 
 		written = filemap_copy_from_user(page, page_off, buf, to_page);
 		if (unlikely(written != to_page)) {
-- 
1.6.0.4.3.g5bcce

