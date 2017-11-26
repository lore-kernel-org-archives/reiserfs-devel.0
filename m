From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH 2/2] reiser4: zstd1 compression support
Date: Sun, 26 Nov 2017 23:54:47 +0100
Message-ID: <04191a34-8a4a-100a-01d8-cf734c6341fc@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------A5BD5DCE58B38DD32EA8FC5D"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=ioJQUvvWATKTreXPT1pMbTFYrL+l+3RgpcEOHOCLHs4=;
        b=dU1SbhxIGQMnLlCZLXiizRceXplE4y49kkk9XP+Bn0wHs1efTwqqKZAT0Zv7PvqbFD
         AN6QLETndcKr+yXDZ0dwiIGe+nQls+AyGH5p8xMlHoDQoStzNOGF188jeTDPw8fiHuGt
         qBxktZwjhbOGWpSnw/fk5mmOe/G9vfCpocp6G46vVrDgnTTny6FYL0ibELlLe0Vo9duz
         hJOB6cVLlWDjJw+H47degPhznJ6cHesI3IXQEaqo0cX6Hj3wvDEOlAWJLi/qbxq2trGy
         VQWuibC8zNj7lxALfmBdVtlg+5Csiz5nY4vv9imYDZzpTPkx0pk8yIOTrI6jicvQ6pQ1
         1iSA==
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------A5BD5DCE58B38DD32EA8FC5D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------A5BD5DCE58B38DD32EA8FC5D
Content-Type: text/x-patch;
 name="2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="2.diff"

commit 61c212718cde654474672ec35389b18a52d6a711
Author: BratSinot <bratsinot@gmail.com>
Date:   Sun Nov 26 11:36:03 2017 +0100

    Reiser4: zstd1 compression support
    
    Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

diff --git a/Kconfig b/Kconfig
index a2f2b05f4..e55f8bc51 100644
--- a/Kconfig
+++ b/Kconfig
@@ -4,6 +4,8 @@ config REISER4_FS
 	select ZLIB_DEFLATE
 	select LZO_COMPRESS
 	select LZO_DECOMPRESS
+	select ZSTD_COMPRESS
+	select ZSTD_DECOMPRESS
 	select CRYPTO
 	select CRYPTO_CRC32C
 	help
diff --git a/plugin/compress/compress.c b/plugin/compress/compress.c
index 2a263eaae..ef568a099 100644
--- a/plugin/compress/compress.c
+++ b/plugin/compress/compress.c
@@ -6,6 +6,7 @@
 #include "../plugin.h"
 
 #include <linux/lzo.h>
+#include <linux/zstd.h>
 #include <linux/zlib.h>
 #include <linux/types.h>
 #include <linux/hardirq.h>
@@ -295,6 +296,162 @@ lzo1_decompress(coa_t coa, __u8 * src_first, size_t src_len,
 	return;
 }
 
