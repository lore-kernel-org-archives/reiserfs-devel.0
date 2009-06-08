From: Jeff Mahoney <jeffm@jeffreymahoney.com>
Subject: [PATCH] reiserfs: Fix warnings with gcc 4.4
Date: Mon, 08 Jun 2009 16:16:28 -0400
Message-ID: <4A2D719C.7010305@jeffreymahoney.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

 Several code paths in reiserfs have a construct like:
 if (is_direntry_le_ih(ih =3D B_N_PITEM_HEAD(src, item_num))) ...

 which, in addition to being ugly, end up causing compiler warnings wit=
h
 gcc 4.4.0. Previous compilers didn't issue a warning.

 fs/reiserfs/do_balan.c:1273: warning: operation on =E2=80=98aux_ih=E2=80=
=99 may be undefined
 fs/reiserfs/lbalance.c:393: warning: operation on =E2=80=98ih=E2=80=99=
 may be undefined
 fs/reiserfs/lbalance.c:421: warning: operation on =E2=80=98ih=E2=80=99=
 may be undefined
 fs/reiserfs/lbalance.c:777: warning: operation on =E2=80=98ih=E2=80=99=
 may be undefined

 I believe this is due to the ih being passed to macros which evaluate =
the
 argument more than once. This is old code and we haven't seen any prob=
lems
 with it, but this patch eliminates the warnings.

 It converts the multiple evaluation macros to static inlines and does
 a preassignment for the cases that were causing the warnings because t=
hat code
 is just ugly.

Reported-by: Chris Mason <mason@oracle.com>
Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/do_balan.c      |    5 +---
 fs/reiserfs/lbalance.c      |   10 +++++----
 include/linux/reiserfs_fs.h |   47 +++++++++++++++++++++++++++++++++++=
+--------
 3 files changed, 47 insertions(+), 15 deletions(-)

--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -1270,9 +1270,8 @@ static int balance_leaf(struct tree_bala
=20
 					RFALSE(ih, "PAP-12210: ih must be 0");
=20
-					if (is_direntry_le_ih
-					    (aux_ih =3D
-					     B_N_PITEM_HEAD(tbS0, item_pos))) {
+					aux_ih =3D B_N_PITEM_HEAD(tbS0, item_pos);
+					if (is_direntry_le_ih(aux_ih)) {
 						/* we append to directory item */
=20
 						int entry_count;
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -390,7 +390,8 @@ static void leaf_item_bottle(struct buff
=20
 	if (last_first =3D=3D FIRST_TO_LAST) {
 		/* if ( if item in position item_num in buffer SOURCE is directory i=
tem ) */
-		if (is_direntry_le_ih(ih =3D B_N_PITEM_HEAD(src, item_num)))
+		ih =3D B_N_PITEM_HEAD(src, item_num);
+		if (is_direntry_le_ih(ih))
 			leaf_copy_dir_entries(dest_bi, src, FIRST_TO_LAST,
 					      item_num, 0, cpy_bytes);
 		else {
@@ -418,7 +419,8 @@ static void leaf_item_bottle(struct buff
 		}
 	} else {
 		/*  if ( if item in position item_num in buffer SOURCE is directory =
item ) */
-		if (is_direntry_le_ih(ih =3D B_N_PITEM_HEAD(src, item_num)))
+		ih =3D B_N_PITEM_HEAD(src, item_num);
+		if (is_direntry_le_ih(ih))
 			leaf_copy_dir_entries(dest_bi, src, LAST_TO_FIRST,
 					      item_num,
 					      I_ENTRY_COUNT(ih) - cpy_bytes,
@@ -774,8 +776,8 @@ void leaf_delete_items(struct buffer_inf
 			leaf_delete_items_entirely(cur_bi, first + 1,
 						   del_num - 1);
=20
-			if (is_direntry_le_ih
-			    (ih =3D B_N_PITEM_HEAD(bh, B_NR_ITEMS(bh) - 1)))
+			ih =3D B_N_PITEM_HEAD(bh, B_NR_ITEMS(bh) - 1);
+			if (is_direntry_le_ih(ih))
 				/* the last item is directory  */
 				/* len =3D numbers of directory entries in this item */
 				len =3D ih_entry_count(ih);
--- a/include/linux/reiserfs_fs.h
+++ b/include/linux/reiserfs_fs.h
@@ -660,23 +660,54 @@ static inline void set_le_key_k_type(int
 		   cpu_to_le32(type2uniqueness(type)))
 	    : (void)(set_offset_v2_k_type(&(key->u.k_offset_v2), type));
 }
+
 static inline void set_le_ih_k_type(struct item_head *ih, int type)
 {
 	set_le_key_k_type(ih_version(ih), &(ih->ih_key), type);
 }
=20
-#define is_direntry_le_key(version,key) (le_key_k_type (version, key) =
=3D=3D TYPE_DIRENTRY)
-#define is_direct_le_key(version,key) (le_key_k_type (version, key) =3D=
=3D TYPE_DIRECT)
-#define is_indirect_le_key(version,key) (le_key_k_type (version, key) =
=3D=3D TYPE_INDIRECT)
-#define is_statdata_le_key(version,key) (le_key_k_type (version, key) =
=3D=3D TYPE_STAT_DATA)
+static inline int is_direntry_le_key(int version, struct reiserfs_key =
*key)
+{
+	return le_key_k_type(version, key) =3D=3D TYPE_DIRENTRY;
+}
+
+static inline int is_direct_le_key(int version, struct reiserfs_key *k=
ey)
+{
+	return le_key_k_type(version, key) =3D=3D TYPE_DIRECT;
+}
+
+static inline int is_indirect_le_key(int version, struct reiserfs_key =
*key)
+{
+	return le_key_k_type(version, key) =3D=3D TYPE_INDIRECT;
+}
+
+static inline int is_statdata_le_key(int version, struct reiserfs_key =
*key)
+{
+	return le_key_k_type(version, key) =3D=3D TYPE_STAT_DATA;
+}
=20
 //
 // item header has version.
 //
-#define is_direntry_le_ih(ih) is_direntry_le_key (ih_version (ih), &((=
ih)->ih_key))
-#define is_direct_le_ih(ih) is_direct_le_key (ih_version (ih), &((ih)-=
>ih_key))
-#define is_indirect_le_ih(ih) is_indirect_le_key (ih_version(ih), &((i=
h)->ih_key))
-#define is_statdata_le_ih(ih) is_statdata_le_key (ih_version (ih), &((=
ih)->ih_key))
+static inline int is_direntry_le_ih(struct item_head *ih)
+{
+	return is_direntry_le_key(ih_version(ih), &ih->ih_key);
+}
+
+static inline int is_direct_le_ih(struct item_head *ih)
+{
+	return is_direct_le_key(ih_version(ih), &ih->ih_key);
+}
+
+static inline int is_indirect_le_ih(struct item_head *ih)
+{
+	return is_indirect_le_key(ih_version(ih), &ih->ih_key);
+}
+
+static inline int is_statdata_le_ih(struct item_head *ih)
+{
+	return is_statdata_le_key(ih_version(ih), &ih->ih_key);
+}
=20
 //
 // key is pointer to cpu key, result is cpu
--=20
Jeff Mahoney
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
