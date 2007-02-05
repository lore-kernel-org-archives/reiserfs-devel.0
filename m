From: Ingo Bormuth <ibormuth@efil.de>
Subject: [patch] reiser4-for-2.6.20
Date: Mon, 5 Feb 2007 04:01:06 +0100
Message-ID: <20070205030106.GA10122@efil.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Return-path: <reiserfs-list-return-30532-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: tormen@gmx.net

--i9LlY+UWpKt15+FH
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Please find my reiser4 patch for 2.6.20 at

   http://public.efil.de/reiser4-for-2.6.20-0.patch.gz


See attachment for changes versus 2.6.19.2 from [1]

I don't use cryptocompress and kindly ask you to confirm
'cancel_dirty_page(clust->pages[i], PAGE_CACHE_SIZE);'
in plugin/file/cryptcompress.c, line 1303. As far as I understand
forget_cluster_pages is only called _after_ the cluster's pages have
successfully been flushed. That would make for case (b) in [2].


[1] ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.19/reiser4-for-2.6.19-2.p=
atch.gz
[2] http://www2.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git=
;a=3Dcommit;h=3Dfba2591bf4e418b6c3f9f8794c9dd8fe40ae7bd9



--=20
Ingo Bormuth, voicebox & fax: +49-(0)-12125-10226517
public key 86326EC9, http://ibormuth.efil.de/contact

--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiser4-2.6.19-to-2.6.20.diff"
Content-Transfer-Encoding: quoted-printable

diff -Nru linux-2.6.20-reiser4/fs/reiser4/entd.c new-linux-2.6.20-reiser4/f=
s/reiser4/entd.c
--- linux-2.6.20-reiser4/fs/reiser4/entd.c	2007-02-05 01:55:43.000000000 +0=
100
+++ new-linux-2.6.20-reiser4/fs/reiser4/entd.c	2007-02-05 01:47:42.00000000=
0 +0100
@@ -14,13 +14,12 @@
 #include "page_cache.h"
 #include "inode.h"
=20
-#include <linux/sched.h>	/* struct task_struct */
+#include <linux/freezer.h>
 #include <linux/suspend.h>
 #include <linux/kernel.h>
 #include <linux/writeback.h>
 #include <linux/time.h>		/* INITIAL_JIFFIES */
 #include <linux/backing-dev.h>	/* bdi_write_congested */
-#include <linux/wait.h>
 #include <linux/kthread.h>
=20
 #define DEF_PRIORITY 12
diff -Nru linux-2.6.20-reiser4/fs/reiser4/flush_queue.c new-linux-2.6.20-re=
iser4/fs/reiser4/flush_queue.c
--- linux-2.6.20-reiser4/fs/reiser4/flush_queue.c	2007-02-05 01:55:43.00000=
0000 +0100
+++ new-linux-2.6.20-reiser4/fs/reiser4/flush_queue.c	2007-02-05 01:30:45.0=
00000000 +0100
@@ -107,7 +107,7 @@
 }
=20
 /* slab for flush queues */
-static kmem_cache_t *fq_slab;
+static struct kmem_cache *fq_slab;
=20
 /**
  * reiser4_init_fqs - create flush queue cache
diff -Nru linux-2.6.20-reiser4/fs/reiser4/fsdata.c new-linux-2.6.20-reiser4=
/fs/reiser4/fsdata.c
--- linux-2.6.20-reiser4/fs/reiser4/fsdata.c	2007-02-05 01:55:43.000000000 =
+0100
+++ new-linux-2.6.20-reiser4/fs/reiser4/fsdata.c	2007-02-05 01:30:45.000000=
000 +0100
@@ -5,7 +5,7 @@
 #include "inode.h"
=20
 /* cache or dir_cursors */
-static kmem_cache_t *d_cursor_cache;
+static struct kmem_cache *d_cursor_cache;
 static struct shrinker *d_cursor_shrinker;
=20
 /* list of unused cursors */
@@ -594,7 +594,7 @@
 }
=20
 /* slab for reiser4_dentry_fsdata */
-static kmem_cache_t *dentry_fsdata_cache;
+static struct kmem_cache *dentry_fsdata_cache;
=20
 /**
  * reiser4_init_dentry_fsdata - create cache of dentry_fsdata
@@ -661,7 +661,7 @@
 }
=20
 /* slab for reiser4_file_fsdata */
