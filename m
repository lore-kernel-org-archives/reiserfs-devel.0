From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] reiserfs: some functions mustn't be inline
Date: Mon, 28 Apr 2008 18:38:45 +0300
Message-ID: <20080428153845.GG2813@cs181133002.pp.htv.fi>
References: <20080424215739.GA32378@elte.hu> <alpine.LFD.1.10.0804241510420.2779@woody.linux-foundation.org> <20080426151516.GA27894@elte.hu> <alpine.LFD.1.10.0804260955300.2813@woody.linux-foundation.org> <20080426172222.GD17345@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080426172222.GD17345@elte.hu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Alexander van Heukelum <heukelum@mailshack.com>, jdike@addtoit.com, Ingo Molnar <mingo@elte.hu>

This patch fixes the following build errors with UML and gcc 4.3:

<--  snip  -->

=2E..
  CC      fs/reiserfs/do_balan.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/do_balan.c: In fu=
nction =E2=80=98balance_leaf=E2=80=99:
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/do_balan.c:34: so=
rry, unimplemented: inlining failed in call to =E2=80=98do_balance_mark=
_leaf_dirty=E2=80=99: function body not available
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/do_balan.c:1018: =
sorry, unimplemented: called from here
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/do_balan.c:34: so=
rry, unimplemented: inlining failed in call to =E2=80=98do_balance_mark=
_leaf_dirty=E2=80=99: function body not available
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/do_balan.c:1174: =
sorry, unimplemented: called from here
make[3]: *** [fs/reiserfs/do_balan.o] Error 1
=2E..
  CC      fs/reiserfs/namei.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/namei.c: In funct=
ion =E2=80=98search_by_entry_key=E2=80=99:
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/namei.c:66: sorry=
, unimplemented: inlining failed in call to =E2=80=98set_de_name_and_na=
melen=E2=80=99: function body not available
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/namei.c:162: sorr=
y, unimplemented: called from here
make[3]: *** [fs/reiserfs/namei.o] Error 1
=2E..
  CC      fs/reiserfs/inode.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/inode.c: In funct=
ion =E2=80=98reiserfs_get_block=E2=80=99:
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/inode.c:108: sorr=
y, unimplemented: inlining failed in call to =E2=80=98make_le_item_head=
=E2=80=99: function body not available
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/inode.c:776: sorr=
y, unimplemented: called from here
make[3]: *** [fs/reiserfs/inode.o] Error 1
=2E..
  CC      fs/reiserfs/stree.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c: In funct=
ion =E2=80=98comp_keys=E2=80=99:
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:86: sorry=
, unimplemented: inlining failed in call to =E2=80=98comp_short_keys=E2=
=80=99: function body not available
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:111: sorr=
y, unimplemented: called from here
make[3]: *** [fs/reiserfs/stree.o] Error 1
=2E..
  CC      fs/reiserfs/stree.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c: In funct=
ion =E2=80=98get_lkey=E2=80=99:
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:61: sorry=
, unimplemented: inlining failed in call to =E2=80=98B_IS_IN_TREE=E2=80=
=99: function body not available
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:265: sorr=
y, unimplemented: called from here
make[3]: *** [fs/reiserfs/stree.o] Error 1
=2E..
  CC      fs/reiserfs/stree.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c: In funct=
ion =E2=80=98key_in_buffer=E2=80=99:
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:294: sorr=
y, unimplemented: inlining failed in call to =E2=80=98get_rkey=E2=80=99=
: function body not available
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:356: sorr=
y, unimplemented: called from here
make[3]: *** [fs/reiserfs/stree.o] Error 1
=2E..
  CC      fs/reiserfs/stree.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c: In funct=
ion =E2=80=98prepare_for_delete_or_cut=E2=80=99:
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:74: sorry=
, unimplemented: inlining failed in call to =E2=80=98copy_item_head=E2=80=
=99: function body not available
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:1041: sor=
ry, unimplemented: called from here
make[3]: *** [fs/reiserfs/stree.o] Error 1
=2E..
  CC      fs/reiserfs/stree.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c: In funct=
ion =E2=80=98reiserfs_delete_solid_item=E2=80=99:
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:153: sorr=
y, unimplemented: inlining failed in call to =E2=80=98le_key2cpu_key=E2=
=80=99: function body not available
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:1335: sor=
ry, unimplemented: called from here
make[3]: *** [fs/reiserfs/stree.o] Error 1
=2E..
  CC      fs/reiserfs/stree.o
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c: In funct=
ion =E2=80=98decrement_counters_in_path=E2=80=99:
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:362: sorr=
y, unimplemented: inlining failed in call to =E2=80=98decrement_bcount=E2=
=80=99: function body not available
/home/bunk/linux/kernel-2.6/git/linux-2.6/fs/reiserfs/stree.c:387: sorr=
y, unimplemented: called from here
make[3]: *** [fs/reiserfs/stree.o] Error 1

