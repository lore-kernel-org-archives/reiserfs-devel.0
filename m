From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4, 2.6.14-rc5-mm1, 4k stacks Lots of badness on umount
Date: Tue, 25 Oct 2005 16:42:04 +0400
Message-ID: <435E281C.4080102@namesys.com>
References: <3aa654a40510250211v53f0a715r8769a3d6f51c21d4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040000020406040903080409"
Return-path: <reiserfs-list-return-26630-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3aa654a40510250211v53f0a715r8769a3d6f51c21d4@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Avuton Olrich <avuton@gmail.com>
Cc: reiserfs-list@namesys.com

--------------040000020406040903080409
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello

This does not look like reiser4 related problem. Please try with the attached patch.

Avuton Olrich wrote:
> When unmounting my reiser4 partition today on my 2.6.14-rc5-mm1 kernel
> I got the following:
> 
> Any ideas? Any way I can help track down this issue? I'm fscking now,
> I will report results if desired.
> 
> Badness in __writeback_single_inode at fs/fs-writeback.c:251
>  [<c017f433>] __writeback_single_inode+0xb3/0x1c0
>  [<c03ce328>] wait_for_completion+0x78/0xf0
>  [<c0118890>] default_wake_function+0x0/0x10
>  [<c017fbb5>] write_inode_now+0x65/0xe0
>  [<c012cfe8>] rcu_barrier+0x58/0x80
>  [<c01760cb>] generic_forget_inode+0x7b/0x180
>  [<c0176243>] iput+0x53/0x70
>  [<c01d6da6>] done_formatted_fake+0x56/0x70
>  [<c01d958f>] reiser4_put_super+0x3f/0xd0
>  [<c01751f6>] invalidate_inodes+0x56/0x80
>  [<c0160afa>] generic_shutdown_super+0x14a/0x180
>  [<c0161695>] kill_block_super+0x25/0x40
>  [<c01608a0>] deactivate_super+0x50/0x80
>  [<c01784d5>] sys_umount+0x35/0x80
>  [<c016432f>] sys_stat64+0xf/0x30
>  [<c03cfec8>] do_page_fault+0x1a8/0x5c5
>  [<c0178537>] sys_oldumount+0x17/0x20
>  [<c01030db>] sysenter_past_esp+0x54/0x75
> Badness in __sync_single_inode at fs/fs-writeback.c:232
>  [<c017f315>] __sync_single_inode+0x205/0x270
>  [<c017f44d>] __writeback_single_inode+0xcd/0x1c0
>  [<c03ce328>] wait_for_completion+0x78/0xf0
>  [<c0118890>] default_wake_function+0x0/0x10
>  [<c017fbb5>] write_inode_now+0x65/0xe0
>  [<c012cfe8>] rcu_barrier+0x58/0x80
>  [<c01760cb>] generic_forget_inode+0x7b/0x180
>  [<c0176243>] iput+0x53/0x70
>  [<c01d6da6>] done_formatted_fake+0x56/0x70
>  [<c01d958f>] reiser4_put_super+0x3f/0xd0
>  [<c01751f6>] invalidate_inodes+0x56/0x80
>  [<c0160afa>] generic_shutdown_super+0x14a/0x180
>  [<c0161695>] kill_block_super+0x25/0x40
>  [<c01608a0>] deactivate_super+0x50/0x80
>  [<c01784d5>] sys_umount+0x35/0x80
>  [<c016432f>] sys_stat64+0xf/0x30
>  [<c03cfec8>] do_page_fault+0x1a8/0x5c5
>  [<c0178537>] sys_oldumount+0x17/0x20
>  [<c01030db>] sysenter_past_esp+0x54/0x75
> Badness in __writeback_single_inode at fs/fs-writeback.c:251
>  [<c017f433>] __writeback_single_inode+0xb3/0x1c0
>  [<c03ce328>] wait_for_completion+0x78/0xf0
>  [<c0118890>] default_wake_function+0x0/0x10
>  [<c017fbb5>] write_inode_now+0x65/0xe0
>  [<c01760cb>] generic_forget_inode+0x7b/0x180
>  [<c0176243>] iput+0x53/0x70
>  [<c01d6d95>] done_formatted_fake+0x45/0x70
>  [<c01d958f>] reiser4_put_super+0x3f/0xd0
>  [<c01751f6>] invalidate_inodes+0x56/0x80
>  [<c0160afa>] generic_shutdown_super+0x14a/0x180
>  [<c0161695>] kill_block_super+0x25/0x40
>  [<c01608a0>] deactivate_super+0x50/0x80
>  [<c01784d5>] sys_umount+0x35/0x80
>  [<c016432f>] sys_stat64+0xf/0x30
>  [<c03cfec8>] do_page_fault+0x1a8/0x5c5
>  [<c0178537>] sys_oldumount+0x17/0x20
>  [<c01030db>] sysenter_past_esp+0x54/0x75
> Badness in __sync_single_inode at fs/fs-writeback.c:232
>  [<c017f315>] __sync_single_inode+0x205/0x270
>  [<c017f44d>] __writeback_single_inode+0xcd/0x1c0
>  [<c03ce328>] wait_for_completion+0x78/0xf0
>  [<c0118890>] default_wake_function+0x0/0x10
>  [<c017fbb5>] write_inode_now+0x65/0xe0
>  [<c01760cb>] generic_forget_inode+0x7b/0x180
>  [<c0176243>] iput+0x53/0x70
>  [<c01d6d95>] done_formatted_fake+0x45/0x70
>  [<c01d958f>] reiser4_put_super+0x3f/0xd0
>  [<c01751f6>] invalidate_inodes+0x56/0x80
>  [<c0160afa>] generic_shutdown_super+0x14a/0x180
>  [<c0161695>] kill_block_super+0x25/0x40
>  [<c01608a0>] deactivate_super+0x50/0x80
>  [<c01784d5>] sys_umount+0x35/0x80
>  [<c016432f>] sys_stat64+0xf/0x30
>  [<c03cfec8>] do_page_fault+0x1a8/0x5c5
>  [<c0178537>] sys_oldumount+0x17/0x20
>  [<c01030db>] sysenter_past_esp+0x54/0x75
> Badness in __writeback_single_inode at fs/fs-writeback.c:251
>  [<c017f433>] __writeback_single_inode+0xb3/0x1c0
>  [<c03ce328>] wait_for_completion+0x78/0xf0
>  [<c0118890>] default_wake_function+0x0/0x10
>  [<c017fbb5>] write_inode_now+0x65/0xe0
>  [<c01760cb>] generic_forget_inode+0x7b/0x180
>  [<c0176243>] iput+0x53/0x70
>  [<c01d6d7d>] done_formatted_fake+0x2d/0x70
>  [<c01d958f>] reiser4_put_super+0x3f/0xd0
>  [<c01751f6>] invalidate_inodes+0x56/0x80
>  [<c0160afa>] generic_shutdown_super+0x14a/0x180
>  [<c0161695>] kill_block_super+0x25/0x40
>  [<c01608a0>] deactivate_super+0x50/0x80
>  [<c01784d5>] sys_umount+0x35/0x80
>  [<c016432f>] sys_stat64+0xf/0x30
>  [<c03cfec8>] do_page_fault+0x1a8/0x5c5
>  [<c0178537>] sys_oldumount+0x17/0x20
>  [<c01030db>] sysenter_past_esp+0x54/0x75
> Badness in __sync_single_inode at fs/fs-writeback.c:232
>  [<c017f315>] __sync_single_inode+0x205/0x270
>  [<c017f44d>] __writeback_single_inode+0xcd/0x1c0
>  [<c03ce328>] wait_for_completion+0x78/0xf0
>  [<c0118890>] default_wake_function+0x0/0x10
>  [<c017fbb5>] write_inode_now+0x65/0xe0
>  [<c01760cb>] generic_forget_inode+0x7b/0x180
>  [<c0176243>] iput+0x53/0x70
>  [<c01d6d7d>] done_formatted_fake+0x2d/0x70
>  [<c01d958f>] reiser4_put_super+0x3f/0xd0
>  [<c01751f6>] invalidate_inodes+0x56/0x80
>  [<c0160afa>] generic_shutdown_super+0x14a/0x180
>  [<c0161695>] kill_block_super+0x25/0x40
>  [<c01608a0>] deactivate_super+0x50/0x80
>  [<c01784d5>] sys_umount+0x35/0x80
>  [<c016432f>] sys_stat64+0xf/0x30
>  [<c03cfec8>] do_page_fault+0x1a8/0x5c5
>  [<c0178537>] sys_oldumount+0x17/0x20
>  [<c01030db>] sysenter_past_esp+0x54/0x75
> 
> --
>   Anyone who quotes me in their sig is an idiot. -- Rusty Russell.
> 
> 


