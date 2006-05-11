From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:80
Date: Thu, 11 May 2006 16:23:57 +0400
Message-ID: <200605111623.57751.zam@namesys.com>
References: <b5d90b2a0605061419o66bbefa7r8f90d728afe2e4bf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_dzyYEizmcqLwx21"
Return-path: <reiserfs-list-return-28603-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b5d90b2a0605061419o66bbefa7r8f90d728afe2e4bf@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Alexey Polyakov <alexey.polyakov@gmail.com>

--Boundary-00=_dzyYEizmcqLwx21
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

please apply the attached patch.

On Sunday 07 May 2006 01:19, Alexey Polyakov wrote:
> Hi!
> I have two servers running reiser4 as root and data partitions.
> Both are using 2.6.15.x kernels with reiser4-for-2.6.15-1.patch.
> One is i386 UP with md over SATA, another is x86_64 SMP with i2o over
> hardware raid.
> I tried upgrading kernels on both servers to 2.6.16-cks9 (thats
> basically 2.6.16.12 with some non-io related patches applied).
> Both give me the same kind of error a few minutes after boot (during
> intensive io):
>
> May  4 14:12:12 titanic kernel: ----------- [cut here ] ---------
> [please bite here ] ---------
> May  4 14:12:21 titanic kernel: Kernel BUG at
> fs/reiser4/plugin/file/tail_conversion.c:80
> May  4 14:12:21 titanic kernel: invalid opcode: 0000 [1] SMP
> May  4 14:12:21 titanic kernel: CPU 3
> May  4 14:12:21 titanic kernel: Modules linked in:
> May  4 14:12:21 titanic kernel: Pid: 2723, comm: ci Not tainted
> 2.6.16-cks9 #1 May  4 14:12:21 titanic kernel: RIP:
> 0010:[<ffffffff80210f73>]
> <ffffffff80210f73>{get_nonexclusive_access+35}
> May  4 14:12:22 titanic kernel: RSP: 0018:ffff8100f0d6dc88  EFLAGS:
> 00010286 May  4 14:12:32 titanic kernel: RAX: ffff8101d106bd40 RBX:
> ffff8101c7c740f8 RCX: 00002b4bc74f2000
> May  4 14:12:49 titanic kernel: RDX: 0000000000000000 RSI:
> 0000000000000000 RDI: ffff8101c7c740f8
> May  4 14:12:49 titanic kernel: RBP: 0000000000000000 R08:
> ffff810037e05680 R09: 0000000000000000
> May  4 14:12:56 titanic kernel: R10: 0000000000000000 R11:
> 0000000000000000 R12: ffff8101c4ca2080
> May  4 14:13:03 titanic kernel: R13: ffff8100f0d6dde8 R14:
> ffff8101c7c74198 R15: ffff8101debd4200
> May  4 14:13:03 titanic kernel: FS:  00002b4bc73f1b00(0000)
> GS:ffff8101045370c0(0000) knlGS:0000000000000000
> May  4 14:13:03 titanic kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 000000008005003b
> May  4 14:13:03 titanic kernel: CR2: 00000000005caff0 CR3:
> 00000000f25b1000 CR4: 00000000000006e0
> May  4 14:13:14 titanic kernel: Process ci (pid: 2723, threadinfo
> ffff8100f0d6c000, task ffff81000c0ad080)
> May  4 14:13:17 titanic kernel: Stack: ffff8101c7c740f8
> ffffffff8022704b ffff8101e07dd928 ffff8101d106bd40
> May  4 14:13:17 titanic kernel:        ffff8101fee3a8f0
> 000000008038fd89 0000000100000000 ffff8101ffcbe020
> May  4 14:13:17 titanic kernel:        000000000023230d
> ffff8101ddabc6d0 May  4 14:13:17 titanic kernel: Call Trace:
> <ffffffff8022704b>{write_extent+1595}
> <ffffffff802294b1>{item_length_by_coord+17}
> May  4 14:13:17 titanic kernel:
> <ffffffff802244a9>{nr_units_extent+9}
> <ffffffff80225df8>{init_coord_extension_extent+120}
> May  4 14:13:17 titanic kernel:
> <ffffffff8020deb6>{find_file_item+182}
> <ffffffff801f25eb>{reiser4_grab+155}
> May  4 14:13:20 titanic kernel:
> <ffffffff80226a10>{write_extent+0} <ffffffff8020f8e5>{write_flow+709}
> May  4 14:13:20 titanic kernel:
> <ffffffff8010b7f1>{error_exit+0} <ffffffff8038d4a2>{__down_read+18}
> May  4 14:13:20 titanic kernel:
> <ffffffff8021030b>{write_unix_file+923}
> <ffffffff80178dac>{vfs_write+236}
> May  4 14:13:20 titanic kernel:
> <ffffffff80178f53>{sys_write+83} <ffffffff8010aaf6>{system_call+126}
> May  4 14:13:20 titanic kernel:
> May  4 14:13:20 titanic kernel: Code: 0f 0b 68 b0 c8 3b 80 c2 50 00
> 66 66 90 e8 3b b6 17 00 48 89
> May  4 14:13:21 titanic kernel: RIP
> <ffffffff80210f73>{get_nonexclusive_access+35} RSP <ffff8100f0d6dc88>
> May  4 14:13:21 titanic kernel:  <4><4>reiser4[ci(2723)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> May  4 14:13:21 titanic kernel: WARNING: out of memory?
> May  4 14:13:21 titanic kernel: <4>reiser4[ci(2723)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> May  4 14:13:21 titanic kernel: WARNING: out of memory?
> May  4 14:13:21 titanic kernel: <4>reiser4[ci(2723)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> May  4 14:13:21 titanic kernel: WARNING: out of memory?
> May  4 14:13:21 titanic kernel: <4>reiser4[ci(2723)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> May  4 14:13:22 titanic kernel: WARNING: out of memory?
> May  4 14:13:23 titanic kernel: <4>reiser4[ci(2723)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> May  4 14:13:25 titanic kernel: WARNING: out of memory?
> May  4 14:13:25 titanic kernel: <4>reiser4[ci(2723)]:
> release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
> May  4 14:13:25 titanic kernel: WARNING: out of memory?
> May  4 14:13:25 titanic kernel: ----------- [cut here ] ---------
> [please bite here ] ---------
>
> After that happens, processes get stuck in D state, and only hard
> reboot helps. Is there any patches that might help with this issue?
> Should I provide any additional information to help with this bug?
>
> Thanks.
>
> --
> Alexey Polyakov
>
> !DSPAM:445d132a126701804284693!

-- 
Alex.

--Boundary-00=_dzyYEizmcqLwx21
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
 

--Boundary-00=_dzyYEizmcqLwx21--
