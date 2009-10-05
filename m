From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 3/4] reiser4: fix compile warnings
Date: Mon, 05 Oct 2009 02:40:23 +0200
Message-ID: <4AC94077.6030500@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020703030905060904070706"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: akpm@linux-foundation.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Brandon Berhent <cheater1034@gmail.com>

This is a multi-part message in MIME format.
--------------020703030905060904070706
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------020703030905060904070706
Content-Type: text/plain;
 name="reiser4-fix-compile-warnings.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="reiser4-fix-compile-warnings.patch"

Fix compile warnings.

Prepared by: Brandon Berhent <cheater1034@gmail.com>
Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

---
 fs/reiser4/plugin/compress/compress.c    |   16 ++++++++--------
 fs/reiser4/plugin/file/cryptcompress.c   |    4 ++--
 fs/reiser4/plugin/file/file_conversion.c |    2 +-
 fs/reiser4/plugin/item/item.h            |    4 ++--
 fs/reiser4/plugin/plugin.h               |    8 ++++----
 5 files changed, 17 insertions(+), 17 deletions(-)

--- mmotm.orig/fs/reiser4/plugin/compress/compress.c
+++ mmotm/fs/reiser4/plugin/compress/compress.c
@@ -122,8 +122,8 @@ static int gzip1_min_size_deflate(void)
 }
 
 static void
-gzip1_compress(coa_t coa, __u8 * src_first, unsigned src_len,
-	       __u8 * dst_first, unsigned *dst_len)
+gzip1_compress(coa_t coa, __u8 * src_first, size_t src_len,
+	       __u8 * dst_first, size_t *dst_len)
 {
 #if REISER4_ZLIB
 	int ret = 0;
@@ -166,8 +166,8 @@ gzip1_compress(coa_t coa, __u8 * src_fir
 }
 
 static void
-gzip1_decompress(coa_t coa, __u8 * src_first, unsigned src_len,
-		 __u8 * dst_first, unsigned *dst_len)
+gzip1_decompress(coa_t coa, __u8 * src_first, size_t src_len,
+		 __u8 * dst_first, size_t *dst_len)
 {
 #if REISER4_ZLIB
 	int ret = 0;
@@ -278,8 +278,8 @@ static int lzo1_min_size_deflate(void)
 }
 
 static void
-lzo1_compress(coa_t coa, __u8 * src_first, unsigned src_len,
-	      __u8 * dst_first, unsigned *dst_len)
+lzo1_compress(coa_t coa, __u8 * src_first, size_t src_len,
+	      __u8 * dst_first, size_t *dst_len)
 {
 	int result;
 
@@ -302,8 +302,8 @@ lzo1_compress(coa_t coa, __u8 * src_firs
 }
 
 static void
-lzo1_decompress(coa_t coa, __u8 * src_first, unsigned src_len,
-		__u8 * dst_first, unsigned *dst_len)
+lzo1_decompress(coa_t coa, __u8 * src_first, size_t src_len,
+		__u8 * dst_first, size_t *dst_len)
 {
 	int result;
 
--- mmotm.orig/fs/reiser4/plugin/file/cryptcompress.c
+++ mmotm/fs/reiser4/plugin/file/cryptcompress.c
@@ -1014,7 +1014,7 @@ int reiser4_deflate_cluster(struct clust
 	coplug = inode_compression_plugin(inode);
 	if (should_compress(tc, clust->index, inode)) {
 		/* try to compress, discard bad results */
-		__u32 dst_len;
+		size_t dst_len;
 		compression_mode_plugin * mplug =
 			inode_compression_mode_plugin(inode);
 		assert("edward-602", coplug != NULL);
@@ -1164,7 +1164,7 @@ int reiser4_inflate_cluster(struct clust
 		transformed = 1;
 	}
 	if (need_inflate(clust, inode, 0)) {
-		unsigned dst_len = inode_cluster_size(inode);
+		size_t dst_len = inode_cluster_size(inode);
 		if(transformed)
 			alternate_streams(tc);
 
--- mmotm.orig/fs/reiser4/plugin/file/file_conversion.c
+++ mmotm/fs/reiser4/plugin/file/file_conversion.c
@@ -273,7 +273,7 @@ static int read_check_compressibility(st
 {
 	int i;
 	int result;
-	__u32 dst_len;
+	size_t dst_len;
 	hint_t tmp_hint;
 	hint_t * cur_hint = clust->hint;
 	assert("edward-1541", cont->state == DISPATCH_POINT);
--- mmotm.orig/fs/reiser4/plugin/item/item.h
+++ mmotm/fs/reiser4/plugin/item/item.h
@@ -233,8 +233,8 @@ struct dir_entry_iops {
 
 /* operations specific to items regular (unix) file metadata are built of */
 struct file_iops{
-	int (*write) (struct file *, struct inode *,
-		      const char __user *, size_t, loff_t *pos);
+	ssize_t (*write) (struct file *, struct inode *,
+			  const char __user *, size_t, loff_t *pos);
 	int (*read) (struct file *, flow_t *, hint_t *);
 	int (*readpage) (void *, struct page *);
 	int (*get_block) (const coord_t *, sector_t, sector_t *);
--- mmotm.orig/fs/reiser4/plugin/plugin.h
+++ mmotm/fs/reiser4/plugin/plugin.h
@@ -560,10 +560,10 @@ typedef struct compression_plugin {
 	int (*min_size_deflate) (void);
 	 __u32(*checksum) (char *data, __u32 length);
 	/* main transform procedures */
-	void (*compress) (coa_t coa, __u8 *src_first, unsigned src_len,
-			  __u8 *dst_first, unsigned *dst_len);
-	void (*decompress) (coa_t coa, __u8 *src_first, unsigned src_len,
-			    __u8 *dst_first, unsigned *dst_len);
+	void (*compress) (coa_t coa, __u8 *src_first, size_t src_len,
+			  __u8 *dst_first, size_t *dst_len);
+	void (*decompress) (coa_t coa, __u8 *src_first, size_t src_len,
+			    __u8 *dst_first, size_t *dst_len);
 } compression_plugin;
 
 typedef struct compression_mode_plugin {

--------------020703030905060904070706--