--------------040000020406040903080409
Content-Type: text/plain;
 name="writeback_single_inode-warn-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="writeback_single_inode-warn-fix.patch"


generic_forget_inode sets I_WILL_FREE bit in inode->i_state.
__writeback_single_inode checks that bit in inode->i_flags.
This patch changes __writeback_single_inode to check inode->i_state.


 fs/fs-writeback.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff -puN fs/fs-writeback.c~writeback_single_inode-warn-fix fs/fs-writeback.c
--- linux-2.6.14-rc5-mm1/fs/fs-writeback.c~writeback_single_inode-warn-fix	2005-10-25 15:52:13.857616000 +0400
+++ linux-2.6.14-rc5-mm1-root/fs/fs-writeback.c	2005-10-25 15:52:37.051065500 +0400
@@ -248,9 +248,9 @@ __writeback_single_inode(struct inode *i
 	wait_queue_head_t *wqh;
 
 	if (!atomic_read(&inode->i_count))
-		WARN_ON(!(inode->i_flags & I_WILL_FREE));
+		WARN_ON(!(inode->i_state & I_WILL_FREE));
 	else
-		WARN_ON(inode->i_flags & I_WILL_FREE);
+		WARN_ON(inode->i_state & I_WILL_FREE);
 
 	if ((wbc->sync_mode != WB_SYNC_ALL) && (inode->i_state & I_LOCK)) {
 		list_move(&inode->i_list, &inode->i_sb->s_dirty);

_

--------------040000020406040903080409--
