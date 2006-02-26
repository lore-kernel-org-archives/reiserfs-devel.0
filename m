From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: possible reiser4 bug
Date: Sun, 26 Feb 2006 10:33:17 +0300
Message-ID: <200602261033.18676.zam@namesys.com>
References: <2bbb1c940602232135jff393fbm2175052026237ce9@mail.gmail.com> <200602260009.36905.zam@namesys.com> <200602260333.28555.biscani@pd.astro.it>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_+mVAEl5znc2x92u"
Return-path: <reiserfs-list-return-28138-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200602260333.28555.biscani@pd.astro.it>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Francesco Biscani <biscani@pd.astro.it>

--Boundary-00=_+mVAEl5znc2x92u
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 26 February 2006 05:33, Francesco Biscani wrote:
> On Saturday 25 February 2006 22:09, Alexander Zarochentsev wrote:
> > would you please try the attached patch.
>
> I'm having a similar problem on 2.6.16-rc4 + reiser4 from -mm1. I
> will be testing the attached patch.

please use better version of the patch (attached).

> Regards,
>
>   Francesco

-- 
Alex.

--Boundary-00=_+mVAEl5znc2x92u
Content-Type: text/x-diff;
  charset="iso-8859-15";
  name="reiser4-unix_file_write-get_exclusive_access-carefully.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="reiser4-unix_file_write-get_exclusive_access-carefully.diff"

 fs/reiser4/plugin/file/file.c            |    9 +++++----
 fs/reiser4/plugin/item/extent_file_ops.c |    2 +-
 fs/reiser4/vfs_ops.c                     |    5 ++++-
 3 files changed, 10 insertions(+), 6 deletions(-)

Index: linux-2.6.16-rc3-mm1/fs/reiser4/plugin/file/file.c
===================================================================
--- linux-2.6.16-rc3-mm1.orig/fs/reiser4/plugin/file/file.c
+++ linux-2.6.16-rc3-mm1/fs/reiser4/plugin/file/file.c
@@ -2454,6 +2454,7 @@ ssize_t write_unix_file(struct file *fil
 
 	if (inode_get_flag(inode, REISER4_PART_CONV)) {
 		/* we can not currently write to a file which is partially converted */
+		txn_restart(ctx);
 		get_exclusive_access(uf_info);
 		result = finish_conversion(inode);
 		drop_exclusive_access(uf_info);
@@ -2481,6 +2482,7 @@ ssize_t write_unix_file(struct file *fil
 
 		   3) convert file to extents to not enter here on each write
 		   to mmaped file */
+		txn_restart(ctx);
 		get_exclusive_access(uf_info);
 		result = check_pages_unix_file(file, inode);
 		drop_exclusive_access(uf_info);
@@ -2535,14 +2537,13 @@ ssize_t write_unix_file(struct file *fil
 	while (left > 0) {
 		int excl = 0;
 
-		/* getting exclusive or not exclusive access requires no
-		   transaction open */
-		txn_restart_current();
-
 		/* faultin user page */
 		fault_in_pages_readable(buf,
 					left > PAGE_CACHE_SIZE ? PAGE_CACHE_SIZE : left);
 
+		/* getting exclusive or not exclusive access requires no
+		   transaction open */
+		txn_restart(ctx);
 		if (inode->i_size == 0) {
 			get_exclusive_access(uf_info);
 			excl = 1;
Index: linux-2.6.16-rc3-mm1/fs/reiser4/vfs_ops.c
===================================================================
--- linux-2.6.16-rc3-mm1.orig/fs/reiser4/vfs_ops.c
+++ linux-2.6.16-rc3-mm1/fs/reiser4/vfs_ops.c
@@ -209,8 +209,11 @@ void writeout(struct super_block *sb, st
 
 void reiser4_throttle_write(struct inode *inode)
 {
-	txn_restart_current();
+	reiser4_context *ctx = get_current_context();
+
+	txn_restart(ctx);
 	balance_dirty_pages_ratelimited(inode->i_mapping);
+	txn_restart(ctx);
 }
 
 const char *REISER4_SUPER_MAGIC_STRING = "ReIsEr4";
Index: linux-2.6.16-rc3-mm1/fs/reiser4/plugin/item/extent_file_ops.c
===================================================================
--- linux-2.6.16-rc3-mm1.orig/fs/reiser4/plugin/item/extent_file_ops.c
+++ linux-2.6.16-rc3-mm1/fs/reiser4/plugin/item/extent_file_ops.c
@@ -803,7 +803,7 @@ extent_balance_dirty_pages(struct inode 
 		fault_in_pages_readable(f->data,
 					f->length > PAGE_CACHE_SIZE ?
 					PAGE_CACHE_SIZE : f->length);
-
+		txn_restart_current();
 		if (excl)
 			get_exclusive_access(uf_info);
 		else

--Boundary-00=_+mVAEl5znc2x92u--
