From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 oops on unmount
Date: Tue, 24 Aug 2004 11:18:37 -0700
Message-ID: <412B867D.4090801@namesys.com>
References: <1093361937.12138.3263.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20484-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093361937.12138.3263.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason wrote:

>Hello everyone,
>
>I was testing reiser4 in the suse kernel and hit an oops during
>unmount.  This could be a problem with my local merge, but I wanted to
>send here in case it is obvious.
>
>The workload was create a few files and dirs, delete them, create 1
>million files in a single dir, sync, unmount.
>
>Unable to handle kernel NULL pointer dereference at virtual address 00000010
> printing eip:
>f8a1826c
>*pde = 00000000
>Oops: 0000 [#1]
>SMP
>Modules linked in: reiser4 dm_mod
>CPU:    0
>EIP:    0060:[<f8a1826c>]    Tainted: G  U
>EFLAGS: 00010246   (2.6.8-0-testing)
>EIP is at safe_link_locality+0xc/0x30 [reiser4]
>eax: 00000000   ebx: 00000000   ecx: 00000000   edx: 00000000
>esi: d6a83340   edi: d6a83340   ebp: e65f7c94   esp: e65f7c90
>ds: 007b   es: 007b   ss: 0068
>Process umount (pid: 13346, threadinfo=e65f6000 task=f755d2d0)
>Stack: 00000000 e65f7cb4 f8a182be e65f7cbc 00000000 d6a83340 04271204 d6a83340
>       d6a83340 e65f7ce4 f8a184a6 00000000 00000000 00000000 00000000 00000000
>       00000000 00000000 00000000 04271204 00000000 e65f7d20 f8a19cae 00000000
>Call Trace:
> [<c0106ed6>] show_stack+0xa6/0xb0
> [<c0107057>] show_registers+0x157/0x1c0
> [<c01071ec>] die+0x9c/0x160
> [<c011726c>] do_page_fault+0x3cc/0x53b
> [<c0106b4d>] error_code+0x2d/0x38
> [<f8a182be>] build_link_key+0x2e/0xa0 [reiser4]
> [<f8a184a6>] safe_link_del+0x16/0x30 [reiser4]
> [<f8a19cae>] common_object_delete_no_reserve+0xee/0x120 [reiser4]
> [<f8a19d3e>] delete_object+0x5e/0x70 [reiser4]
> [<f8a101e7>] reiser4_delete_inode+0x67/0x70 [reiser4]
> [<f8a1a67b>] delete_inode_common+0xdb/0x2c0 [reiser4]
> [<f8a1a8af>] drop_common+0x3f/0x50 [reiser4]
> [<f8a0ffb9>] reiser4_drop_inode+0x19/0x30 [reiser4]
> [<c0180716>] iput+0x56/0x80
> [<c017bc1f>] dput+0x8f/0x320
> [<c017c5bd>] prune_dcache+0x20d/0x370
> [<c017ccbd>] shrink_dcache_parent+0xd/0x20
> [<c0168bda>] generic_shutdown_super+0x2a/0x260
> [<c0169f2a>] kill_block_super+0x1a/0x40
> [<c0168a08>] deactivate_super+0x68/0xa0
> [<c01835a9>] sys_umount+0x59/0x80
> [<c01835e9>] sys_oldumount+0x19/0x20
> [<c0106071>] sysenter_past_esp+0x52/0x71
>Code: 8b 48 10 8b 81 50 ff ff ff 8b 49 20 89 c2 31 c0 09 da 09 c8
>
>
>
>
>  
>
the guys will look at this on thursday, we need to get some billable 
hours in on digeo work for me to make payroll.
