From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 32/8] kassign.c cleanup
Date: Thu, 25 Oct 2007 01:19:34 +0200
Message-ID: <1193267974.24225.56.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-i+Aq4OrTmBTyJYQqYrH9"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward@namesys.com>, reiser4 <reiserfs-devel@vger.kernel.org>


--=-i+Aq4OrTmBTyJYQqYrH9
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 11 errors, 10 warnings, 661 lines checked
patched:total: 0 errors, 1 warnings, 661 lines checked

Leftovers:

WARNING: line over 80 characters
#628: FILE: kassign.c:628:
+               put_unaligned(cpu_to_le64(get_inode_ordering(inode)),
(__le64 *)start);




--=-i+Aq4OrTmBTyJYQqYrH9
Content-Disposition: attachment; filename=kassign.c.patch
Content-Type: text/x-patch; name=kassign.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- kassign.c.orig	2007-10-25 01:12:24.000000000 +0200
+++ kassign.c	2007-10-25 01:18:32.000000000 +0200
@@ -38,12 +38,12 @@
  *
  * DIRECTORY ITEMS
  *
- *  |       60     | 4 | 7 |1|   56        |        64        |        64       |
- *  +--------------+---+---+-+-------------+------------------+-----------------+
- *  |    dirid     | 0 | F |H|  prefix-1   |    prefix-2      |  prefix-3/hash  |
- *  +--------------+---+---+-+-------------+------------------+-----------------+
- *  |                  |                   |                  |                 |
- *  |    8 bytes       |      8 bytes      |     8 bytes      |     8 bytes     |
+ * |       60     | 4 | 7 |1|   56        |        64        |        64       |
+ * +--------------+---+---+-+-------------+------------------+-----------------+
+ * |    dirid     | 0 | F |H|  prefix-1   |    prefix-2      |  prefix-3/hash  |
+ * +--------------+---+---+-+-------------+------------------+-----------------+
+ * |                  |                   |                  |                 |
+ * |    8 bytes       |      8 bytes      |     8 bytes      |     8 bytes     |
  *
  * dirid         objectid of directory this item is for
  *
@@ -262,7 +262,7 @@ static __u64 pack_string(const char *nam
 
 /* opposite to pack_string(). Takes value produced by pack_string(), restores
  * string encoded in it and stores result in @buf */
-char * reiser4_unpack_string(__u64 value, char *buf)
+char *reiser4_unpack_string(__u64 value, char *buf)
 {
 	do {
 		*buf = value >> (64 - 8);
@@ -343,10 +343,11 @@ void complete_entry_key(const struct ino
 				/* [15-23] characters to offset */
 				offset = pack_string(name + 15, 0);
 			} else {
-				/* note in a key the fact that offset contains hash. */
+				/* note in a key the fact that offset contains
+				 * hash */
 				ordering |= longname_mark;
 
-				/* offset is the hash of the file name's tail. */
+				/* offset is the hash of the file name's tail */
 				offset = inode_hash_plugin(dir)->hash(name + 15,
 								      len - 15);
 			}
@@ -417,7 +418,7 @@ void complete_entry_key(const struct ino
 }
 
 /* true, if @key is the key of "." */
-int is_dot_key(const reiser4_key * key /* key to check */ )
+int is_dot_key(const reiser4_key * key/* key to check */)
 {
 	assert("nikita-1717", key != NULL);
 	assert("nikita-1718", get_key_type(key) == KEY_FILE_NAME_MINOR);
@@ -432,7 +433,7 @@ int is_dot_key(const reiser4_key * key /
    method in the future. For now, let it be here.
 
 */
-reiser4_key *build_sd_key(const struct inode * target /* inode of an object */ ,
+reiser4_key *build_sd_key(const struct inode *target /* inode of an object */ ,
 			  reiser4_key * result	/* resulting key of @target
 						   stat-data */ )
 {
@@ -455,7 +456,7 @@ reiser4_key *build_sd_key(const struct i
    See &obj_key_id
 */
 int build_obj_key_id(const reiser4_key * key /* key to encode */ ,
-		     obj_key_id * id /* id where key is encoded in */ )
+		     obj_key_id * id/* id where key is encoded in */)
 {
 	assert("nikita-1151", key != NULL);
 	assert("nikita-1152", id != NULL);
@@ -468,7 +469,7 @@ int build_obj_key_id(const reiser4_key *
 
    This is like build_obj_key_id() above, but takes inode as parameter. */
 int build_inode_key_id(const struct inode *obj /* object to build key of */ ,
-		       obj_key_id * id /* result */ )
+		       obj_key_id * id/* result */)
 {
 	reiser4_key sdkey;
 
@@ -487,7 +488,7 @@ int build_inode_key_id(const struct inod
 */
 int extract_key_from_id(const obj_key_id * id	/* object key id to extract key
 						 * from */ ,
-			reiser4_key * key /* result */ )
+			reiser4_key * key/* result */)
 {
 	assert("nikita-1153", id != NULL);
 	assert("nikita-1154", key != NULL);
@@ -520,7 +521,7 @@ int build_de_id(const struct inode *dir 
 		const struct qstr *name	/* name to be given to @obj by
 					 * directory entry being
 					 * constructed */ ,
-		de_id * id /* short key of directory entry */ )
+		de_id * id/* short key of directory entry */)
 {
 	reiser4_key key;
 
@@ -542,7 +543,7 @@ int build_de_id(const struct inode *dir 
 */
 int build_de_id_by_key(const reiser4_key * entry_key	/* full key of directory
 							 * entry */ ,
-		       de_id * id /* short key of directory entry */ )
+		       de_id * id/* short key of directory entry */)
 {
 	memcpy(id, ((__u64 *) entry_key) + 1, sizeof *id);
 	return 0;
@@ -557,7 +558,7 @@ int build_de_id_by_key(const reiser4_key
 int extract_key_from_de_id(const oid_t locality	/* locality of directory
 						 * entry */ ,
 			   const de_id * id /* directory entry id */ ,
-			   reiser4_key * key /* result */ )
+			   reiser4_key * key/* result */)
 {
 	/* no need to initialise key here: all fields are overwritten */
 	memcpy(((__u64 *) key) + 1, id, sizeof *id);
@@ -568,7 +569,7 @@ int extract_key_from_de_id(const oid_t l
 
 /* compare two &de_id's */
 cmp_t de_id_cmp(const de_id * id1 /* first &de_id to compare */ ,
-		const de_id * id2 /* second &de_id to compare */ )
+		const de_id * id2/* second &de_id to compare */)
 {
 	/* NOTE-NIKITA ugly implementation */
 	reiser4_key k1;
@@ -581,7 +582,7 @@ cmp_t de_id_cmp(const de_id * id1 /* fir
 
 /* compare &de_id with key */
 cmp_t de_id_key_cmp(const de_id * id /* directory entry id to compare */ ,
-		    const reiser4_key * key /* key to compare */ )
+		    const reiser4_key * key/* key to compare */)
 {
 	cmp_t result;
 	reiser4_key *k1;
@@ -590,9 +591,8 @@ cmp_t de_id_key_cmp(const de_id * id /* 
 	result = KEY_DIFF_EL(k1, key, 1);
 	if (result == EQUAL_TO) {
 		result = KEY_DIFF_EL(k1, key, 2);
-		if (REISER4_LARGE_KEY && result == EQUAL_TO) {
+		if (REISER4_LARGE_KEY && result == EQUAL_TO)
 			result = KEY_DIFF_EL(k1, key, 3);
-		}
 	}
 	return result;
 }

--=-i+Aq4OrTmBTyJYQqYrH9--

