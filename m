From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] reiserfs: fix code unwinding with clang
Date: Thu, 18 Jul 2019 15:49:14 +0200
Message-ID: <20190718134928.2472465-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com

Building reiserfs with clang leads to objtool warnings about a part of the
unreachable code that may confuse the ORC unwinder:

fs/reiserfs/ibalance.o: warning: objtool: balance_internal()+0xe8f: stack state mismatch: cfa1=7+240 cfa2=7+248
fs/reiserfs/ibalance.o: warning: objtool: internal_move_pointers_items()+0x36f: stack state mismatch: cfa1=7+152 cfa2=7+144
fs/reiserfs/lbalance.o: warning: objtool: leaf_cut_from_buffer()+0x58b: stack state mismatch: cfa1=7+128 cfa2=7+112
fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_boundary_item()+0x7a9: stack state mismatch: cfa1=7+104 cfa2=7+96
fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0x3d2: stack state mismatch: cfa1=7+120 cfa2=7+128
fs/reiserfs/do_balan.o: warning: objtool: replace_key()+0x158: stack state mismatch: cfa1=7+40 cfa2=7+56
fs/reiserfs/do_balan.o: warning: objtool: balance_leaf()+0x2791: stack state mismatch: cfa1=7+176 cfa2=7+192

Reword this to use the regular BUG() call directly from the original code
location, since objtool finds the generated object code more reasonable.

This will likely get fixed in a future clang release, but in the meantime
the workaround helps us build cleanly with existing releases.

Link: https://groups.google.com/d/msgid/clang-built-linux/20190712135755.7qa4wxw3bfmwn5rp%40treble
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/reiserfs/prints.c   | 5 +++--
 fs/reiserfs/reiserfs.h | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index 9fed1c05f1f4..da996eaaebac 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -387,7 +387,6 @@ void __reiserfs_panic(struct super_block *sb, const char *id,
 	else
 		printk(KERN_WARNING "REISERFS panic: %s%s%s: %s\n",
 		      id ? id : "", id ? " " : "", function, error_buf);
-	BUG();
 }
 
 void __reiserfs_error(struct super_block *sb, const char *id,
@@ -397,8 +396,10 @@ void __reiserfs_error(struct super_block *sb, const char *id,
 
 	BUG_ON(sb == NULL);
 
-	if (reiserfs_error_panic(sb))
+	if (reiserfs_error_panic(sb)) {
 		__reiserfs_panic(sb, id, function, error_buf);
+		BUG();
+	}
 
 	if (id && id[0])
 		printk(KERN_CRIT "REISERFS error (device %s): %s %s: %s\n",
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index e5ca9ed79e54..f5bd17ee21f6 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -3185,10 +3185,9 @@ void unfix_nodes(struct tree_balance *);
 
 /* prints.c */
 void __reiserfs_panic(struct super_block *s, const char *id,
-		      const char *function, const char *fmt, ...)
-    __attribute__ ((noreturn));
+		      const char *function, const char *fmt, ...);
 #define reiserfs_panic(s, id, fmt, args...) \
-	__reiserfs_panic(s, id, __func__, fmt, ##args)
+	do { __reiserfs_panic(s, id, __func__, fmt, ##args); BUG(); } while (0)
 void __reiserfs_error(struct super_block *s, const char *id,
 		      const char *function, const char *fmt, ...);
 #define reiserfs_error(s, id, fmt, args...) \
-- 
2.20.0