+/******************************************************************************/
+/*                         zstd1 compression                                  */
+/******************************************************************************/
+
+typedef struct {
+	ZSTD_parameters params;
+	void* workspace;
+	ZSTD_CCtx* cctx;
+} zstd1_coa_c;
+typedef struct {
+	void* workspace;
+	ZSTD_DCtx* dctx;
+} zstd1_coa_d;
+
+static int zstd1_init(void)
+{
+	return 0;
+}
+
+static int zstd1_overrun(unsigned src_len UNUSED_ARG)
+{
+	return ZSTD_compressBound(src_len) - src_len;
+}
+
+static coa_t zstd1_alloc(tfm_action act)
+{
+	int ret = 0;
+	size_t workspace_size;
+	coa_t coa = NULL;
+
+	switch (act) {
+	case TFMA_WRITE:	/* compress */
+		coa = reiser4_vmalloc(sizeof(zstd1_coa_c));
+		if (!coa) {
+			ret = -ENOMEM;
+			break;
+		}
+		/* ZSTD benchmark use level 1 as default. Max is 22. */
+		((zstd1_coa_c*)coa)->params = ZSTD_getParams(1, 0, 0);
+		workspace_size = ZSTD_CCtxWorkspaceBound(((zstd1_coa_c*)coa)->params.cParams);
+		((zstd1_coa_c*)coa)->workspace = reiser4_vmalloc(workspace_size);
+		if (!(((zstd1_coa_c*)coa)->workspace)) {
+			ret = -ENOMEM;
+			vfree(coa);
+			break;
+		}
+		((zstd1_coa_c*)coa)->cctx = ZSTD_initCCtx(((zstd1_coa_c*)coa)->workspace, workspace_size);
+		if (!(((zstd1_coa_c*)coa)->cctx)) {
+			ret = -ENOMEM;
+			vfree(((zstd1_coa_c*)coa)->workspace);
+			vfree(coa);
+			break;
+		}
+		break;
+	case TFMA_READ:		/* decompress */
+		coa = reiser4_vmalloc(sizeof(zstd1_coa_d));
+		if (!coa) {
+			ret = -ENOMEM;
+			break;
+		}
+		workspace_size = ZSTD_DCtxWorkspaceBound();
+		((zstd1_coa_d*)coa)->workspace = reiser4_vmalloc(workspace_size);
+		if (!(((zstd1_coa_d*)coa)->workspace)) {
+			ret = -ENOMEM;
+			vfree(coa);
+			break;
+		}
+		((zstd1_coa_d*)coa)->dctx = ZSTD_initDCtx(((zstd1_coa_d*)coa)->workspace, workspace_size);
+		if (!(((zstd1_coa_d*)coa)->dctx)) {
+			ret = -ENOMEM;
+			vfree(((zstd1_coa_d*)coa)->workspace);
+			vfree(coa);
+			break;
+		}
+		break;
+	default:
+		impossible("bsinot-1",
+			   "trying to alloc workspace for unknown tfm action");
+	}
+	if (ret) {
+		warning("bsinot-2",
+			"alloc workspace for zstd (tfm action = %d) failed\n",
+			act);
+		return ERR_PTR(ret);
+	}
+	return coa;
+}
+
+static void zstd1_free(coa_t coa, tfm_action act)
+{
+	assert("bsinot-3", coa != NULL);
+
+	switch (act) {
+	case TFMA_WRITE:	/* compress */
+		vfree(((zstd1_coa_c*)coa)->workspace);
+		vfree(coa);
+		//printk(KERN_WARNING "free comp memory -- %p\n", coa);
+		break;
+	case TFMA_READ:		/* decompress */
+		vfree(((zstd1_coa_d*)coa)->workspace);
+		vfree(coa);
+		//printk(KERN_WARNING "free decomp memory -- %p\n", coa);
+		break;
+	default:
+		impossible("bsinot-4", "unknown tfm action");
+	}
+	return;
+}
+
+static int zstd1_min_size_deflate(void)
+{
+	return 256; /* I'm not sure about the correct value, so took from LZO1 */
+}
+
+static void
+zstd1_compress(coa_t coa, __u8 * src_first, size_t src_len,
+	      __u8 * dst_first, size_t *dst_len)
+{
+	unsigned int result;
+
+	assert("bsinot-5", coa != NULL);
+	assert("bsinot-6", src_len != 0);
+	result = ZSTD_compressCCtx(((zstd1_coa_c*)coa)->cctx, dst_first, *dst_len, src_first, src_len, ((zstd1_coa_c*)coa)->params);
+	if (ZSTD_isError(result)) {
+		warning("bsinot-7", "zstd1_compressCCtx failed\n");
+		goto out;
+	}
+	*dst_len = result;
+	if (*dst_len >= src_len) {
+		//warning("bsinot-8", "zstd1_compressCCtx: incompressible data\n");
+		goto out;
+	}
+	return;
+      out:
+	*dst_len = src_len;
+	return;
+}
+
+static void
+zstd1_decompress(coa_t coa, __u8 * src_first, size_t src_len,
+		__u8 * dst_first, size_t *dst_len)
+{
+	unsigned int result;
+
+	assert("bsinot-9", coa != NULL);
+	assert("bsinot-10", src_len != 0);
+
+	result = ZSTD_decompressDCtx(((zstd1_coa_d*)coa)->dctx, dst_first, *dst_len, src_first, src_len);
+	/* Same here. */
+	if (ZSTD_isError(result))
+		warning("bsinot-11", "zstd1_decompressDCtx failed\n");
+	*dst_len = result;
+	return;
+}
+
+
 compression_plugin compression_plugins[LAST_COMPRESSION_ID] = {
 	[LZO1_COMPRESSION_ID] = {
 		.h = {
@@ -331,6 +488,24 @@ compression_plugin compression_plugins[LAST_COMPRESSION_ID] = {
 		.checksum = reiser4_adler32,
 		.compress = gzip1_compress,
 		.decompress = gzip1_decompress
+	},
+	[ZSTD1_COMPRESSION_ID] = {
+		.h = {
+			.type_id = REISER4_COMPRESSION_PLUGIN_TYPE,
+			.id = ZSTD1_COMPRESSION_ID,
+			.pops = &compression_plugin_ops,
+			.label = "zstd1",
+			.desc = "zstd1 compression transform",
+			.linkage = {NULL, NULL}
+		},
+		.init = zstd1_init,
+		.overrun = zstd1_overrun,
+		.alloc = zstd1_alloc,
+		.free = zstd1_free,
+		.min_size_deflate = zstd1_min_size_deflate,
+		.checksum = reiser4_adler32,
+		.compress = zstd1_compress,
+		.decompress = zstd1_decompress
 	}
 };
 
diff --git a/plugin/compress/compress.h b/plugin/compress/compress.h
index cf00ce103..235273897 100644
--- a/plugin/compress/compress.h
+++ b/plugin/compress/compress.h
@@ -15,6 +15,7 @@ typedef enum {
 typedef enum {
 	LZO1_COMPRESSION_ID,
 	GZIP1_COMPRESSION_ID,
+	ZSTD1_COMPRESSION_ID,
 	LAST_COMPRESSION_ID,
 } reiser4_compression_id;
 

--------------A5BD5DCE58B38DD32EA8FC5D--