<--  snip  -->

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---

 fs/reiserfs/do_balan.c |    4 ++--
 fs/reiserfs/inode.c    |    8 ++++----
 fs/reiserfs/namei.c    |    2 +-
 fs/reiserfs/stree.c    |   17 ++++++++---------
 4 files changed, 15 insertions(+), 16 deletions(-)

da1507ac13cfd50db5dddc0186e0ff1f1ae26517 diff --git a/fs/reiserfs/do_ba=
lan.c b/fs/reiserfs/do_balan.c
index 7ee4208..42be2a6 100644
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -29,8 +29,8 @@ struct tree_balance *cur_tb =3D NULL;	/* detects whet=
her more than one
 					   is interrupting do_balance */
 #endif
=20
-inline void do_balance_mark_leaf_dirty(struct tree_balance *tb,
-				       struct buffer_head *bh, int flag)
+void do_balance_mark_leaf_dirty(struct tree_balance *tb,
+				struct buffer_head *bh, int flag)
 {
 	journal_mark_dirty(tb->transaction_handle,
 			   tb->transaction_handle->t_super, bh);
diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 5791793..3e06b99 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -101,10 +101,10 @@ void make_cpu_key(struct cpu_key *key, struct ino=
de *inode, loff_t offset,
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
diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 8867533..f592296 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -62,7 +62,7 @@ static inline void set_de_item_location(struct reiser=
fs_dir_entry *de,
 }
=20
 // de_bh, de_ih, de_deh (points to first element of array), de_item_nu=
m is set
-inline void set_de_name_and_namelen(struct reiserfs_dir_entry *de)
+void set_de_name_and_namelen(struct reiserfs_dir_entry *de)
 {
 	struct reiserfs_de_head *deh =3D de->de_deh + de->de_entry_num;
=20
diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index d2db241..9b84b4c 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -57,7 +57,7 @@
 #include <linux/quotaops.h>
=20
 /* Does the buffer contain a disk block which is in the tree. */
-inline int B_IS_IN_TREE(const struct buffer_head *p_s_bh)
+int B_IS_IN_TREE(const struct buffer_head *p_s_bh)
 {
=20
 	RFALSE(B_LEVEL(p_s_bh) > MAX_HEIGHT,
@@ -69,8 +69,7 @@ inline int B_IS_IN_TREE(const struct buffer_head *p_s=
_bh)
 //
 // to gets item head in le form
 //
-inline void copy_item_head(struct item_head *p_v_to,
-			   const struct item_head *p_v_from)
+void copy_item_head(struct item_head *p_v_to, const struct item_head *=
p_v_from)
 {
 	memcpy(p_v_to, p_v_from, IH_SIZE);
 }
@@ -81,8 +80,8 @@ inline void copy_item_head(struct item_head *p_v_to,
    Returns: -1 if key1 < key2=20
    0 if key1 =3D=3D key2
    1 if key1 > key2 */
-inline int comp_short_keys(const struct reiserfs_key *le_key,
-			   const struct cpu_key *cpu_key)
+int comp_short_keys(const struct reiserfs_key *le_key,
+		    const struct cpu_key *cpu_key)
 {
 	__u32 n;
 	n =3D le32_to_cpu(le_key->k_dir_id);
@@ -150,7 +149,7 @@ inline int comp_short_le_keys(const struct reiserfs=
_key *key1,
 	return 0;
 }
=20
-inline void le_key2cpu_key(struct cpu_key *to, const struct reiserfs_k=
ey *from)
+void le_key2cpu_key(struct cpu_key *to, const struct reiserfs_key *fro=
m)
 {
 	int version;
 	to->on_disk_key.k_dir_id =3D le32_to_cpu(from->k_dir_id);
@@ -289,8 +288,8 @@ static inline const struct reiserfs_key *get_lkey(c=
onst struct treepath
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
@@ -359,7 +358,7 @@ static inline int key_in_buffer(struct treepath *p_=
s_chk_path,	/* Path which sho
 	return 1;
 }
=20
-inline void decrement_bcount(struct buffer_head *p_s_bh)
+void decrement_bcount(struct buffer_head *p_s_bh)
 {
 	if (p_s_bh) {
 		if (atomic_read(&(p_s_bh->b_count))) {

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
