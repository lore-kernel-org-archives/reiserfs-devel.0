From: Ookhoi <ookhoi@humilis.net>
Subject: oops reiser4, 2.5.60
Date: Fri, 14 Feb 2003 22:16:53 +0100
Message-ID: <20030214221653.H26095@humilis>
References: <15947.44879.855354.614016@laputa.namesys.com> <20030213203235.E17656@humilis> <20030214095359.D10351@namesys.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030214095359.D10351@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: Ookhoi <ookhoi@humilis.net>, Nikita Danilov <Nikita@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

CONFIG_REISER4_FS=y
CONFIG_REISER4_CHECK=y
CONFIG_REISER4_DEBUG=y
CONFIG_REISER4_CHECK_STACK=y
CONFIG_REISER4_DEBUG_MODIFY=y
CONFIG_REISER4_DEBUG_MEMCPY=y
CONFIG_REISER4_DEBUG_NODE=y
CONFIG_REISER4_ZERO_NEW_NODE=y
CONFIG_REISER4_TRACE=y
CONFIG_REISER4_EVENT_LOG=y
CONFIG_REISER4_STATS=y
CONFIG_REISER4_PROF=y
CONFIG_REISER4_DEBUG_OUTPUT=y
# CONFIG_REISER4_NOOPT is not set
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set

2.5.60, reiser4.diff, reiser4-kernel-2.5.60.diff

gcc (GCC) 3.2.3 20030210 (Debian prerelease)
mkfs.reiser4 0.3.0

Please let me know if you need more info.

Create 512MB loop fs, mkfs.reiser4 with no options, mount with no
options:


 reiser4[mount(217)]: reiser4_fill_super (fs/reiser4/vfs_ops.c:2116)[nikita-2372]:
WARNING: Debugging is on. Benchmarking is invalid.
Unable to handle kernel NULL pointer dereference at virtual address 00000000
 printing eip:
c019f70e
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0060:[<c019f70e>]    Not tainted
EFLAGS: 00010292
EIP is at update_prof_trace+0xe/0x100
eax: 00001fd1   ebx: cf4dbc8f   ecx: 00000000   edx: 00000000
esi: cf4cb93a   edi: 00000009   ebp: da63badc   esp: da63baa8
ds: 007b   es: 007b   ss: 0068
Process mount (pid: 217, threadinfo=da63a000 task=db154d40)
Stack: c019f4f3 df8fc000 da70e660 c019f4f3 00001fcf c019f85f c141fe38 c01f9fde 
       00010355 00000000 cf4dbc8f cf4cb93a 00000009 00000000 c01a2977 db5f9b54 
       cf4cb93a 00000009 cf4dbc8f 00000009 00001fcf cf4cb93a 00000009 00001fcf 
