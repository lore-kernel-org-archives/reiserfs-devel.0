From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Oops with large file in 2.6.8, reiser 3.6.13
Date: Sun, 24 Oct 2004 12:37:32 +0400
Message-ID: <20041024083732.GA25932@backtop.namesys.com>
References: <41750864.3060600@liv.ac.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <41750864.3060600@liv.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Gregory <R.Gregory@liverpool.ac.uk>
Cc: reiserfs-list@namesys.com

Hello,

please try the following patch (it is for 2.6.6, 
but i expect it to work with 2.6.8):
=========================================
--- linux-2.6.6/fs/reiserfs/stree.c.orig	2004-10-23 16:43:11.412335592 +0400
+++ linux-2.6.6/fs/reiserfs/stree.c	2004-10-23 17:09:36.983292168 +0400
@@ -1721,8 +1721,14 @@ void reiserfs_do_truncate (struct reiser
     set_cpu_key_k_offset (&s_item_key, n_file_size);
 
     do  {
+	loff_t to_size;
+
+	to_size = n_file_size - (p_s_inode->i_sb->s_blocksize * 2);
+	if (to_size < n_new_file_size)
+		to_size = n_new_file_size;
+
 	/* Cut or delete file item. */
-	n_deleted = reiserfs_cut_from_item(th, &s_search_path, &s_item_key, p_s_inode,  page, n_new_file_size);
+	n_deleted = reiserfs_cut_from_item(th, &s_search_path, &s_item_key, p_s_inode,  page, to_size);
 	if (n_deleted < 0) {
 	    reiserfs_warning ("vs-5665: reiserfs_do_truncate: reiserfs_cut_from_item failed");
 	    reiserfs_check_path(&s_search_path) ;
@@ -1731,7 +1737,7 @@ void reiserfs_do_truncate (struct reiser
 
 	RFALSE( n_deleted > n_file_size,
 		"PAP-5670: reiserfs_cut_from_item: too many bytes deleted: deleted %d, file_size %lu, item_key %K",
-		n_deleted, n_file_size, &s_item_key);
+		n_deleted, to_size, &s_item_key);
 
 	/* Change key to search the last file item. */
 	n_file_size -= n_deleted;
@@ -1747,7 +1753,7 @@ void reiserfs_do_truncate (struct reiser
 	** sure the file is consistent before ending the current trans
 	** and starting a new one
 	*/
-        if (journal_transaction_should_end(th, th->t_blocks_allocated)) {
+        if (1 || journal_transaction_should_end(th, th->t_blocks_allocated)) {
 	  int orig_len_alloc = th->t_blocks_allocated ;
 	  decrement_counters_in_path(&s_search_path) ;
 
=========================================
On Tue, Oct 19, 2004 at 01:28:20PM +0100, Richard Gregory wrote:
> Have managed to create an Oops in the reiser code, dmesg output below.
> This was on a software raid5 setup, with 8 160Gb disks, creating around 
> 1.1Tb of storage. There was around 400Gb of content on this filesystem, 
> then as an over night test, /dev/zero was dd'ed to a file on the 
> filesystem, creating an approx 720Gb file and filling the filesystem.
> 
> The problem came when I tried to delete it, rm'ing it caused an Oops in 
> the reiser code. The system was rebooted, but mounting the filesystem 
> gave the oops below.
> 
> Am currently running reiserfsck --check to see if this file can be 
> removed some other way, otherwise, it will mean a very long reformat and 
> copy operation.
> 
> Something else, this filesystem had recently been resized from 960Gb to 
> the 1.1Tb with the addition of the eighth drive. This is on a FC2 based 
> install, Duron 833, 256 meg.
> 
> 
> Richard
> 
> 
> ReiserFS: md0: found reiserfs format "3.6" with standard journal
> ReiserFS: md0: using ordered data mode
> ReiserFS: md0: journal params: device md0, size 8192, journal first 
> block 18, max trans len 1024, max batch 900, max commit age 30, max 
> trans age 30
> ReiserFS: md0: checking transaction log (md0)
> ReiserFS: md0: replayed 3 transactions in 18 seconds
> ReiserFS: md0: Using r5 hash to sort names
> ReiserFS: md0: Removing [2 1282214 0x0 SD]..<0>REISERFS: panic (device 
> md0): journal-1413: journal_mark_dirty: j_len (1024) is too big
> 
> ------------[ cut here ]------------
> kernel BUG at fs/reiserfs/prints.c:362!
> invalid operand: 0000 [#1]
> Modules linked in: raid5 xor iteraid sd_mod autofs4 r8169 sg scsi_mod 
> dm_mod uhci_hcd button battery asus_acpi ac ext3 jbd
> CPU:    0
> EIP:    0060:[<c019416a>]    Not tainted
> EFLAGS: 00010292   (2.6.8-1.521custom)
> EIP is at reiserfs_panic+0x4a/0x70
> eax: 0000005c   ebx: c03422a8   ecx: c0380f78   edx: c0380f78
> esi: c13b1e00   edi: c13b1f2c   ebp: c13b1e00   esp: cc852950
> ds: 007b   es: 007b   ss: 0068
> 
> Process mount (pid: 1204, threadinfo=cc852000 task=cccb2310)
> Stack: c0347a48 c13b1f2c c0419c60 cc852d1c ffffffff ca5a59a0 c01a28f8 
> c13b1e00
>        c03498dc 00000400 c13b1e00 c019e589 000017bc d08f50e4 00007fff 
> c13b1e00
>        00000000 00007fff c13b1e00 000017bc 0bde7fff c017e384 cc852a20 
> c95ee018
> Call Trace:
>  [<c01a28f8>] journal_mark_dirty+0x288/0x2a0
>  [<c019e589>] get_bitmap_node+0x39/0xa0
>  [<c017e384>] _reiserfs_free_block+0xf4/0x180
>  [<c019ac35>] prepare_for_delete_or_cut+0x515/0x710
>  [<c0190d61>] unfix_nodes+0x61/0x140
>  [<c019bbbc>] reiserfs_cut_from_item+0xac/0x4f0
>  [<c019c2fc>] reiserfs_do_truncate+0x26c/0x520
>  [<c019b6bb>] reiserfs_delete_object+0x2b/0x60
>  [<c0185777>] reiserfs_delete_inode+0xb7/0x100
>  [<c011a587>] printk+0xf7/0x140
>  [<c01856c0>] reiserfs_delete_inode+0x0/0x100
>  [<c015eb04>] generic_delete_inode+0x74/0xf0
>  [<c015ecdc>] iput+0x4c/0x60
>  [<c01912f5>] finish_unfinished+0x1c5/0x310
>  [<c0154e09>] __lookup_hash+0x89/0xb0
>  [<c01a29a6>] journal_end+0x96/0xc0
>  [<c01931ba>] reiserfs_fill_super+0x4da/0x640
>  [<c0187ef0>] reiserfs_init_locked_inode+0x0/0x10
>  [<c020e40f>] snprintf+0x1f/0x30
>  [<c014e67f>] get_sb_bdev+0xef/0x120
>  [<c019339b>] get_super_block+0x1b/0x40
>  [<c0192ce0>] reiserfs_fill_super+0x0/0x640
>  [<c014e871>] do_kern_mount+0x51/0xe0
>  [<c016127a>] do_new_mount+0x8a/0xc0
>  [<c016182f>] do_mount+0x13f/0x180
>  [<c020f50a>] __copy_from_user_ll+0x3a/0x70
>  [<c016167c>] copy_mount_options+0x6c/0xe0
>  [<c0161b9e>] sys_mount+0x8e/0xf0
>  [<c032ce0f>] syscall_call+0x7/0xb
> Code: 0f 0b 6a 01 ce 27 34 c0 85 f6 c7 44 24 08 60 9c 41 c0 c7 04

-- 
Alex.
