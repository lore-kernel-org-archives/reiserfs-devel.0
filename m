From: Redeeman <redeeman@metanurb.dk>
Subject: Re: More oops with reiser4 on x86_64
Date: Sun, 29 Aug 2004 12:05:57 +0200
Message-ID: <1093773957.12393.0.camel@localhost>
References: <200408291906.05639.rodda@kde.org>
Reply-To: redeeman@metanurb.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408291906.05639.rodda@kde.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

did you remember to apply the patch on lkml for not loosing data with
2.6.9-rc1-mm1
On Sun, 2004-08-29 at 19:06 +1000, Hamish Rodda wrote:
> Hi,
> 
> Following up my earlier email, I upgraded to 2.6.9-rc1-mm1 and enabled a few 
> of the reiser4 debug options.  I did the same command (copy 6G of files from 
> a reiser3 partition to a clean reiser4 partition), and it oopsed again at 
> just under 5G (4999264 1k blocks) - this seems to be a pattern.  I got more 
> info in the message log too:
> 
> reiser4[ent:dm-4!(6311)]: reiser4_alloc_blocks (fs/reiser4/block_alloc.c:765)
> [zam-821]:
> code: -28 at fs/reiser4/plugin/space/bitmap.c:1053
> ----------- [cut here ] --------- [please bite here ] ---------
> CPU 0 
> Modules linked in: ds yenta_socket pcmcia_core thermal fan button processor ac 
> battery snd_intel8x0 snd_ac97_codec snd_mpu401_uart ehci_hcd 8139too mii 
> crc32
> Pid: 6311, comm: ent:dm-4! Not tainted 2.6.9-rc1-mm1
> RIP: 0010:[<ffffffff801d9af1>] <ffffffff801d9af1>{reiser4_do_panic+817}
> RSP: 0018:000001001023b658  EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 000001001023bdd8 RCX: ffffffff806bbd20
> RDX: 000001001fc3baf8 RSI: 000001001fc3baf8 RDI: 000001001d64b000
> RBP: 000001001023ba98 R08: 000001001023a000 R09: 0000000000000001
> R10: 0000000000000000 R11: ffffffff7fffffff R12: 000001001023bdd8
> R13: 000001001023b798 R14: 0000000000000014 R15: 00000000ffffffe4
> FS:  0000002a995a7380(0000) GS:ffffffff806f14c0(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> CR2: 0000002a95760085 CR3: 0000000000101000 CR4: 00000000000006e0
> Process ent:dm-4! (pid: 6311, threadinfo 000001001023a000, task 
> 000001000a037000)
> Stack: 0000003000000010 000001001023b738 000001001023b678 00000000000018a7 
>        ffffffff804d3520 ffffffff80555480 0000000000000000 000001000a037000 
>        000001001023a000 0000000000000001 
> Call Trace:<ffffffff801da207>{return_err+39} 
> <ffffffff8029512f>{alloc_blocks_forward+511} 
>        <ffffffff801d9ba9>{reiser4_print_prefix+137} 
> <ffffffff801da2a9>{report_err+9} 
>        <ffffffff801fead5>{reiser4_alloc_blocks+965} 
> <ffffffff80212d7e>{allocate_znode_update+638} 
>        <ffffffff8026651e>{internal_at+894} 
> <ffffffff8021290f>{allocate_znode_loaded+1103} 
>        <ffffffff80212acc>{allocate_znode+60} 
> <ffffffff8020f7a9>{lock_parent_and_allocate_znode+249} 
>        <ffffffff8020fb5b>{handle_pos_on_formatted+859} 
> <ffffffff80286918>{item_type_by_coord+792} 
>        <ffffffff8020fc34>{handle_pos_on_leaf+84} 
> <ffffffff80211371>{squalloc+33} 
>        <ffffffff8020c98d>{jnode_flush+1757} 
> <ffffffff8020d355>{flush_current_atom+1957} 
>        <ffffffff8020375d>{flush_some_atom+1005} 
> <ffffffff802385e7>{entd_flush+103} 
>        <ffffffff80237e87>{entd+631} <ffffffff80110753>{child_rip+8} 
>        <ffffffff80237c10>{entd+0} <ffffffff8011074b>{child_rip+0} 
>        
> 
> Code: 0f 0b f8 54 53 80 ff ff ff ff 84 00 31 c0 48 c7 c7 9b 24 58 
>  reiser4[cpio(6389)]: txnh_list_link_ok (fs/reiser4/txnmgr.c:286)
> [nikita-1054]:
> code: -2 at fs/reiser4/search.c:1214
> ----------- [cut here ] --------- [please bite here ] ---------
> CPU 0 
> Modules linked in: ds yenta_socket pcmcia_core thermal fan button processor ac 
> battery snd_intel8x0 snd_ac97_codec snd_mpu401_uart ehci_hcd 8139too mii 
> crc32
> Pid: 6389, comm: cpio Not tainted 2.6.9-rc1-mm1
> RIP: 0010:[<ffffffff801d9af1>] <ffffffff801d9af1>{reiser4_do_panic+817}
> RSP: 0018:00000100106eb678  EFLAGS: 00010202
> RAX: 0000000000000001 RBX: 00000100106ebe18 RCX: 00000000001b773f
> RDX: ffffffff801d9820 RSI: ffffffff80555aa0 RDI: ffffffff80538d37
> RBP: 000001000ab8c900 R08: 0000010001728000 R09: 000000000000000d
> R10: 000000000000000e R11: 0000000000000000 R12: 00000100106ebe18
> R13: 0000000000000008 R14: 0000000000000001 R15: 0000000000000001
> FS:  0000002a996ae380(0000) GS:ffffffff806f14c0(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
> CR2: 000000000050d548 CR3: 0000000000101000 CR4: 00000000000006e0
> Process cpio (pid: 6389, threadinfo 00000100106ea000, task 000001001f307000)
> Stack: 0000003000000020 00000100106eb758 00000100106eb698 00000000000018f5 
>        ffffffff804d4680 ffffffff80555aa0 00000000ffffffff 00000000001b773f 
>        0000010001728000 000000000000000d 
> Call Trace:<ffffffff803ac793>{__elv_add_request+83} 
> <ffffffff803afd2a>{__make_request+1322} 
>        <ffffffff801d9ba9>{reiser4_print_prefix+137} 
> <ffffffff801da2a9>{report_err+9} 
>        <ffffffff8020582a>{capture_assign_txnh_nolock+586} 
>        <ffffffff80207c75>{capture_assign_txnh+725} 
> <ffffffff80204547>{try_capture_block+583} 
>        <ffffffff80204880>{try_capture+176} 
> <ffffffff801f0762>{longterm_lock_znode+802} 
>        <ffffffff8021e4ce>{cbk_cache_scan_slots+926} 
> <ffffffff80130380>{autoremove_wake_function+0} 
>        <ffffffff8021ea4b>{cbk_cache_search+43} 
> <ffffffff8021b969>{coord_by_handle+9} 
>        <ffffffff8021b8e6>{object_lookup+790} 
> <ffffffff8029a483>{find_file_item+451} 
>        <ffffffff8029e619>{append_and_or_overwrite+473} 
> <ffffffff8029eccc>{write_flow+204} 
>        <ffffffff8029f022>{write_file+178} 
> <ffffffff8029f287>{write_unix_file+551} 
>        <ffffffff80233631>{reiser4_write+401} <ffffffff801712a2>{filp_open+66} 
>        <ffffffff801721d7>{vfs_write+199} <ffffffff80172303>{sys_write+83} 
>        <ffffffff8010fcea>{system_call+126} 
> 
> Code: 0f 0b f8 54 53 80 ff ff ff ff 84 00 31 c0 48 c7 c7 9b 24 58 
>  <6>note: cpio[6389] exited with preempt_count 3
> 
> Hope this helps.
> 
> Cheers,
> Hamish.
> 
-- 
Redeeman <redeeman@metanurb.dk>