-static kmem_cache_t *file_fsdata_cache;
+static struct kmem_cache *file_fsdata_cache;
=20
 /**
  * reiser4_init_file_fsdata - create cache of reiser4_file_fsdata
diff -Nru linux-2.6.20-reiser4/fs/reiser4/jnode.c new-linux-2.6.20-reiser4/=
fs/reiser4/jnode.c
--- linux-2.6.20-reiser4/fs/reiser4/jnode.c	2007-02-05 01:55:43.000000000 +=
0100
+++ new-linux-2.6.20-reiser4/fs/reiser4/jnode.c	2007-02-05 01:30:46.0000000=
00 +0100
@@ -123,7 +123,7 @@
 #include <linux/fs.h>		/* for struct address_space  */
 #include <linux/writeback.h>	/* for inode_lock */
=20
-static kmem_cache_t *_jnode_slab =3D NULL;
+static struct kmem_cache *_jnode_slab =3D NULL;
=20
 static void jnode_set_type(jnode * node, jnode_type type);
 static int jdelete(jnode * node);
diff -Nru linux-2.6.20-reiser4/fs/reiser4/ktxnmgrd.c new-linux-2.6.20-reise=
r4/fs/reiser4/ktxnmgrd.c
--- linux-2.6.20-reiser4/fs/reiser4/ktxnmgrd.c	2007-02-05 01:55:43.00000000=
0 +0100
+++ new-linux-2.6.20-reiser4/fs/reiser4/ktxnmgrd.c	2007-02-05 01:48:14.0000=
00000 +0100
@@ -29,12 +29,11 @@
 #include "super.h"
 #include "reiser4.h"
=20
-#include <linux/sched.h>	/* for struct task_struct */
-#include <linux/wait.h>
 #include <linux/suspend.h>
 #include <linux/kernel.h>
 #include <linux/writeback.h>
 #include <linux/kthread.h>
+#include <linux/freezer.h>
=20
 static int scan_mgr(struct super_block *);
=20
diff -Nru linux-2.6.20-reiser4/fs/reiser4/plugin/file/cryptcompress.c new-l=
inux-2.6.20-reiser4/fs/reiser4/plugin/file/cryptcompress.c
--- linux-2.6.20-reiser4/fs/reiser4/plugin/file/cryptcompress.c	2007-02-05 =
01:55:43.000000000 +0100
+++ new-linux-2.6.20-reiser4/fs/reiser4/plugin/file/cryptcompress.c	2007-02=
-05 01:21:48.000000000 +0100
@@ -1300,7 +1300,7 @@
 		lock_page(clust->pages[i]);
 		if (PageDirty(clust->pages[i])) {
 			assert("edward-1277", PageUptodate(clust->pages[i]));
-			test_clear_page_dirty(clust->pages[i]);
+			cancel_dirty_page(clust->pages[i], PAGE_CACHE_SIZE);
 		}
 #if REISER4_DEBUG
 		else
diff -Nru linux-2.6.20-reiser4/fs/reiser4/plugin/plugin_set.c new-linux-2.6=
=2E20-reiser4/fs/reiser4/plugin/plugin_set.c
--- linux-2.6.20-reiser4/fs/reiser4/plugin/plugin_set.c	2007-02-05 01:55:43=
=2E000000000 +0100
+++ new-linux-2.6.20-reiser4/fs/reiser4/plugin/plugin_set.c	2007-02-05 01:3=
0:45.000000000 +0100
@@ -31,7 +31,7 @@
 #include <linux/stddef.h>
=20
 /* slab for plugin sets */