Call Trace:
 [<c019f4f3>] check_stack+0xa3/0x180
 [<c019f4f3>] check_stack+0xa3/0x180
 [<c019f85f>] update_prof_cnt+0x5f/0xb0
 [<c01f9fde>] eflush_del+0x1e/0x820
 [<c01a2977>] jload_gfp+0x317/0x9e0
 [<c01db9bc>] load_journal_control_block+0x2c/0x60
 [<c01dbb6a>] init_journal_info+0x7a/0x1c0
 [<c021e0a3>] format40_get_ready+0xa3/0x3d0
 [<c013c4de>] do_no_page+0x1ae/0x390
 [<c0132704>] mempool_free+0x44/0x90
 [<c013329b>] buffered_rmqueue+0xbb/0x150
 [<c01239ca>] update_process_times+0x2a/0x30
 [<c012388b>] update_wall_time+0xb/0x40
 [<c0123b23>] do_timer+0xf3/0x100
 [<c01110f6>] do_timer_interrupt+0xd6/0xf0
 [<c0110dbe>] timer_interrupt+0x5e/0x70
 [<c015f0a5>] inode_init_once+0x15/0x110
 [<c019f4f3>] check_stack+0xa3/0x180
 [<c01f4e78>] init_once+0x48/0xa0
 [<c0135e7b>] cache_init_objs+0x5b/0x70
 [<c013600c>] cache_grow+0x13c/0x230
 [<c01e1f57>] xmemset+0x17/0x20
 [<c01e1f57>] xmemset+0x17/0x20
 [<c01f4fdf>] reiser4_alloc_inode+0x8f/0xf0
 [<c015f012>] alloc_inode+0x122/0x150
 [<c015f9b3>] get_new_inode_fast+0x33/0xe0
 [<c015fcab>] iget_locked+0x4b/0x50
 [<c019f4f3>] check_stack+0xa3/0x180
 [<c01602ba>] wake_up_inode+0xa/0x20
 [<c01f6d0c>] reiser4_fill_super+0x29c/0x8e0
 [<c0235dc4>] sprintf+0x14/0x20
 [<c014f39a>] get_sb_bdev+0xfa/0x140
 [<c01f769e>] reiser4_get_sb+0x1e/0x30
 [<c01f6a70>] reiser4_fill_super+0x0/0x8e0
 [<c014f55f>] do_kern_mount+0x3f/0xb0
 [<c0162bd5>] do_add_mount+0x75/0x160
 [<c0162e98>] do_mount+0x118/0x170
 [<c031ee1f>] sock_i_ino+0x9df/0xf60
 [<c0162d75>] copy_mount_options+0xb5/0xc0
 [<c0163245>] sys_mount+0xa5/0xe0
 [<c010ae47>] syscall_call+0x7/0xb

Code: 8b 02 8b 40 04 89 45 d4 8b 02 8b 00 8b 40 04 89 45 d8 8b 02 
  reiser4[ktxnmgrd:timed(218)]: scan_mgr (fs/reiser4/ktxnmgrd.c:219)[nikita-2456]:
reiser4 panicked cowardly: assertion failed: tree->super != NULL
------------[ cut here ]------------
kernel BUG at fs/reiser4/debug.c:59!
invalid operand: 0000
CPU:    0
EIP:    0060:[<c019f19b>]    Not tainted
EFLAGS: 00010246
EIP is at reiser4_do_panic+0x12b/0x1e0
eax: 00000000   ebx: da702000   ecx: 00000001   edx: 00000000
esi: db5f98b4   edi: c047791c   ebp: da702000   esp: da703ec4
ds: 007b   es: 007b   ss: 0068
Process ktxnmgrd:timed (pid: 218, threadinfo=da702000 task=db154740)
Stack: db5f9020 c01e9f9d c036f180 da703ee8 c01190ce da703f68 00000003 00000001 
       00000000 da702000 00000246 da702000 da703f68 db154740 00000000 00000001 
       db154740 c0119000 da703f68 da703f68 00000000 00000000 00000001 da703f5c 
Call Trace:
 [<c01e9f9d>] scan_mgr+0xcd/0x120
 [<c01190ce>] __wake_up_locked+0xe/0x20
 [<c0119000>] default_wake_function+0x0/0x20
 [<c01e43e9>] kcond_remove+0x19/0x6f
 [<c01e41c7>] kcond_timedwait+0x147/0x1d0
 [<c011869d>] try_to_wake_up+0xfd/0x120
 [<c0119046>] __wake_up_common+0x26/0x50
 [<c01e43b0>] kcond_timeout+0x0/0x20
 [<c0235d89>] snprintf+0x19/0x20
 [<c01e99f5>] ktxnmgrd+0x115/0x1d0
 [<c01e9a16>] ktxnmgrd+0x136/0x1d0
 [<c01e98e0>] ktxnmgrd+0x0/0x1d0
 [<c0108d59>] kernel_thread_helper+0x5/0xc

Code: 0f 0b 3b 00 30 82 35 c0 68 00 74 47 c0 e8 13 d3 f7 ff 3d 40 
 <6>note: ktxnmgrd:timed[218] exited with preempt_count 1
