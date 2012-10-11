From: Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH 06/10] reiserfsprogs: fix -Wpointer-sign warnings for
 blocksize and position
Date: Thu, 11 Oct 2012 13:34:49 -0400
Message-ID: <20121011200115.BDB2F200B2@oldboy.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

This patch fixes the following warnings:
pointer targets in passing argument 5 of =E2=80=98reiserfs_bin_search=E2=
=80=99 differ in signedness [-Wpointer-sign]
pointer targets in passing argument 2 of =E2=80=98init_rollback_file=E2=
=80=99 differ in signedness [-Wpointer-sign]

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 include/io.h               |    3 ++-
 include/reiserfs_fs.h      |    6 +++---
 lib/io.c                   |    4 +++-
 reiserfscore/reiserfslib.c |    4 +++-
 reiserfscore/stree.c       |    5 +++--
 5 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/io.h b/include/io.h
index ae9af4c..d4dc0f0 100644
--- a/include/io.h
+++ b/include/io.h
@@ -72,7 +72,8 @@ struct buffer_head * reiserfs_bread (int dev, unsigne=
d long block, int size, int
 int bwrite (struct buffer_head * bh);
 void brelse (struct buffer_head * bh);
 void bforget (struct buffer_head * bh);
-void init_rollback_file (char * rollback_file, int *bloksize, FILE * l=
og);
+void init_rollback_file (char * rollback_file, unsigned int *blocksize=
,
+			 FILE * log);
 int open_rollback_file (char * rollback_file, FILE * log);
 void close_rollback_file ();
 void do_fsck_rollback (int fd_device, int fd_journal_device, FILE * lo=
g);=20
diff --git a/include/reiserfs_fs.h b/include/reiserfs_fs.h
index bcee57b..1a00c95 100644
--- a/include/reiserfs_fs.h
+++ b/include/reiserfs_fs.h
@@ -1111,8 +1111,8 @@ struct disk_child {
 struct path_element  {
     struct buffer_head * pe_buffer; /* Pointer to the buffer at the pa=
th in
 				       the tree. */
-    int pe_position;  /* Position in the tree node which is placed in =
the
-			 buffer above. */
+    unsigned int pe_position;  /* Position in the tree node which is p=
laced
+				  in the buffer above. */
 };
=20
=20
@@ -1512,7 +1512,7 @@ struct buffer_info {
 void padd_item (char * item, int total_length, int length);
 int B_IS_IN_TREE(struct buffer_head *);
 struct key * get_rkey (struct path * p_s_chk_path, reiserfs_filsys_t *=
);
-int bin_search (void * p_v_key, void * p_v_base, int p_n_num, int p_n_=
width, int * p_n_pos);
+int bin_search (void * p_v_key, void * p_v_base, int p_n_num, int p_n_=
width, unsigned int * p_n_pos);
 int search_by_key (reiserfs_filsys_t *, struct key *, struct path *, i=
nt);
 int search_by_entry_key (reiserfs_filsys_t *, struct key *, struct pat=
h *);
 int search_for_position_by_key (reiserfs_filsys_t *, struct key *, str=
uct path *);
diff --git a/lib/io.c b/lib/io.c
index 3f9fe6a..62aec45 100644
--- a/lib/io.c
+++ b/lib/io.c
@@ -534,7 +534,9 @@ static int do_rollback =3D 0;
 static char * rollback_data;
 static int rollback_blocksize;
=20
-void init_rollback_file (char * rollback_file, int *blocksize, FILE * =
log) {
+void init_rollback_file (char * rollback_file, unsigned int *blocksize=
,
+			 FILE * log)
+{
     char * string;
     struct stat buf;
    =20
diff --git a/reiserfscore/reiserfslib.c b/reiserfscore/reiserfslib.c
index 5cecc3b..9c03ba4 100644
--- a/reiserfscore/reiserfslib.c
+++ b/reiserfscore/reiserfslib.c
@@ -464,7 +464,9 @@ static int reiserfs_search_by_key_x (reiserfs_filsy=
s_t * fs, struct key * key,
 	}
 	retval =3D reiserfs_bin_search (key, B_N_PKEY (bh, 0), B_NR_ITEMS (bh=
),
 				      is_leaf_node (bh) ? IH_SIZE : KEY_SIZE,
-				      &(curr->pe_position), key_length =3D=3D 4 ? comp_keys : comp=
_keys_3);
+				      &curr->pe_position,
+				      key_length =3D=3D 4 ?
+					comp_keys : comp_keys_3);
 	if (retval =3D=3D POSITION_FOUND) {
 	    /* key found, return if this is leaf level */
 	    if (is_leaf_node (bh)) {
diff --git a/reiserfscore/stree.c b/reiserfscore/stree.c
index eea7062..566c7f6 100644
--- a/reiserfscore/stree.c
+++ b/reiserfscore/stree.c
@@ -138,7 +138,7 @@ int comp_keys (const void * p1, const void * p2)
  there are no possible items, and we have not found it. With each exam=
ination we
  cut the number of possible items it could be by one more than half ro=
unded down,
  or we find it. */
-inline	int bin_search (
+int bin_search (
               void    * p_v_key,    /* Key to search for.             =
      */
 	      void    * p_v_base,   /* First item in the array.             *=
/
 	      int       p_n_num,    /* Number of items in the array.        *=
/
@@ -150,7 +150,8 @@ inline	int bin_search (
 				       of item headers in a node, p_n_width
 				       is actually the item header size not
 				       the item size.                      */
-	      int     * p_n_pos     /* Number of the searched for element. */
+	      unsigned int     * p_n_pos     /* Number of the searched
+						for element. */
             ) {
     int   n_rbound, n_lbound, n_j;
=20
--=20
1.7.10.4


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
