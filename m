From: Jan Kara <jack@suse.cz>
Subject: [PATCH] Improve credits estimates for quota
Date: Tue, 24 May 2005 13:25:18 +0200
Message-ID: <20050524112518.GB20958@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="6sX45UoQRIJXqkqR"
Return-path: <reiserfs-list-return-24125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: akpm@osdl.org, reiserfs-list@namesys.com

--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hello,

  attached patch is the first of the three patches improving the estimates
on the number of credits needed to perform a quota operation. We now
distinguish whether block needs to be allocated or just rewritten. This
change also fixes a problem with reiserfs and 1KB blocksize where we
exceeded the maximum transaction size.
  This patch implements the changes in the generic quota code. Please apply.

								Honza

-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs

--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="quota-2.6.12-rc4-3-credits.diff"

Improve estimates on the number of needed credits for quota transaction.
Now we distinguish blocks that might need to be allocated and blocks that
only need to be rewritten. Also we distinguish deleting of a quota structure
and creating of a new one.

Signed-off-by: Jan Kara <jack@suse.cz>

diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-2-transstart/include/linux/dqblk_v1.h linux-2.6.12-rc4-3-credits/include/linux/dqblk_v1.h
--- linux-2.6.12-rc4-2-transstart/include/linux/dqblk_v1.h	2004-10-18 23:54:07.000000000 +0200
+++ linux-2.6.12-rc4-3-credits/include/linux/dqblk_v1.h	2005-05-24 11:13:45.000000000 +0200
@@ -11,6 +11,12 @@
 /* Root squash turned on */
 #define V1_DQF_RSQUASH 1
 
+/* Numbers of blocks needed for updates */
+#define V1_INIT_ALLOC 1
+#define V1_INIT_REWRITE 1
+#define V1_DEL_ALLOC 0
+#define V1_DEL_REWRITE 2
+
 /* Special information about quotafile */
 struct v1_mem_dqinfo {
 };
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-2-transstart/include/linux/dqblk_v2.h linux-2.6.12-rc4-3-credits/include/linux/dqblk_v2.h
--- linux-2.6.12-rc4-2-transstart/include/linux/dqblk_v2.h	2004-10-18 23:53:46.000000000 +0200
+++ linux-2.6.12-rc4-3-credits/include/linux/dqblk_v2.h	2005-05-24 11:13:45.000000000 +0200
@@ -10,6 +10,12 @@
 /* id numbers of quota format */
 #define QFMT_VFS_V0 2
 
+/* Numbers of blocks needed for updates */
+#define V2_INIT_ALLOC 4
+#define V2_INIT_REWRITE 2
+#define V2_DEL_ALLOC 0
+#define V2_DEL_REWRITE 6
+
 /* Inmemory copy of version specific information */
 struct v2_mem_dqinfo {
 	unsigned int dqi_blocks;
diff -rupX /home/jack/.kerndiffexclude linux-2.6.12-rc4-2-transstart/include/linux/quota.h linux-2.6.12-rc4-3-credits/include/linux/quota.h
--- linux-2.6.12-rc4-2-transstart/include/linux/quota.h	2005-03-03 18:58:41.000000000 +0100
+++ linux-2.6.12-rc4-3-credits/include/linux/quota.h	2005-05-24 11:13:45.000000000 +0200
@@ -138,8 +138,11 @@ struct if_dqinfo {
 #include <linux/dqblk_v2.h>
 
 /* Maximal numbers of writes for quota operation (insert/delete/update)
- * (over all formats) - info block, 4 pointer blocks, data block */
-#define DQUOT_MAX_WRITES	6
+ * (over VFS all formats) */
+#define DQUOT_INIT_ALLOC max(V1_INIT_ALLOC, V2_INIT_ALLOC)
+#define DQUOT_INIT_REWRITE max(V1_INIT_REWRITE, V2_INIT_REWRITE)
+#define DQUOT_DEL_ALLOC max(V1_DEL_ALLOC, V2_DEL_ALLOC)
+#define DQUOT_DEL_REWRITE max(V1_DEL_REWRITE, V2_DEL_REWRITE)
 
 /*
  * Data for one user/group kept in memory

--6sX45UoQRIJXqkqR--
