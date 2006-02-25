From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: possible reiser4 bug
Date: Sun, 26 Feb 2006 00:09:35 +0300
Message-ID: <200602260009.36905.zam@namesys.com>
References: <2bbb1c940602232135jff393fbm2175052026237ce9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_QeMAE8o8u4IgyvX"
Return-path: <reiserfs-list-return-28133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2bbb1c940602232135jff393fbm2175052026237ce9@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Alec Burney <madbull@gmail.com>

--Boundary-00=_QeMAE8o8u4IgyvX
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hello,

On Friday 24 February 2006 08:35, Alec Burney wrote:
> i have been experiencing hard locks (preceded by intense 5< load
> averages, disk i/o timeouts, and processes gone astray) that seem to
> be related to a possible bug in reiser4.
> here is the information that i think is important:
>
>  a sample dmesg from right before a hardlock:
> ------------[ cut here ]------------
> kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:29!
> invalid opcode: 0000 [#1]
> SMP
> last sysfs file: /class/vc/vcsa7/dev 
> Modules linked in: snd_rtctimer
> CPU:    0
> EIP:    0060:[<c019c3bb>]    Not tainted VLI
> EFLAGS: 00210282   (2.6.16-rc3-mm1 #1)
> EIP is at get_exclusive_access+0x1b/0x44
> eax: eec1b1ac   ebx: ecda70d8   ecx: ecda7140   edx: 00000000
> esi: addee000   edi: eec1b160   ebp: 00000000   esp: dfd89f38
> ds: 007b   es: 007b   ss: 0068
> Process soffice.bin (pid: 11208, threadinfo=dfd89000 task=e1193a70)
> Stack: <0>00000001 c019b956 c013f613 eecbfb74 e8daa560 00000001
> 00005600 00000000
>        ecda70d8 ecda7140 addee000 ea8ea7c0 00005600 d06d2740 00005600
> ea8ea7c0 c03b0e10 00000000 c014bbf3 dfd89fa4 addee000 ea8ea7c0
> fffffff7 bfb4a870 Call Trace:
>  <c019b956> write_unix_file+0x2a4/0x44b   <c013f613>
> vma_link+0xa2/0xbc <c014bbf3> vfs_write+0xab/0x14c   <c014bd32>
> sys_write+0x3c/0x62 <c01025bf> sysenter_past_esp+0x54/0x75
> Code: 8d 43 10 e8 5c 54 1a 00 e9 f8 fc ff ff 90 90 90 53 89 c3 b8 00
> f0 ff ff 21 e0 8b 00 8b 80 c8 04 00 00 8b 40 48 83 78 0c 00 74 08
> <0f> 0b 1d 00 e0 58 36 c0 e8 28 61 1a 00 ba 01 00 ff ff 89 d8 f0
>

[...]

> my question: can this be fixed, has it been fixed, or can i convert
> this drive online to reiserfs.
> sorry for such a long message, but this is very important to me.
> thank you!

would you please try the attached patch.

-- 
Alex.

--Boundary-00=_QeMAE8o8u4IgyvX
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="reiser4-unix_file_write-get_exclusive_access-carefully.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="reiser4-unix_file_write-get_exclusive_access-carefully.diff"

 fs/reiser4/plugin/file/file.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

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

--Boundary-00=_QeMAE8o8u4IgyvX--
