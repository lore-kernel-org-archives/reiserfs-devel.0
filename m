From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 63/8] file_ops_readdir.c cleanup
Date: Fri, 26 Oct 2007 13:25:49 +0200
Message-ID: <1193397949.4615.2.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-XZ4eqXb7ejejgPdp4fS5"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-XZ4eqXb7ejejgPdp4fS5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 12 errors, 4 warnings, 658 lines checked
patched:total: 0 errors, 2 warnings, 658 lines checked
leftover:

WARNING: line over 80 characters
#624: FILE: file_ops_readdir.c:624:
+                                       "reiser4_readdir_common:
unexpected error %d",

WARNING: line over 80 characters
#637: FILE: file_ops_readdir.c:637:
+       if
(reiser4_grab_space_force(inode_file_plugin(inode)->estimate.update(inode),


--=-XZ4eqXb7ejejgPdp4fS5
Content-Disposition: attachment; filename=file_ops_readdir.c.patch
Content-Type: text/x-patch; name=file_ops_readdir.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- file_ops_readdir.c.orig	2007-10-26 13:18:01.000000000 +0200
+++ file_ops_readdir.c	2007-10-26 13:21:40.000000000 +0200
@@ -5,7 +5,7 @@
 
 /* return true, iff @coord points to the valid directory item that is part of
  * @inode directory. */
-static int is_valid_dir_coord(struct inode *inode, coord_t * coord)
+static int is_valid_dir_coord(struct inode *inode, coord_t *coord)
 {
 	return plugin_of_group(item_plugin_by_coord(coord),
 			       DIR_ENTRY_ITEM_TYPE) &&
@@ -13,7 +13,7 @@ static int is_valid_dir_coord(struct ino
 }
 
 /* compare two logical positions within the same directory */
-static cmp_t dir_pos_cmp(const struct dir_pos * p1, const struct dir_pos * p2)
+static cmp_t dir_pos_cmp(const struct dir_pos *p1, const struct dir_pos *p2)
 {
 	cmp_t result;
 
@@ -31,11 +31,11 @@ static cmp_t dir_pos_cmp(const struct di
 	return result;
 }
 
-/* see comment before reiser4_readdir_common() for overview of why "adjustment" is
- * necessary. */
+/* see comment before reiser4_readdir_common() for overview of why "adjustment"
+ * is necessary. */
 static void
-adjust_dir_pos(struct file *dir, struct readdir_pos * readdir_spot,
-	       const struct dir_pos * mod_point, int adj)
+adjust_dir_pos(struct file *dir, struct readdir_pos *readdir_spot,
+	       const struct dir_pos *mod_point, int adj)
 {
 	struct dir_pos *pos;
 
@@ -127,7 +127,7 @@ void reiser4_adjust_dir_file(struct inod
 /*
  * traverse tree to start/continue readdir from the readdir position @pos.
  */
-static int dir_go_to(struct file *dir, struct readdir_pos * pos, tap_t * tap)
+static int dir_go_to(struct file *dir, struct readdir_pos *pos, tap_t *tap)
 {
 	reiser4_key key;
 	int result;
@@ -161,7 +161,7 @@ static int dir_go_to(struct file *dir, s
  * handling of non-unique keys: calculate at what ordinal position within
  * sequence of directory items with identical keys @pos is.
  */
-static int set_pos(struct inode *inode, struct readdir_pos * pos, tap_t * tap)
+static int set_pos(struct inode *inode, struct readdir_pos *pos, tap_t *tap)
 {
 	int result;
 	coord_t coord;
@@ -212,7 +212,7 @@ static int set_pos(struct inode *inode, 
 /*
  * "rewind" directory to @offset, i.e., set @pos and @tap correspondingly.
  */
-static int dir_rewind(struct file *dir, struct readdir_pos * pos, tap_t * tap)
+static int dir_rewind(struct file *dir, struct readdir_pos *pos, tap_t *tap)
 {
 	__u64 destination;
 	__s64 shift;
@@ -295,7 +295,7 @@ static int dir_rewind(struct file *dir, 
  * unlocked.
  */
 static int
-feed_entry(struct file *f, struct readdir_pos * pos, tap_t * tap,
+feed_entry(struct file *f, struct readdir_pos *pos, tap_t *tap,
 	   filldir_t filldir, void *dirent)
 {
 	item_plugin *iplug;
@@ -368,7 +368,7 @@ feed_entry(struct file *f, struct readdi
 	return result;
 }
 
-static void move_entry(struct readdir_pos * pos, coord_t * coord)
+static void move_entry(struct readdir_pos *pos, coord_t *coord)
 {
 	reiser4_key de_key;
 	de_id *did;
@@ -432,8 +432,8 @@ static void move_entry(struct readdir_po
 /*
  * prepare for readdir.
  */
-static int dir_readdir_init(struct file *f, tap_t * tap,
-			    struct readdir_pos ** pos)
+static int dir_readdir_init(struct file *f, tap_t *tap,
+			    struct readdir_pos **pos)
 {
 	struct inode *inode;
 	reiser4_file_fsdata *fsdata;
@@ -473,7 +473,7 @@ static int dir_readdir_init(struct file 
    typical directory
    See comment before reiser4_readdir_common() for explanation.
 */
-loff_t reiser4_llseek_dir_common(struct file * file, loff_t off, int origin)
+loff_t reiser4_llseek_dir_common(struct file *file, loff_t off, int origin)
 {
 	reiser4_context *ctx;
 	loff_t result;
@@ -586,7 +586,7 @@ int reiser4_readdir_common(struct file *
 
 	reiser4_readdir_readahead_init(inode, &tap);
 
-      repeat:
+repeat:
 	result = dir_readdir_init(f, &tap, &pos);
 	if (result == 0) {
 		result = reiser4_tap_load(&tap);

--=-XZ4eqXb7ejejgPdp4fS5--

