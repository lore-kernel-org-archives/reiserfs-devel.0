From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Recent patch frenzy, conflicts and Oopses
Date: Mon, 15 May 2006 15:04:50 +0200
Message-ID: <20060515130450.GB8977@zeus.uziel.local>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi guys,

as I am heavily using reiser4 for some time now on my stable machine, I
keep a git tree with vanilla -stable and reiser4 since -mm has sometimes
been too unreliable. Lurking on this list I collected some patches, of
which two seem to collide. The first one fixes a nasty "out of memory?"
Oops for me and maybe others, and the second one was posted as a
response to other Oopses on the list.

Since I reversed the first one in order to apply the second one,
thinking (wrongly) that this one should be a better fix for the same issues and
maybe more, I have my old pal out of memory back. Maybe the two should
be merged in a compatible way, and a new patch against 2.6.16-stable be
put on the namesys ftp server?

Anyway, here come the patches in question:

From: Alexander Zarochentsev <zam@namesys.com>
To: reiserfs-list@namesys.com
Subject: Re: "warning("vs-44", "out of memory?")"
Date: Wed, 12 Apr 2006 14:26:59 +0400

On Wednesday 12 April 2006 13:06, Alexander Zarochentsev wrote:
> Hello
>
> On Wednesday 12 April 2006 11:42, Roy Lanek wrote:
> > I have managed to save a copy of my
> > /var/log/socklog-klog/others/current
> > before the next complete freezing happened.
>
> Please use the latest reiser4 patch reiser4-for-2.6.16-2 from
> ftp.namesys.com.

and apply the following patch:

Index: linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/extent_file_ops.c
===================================================================
--- linux-2.6.17-rc1-mm1.orig/fs/reiser4/plugin/item/extent_file_ops.c
+++ linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/extent_file_ops.c
@@ -807,7 +807,7 @@ extent_balance_dirty_pages(struct inode 
 		if (excl)
 			get_exclusive_access(uf_info);
 		else
-			get_nonexclusive_access(uf_info, 0);
+			get_nonexclusive_access(uf_info, 1);
 	}
 	return 0;
 }
Index: linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/tail.c
===================================================================
--- linux-2.6.17-rc1-mm1.orig/fs/reiser4/plugin/item/tail.c
+++ linux-2.6.17-rc1-mm1/fs/reiser4/plugin/item/tail.c
@@ -510,7 +510,7 @@ tail_balance_dirty_pages(struct address_
 		if (excl)
 			get_exclusive_access(uf_info);
 		else
-			get_nonexclusive_access(uf_info, 0);
+			get_nonexclusive_access(uf_info, 1);
 	}
 	return 0;
 }


This one helped me a lot. The second one brought older problems back,
but may have fixed others for some people on this list. It seems to
remove the second argument to get_nonexclusive_access(), though:

From: Alexander Zarochentsev <zam@namesys.com>
To: reiserfs-list@namesys.com
Subject: Re: Reproducible reiser4 bug with 2.6.16.2 patch on tail_conversion.c:80
Date: Thu, 11 May 2006 11:24:53 +0400

--Boundary-00=_FbuYEKWWhFAJ/IU
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello

[original message snipped]

please check whether the attached patch helps.

-- 
Alex.

--Boundary-00=_FbuYEKWWhFAJ/IU
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiser4-remove-atom_may_exists-from-get_nea.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="reiser4-remove-atom_may_exists-from-get_nea.diff"

 fs/reiser4/plugin/file/file.c            |   17 ++++++++---------
 fs/reiser4/plugin/file/file.h            |    2 +-
 fs/reiser4/plugin/file/funcs.h           |    5 -----
 fs/reiser4/plugin/file/tail_conversion.c |   12 +++---------
 fs/reiser4/plugin/item/extent_file_ops.c |    3 ++-
 fs/reiser4/plugin/item/tail.c            |    3 ++-
 6 files changed, 16 insertions(+), 26 deletions(-)

Index: linux-2.6.17-rc3-mm1/fs/reiser4/plugin/item/extent_file_ops.c
===================================================================
--- linux-2.6.17-rc3-mm1.orig/fs/reiser4/plugin/item/extent_file_ops.c
+++ linux-2.6.17-rc3-mm1/fs/reiser4/plugin/item/extent_file_ops.c
@@ -804,10 +804,11 @@ extent_balance_dirty_pages(struct inode 
 					f->length > PAGE_CACHE_SIZE ?
 					PAGE_CACHE_SIZE : f->length);
 
+		txn_restart_current();
 		if (excl)
 			get_exclusive_access(uf_info);
 		else
-			get_nonexclusive_access(uf_info, 0);
+			get_nonexclusive_access(uf_info);
 	}
 	return 0;
 }
Index: linux-2.6.17-rc3-mm1/fs/reiser4/plugin/item/tail.c
===================================================================
--- linux-2.6.17-rc3-mm1.orig/fs/reiser4/plugin/item/tail.c
+++ linux-2.6.17-rc3-mm1/fs/reiser4/plugin/item/tail.c
@@ -507,10 +507,11 @@ tail_balance_dirty_pages(struct address_
 		} else
 			drop_nonexclusive_access(uf_info);
 		reiser4_throttle_write(inode);
+		txn_restart_current();
 		if (excl)
 			get_exclusive_access(uf_info);
 		else
