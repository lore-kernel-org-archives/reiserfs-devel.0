From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Reproducible reiser4 bug with 2.6.16.2 patch on tail_conversion.c:80
Date: Thu, 11 May 2006 11:24:53 +0400
Message-ID: <200605111124.53927.zam@namesys.com>
References: <4461C6D4.9050705@ee.oulu.fi>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_FbuYEKWWhFAJ/IU"
Return-path: <reiserfs-list-return-28602-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4461C6D4.9050705@ee.oulu.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Timo Kokkonen <kaapeli@ee.oulu.fi>

--Boundary-00=_FbuYEKWWhFAJ/IU
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello

please check whether the attached patch helps.

On Wednesday 10 May 2006 14:56, Timo Kokkonen wrote:
> Hello,
>
> I was able to produce this bug on two different computers running the
> same kernel version and same patches and same task. Each time I run
> dispatch-conf (I'm running on gentoo) to update the config files on
> /etc, it gives the following output:
>
> RCS file: /etc/config-archive/usr/lib/X11/xkb/xkbcomp,v
> 1.1 locked
> ci: RCS file /etc/config-archive/usr/lib/X11/xkb/xkbcomp,v is in use
> /etc/config-archive/usr/lib/X11/xkb/xkbcomp,v  -->
> /etc/config-archive/usr/lib/X11/xkb/xkbcomp
> revision 1.1.1.1
> writable /etc/config-archive/usr/lib/X11/xkb/xkbcomp exists; remove
> it? [ny](n):
>
>
> And right after that I can see this message in kernel log:
>
> May 10 11:26:32 kaatokone2 [4296234.613000] ------------[ cut here
> ]------------
> May 10 11:26:32 kaatokone2 [4296234.613000] kernel BUG at
> fs/reiser4/plugin/file/tail_conversion.c:80!
> May 10 11:26:32 kaatokone2 [4296234.613000] invalid opcode: 0000 [#1]
> May 10 11:26:32 kaatokone2 [4296234.613000] PREEMPT
> May 10 11:26:32 kaatokone2 [4296234.613000] Modules linked in:
> w83627hf w83781d hwmon_vid eeprom i2c_isa
> May 10 11:26:32 kaatokone2 [4296234.613000] CPU:    0
> May 10 11:26:32 kaatokone2 [4296234.613000] EIP:    0060:[<b019ec1f>]
>   Not tainted VLI
> May 10 11:26:32 kaatokone2 [4296234.613000] EFLAGS: 00210286
> (2.6.16-gentoo-r7 #1)
> May 10 11:26:32 kaatokone2 [4296234.613000] EIP is at
> get_nonexclusive_access+0x23/0x36
> May 10 11:26:32 kaatokone2 [4296234.613000] eax: ef7644c4   ebx:
> 00000000   ecx: a7e8b000   edx: e5d0c414
> May 10 11:26:32 kaatokone2 [4296234.613000] esi: e5d0c414   edi:
> e5d0c46c   ebp: e5d59e9c   esp: e5d59dc4
> May 10 11:26:32 kaatokone2 [4296234.613000] ds: 007b   es: 007b   ss:
> 0068 May 10 11:26:32 kaatokone2 [4296234.613000] Process rcs (pid:
> 8422, threadinfo=e5d58000 task=e5cf2ab0)
> May 10 11:26:32 kaatokone2 [4296234.613000] Stack: <0>b01b18e9
> e5d0c414 00000000 00000000 34000000 e5d58000 b16ba260 00000000
> May 10 11:26:32 kaatokone2 [4296234.613000]        e5eb8780 b01b1ccd
> e5d0c46c e5d59e9c eed8e8c0 eed8e8d0 eed8e8d0 00000002
> May 10 11:26:32 kaatokone2 [4296234.613000]        00000001 e5d59e9c
> 00001000 00000001 efeea800 efded414 00391f78 00000000
> May 10 11:26:32 kaatokone2 [4296234.613000] Call Trace:
> May 10 11:26:32 kaatokone2 [4296234.613000]  [<b01b18e9>]
> extent_balance_dirty_pages+0x13a/0x145
> May 10 11:26:32 kaatokone2 [4296234.613000]  [<b01b1ccd>]
> extent_write_flow+0x3d9/0x4e7
> May 10 11:26:32 kaatokone2 [4296234.613000]  [<b01b1f0a>]
> write_extent+0x0/0x36
> May 10 11:26:32 kaatokone2 [4296234.613000]  [<b019dc17>]
> append_and_or_overwrite+0x24f/0x2fd
> May 10 11:26:32 kaatokone2 [4296234.613000]  [<b019dd0c>]
> write_flow+0x47/0x50
> May 10 11:26:32 kaatokone2 [4296234.613000]  [<b019de92>]
> write_file+0x5c/0x7a
> May 10 11:26:32 kaatokone2 [4296234.613000]  [<b019e177>]
> write_unix_file+0x2c7/0x444
> May 10 11:26:32 kaatokone2 [4296234.613000]  [<b014bd9e>]
> vfs_write+0x87/0x11b
> May 10 11:26:32 kaatokone2 [4296234.613000]  [<b014bed0>]
> sys_write+0x3b/0x63
> May 10 11:26:32 kaatokone2 [4296234.613000]  [<b0102a93>]
> sysenter_past_esp+0x54/0x75
> May 10 11:26:32 kaatokone2 [4296234.613000] Code: 0f 85 b5 0d 00 00
> c3 c3 83 7c 24 08 00 8b 54 24 04 75 20 b8 00 e0 ff ff 21 e0 8b 00 8b
> 80 b4 04 00 00 8b 40 40 83 78 08 00 74 08 <0f> 0b 50 00 ba cf 43 b0
> 89 d0 ff 00 0f 88 92 0d 00 00 c3 8b 54
> May 10 11:26:32 kaatokone2 [4296234.613000] 
> <4><4>reiser4[rcs(8422)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2670)[vs-44]: May 10 11:26:32
> kaatokone2 [4296234.614000] WARNING: out of memory? May 10 11:26:32
> kaatokone2 [4296234.614000] <4>reiser4[rcs(8422)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2670)[vs-44]: May 10 11:26:32
> kaatokone2 [4296234.614000] WARNING: out of memory? May 10 11:26:32
> kaatokone2 [4296234.614000] <4>reiser4[rcs(8422)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2670)[vs-44]: May 10 11:26:32
> kaatokone2 [4296234.614000] WARNING: out of memory? May 10 11:26:32
> kaatokone2 [4296234.614000] <4>reiser4[rcs(8422)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2670)[vs-44]: May 10 11:26:32
> kaatokone2 [4296234.614000] WARNING: out of memory? May 10 11:26:32
> kaatokone2 [4296234.614000] <4>reiser4[rcs(8422)]: release_unix_file
> (fs/reiser4/plugin/file/file.c:2670)[vs-44]: May 10 11:26:32
> kaatokone2 [4296234.614000] WARNING: out of memory?
>
>
> After a reboot and running dispatch-conf again I get the exact same
> error message again. I got this same bug on the another computer
> aswell, during exact same conditions (running dispatch-conf, it even
> complained about the same filename). Running reiser4.fsck didn't
> reveal any problems at all on that computer. Booting with 2.6.15.1
> (with gentoo-sources-2.6.15-r1 patches) and reiser4-2.6.15.1 didn't
> crash and dispatch-conf finished updating the files normally.
>
> So, now I have this computer that I can make to crash every time by
> running dispatch-conf. I can keep the computer intact and run further
> diagnostics on it, if necessary. If there is any other info you need
> to know, let me know what you want and I try to provide the info you
> need to get this solved.
>
>
> Timo Kokkonen
>
> !DSPAM:4461c711169651806120903!

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
