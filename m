From: Andrew Wade <mscibing@yahoo.com>
Subject: crash while processing safelinks caused by i_count==1
Date: Mon, 28 Mar 2005 22:18:04 -0500 (EST)
Message-ID: <20050329031805.64398.qmail@web50207.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23715-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello,
I have a reiser4 partion I can't mount.

fsck.reiser4 (1.0.4) gives it a clean bill of health.

Attempting to mount results in:
(linux-2.6.12-rc1-mm3)

ef_hash_table: 8192 buckets
z_hash_table: 8192 buckets
z_hash_table: 8192 buckets
j_hash_table: 16384 buckets
loading reiser4 bitmap......done (7395 jiffies)
d_cursor_hash_table: 256 buckets
reiser4[mount(212)]: reiser4_iget
(fs/reiser4/inode.c:478)[nikita-3559]:
code: -2 at fs/reiser4/tree_walk.c:189
WARNING: Unlinked inode found: 1030481

Unable to handle kernel paging request at virtual address
6b6b6ccb
 printing eip:
c0238c9a
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
CPU:    0
EIP:    0060:[<c0238c9a>]    Not tainted VLI
EFLAGS: 00010202   (2.6.12-rc1-mm3)
EIP is at is_reiser4_super+0xa/0x30
eax: 6b6b6b6b   ebx: 6b6b6b6b   ecx: 00000000   edx: 6b6b6b6b
esi: de905380   edi: 0000000a   ebp: c0584100   esp: de8ebc48
ds: 007b   es: 007b   ss: 0068
Process mount (pid: 212, threadinfo=de8ea000 task=c1631a30)
Stack: c0238be7 6b6b6b6b de905380 de905380 c0171722 de905380
c0636f60 00000000
       c0257db0 6b6b6b6b 00000000 0000000a c0584100 c1632888
c1627dcc 000fb951
       00000000 00000000 de8ebcbc dfbc3078 de8ebd4c c0257fa7
dfbc3078 00000000
Call Trace:
 [<c0238be7>] get_tree+0x17/0xc0
 [<c0171722>] iput+0x62/0x80
 [<c0257db0>] process_safelink+0xb0/0x210
 [<c0257fa7>] process_safelinks+0x97/0x130
 [<c02572bf>] _init_safelink+0xf/0x20
 [<c0257384>] reiser4_fill_super+0x44/0xc0
 [<c015cc5f>] get_sb_bdev+0x10f/0x160
 [<c0172d92>] alloc_vfsmnt+0x92/0xe0
 [<c02476ff>] reiser4_get_sb+0x2f/0x40
 [<c0257340>] reiser4_fill_super+0x0/0xc0
 [<c015cec7>] do_kern_mount+0x57/0xe0
 [<c01740ec>] do_new_mount+0x9c/0xe0
 [<c0174867>] do_mount+0x147/0x1a0
 [<c01746c3>] copy_mount_options+0x63/0xc0
 [<c04b127e>] lock_kernel+0x2e/0x50
 [<c0174d2f>] sys_mount+0x9f/0xe0
 [<c0102c75>] syscall_call+0x7/0xb

I have determined that despite the Call Trace, the iput() in
process_safelink() does in fact return, but it decrements
i_count to 0 and thus deletes the inode early, leading to a
crash soon after.

I am new at kernel hacking, and have not traced the problem
further back yet.


______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