-			get_nonexclusive_access(uf_info, 0);
+			get_nonexclusive_access(uf_info);
 	}
 	return 0;
 }
Index: linux-2.6.17-rc3-mm1/fs/reiser4/plugin/file/file.c
===================================================================
--- linux-2.6.17-rc3-mm1.orig/fs/reiser4/plugin/file/file.c
+++ linux-2.6.17-rc3-mm1/fs/reiser4/plugin/file/file.c
@@ -1597,7 +1597,7 @@ writepages_unix_file(struct address_spac
 				break;
 			}
 		} else
-			get_nonexclusive_access(uf_info, 0);
+			get_nonexclusive_access(uf_info);
 
 		while (to_capture > 0) {
 			pgoff_t start;
@@ -2023,7 +2023,7 @@ read_unix_file(struct file *file, char _
 	while (left > 0) {
 		txn_restart_current();
 
-		get_nonexclusive_access(uf_info, 0);
+		get_nonexclusive_access(uf_info);
 
 		size = i_size_read(inode);
 		if (*off >= size) {
@@ -2177,7 +2177,7 @@ append_and_or_overwrite(hint_t * hint, s
 				if (!exclusive) {
 					drop_exclusive_access(uf_info);
 					txn_restart_current();
-					get_nonexclusive_access(uf_info, 0);
+					get_nonexclusive_access(uf_info);
 				}
 				if (result)
 					return result;
@@ -2531,19 +2531,18 @@ ssize_t write_unix_file(struct file *fil
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
+		txn_restart_current();
 
 		if (inode->i_size == 0) {
 			get_exclusive_access(uf_info);
 			excl = 1;
 		} else {
-			get_nonexclusive_access(uf_info, 0);
+			get_nonexclusive_access(uf_info);
 			excl = 0;
 		}
 
@@ -3015,7 +3014,7 @@ sendfile_unix_file(struct file *file, lo
 	mutex_unlock(&inode->i_mutex);
 
 	uf_info = unix_file_inode_data(inode);
-	get_nonexclusive_access(uf_info, 0);
+	get_nonexclusive_access(uf_info);
 	result = generic_file_sendfile(file, ppos, count, actor, target);
 	drop_nonexclusive_access(uf_info);
  error:
Index: linux-2.6.17-rc3-mm1/fs/reiser4/plugin/file/file.h
===================================================================
--- linux-2.6.17-rc3-mm1.orig/fs/reiser4/plugin/file/file.h
+++ linux-2.6.17-rc3-mm1/fs/reiser4/plugin/file/file.h
@@ -104,7 +104,7 @@ typedef struct unix_file_info {
 struct unix_file_info *unix_file_inode_data(const struct inode *inode);
 void get_exclusive_access(unix_file_info_t *);
 void drop_exclusive_access(unix_file_info_t *);
-void get_nonexclusive_access(unix_file_info_t *, int);
+void get_nonexclusive_access(unix_file_info_t *);
 void drop_nonexclusive_access(unix_file_info_t *);
 int try_to_get_nonexclusive_access(unix_file_info_t *);
 
Index: linux-2.6.17-rc3-mm1/fs/reiser4/plugin/file/funcs.h
===================================================================
--- linux-2.6.17-rc3-mm1.orig/fs/reiser4/plugin/file/funcs.h
+++ linux-2.6.17-rc3-mm1/fs/reiser4/plugin/file/funcs.h
@@ -1,11 +1,6 @@
 /* Copyright 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by reiser4/README */
 
 /* this prototypes functions used by both file.c and tail_conversion.c */
-void get_exclusive_access(unix_file_info_t *);
-void drop_exclusive_access(unix_file_info_t *);
-void get_nonexclusive_access(unix_file_info_t *, int);
-void drop_nonexclusive_access(unix_file_info_t *);
-
 int tail2extent(unix_file_info_t *);
 int extent2tail(unix_file_info_t *);
 int finish_conversion(struct inode *inode);
Index: linux-2.6.17-rc3-mm1/fs/reiser4/plugin/file/tail_conversion.c
===================================================================
--- linux-2.6.17-rc3-mm1.orig/fs/reiser4/plugin/file/tail_conversion.c
+++ linux-2.6.17-rc3-mm1/fs/reiser4/plugin/file/tail_conversion.c
@@ -69,18 +69,12 @@ static void nea_grabbed(unix_file_info_t
  *
  * Nonexclusive access is obtained on a file before read, write, readpage.
  */
-void get_nonexclusive_access(unix_file_info_t *uf_info, int atom_may_exist)
+void get_nonexclusive_access(unix_file_info_t *uf_info)
 {
 	assert("nikita-3029", schedulable());
-	/* unix_file_filemap_nopage may call this when current atom exist already */
-	assert("nikita-3361",
-	       ergo(atom_may_exist == 0,
-		    get_current_context()->trans->atom == NULL));
-	BUG_ON(atom_may_exist == 0
-	       && get_current_context()->trans->atom != NULL);
-
+	assert("nikita-3361", get_current_context()->trans->atom == NULL);
+	BUG_ON(get_current_context()->trans->atom != NULL);
 	down_read(&uf_info->latch);
-
 	nea_grabbed(uf_info);
 }
 

--Boundary-00=_FbuYEKWWhFAJ/IU--


Kind regards,
Chris

