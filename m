From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Yet another 2.6.16/reiser4 crash
Date: Tue, 18 Apr 2006 16:47:47 +0400
Message-ID: <1145364467.6291.31.camel@tribesman.namesys.com>
References: <3aa654a40604160035p6c81daf6vf5606c937c97cb0f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3aa654a40604160035p6c81daf6vf5606c937c97cb0f@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Avuton Olrich <avuton@gmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello

On Sun, 2006-04-16 at 00:35 -0700, Avuton Olrich wrote:
> Kernel: 2.6.16.3 with reiser4-for-2.6.16-2
> Compiler: GCC-4.1.0
> 
> Notes: This caused the computer to not allow login, refuse to route
> network stuff, though I could see kernel messages still coming through
> (such as network traffic trying to get through).
> 
> Any questions please ask. Thanks
> 

can you find a way to reproduce this bug reliably?

> Apr 15 22:58:32 shapeshifter ------------[ cut here ]------------
> Apr 15 22:58:32 shapeshifter kernel BUG at
> /usr/src/linux-stable/fs/reiser4/as_ops.c:327!
> Apr 15 22:58:32 shapeshifter invalid opcode: 0000 [#1]
> Apr 15 22:58:32 shapeshifter PREEMPT
> Apr 15 22:58:32 shapeshifter Modules linked in: snd_seq_midi
> snd_emu10k1_synth snd_emux_synth snd_seq_virmidi snd_seq_midi_event
> snd_seq_midi_emul snd_seq snd_emu10k1 snd_rawmidi snd_ac97_codec
> snd_ac97_bus snd_pcm snd_seq_device snd_timer snd_page_alloc
> snd_util_mem snd_hwdep snd ipt_MASQUERADE ipt_LOG xt_limit xt_state
> ipt_TOS ipt_TCPMSS iptable_mangle iptable_nat ip_nat ip_conntrack
> iptable_filter
> Apr 15 22:58:32 shapeshifter CPU:    0
> Apr 15 22:58:32 shapeshifter EIP:    0060:[<c01ab8e5>]    Not tainted VLI
> Apr 15 22:58:32 shapeshifter EFLAGS: 00010206   (2.6.16.3-reiser4 #6)
> Apr 15 22:58:32 shapeshifter EIP is at jnode_is_releasable+0x47/0x7e
> Apr 15 22:58:32 shapeshifter eax: 40002061   ebx: d1123240   ecx:
> c13fbc60   edx: c13fbc60
> Apr 15 22:58:32 shapeshifter esi: d1123240   edi: c13fbc60   ebp:
> c0372ad0   esp: c2fe1c30
> Apr 15 22:58:32 shapeshifter ds: 007b   es: 007b   ss: 0068
> Apr 15 22:58:32 shapeshifter Process ecasound (pid: 18388,
> threadinfo=c2fe1000 task=d6f19570)
> Apr 15 22:58:32 shapeshifter Stack: <0>c2fe1000 c01abc1d c01abbda
> 000000d0 00000000 c01480f1 c13fbc60 c38c5aa8
> Apr 15 22:58:32 shapeshifter c01363f9 00000047 c2fe1d64 000024c6
> 00000049 00000000 00000000 00000020
> Apr 15 22:58:32 shapeshifter 00000000 00000012 00000021 00000000
> 00000001 c12922e0 c10d0420 c12554a0
> Apr 15 22:58:32 shapeshifter Call Trace:
> Apr 15 22:58:32 shapeshifter [<c01abc1d>] reiser4_releasepage+0x43/0x10a
> Apr 15 22:58:32 shapeshifter [<c01abbda>] reiser4_releasepage+0x0/0x10a
> Apr 15 22:58:32 shapeshifter [<c01480f1>] try_to_release_page+0x34/0x46
> Apr 15 22:58:32 shapeshifter [<c01363f9>] shrink_zone+0x928/0xce5
> Apr 15 22:58:32 shapeshifter [<c0136e34>] try_to_free_pages+0x10d/0x1df
> Apr 15 22:58:32 shapeshifter [<c013318d>] __alloc_pages+0x163/0x254
> Apr 15 22:58:32 shapeshifter [<c013124e>] find_or_create_page+0x53/0x8c
> Apr 15 22:58:32 shapeshifter [<c01967b2>] jnode_get_page_locked+0x5d/0xf3
> Apr 15 22:58:32 shapeshifter [<c01c7976>] write_extent+0x1a9/0xba4
> Apr 15 22:58:32 shapeshifter [<c01cac04>] item_length_by_coord+0xb/0xf
> Apr 15 22:58:32 shapeshifter [<c01c657f>] nr_units_extent+0x5/0xd
> Apr 15 22:58:32 shapeshifter [<c01c6e5e>] init_coord_extension_extent+0x60/0xdf
> Apr 15 22:58:32 shapeshifter [<c01b3188>] set_file_state+0x26/0x5d
> Apr 15 22:58:32 shapeshifter [<c01b436c>] find_file_item+0xc4/0xd6
> Apr 15 22:58:32 shapeshifter [<c01b2dfc>] how_to_write+0x1aa/0x208
> Apr 15 22:58:32 shapeshifter [<c01c77cd>] write_extent+0x0/0xba4
> Apr 15 22:58:32 shapeshifter [<c01b45b3>] write_flow+0x235/0x2c8
> Apr 15 22:58:32 shapeshifter [<c01b49d6>] write_unix_file+0x33e/0x4cd
> Apr 15 22:58:32 shapeshifter [<c01b4698>] write_unix_file+0x0/0x4cd
> Apr 15 22:58:32 shapeshifter [<c014712c>] vfs_write+0xa1/0x140
> Apr 15 22:58:32 shapeshifter [<c0147659>] sys_write+0x3c/0x63
> Apr 15 22:58:32 shapeshifter [<c0102a93>] sysenter_past_esp+0x54/0x75
> Apr 15 22:58:32 shapeshifter Code: 8d 43 40 e8 95 26 ff ff 85 c0 75 4b
> 8b 03 f6 c4 01 75 44 8b 03 84 c0 78 3e 8b 03 a9 00 00 04 00 75 35 8b
> 03 a9 00 00 00 40 74 08 <0f> 0b 47 01 1d fb 32 c0 8b 03 25 00 e0 00 00
> c1 e8 0d 83 3c 85
> Apr 15 22:58:32 shapeshifter <6>note: ecasound[18388] exited with
> preempt_count 2
> --
> avuton
> --
>  Anyone who quotes me in their sig is an idiot. -- Rusty Russell.
> 

