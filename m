From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [2.6 patch] reiserfs: some functions mustn't be inline
Date: Wed, 30 Apr 2008 02:43:57 +0400
Message-ID: <200804300243.58127.edward.shishkin@gmail.com>
References: <20080424215739.GA32378@elte.hu> <20080426172222.GD17345@elte.hu> <20080428153845.GG2813@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20080428153845.GG2813@cs181133002.pp.htv.fi>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Adrian Bunk <bunk@kernel.org>
Cc: reiserfs-devel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, heukelum@mailshack.com, jdike@addtoit.com, mingo@elte.hu

On Monday 28 April 2008 19:38, Adrian Bunk wrote:
> This patch fixes the following build errors with UML and gcc 4.3:
>=20
> <--  snip  -->
>=20
> ...
>   CC      fs/reiserfs/do_balan.o
> /home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/do_balan.c: In =
function =E2=80=98balance_leaf=E2=80=99:
> /home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/do_balan.c:34: =
sorry, unimplemented: inlining failed in call to =E2=80=98do_balance_ma=
rk_leaf_dirty=E2=80=99: function body not available
> /home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/do_balan.c:1018=
: sorry, unimplemented: called from here
> /home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/do_balan.c:34: =
sorry, unimplemented: inlining failed in call to =E2=80=98do_balance_ma=
rk_leaf_dirty=E2=80=99: function body not available
> /home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/do_balan.c:1174=
: sorry, unimplemented: called from here
> make[3]: *** [fs/reiserfs/do_balan.o] Error 1

Hello.
I would make some of them static inline (my version is appended).

Thanks,
Edward.

Make the following functions static inline:

=2E do_balance_mark_leaf_dirty
=2E set_de_name_and_namelen
=2E comp_short_keys
=2E B_IS_IN_TREE
=2E copy_item_head
=2E le_key2cpu_key
=2E decrement_bcount

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>

---
 linux-2.6.25-mm1/fs/reiserfs/do_balan.c      |   10 --
 linux-2.6.25-mm1/fs/reiserfs/inode.c         |    8 +-
 linux-2.6.25-mm1/fs/reiserfs/namei.c         |   12 ---
 linux-2.6.25-mm1/fs/reiserfs/stree.c         |   77 ------------------=
---
 linux-2.6.25-mm1/include/linux/reiserfs_fs.h |   99 ++++++++++++++++++=
+++++----
 5 files changed, 93 insertions(+), 113 deletions(-)

--- linux-2.6.25-mm1/fs/reiserfs/do_balan.c.orig
+++ linux-2.6.25-mm1/fs/reiserfs/do_balan.c
@@ -29,16 +29,6 @@
 					   is interrupting do_balance */
 #endif
