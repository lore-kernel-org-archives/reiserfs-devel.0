From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Another panic!
Date: Sun, 21 Nov 2004 18:37:55 +0200
Message-ID: <20041121163755.GV26192@nysv.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22466-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi!

I got weirdass segfaults and hangs, so I thought I'd reboot the all-debug
version of -cko3 I have around. However, I saw the following:
(Reiser4 for 2.6.9 as merged by Piotr Neuman, afaik)

Nov 21 17:55:23 shrike -- MARK --
Nov 21 18:07:13 shrike kernel: 
Nov 21 18:07:14 shrike kernel: WARNING: Found but not happy: 2
Nov 21 18:07:14 shrike kernel: reiser4[ent:hda2!(175)]: jnode_lock_parent_coord 
(fs/reiser4/flush.c:3093)[nikita-3178]:
Nov 21 18:07:14 shrike kernel: WARNING: Found but not happy: 2

That went obviously on for quite a while:

Nov 21 18:09:06 shrike kernel: WARNING: Found but not happy: 2
Nov 21 18:09:07 shrike kernel: reiser4[ent:hda2!(175)]: jnode_lock_parent_coord 
(fs/reiser4/flush.c:3093)[nikita-3178]:
Nov 21 18:17:18 shrike syslogd 1.4.1#16: restart.

So with the debug kernel I got this:

shrike kernel: reiser4 panicked cowardly: assertion failed: extent_get_start(ext) == extent_get_start(&uf_coord->extension.extent.extent)

And in the logs:

(Added newlines for ease of reading, otherwise just as it came)

Nov 21 18:24:08 shrike kernel: reiser4[http(5264)]: ext_by_ext_coord (fs/reiser4 /plugin/item/extent_file_ops.c:26)[vs-1650]:
Nov 21 18:24:08 shrike kernel: 0xc01fd1b0 0xc01f97cb 0xc01f94e5 0xc028ac8a 
Nov 21 18:24:08 shrike kernel: code: -2 at fs/reiser4/search.c:1214
Nov 21 18:24:08 shrike kernel: reiser4 panicked cowardly: assertion failed: extent_get_start(ext) == extent_get_start(&uf_coord->extension.extent.extent)

Nov 21 18:24:08 shrike kernel: context: trace_flags: 0
Nov 21 18:24:08 shrike kernel: pid: 5264, comm: http
Nov 21 18:24:08 shrike kernel: ^Ilock stack:
Nov 21 18:24:08 shrike kernel: .... nr_signaled 0
Nov 21 18:24:08 shrike kernel: .... curpri low
Nov 21 18:24:08 shrike kernel: .... current locks:
Nov 21 18:24:08 shrike kernel: ...... write: 1455893
Nov 21 18:24:08 shrike kernel: ^Iatom: refcount: 2 id: 2786 flags: 0 txnh_count: 1 capture_count: 9 stage: 1 start: 87972, flushed: 0

