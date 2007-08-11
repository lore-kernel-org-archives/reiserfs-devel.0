From: Edward Shishkin <edward@namesys.com>
Subject: [PATCH] reiser4: cryptcompress misc fixups-2
Date: Sun, 12 Aug 2007 00:02:38 +0400
Message-ID: <46BE15DE.7080304@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020407090007040109050704"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------020407090007040109050704
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit




--------------020407090007040109050704
Content-Type: text/x-patch;
 name="reiser4-cryptcompress-misc-fixups-2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-cryptcompress-misc-fixups-2.patch"

Check a file plugin id before manipulating
with plugin-specific counter.

Signed-off-by: Edward Shishkin <edward@namesys.com>
---
 linux-2.6.23-rc1-mm1/fs/reiser4/plugin/file/cryptcompress.h |   18 ++++++++++--
 1 files changed, 15 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1/fs/reiser4/plugin/file/cryptcompress.h.orig
+++ linux-2.6.23-rc1-mm1/fs/reiser4/plugin/file/cryptcompress.h
@@ -38,11 +38,23 @@
 
 #if REISER4_DEBUG
 #define INODE_PGCOUNT(inode)						\
-	(atomic_read(&cryptcompress_inode_data(inode)->pgcount))
+({								        \
+	assert("edward-1530", inode_file_plugin(inode) ==		\
+	       file_plugin_by_id(CRYPTCOMPRESS_FILE_PLUGIN_ID));	\
+	atomic_read(&cryptcompress_inode_data(inode)->pgcount);		\
+ })
 #define INODE_PGCOUNT_INC(inode)					\
-	(atomic_inc(&cryptcompress_inode_data(inode)->pgcount))
+do {								        \
+	assert("edward-1531", inode_file_plugin(inode) ==		\
+	       file_plugin_by_id(CRYPTCOMPRESS_FILE_PLUGIN_ID));	\
+	atomic_inc(&cryptcompress_inode_data(inode)->pgcount);		\
+} while (0)
 #define INODE_PGCOUNT_DEC(inode)					\
-	(atomic_dec(&cryptcompress_inode_data(inode)->pgcount))
+do {								        \
+	if (inode_file_plugin(inode) ==					\
+	    file_plugin_by_id(CRYPTCOMPRESS_FILE_PLUGIN_ID))		\
+		atomic_dec(&cryptcompress_inode_data(inode)->pgcount);	\
+} while (0)
 #else
 #define INODE_PGCOUNT(inode) (0)
 #define INODE_PGCOUNT_INC(inode)


--------------020407090007040109050704--