-static kmem_cache_t *plugin_set_slab;
+static struct kmem_cache *plugin_set_slab;
=20
 static spinlock_t plugin_set_lock[8] __cacheline_aligned_in_smp =3D {
 	[0 ... 7] =3D SPIN_LOCK_UNLOCKED
diff -Nru linux-2.6.20-reiser4/fs/reiser4/super.h new-linux-2.6.20-reiser4/=
fs/reiser4/super.h
--- linux-2.6.20-reiser4/fs/reiser4/super.h	2007-02-05 01:55:43.000000000 +=
0100
+++ new-linux-2.6.20-reiser4/fs/reiser4/super.h	2007-02-05 01:30:46.0000000=
00 +0100
@@ -444,7 +444,7 @@
 void print_fs_info(const char *prefix, const struct super_block *);
 #endif
=20
-extern void destroy_reiser4_cache(kmem_cache_t **);
+extern void destroy_reiser4_cache(struct kmem_cache **);
=20
 extern struct super_operations reiser4_super_operations;
 extern struct export_operations reiser4_export_operations;
diff -Nru linux-2.6.20-reiser4/fs/reiser4/super_ops.c new-linux-2.6.20-reis=
er4/fs/reiser4/super_ops.c
--- linux-2.6.20-reiser4/fs/reiser4/super_ops.c	2007-02-05 01:55:43.0000000=
00 +0100
+++ new-linux-2.6.20-reiser4/fs/reiser4/super_ops.c	2007-02-05 01:30:46.000=
000000 +0100
@@ -14,7 +14,7 @@
 #include <linux/debugfs.h>
=20
 /* slab cache for inodes */
-static kmem_cache_t *inode_cache;
+static struct kmem_cache *inode_cache;
=20
 static struct dentry *reiser4_debugfs_root =3D NULL;
=20
@@ -27,7 +27,7 @@
  * Initialization function to be called when new page is allocated by reis=
er4
  * inode cache. It is set on inode cache creation.
  */
-static void init_once(void *obj, kmem_cache_t *cache, unsigned long flags)
+static void init_once(void *obj, struct kmem_cache *cache, unsigned long f=
lags)
 {
 	reiser4_inode_object *info;
=20
@@ -595,7 +595,7 @@
 	.next =3D NULL
 };
=20
-void destroy_reiser4_cache(kmem_cache_t **cachep)
+void destroy_reiser4_cache(struct kmem_cache **cachep)
 {
 	BUG_ON(*cachep =3D=3D NULL);
 	kmem_cache_destroy(*cachep);
diff -Nru linux-2.6.20-reiser4/fs/reiser4/txnmgr.c new-linux-2.6.20-reiser4=
/fs/reiser4/txnmgr.c
--- linux-2.6.20-reiser4/fs/reiser4/txnmgr.c	2007-02-05 01:55:43.000000000 =
+0100
+++ new-linux-2.6.20-reiser4/fs/reiser4/txnmgr.c	2007-02-05 01:30:46.000000=
000 +0100
@@ -90,7 +90,7 @@
    For actually implementing these out-of-system-call-scopped transcrashes=
, the
    reiser4_context has a "txn_handle *trans" pointer that may be set to an=
 open
    transcrash.  Currently there are no dynamically-allocated transcrashes,=
 but there is a
-   "kmem_cache_t *_txnh_slab" created for that purpose in this file.
+   "struct kmem_cache *_txnh_slab" created for that purpose in this file.
 */
=20
 /* Extending the other system call interfaces for future transaction featu=
res:
@@ -279,9 +279,9 @@
=20
 /* FIXME: In theory, we should be using the slab cache init & destructor
    methods instead of, e.g., jnode_init, etc. */
-static kmem_cache_t *_atom_slab =3D NULL;
+static struct kmem_cache *_atom_slab =3D NULL;
 /* this is for user-visible, cross system-call transactions. */
-static kmem_cache_t *_txnh_slab =3D NULL;
+static struct kmem_cache *_txnh_slab =3D NULL;
=20
 /**
  * init_txnmgr_static - create transaction manager slab caches
diff -Nru linux-2.6.20-reiser4/fs/reiser4/znode.c new-linux-2.6.20-reiser4/=
fs/reiser4/znode.c
--- linux-2.6.20-reiser4/fs/reiser4/znode.c	2007-02-05 01:55:43.000000000 +=
0100
+++ new-linux-2.6.20-reiser4/fs/reiser4/znode.c	2007-02-05 01:30:46.0000000=
00 +0100
@@ -196,7 +196,7 @@
 #undef KMALLOC
=20
 /* slab for znodes */
-static kmem_cache_t *znode_cache;
+static struct kmem_cache *znode_cache;
=20
 int znode_shift_order;
=20

--sdtB3X0nJg68CQEu--

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFFxp3yNzWqdIYybskRAoUPAJ9DprJSmvv+r+t98aC410XSpXUzHwCeMwgg
Yx920x03Ghl1dXpjPxN8KYo=
=WCor
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--

