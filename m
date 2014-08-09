From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 1/1] reiser4: Fixups
Date: Sat, 09 Aug 2014 19:43:55 +0200
Message-ID: <53E65DDB.2090306@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090208030007070206080003"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type;
        bh=14z4bLevJE9nms42oogfHdO3sXRxBPByxNUUhced4s4=;
        b=CWx8ZjescwJcDegC1pm7bGqac/0NCDm8rBCdXoOTe5rs0PQM7iAQQmo59CcUnl22zh
         W+2h4Kq6DZVUsM4hS1QRkKCJlaLZPOjBCTbv/2FtiWq/NZcFqMjqJkQLbuf/BD7vbuI9
         91Uhzu1+9TXD0pw5vwMEk0NNN+SWyr6s5XYaNz9GGTW3stCTJtEQ7dC5wpTPNlNcImc6
         fKcCXzewfT+G7x3+rpX/qKPDxEeywWHo/D0loGGWhhkCeHyARkzihLRBEikGF8/Ywk2u
         jQcu4+Z1FmpRtXpl5+dMWUcx8/eewJzMGrbVzsfGuYkbey+5mP80wLtAsjtcgp9RRmhI
         B2hw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

This is a multi-part message in MIME format.
--------------090208030007070206080003
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------090208030007070206080003
Content-Type: text/x-patch;
 name="reiser4-fixups-for-3.15.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fixups-for-3.15.patch"

. Fix up incorrect calculation of REISER4_SUPER_MAGIC_STRING size;
. Fix up incorrect initialization of dataonstack, dotdot_entry,
  dotdot_name variables in reiser4_rename_common().

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 fs/reiser4/plugin/inode_ops_rename.c |    6 +++---
 fs/reiser4/reiser4.h                 |    2 +-
 fs/reiser4/vfs_ops.c                 |    1 -
 3 files changed, 4 insertions(+), 5 deletions(-)

--- a/fs/reiser4/plugin/inode_ops_rename.c
+++ b/fs/reiser4/plugin/inode_ops_rename.c
@@ -572,10 +572,10 @@ int reiser4_rename_common(struct inode *
 			   dotdot entry. */
 			coord_t *dotdot_coord;
 
-			memset(dataonstack, 0, sizeof dataonstack);
-			memset(dotdot_entry, 0, sizeof dotdot_entry);
+			memset(dataonstack, 0, sizeof(*dataonstack));
+			memset(dotdot_entry, 0, sizeof(*dotdot_entry));
 			dotdot_entry->obj = old_dir;
-			memset(dotdot_name, 0, sizeof dotdot_name);
+			memset(dotdot_name, 0, sizeof(*dotdot_name));
 			dotdot_name->d_name.name = "..";
 			dotdot_name->d_name.len = 2;
 			/*
--- a/fs/reiser4/reiser4.h
+++ b/fs/reiser4/reiser4.h
@@ -54,7 +54,7 @@
  * option
  */
 
-extern const char *REISER4_SUPER_MAGIC_STRING;
+#define REISER4_SUPER_MAGIC_STRING "ReIsEr4"
 extern const int REISER4_MAGIC_OFFSET;	/* offset to magic string from the
 					 * beginning of device */
 
--- a/fs/reiser4/vfs_ops.c
+++ b/fs/reiser4/vfs_ops.c
@@ -213,7 +213,6 @@ void reiser4_throttle_write(struct inode
 	current->journal_info = ctx;
 }
 
-const char *REISER4_SUPER_MAGIC_STRING = "ReIsEr4";
 const int REISER4_MAGIC_OFFSET = 16 * 4096;	/* offset to magic string from the
 						 * beginning of device */
 

--------------090208030007070206080003--
