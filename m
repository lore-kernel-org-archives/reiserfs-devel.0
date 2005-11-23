From: John Gilmore <jgilmore@glycou.com>
Subject: Re: / is no longer Reiser4 :(
Date: Wed, 23 Nov 2005 09:34:02 +0000
Message-ID: <200511230934.02726.jgilmore@glycou.com>
References: <200511191515.48570.jgilmore@glycou.com> <200511212215.47467.zam@namesys.com> <43825590.5050909@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27116-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43825590.5050909@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 21 November 2005 23:17, Hans Reiser wrote:
> Alexander Zarochentsev wrote:
> >one bug responsible for fs corruption was fixed recently.
> >the fix is in 2.6.14-mm2 already.
>
> Then send an email titled something like "Data corruption bug was fixed,
> be sure to upgrade!" to our list.

I tried it again and got the complete oops text. It's a "soft lockup detected 
on CPU#0" message, which leads me to believe that it's a side effect of the 
sync taking a long time. I've got 1.5 gigs of memory and a very slow hard 
disk. hdparm -tT gives ~4.5 MB/s or up to 8 MB/s if I have everythings turned 
on that I can. I can't enable dma, because hdparm refuses to do so, and I 
haven't figured out which parameters to pass to which modules to make it so 
that I can. It's also possible that my hardware is buggy, and the driver 
knows that and is thus refusing to enable dma and corrupt data.

I've got 2.6.14-mm2 with the latest reiser4 patch, but it's giving my loads of 
garbage like:
*** Warning: 
"plugin_set_compression" [fs/reiser4/plugin/compress/compress_plugins.ko] 
undefined!

I think that maybe the source was corrupted in the restore process (I'll have 
to do it again---later)

I'm moving on friday/saturday, and I don't have arrangements for internet 
access at the new digs yet, so if you've got questions, ask them now...


BUG: soft lockup detected on CPU#0

Pid: 4582, comm:              pdflush
EIP: 0060:[<f892da3b>] CPU: 0
EIP is at ide_pio_sector+0xcb/0x120 [ide_core]
 EFLAGS: 00000282    Not tainted  (2.6.14-mm1)
EAX: ec5bc000 EBX: eb531000 ECX: 00000000 EDX: 000001f0
ESI: 00000004 EDO: f893f120 ENP: 00000282 DS: 007b ES: 007b
CR0: 8005003b CR2: 0812b008 CR3: 298b8000 CR4: 000006d0
 [<f892dadd>] ide_pio_multi+0x4d/0x70 [ide_core]
 [<f892de61>] task_out_intr+0x101/0x140 [ide_core]
 [<f892836d>] ide_intr+0x7d/0x180 [ide_core]
 [<f892dd60>] task_out_intr+0x0/0x140 [ide_core]
 [<c013c22d>] handle_IRQ_event+0x3d/0x70
 [<c013c2c3>] __do_IRQ+0x63/0xc0
 [<c0105379>] do_IRQ+0x19/0x30
 [<c0103b1a>] common_interupt+0x1a/0x20
 [<c013d6ca>] unlock_page+0xa/0x30
 [<f8a4c130>] write_jnodes_to_disk_extent+0x1b0/0x2c0 [reiser4]
 [<f8a4c4c9>] write_jnode_list+0xa9/0x110 [reiser4]
 [<f8a51483>] write_fq+0x53/0x70 [reiser4]
 [<f9a47d19>] write_prepped_nodes+0x39/0x40 [resier4]
 [<f8a48f0c>] squeeze_right_twig+0x10c/0x160 [reiser4]
 [<f8a49156>] squeeze_right_twig_and_advance_coord+0x26/0x80 [reiser4]
 [<f8a49a84>] handle_pos_end_of_twig+0xd4/0x290 [reiser4]
 [<f8a810d5>] item_length_by_coord+0x15/0x20 [reiser4]
 [<f8a49f28>] squalloc+0x28/0x60 [reiser4]
 [<f8a4829f>] jnode_flush+0x2cf/0x340 [reiser4]
 [<f8a48519>] flush_current_atom+0xf9/0x250 [reiser4]
 [<f8a457cf>] flush_some_atom+0xaf/0x2c0 [reiser4]
 [<f8a565a4>] writeout+0x124/0x200 [reiser4]
 [<f8a52c04>] reiser4_sync_inodes+0x64/0xf0 [reiser4]
 [<c0184b0d>] writeback_inodes+0x4d/0xb0
 [<c0144118>] background_writeout+0x98/0xe0
 [<c0144cb0>] pdflush+0x0/0x30
 [<c0144c0d>] __pdflush+0xbd/0x160
 [<c0144cd6>] pdflush+0x26/0x30
 [<c0144080>] background_writeout+0x0/0xe0
 [<c0144080>] background_writeout+0x0/0xe0
 [<c012f1e6>] kthread+0xb6/0xc0
 [<c012f130>] kthread+0x0/0xc0
 [<c0101369>] kernel_thread_helper+0x5/0xc

