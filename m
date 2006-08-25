From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: [nikita-1936] assertion failed: reiser4_no_counters_are_held()
Date: Fri, 25 Aug 2006 17:18:53 +0400
Message-ID: <200608251718.54020.zam@namesys.com>
References: <200608211759.04151.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com> <200608211935.35024.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29689-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608211935.35024.ajwade@cpe001346162bf9-cm0011ae8cd564.cpe.net.cable.rogers.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew James Wade <andrew.j.wade@gmail.com>
Cc: reiserfs-list@namesys.com

On 22 August 2006 03:35, Andrew James Wade wrote:
> This one has only occurred once. I looked fairly carefully at the
> code for partially converted files under the assumption that the rest
> was unlikely to be buggy, but nothing stood out at me.
>
> reiser4 panicked cowardly: reiser4[fixdep(19237)]:
> reiser4_done_context (fs/reiser4/context.c:181)[nikita-1936]:
> assertion failed: reiser4_no_counters_are_held()
>  [<c0103754>] dump_trace+0x64/0x181
>  [<c0103883>] show_trace_log_lvl+0x12/0x25
>  [<c0103b79>] show_trace+0xd/0x10
>  [<c0103b93>] dump_stack+0x17/0x19
>  [<c01a0663>] reiser4_do_panic+0x4e/0x7b
>  [<c01bdbc0>] reiser4_exit_context+0xa1/0x575
>  [<c0202bc9>] release_unix_file+0x1b7/0x1c2
>  [<c014f90b>] __fput+0xbe/0x16c
>  [<c014f9e7>] fput+0x2e/0x33
>  [<c014d3ec>] filp_close+0x51/0x5b
>  [<c014ddd2>] sys_close+0x70/0x93
>  [<c01028a5>] sysenter_past_esp+0x56/0x8d
> DWARF2 unwinder stuck at sysenter_past_esp+0x56/0x8d
> Leftover inexact backtrace:
>  [<c0103883>] show_trace_log_lvl+0x12/0x25
>  [<c0103b79>] show_trace+0xd/0x10
>  [<c0103b93>] dump_stack+0x17/0x19
>  [<c01a0663>] reiser4_do_panic+0x4e/0x7b
>  [<c01bdbc0>] reiser4_exit_context+0xa1/0x575
>  [<c0202bc9>] release_unix_file+0x1b7/0x1c2
>  [<c014f90b>] __fput+0xbe/0x16c
>  [<c014f9e7>] fput+0x2e/0x33
>  [<c014d3ec>] filp_close+0x51/0x5b
>  [<c014ddd2>] sys_close+0x70/0x93
>  [<c01028a5>] sysenter_past_esp+0x56/0x8d
>  =======================
>
> : jnode: 0, tree: 0 (r:0,w:0), dk: 0 (r:0,w:0)
>
> jload: 0, txnh: 0, atom: 0, stack: 0, txnmgr: 0, ktxnmgrd: 0, fq: 0
> inode: 0, cbk_cache: 0 (r:0,w0), eflush: 0, zlock: 0,
> spin: 0, long: 0 inode_sem: (r:0,w:0)
> d: 1, x: -2, t: -2
> Kernel panic - not syncing: reiser4[fixdep(19237)]:
> reiser4_done_context (fs/reiser4/context.c:181)[nikita-1936]:
> assertion failed: reiser4_no_counters_are_held()
>
> I should be looking for an un-zrelse'd znode for this bug, correct?

yes.

-- 
Alex.