=20
-inline void do_balance_mark_leaf_dirty(struct tree_balance *tb,
-				       struct buffer_head *bh, int flag)
-{
-	journal_mark_dirty(tb->transaction_handle,
-			   tb->transaction_handle->t_super, bh);
-}
-
-#define do_balance_mark_internal_dirty do_balance_mark_leaf_dirty
-#define do_balance_mark_sb_dirty do_balance_mark_leaf_dirty
-
 /* summary:=20
  if deleting something ( tb->insert_size[0] < 0 )
    return(balance_leaf_when_delete()); (flag d handled here)
--- linux-2.6.25-mm1/fs/reiserfs/inode.c.orig
+++ linux-2.6.25-mm1/fs/reiserfs/inode.c
@@ -101,10 +101,10 @@
 //
 // when key is 0, do not set version and short key
 //
-inline void make_le_item_head(struct item_head *ih, const struct cpu_k=
ey *key,
-			      int version,
-			      loff_t offset, int type, int length,
-			      int entry_count /*or ih_free_space */ )
+void make_le_item_head(struct item_head *ih, const struct cpu_key *key=
,
+		       int version,
+		       loff_t offset, int type, int length,
+		       int entry_count /*or ih_free_space */ )
 {
 	if (key) {
 		ih->ih_key.k_dir_id =3D cpu_to_le32(key->on_disk_key.k_dir_id);
--- linux-2.6.25-mm1/fs/reiserfs/namei.c.orig
+++ linux-2.6.25-mm1/fs/reiserfs/namei.c
@@ -62,18 +62,6 @@
 }
=20
 // de_bh, de_ih, de_deh (points to first element of array), de_item_nu=
m is set
-inline void set_de_name_and_namelen(struct reiserfs_dir_entry *de)
-{
-	struct reiserfs_de_head *deh =3D de->de_deh + de->de_entry_num;
-
-	BUG_ON(de->de_entry_num >=3D ih_entry_count(de->de_ih));
-
-	de->de_entrylen =3D entry_length(de->de_bh, de->de_ih, de->de_entry_n=
um);
-	de->de_namelen =3D de->de_entrylen - (de_with_sd(deh) ? SD_SIZE : 0);
-	de->de_name =3D B_I_PITEM(de->de_bh, de->de_ih) + deh_location(deh);
-	if (de->de_name[de->de_namelen - 1] =3D=3D 0)
-		de->de_namelen =3D strlen(de->de_name);
-}
=20
 // what entry points to
 static inline void set_de_object_key(struct reiserfs_dir_entry *de)
--- linux-2.6.25-mm1/fs/reiserfs/stree.c.orig
+++ linux-2.6.25-mm1/fs/reiserfs/stree.c
@@ -11,18 +11,13 @@
 /*
  *  This file contains functions dealing with S+tree
  *
- * B_IS_IN_TREE
- * copy_item_head
- * comp_short_keys
  * comp_keys
  * comp_short_le_keys
- * le_key2cpu_key
  * comp_le_keys
  * bin_search
  * get_lkey
  * get_rkey
  * key_in_buffer
- * decrement_bcount
  * decrement_counters_in_path
  * reiserfs_check_path
  * pathrelse_and_restore
@@ -56,48 +51,6 @@
 #include <linux/buffer_head.h>
 #include <linux/quotaops.h>
=20
-/* Does the buffer contain a disk block which is in the tree. */
-inline int B_IS_IN_TREE(const struct buffer_head *p_s_bh)
-{
-
-	RFALSE(B_LEVEL(p_s_bh) > MAX_HEIGHT,
-	       "PAP-1010: block (%b) has too big level (%z)", p_s_bh, p_s_bh)=
;
-
-	return (B_LEVEL(p_s_bh) !=3D FREE_LEVEL);
-}
-
-//
-// to gets item head in le form
-//
-inline void copy_item_head(struct item_head *p_v_to,
-			   const struct item_head *p_v_from)
-{
-	memcpy(p_v_to, p_v_from, IH_SIZE);
-}
-
-/* k1 is pointer to on-disk structure which is stored in little-endian
-   form. k2 is pointer to cpu variable. For key of items of the same
-   object this returns 0.
-   Returns: -1 if key1 < key2=20
-   0 if key1 =3D=3D key2
-   1 if key1 > key2 */
-inline int comp_short_keys(const struct reiserfs_key *le_key,
-			   const struct cpu_key *cpu_key)
-{
-	__u32 n;
-	n =3D le32_to_cpu(le_key->k_dir_id);
-	if (n < cpu_key->on_disk_key.k_dir_id)
-		return -1;
-	if (n > cpu_key->on_disk_key.k_dir_id)
-		return 1;
-	n =3D le32_to_cpu(le_key->k_objectid);
-	if (n < cpu_key->on_disk_key.k_objectid)
-		return -1;
-	if (n > cpu_key->on_disk_key.k_objectid)
-		return 1;
-	return 0;
-}
-
 /* k1 is pointer to on-disk structure which is stored in little-endian
    form. k2 is pointer to cpu variable.
    Compare keys using all 4 key fields.
@@ -150,19 +103,6 @@
 	return 0;
 }
=20
-inline void le_key2cpu_key(struct cpu_key *to, const struct reiserfs_k=
ey *from)
-{
-	int version;
-	to->on_disk_key.k_dir_id =3D le32_to_cpu(from->k_dir_id);
-	to->on_disk_key.k_objectid =3D le32_to_cpu(from->k_objectid);
-
-	// find out version of the key
-	version =3D le_key_version(from);
-	to->version =3D version;
-	to->on_disk_key.k_offset =3D le_key_k_offset(version, from);
-	to->on_disk_key.k_type =3D le_key_k_type(version, from);
-}
-
 // this does not say which one is bigger, it only returns 1 if keys
 // are not equal, 0 otherwise
 inline int comp_le_keys(const struct reiserfs_key *k1,
@@ -289,8 +229,8 @@
 }
=20
 /* Get delimiting key of the buffer at the path and its right neighbor=
=2E */
-inline const struct reiserfs_key *get_rkey(const struct treepath *p_s_=
chk_path,
-					   const struct super_block *p_s_sb)
+const struct reiserfs_key *get_rkey(const struct treepath *p_s_chk_pat=
h,
+				    const struct super_block *p_s_sb)
 {
 	int n_position, n_path_offset =3D p_s_chk_path->path_length;
 	struct buffer_head *p_s_parent;
@@ -359,19 +299,6 @@
 	return 1;
 }
=20
-inline void decrement_bcount(struct buffer_head *p_s_bh)
-{
-	if (p_s_bh) {
-		if (atomic_read(&(p_s_bh->b_count))) {
-			put_bh(p_s_bh);
-			return;
-		}
-		reiserfs_panic(NULL,
-			       "PAP-5070: decrement_bcount: trying to free free buffer %b",
-			       p_s_bh);
-	}
-}
-
 /* Decrement b_count field of the all buffers in the path. */
 void decrement_counters_in_path(struct treepath *p_s_search_path)
 {
--- linux-2.6.25-mm1/include/linux/reiserfs_fs.h.orig
+++ linux-2.6.25-mm1/include/linux/reiserfs_fs.h
@@ -1770,14 +1770,37 @@
 int reiserfs_convert_objectid_map_v1(struct super_block *);
=20
 /* stree.c */
-int B_IS_IN_TREE(const struct buffer_head *);
-extern void copy_item_head(struct item_head *p_v_to,
-			   const struct item_head *p_v_from);
-
-// first key is in cpu form, second - le
-extern int comp_short_keys(const struct reiserfs_key *le_key,
-			   const struct cpu_key *cpu_key);
-extern void le_key2cpu_key(struct cpu_key *to, const struct reiserfs_k=
ey *from);
+
+/* to get item head in le form */
+static inline void copy_item_head(struct item_head *p_v_to,
+				  const struct item_head *p_v_from)
+{
+	memcpy(p_v_to, p_v_from, IH_SIZE);
+}
+
+/* first key is in cpu form, second - le */
+/* k1 is pointer to on-disk structure which is stored in little-endian
+   form. k2 is pointer to cpu variable. For key of items of the same
+   object this returns 0.
+   Returns: -1 if key1 < key2
+   0 if key1 =3D=3D key2
+   1 if key1 > key2 */
+static inline int comp_short_keys(const struct reiserfs_key *le_key,
+				  const struct cpu_key *cpu_key)
+{
+	__u32 n;
+	n =3D le32_to_cpu(le_key->k_dir_id);
+	if (n < cpu_key->on_disk_key.k_dir_id)
+		return -1;
+	if (n > cpu_key->on_disk_key.k_dir_id)
+		return 1;
+	n =3D le32_to_cpu(le_key->k_objectid);
+	if (n < cpu_key->on_disk_key.k_objectid)
+		return -1;
+	if (n > cpu_key->on_disk_key.k_objectid)
+		return 1;
+	return 0;
+}
=20
 // both are in le form
 extern int comp_le_keys(const struct reiserfs_key *,
@@ -1801,6 +1824,20 @@
=20
 }
=20
+static inline void le_key2cpu_key(struct cpu_key *to,
+				  const struct reiserfs_key *from)
+{
+	int version;
+	to->on_disk_key.k_dir_id =3D le32_to_cpu(from->k_dir_id);
+	to->on_disk_key.k_objectid =3D le32_to_cpu(from->k_objectid);
+
+	// find out version of the key
+	version =3D le_key_version(from);
+	to->version =3D version;
+	to->on_disk_key.k_offset =3D le_key_k_offset(version, from);
+	to->on_disk_key.k_type =3D le_key_k_type(version, from);
+}
+
 static inline void copy_key(struct reiserfs_key *to,
 			    const struct reiserfs_key *from)
 {
@@ -1816,7 +1853,6 @@
 int search_for_position_by_key(struct super_block *p_s_sb,
 			       const struct cpu_key *p_s_cpu_key,
 			       struct treepath *p_s_search_path);
-extern void decrement_bcount(struct buffer_head *p_s_bh);
 void decrement_counters_in_path(struct treepath *p_s_search_path);
 void pathrelse(struct treepath *p_s_search_path);
 int reiserfs_check_path(struct treepath *p);
@@ -1913,7 +1949,19 @@
 int reiserfs_setattr(struct dentry *dentry, struct iattr *attr);
=20
 /* namei.c */
-void set_de_name_and_namelen(struct reiserfs_dir_entry *de);
+static inline void set_de_name_and_namelen(struct reiserfs_dir_entry *=
de)
+{
+	struct reiserfs_de_head *deh =3D de->de_deh + de->de_entry_num;
+
+	BUG_ON(de->de_entry_num >=3D ih_entry_count(de->de_ih));
+
+	de->de_entrylen =3D entry_length(de->de_bh, de->de_ih, de->de_entry_n=
um);
+	de->de_namelen =3D de->de_entrylen - (de_with_sd(deh) ? SD_SIZE : 0);
+	de->de_name =3D B_I_PITEM(de->de_bh, de->de_ih) + deh_location(deh);
+	if (de->de_name[de->de_namelen - 1] =3D=3D 0)
+		de->de_namelen =3D strlen(de->de_name);
+}
+
 int search_by_entry_key(struct super_block *sb, const struct cpu_key *=
key,
 			struct treepath *path, struct reiserfs_dir_entry *de);
 struct dentry *reiserfs_get_parent(struct dentry *);
@@ -2030,8 +2078,12 @@
 		     struct buffer_head **);
=20
 /* do_balance.c */
-void do_balance_mark_leaf_dirty(struct tree_balance *tb,
-				struct buffer_head *bh, int flag);
+static inline void do_balance_mark_leaf_dirty(struct tree_balance *tb,
+				struct buffer_head *bh, int flag)
+{
+	journal_mark_dirty(tb->transaction_handle,
+			   tb->transaction_handle->t_super, bh);
+}
 #define do_balance_mark_internal_dirty do_balance_mark_leaf_dirty
 #define do_balance_mark_sb_dirty do_balance_mark_leaf_dirty
=20
@@ -2148,6 +2200,29 @@
 void reiserfs_discard_all_prealloc(struct reiserfs_transaction_handle =
*th);
 #endif
=20
+static inline void decrement_bcount(struct buffer_head *p_s_bh)
+{
+	if (p_s_bh) {
+		if (atomic_read(&(p_s_bh->b_count))) {
+			put_bh(p_s_bh);
+			return;
+		}
+		reiserfs_panic(NULL,
+		    "PAP-5070: decrement_bcount: trying to free free buffer %b",
+			       p_s_bh);
+	}
+}
+
+/* Does the buffer contain a disk block which is in the tree. */
+static inline int B_IS_IN_TREE(const struct buffer_head *p_s_bh)
+{
+
+	RFALSE(B_LEVEL(p_s_bh) > MAX_HEIGHT,
+	       "PAP-1010: block (%b) has too big level (%z)", p_s_bh, p_s_bh)=
;
+
+	return (B_LEVEL(p_s_bh) !=3D FREE_LEVEL);
+}
+
 /* hashes.c */
 __u32 keyed_hash(const signed char *msg, int len);
 __u32 yura_hash(const signed char *msg, int len);
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
