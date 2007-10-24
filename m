From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 25/8] fsdata.c cleanup
Date: Wed, 24 Oct 2007 15:04:30 +0200
Message-ID: <1193231070.24225.20.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-4dIqfnokDlkeBmJ5B1+i"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-4dIqfnokDlkeBmJ5B1+i
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 5 errors, 0 warnings, 808 lines checked
patched:total: 3 errors, 0 warnings, 808 lines checked

1 error is bogus:
ERROR: need consistent spacing around '*' (ctx:WxB)
#24: FILE: fsdata.c:24:
+static void kill_cursor(dir_cursor *);
                                    ^
and 2 are:
ERROR: do not initialise statics to 0 or NULL
#16: FILE: fsdata.c:16:
+static unsigned long d_cursor_unused = 0;

ERROR: do not initialise statics to 0 or NULL
#302: FILE: fsdata.c:302:
+static __u32 cid_counter = 0;


--=-4dIqfnokDlkeBmJ5B1+i
Content-Disposition: attachment; filename=fsdata.c.patch
Content-Type: text/x-patch; name=fsdata.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- fsdata.c.orig	2007-10-24 14:59:50.000000000 +0200
+++ fsdata.c	2007-10-24 15:02:00.000000000 +0200
@@ -100,7 +100,7 @@ void reiser4_done_d_cursor(void)
 #define D_CURSOR_TABLE_SIZE (256)
 
 static inline unsigned long
-d_cursor_hash(d_cursor_hash_table *table, const struct d_cursor_key *key)
+d_cursor_hash(d_cursor_hash_table * table, const struct d_cursor_key *key)
 {
 	assert("nikita-3555", IS_POW(D_CURSOR_TABLE_SIZE));
 	return (key->oid + key->cid) & (D_CURSOR_TABLE_SIZE - 1);
@@ -243,7 +243,7 @@ static inline struct d_cursor_info *d_in
 /*
  * lookup d_cursor in the per-super-block radix tree.
  */
-static inline dir_cursor *lookup(struct d_cursor_info * info,
+static inline dir_cursor *lookup(struct d_cursor_info *info,
 				 unsigned long index)
 {
 	return (dir_cursor *) radix_tree_lookup(&info->tree, index);

--=-4dIqfnokDlkeBmJ5B1+i--

