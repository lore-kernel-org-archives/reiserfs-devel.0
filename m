From: William Jared Roberts <wjr6@email.byu.edu>
Subject: Re: Bugs?
Date: Sun, 17 Aug 2003 14:46:09 -0600
Message-ID: <01KZKLO0E6JC90R5TV@EMAIL1.BYU.EDU>
Return-path: <reiserfs-list-return-15351-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


> He shouldn't be using reiser4 for anything other than bug finding and 
> stress testing.  Given how extensively we warn people that, I assume 
> this is just a toy installation without any real data on it for the 
> purpose of seeing how fast he can crash it.....

Yes, and we all follow that counsel to the letter, I assure you ;).

If it helps to track this thing down, here's a call trace I collected from
hitting Alt+SysRq+P while I was getting the "flushing like mad" with powers of 2
during a shutdown.  Again, this is NOT an oops, so I don't know if it will be as
useful.  Also, it was copied by hand to paper first, then to this email, so
there may be a couple typos in there, sorry :(.  It also may be slightly out of
date-- this a bk pull  pretty much right after the sync to 2.6.0-test3.

EIP: 0060:[<c01fa978>] CPU:0
EIP is at reiser4_lock_page+0x8/0x20
  EFLAGS:00000206           Not tainted
EAX:0100106c   EBX:00000001   ECX:dfcb2b00   EDX:c14f7b780
ESI:c14f7b80   EDI:00000001   EBP:df8fff80   DS:007b   ES:007b
CR0:80050036   CR2:400e1c40   CR3:01611000   CR4:000006d0
Call Trace:
[<c01f7c00>] jnode_extent_write+0xd0/0x2f0
[<c01f7eae>] write_jnode_list+0x8e/0xc0
[<c01fc614>] write_fq+0x34/0x50
[<c01f4756>] flush_current_atom+0x146/0x1e0
[<c01f1d39>] commit_current_atom+0x49/0x1d0
[<c01f23c8>] try_commit_txnh+0xf8/0x130
[<c01f242d>] commit_txnh+0x2d/0xa0
[<c01f1769>] txn_end+0x39/0x40
[<c01f1ddc>] force_commit_atom_nolock+0x2c/0x50
[<c01f1ffd>] txnmgr_force_commit_all+0xad/0xc0
[<c01fff16>] writeout+0x66/0x70
[<c01fff71>] reiser4_sync_inodes+0x51/0x80
[<c016a31e>] sync_sb_inodes+0x23/0x40
[<c016a3f7>] sync_inodes_sb+0x77/0x90
[<c016a4bb>] sync_inodes+0x2b/0xa0
[<c014e883>] do_sync+0x23/0x70
[<c014e8df>] sys_sync+0xf/0x20
[<c0108e5f>] syscall_call+0x7/0xb

Let me know if any other information would help.

