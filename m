From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: kernel BUG at fs/reiser4/block_alloc.c:149!
Date: Tue, 20 Dec 2005 10:19:28 +0300
Message-ID: <43A7B080.3070603@namesys.com>
References: <20051219203323.64d48641@tormented-soul>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27450-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051219203323.64d48641@tormented-soul>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heiko Przybyl <lil_tux@web.de>
Cc: reiserfs-list@namesys.com

Hello

Heiko Przybyl wrote:
> I)
> 
>  i tapped into the following kernel trace, which locks down the directory it
>  came up in and with the next flush it locks the whole the partition :-(
> 
>  d_cursor_hash_table: 256 buckets
>  ef_hash_table: 8192 buckets
>  z_hash_table: 8192 buckets
>  z_hash_table: 8192 buckets
>  j_hash_table: 16384 buckets
>  loading reiser4 bitmap......done (4780 jiffies)
>  VFS: Mounted root (reiser4 filesystem) readonly.
>  .
>  .
>  .
>  ------------[ cut here ]------------
>  kernel BUG at fs/reiser4/block_alloc.c:149!
>  invalid operand: 0000 [#1]
>  Modules linked in: ipt_state ip_conntrack iptable_filter ip_tables usbhid
>  uhci_hcd 8139too mii evdev usbcore
>  CPU:    0
>  EIP:    0060:[<c01b897f>]    Not tainted VLI
>  EFLAGS: 00010297   (2.6.14) 
>  EIP is at sub_from_ctx_grabbed+0xaf/0xc0
>  eax: 00000000   ebx: 00000000   ecx: 00000001   edx: 00000000
>  esi: f74eee00   edi: 00000001   ebp: 00000000   esp: f6eebca8
>  ds: 007b   es: 007b   ss: 0068
>  Process linux1 (pid: 5245, threadinfo=f6eea000 task=f71280b0)
>  Stack: 00000000 00000000 f6e5eae0 f6eebe3c 00000000 f6e5eae0 c16dcc60 00000001 
>         f6e5eae0 c1b98800 f74eee00 c01bb607 f74eee00 00000001 00000000 c039c554 
>         f6e5eae0 f6e5eae0 f6e5eb25 f6e5eae0 c01974dc f6eea000 f6e5eae0 f6eea000 
>  Call Trace:
>   [<c01bb607>] grabbed2flush_reserved_nolock+0x67/0x1c0
>   [<c01974dc>] znode_invariant_f+0x3dc/0x410
>   [<c01c6e77>] do_jnode_make_dirty+0x187/0x460
>   [<c020d17b>] is_plugin_id_valid+0x1b/0xa0
>   [<c01c71c2>] jnode_make_dirty_locked+0x72/0x2c0
>   [<c0250693>] save_static_sd+0xd3/0x210
>   [<c01c757e>] znode_make_dirty+0x16e/0x650
>   [<c0216a77>] update_sd_at+0x1f7/0x6e0
>   [<c0216fe9>] update_sd+0x89/0x140
>   [<c0213e2d>] write_sd_by_inode_common+0xdd/0x150
>   [<c01bd424>] txn_begin+0x24/0x90
>   [<c021e829>] sync_unix_file+0x59/0x1e0
>   [<c0221851>] write_unix_file+0x471/0x6d0
>   [<c01283a0>] autoremove_wake_function+0x0/0x60
>   [<c0150fd5>] vfs_write+0xb5/0x190
>   [<c015117b>] sys_write+0x4b/0x80
>   [<c0102c0b>] sysenter_past_esp+0x54/0x75
>  Code: 8b 02 8b 80 9c 00 00 00 89 44 24 0c 8b 02 c7 44 24 04 94 41 3b c0 c7 04
>  24 3c b0 39 c0 05 a4 01 00 00 89 44 24 08 e8 21 01 fd ff <0f> 0b 95 00 26 f7 38
>  c0 eb 84 8d b4 26 00 00 00 00 8b 4c 24 04 
> Dec 19 19:49:22 tormented-soul kernel: d_cursor_hash_table: 256 buckets
> Dec 19 19:49:22 tormented-soul kernel: ef_hash_table: 8192 buckets
> Dec 19 19:49:22 tormented-soul kernel: z_hash_table: 8192 buckets
> Dec 19 19:49:22 tormented-soul kernel: z_hash_table: 8192 buckets
> Dec 19 19:49:22 tormented-soul kernel: j_hash_table: 16384 buckets
> Dec 19 19:49:22 tormented-soul kernel: loading reiser4 bitmap......done (4780
> jiffies) Dec 19 19:49:22 tormented-soul kernel: VFS: Mounted root (reiser4
> filesystem) readonly.
> Dec 19 19:49:22 tormented-soul kernel: d_cursor_hash_table: 256 buckets
> Dec 19 19:49:22 tormented-soul kernel: ef_hash_table: 8192 buckets
> Dec 19 19:49:22 tormented-soul kernel: z_hash_table: 8192 buckets
> Dec 19 19:49:22 tormented-soul kernel: z_hash_table: 8192 buckets
> Dec 19 19:49:22 tormented-soul kernel: j_hash_table: 16384 buckets
> Dec 19 19:49:22 tormented-soul kernel: loading reiser4 bitmap......done (4780
> jiffies) Dec 19 19:49:22 tormented-soul kernel: VFS: Mounted root (reiser4
> filesystem) readonly.
> 
> 
> this happens everytime i try to start 3 user-mode-linux instances with an
> disk-image of approx 500mb each
> 
> the system('s) i get this on, are running gentoo linux with gcc4 +
> glibc-2.3.6-nptl
>   
> 
> kernel:
>   linux-2.6.14
>     patched with:
>       *reiser4-for-2.6.14-1.patch :-)
>       *reiser4-fix-fsync.patch
>       *force-starget-scsi_level-in-usb-storage-scsigluec.patch
>       *skas-2.6.14-v8.2.patch
>       *suspend2-2.2-rc13-for-2.6.14
> 
>   update: the problem even occurs with only reiser4-for-2.6.14-1.patch applied,
>           so the other patches should be safe
>     
>   linux-2.6.15-rc5-mm3, too - same error
>     that version was additionally patched with:
>       *reiser4-fix-fsync.patch
>   

Please try
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.15-rc5-mm3/reiser4-for-2.6.15-rc5-mm3-1.patch.gz


> 
> could this be a gcc4-bug? are there any known issues? haven't found any on the
> net, yet - and it did definitely work with gcc4.0 and gcc4.1 and i never had
> any problems with gcc4.
> 
> but i'll give gcc3 a shot if i can find a source-tarball lying around...
> 
> 
> II)
> 
> there's also a warning i get each time the system is running:
> 
> "<4>reiser4[ktxnmgrd:hda4:r(651)]: disable_write_barrier
> (fs/reiser4/wander.c:233)[zam-1055]: WARNING: disabling write barrier"
> 
> is this behaviour normal? should i be concerned about this WARNING?
> 

just ignore that.

> 
> III)
> 
> are there any mount/compile options, which could produce better performance with
> larger files (i.e. 2gb and more)?
> 

What does your load do with large files?

> 
> 
> 
> 
> btw. reiser4 rocks a lot more than xfs/ext3 - good work :-)
> 
> 
> thx for any help,
> 
>     Heiko
> 
> 