Nov 21 18:24:08 shrike kernel: ------------[ cut here ]------------
Nov 21 18:24:08 shrike kernel: kernel BUG at fs/reiser4/debug.c:131!
Nov 21 18:24:08 shrike kernel: invalid operand: 0000 [#1]
Nov 21 18:24:08 shrike kernel: PREEMPT DEBUG_PAGEALLOC
Nov 21 18:24:08 shrike kernel: Modules linked in: fglrx lp snd_bt87x ohci1394
ieee1394 snd_emu10k1 snd_rawmidi snd_pcm snd_timer snd_seq_device snd_ac97_codec snd_page_alloc snd_util_mem snd_hwdep snd soundcore parport_pc parport evdev tun iptable_nat ip_conntrack ip_tables uhci_hcd usbcore tuner tda9887 msp3400 bttv video_buf firmware_class i2c_algo_bit v4l2_common btcx_risc videodev i2c_dev i2c_core amd_k7_agp agpgart nvram ide_cd cdrom md5 des blowfish oprofile msr cpuid

Nov 21 18:24:08 shrike kernel: CPU:    0
Nov 21 18:24:08 shrike kernel: EIP:    0060:[reiser4_do_panic+517/688]    Tainted: P   VLI
Nov 21 18:24:08 shrike kernel: EFLAGS: 00010246   (2.6.9-cko3debug) 
Nov 21 18:24:08 shrike kernel: EIP is at reiser4_do_panic+0x205/0x2b0
Nov 21 18:24:08 shrike kernel: eax: 00000000   ebx: c0607ee0   ecx: c0607ee0   edx: c0607ee0
Nov 21 18:24:08 shrike kernel: esi: cf606000   edi: cf607cf4   ebp: cf607bec   esp: cf607bd8
Nov 21 18:24:08 shrike kernel: ds: 007b   es: 007b   ss: 0068

Nov 21 18:24:08 shrike kernel: Process http (pid: 5264, threadinfo=cf606000 task=c0c5bab0)
Nov 21 18:24:08 shrike kernel: Stack: c048f900 c0607a80 000004be 05560a12 05560a12 cf607c2c c0263328 c0476858 
Nov 21 18:24:08 shrike kernel:        c049d520 0000001a c0288d77 cf607c14 cf607cf4 cf607c24 cf607cb4 d5c65000 
Nov 21 18:24:08 shrike kernel:        d0edbed8 cf607d14 cf606000 00000000 cf607cf4 cf607c64 c0265cc3 00000003 

Nov 21 18:24:09 shrike kernel: Call Trace:
Nov 21 18:24:09 shrike kernel:  [show_stack+122/144] show_stack+0x7a/0x90
Nov 21 18:24:09 shrike kernel:  [show_registers+333/432] show_registers+0x14d/0x1b0
Nov 21 18:24:09 shrike kernel:  [die+240/384] die+0xf0/0x180
Nov 21 18:24:09 shrike kernel:  [do_invalid_op+231/240] do_invalid_op+0xe7/0xf0
Nov 21 18:24:09 shrike kernel:  [error_code+45/56] error_code+0x2d/0x38

Nov 21 18:24:09 shrike kernel:  [coord_extension_is_ok+552/1152] coord_extension_is_ok+0x228/0x480
Nov 21 18:24:09 shrike kernel:  [make_extent+547/960] make_extent+0x223/0x3c0
Nov 21 18:24:09 shrike kernel:  [capture_extent+275/1824] capture_extent+0x113/0x720
Nov 21 18:24:09 shrike kernel:  [find_or_create_extent+363/640] find_or_create_extent+0x16b/0x280
Nov 21 18:24:09 shrike kernel:  [shorten_file+355/848] shorten_file+0x163/0x350
Nov 21 18:24:09 shrike kernel:  [truncate_file_body+48/64] truncate_file_body+0x30/0x40

Nov 21 18:24:09 shrike kernel:  [setattr_truncate+114/496] setattr_truncate+0x72/0x1f0
Nov 21 18:24:09 shrike kernel:  [setattr_unix_file+47/80] setattr_unix_file+0x2f/0x50
Nov 21 18:24:09 shrike kernel:  [reiser4_setattr+189/592] reiser4_setattr+0xbd/0x250

Nov 21 18:24:09 shrike kernel:  [notify_change+419/480] notify_change+0x1a3/0x1e0
Nov 21 18:24:09 shrike kernel:  [do_truncate+89/144] do_truncate+0x59/0x90
Nov 21 18:24:09 shrike kernel:  [sys_ftruncate+235/352] sys_ftruncate+0xeb/0x160Nov 21 18:24:09 shrike kernel:  [sysenter_past_esp+82/113] sysenter_past_esp+0x52/0x71

Nov 21 18:24:09 shrike kernel: Code: d2 0f 84 4e ff ff ff 8b 00 39 c8 0f 85 44 ff ff ff 39 42 04 0f 85 3b ff ff ff b8 00 e0 ff ff 21 e0 ff 48 14 8b 40 08 a8 08 75 1c <0f> 0b 83 00 6e 68 47 c0 c7 04 24 7c 64 47 c0 c7 44 24 04 80 7a

Nov 21 18:27:31 shrike kernel:  <1>Unable to handle kernel paging request at virtual address cf607e50
Nov 21 18:27:31 shrike kernel:  printing eip:

And there it ended, with no eip printed below;

Nov 21 18:29:17 shrike syslogd 1.4.1#16: restart.

Any help is appreciated; thanks!

-- 
mjt

