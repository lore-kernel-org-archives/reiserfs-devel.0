From: Thorsten Hirsch <t.hirsch@web.de>
Subject: Re: More Slowdown or reiser4 update for 2.6.14-mm2
Date: Thu, 17 Nov 2005 21:23:36 +0100
Message-ID: <1132259016.6364.7.camel@bauerbob.hirsch.lan>
References: <200511171447.41362.mail@earthworm.de>
	 <437CBC63.3050202@namesys.com>
	 <1132254834.6350.19.camel@bauerbob.hirsch.lan>
	 <1132256030.6340.5.camel@bauerbob.hirsch.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26990-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1132256030.6340.5.camel@bauerbob.hirsch.lan>
Sender: t.hirsch@web.de
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Seems like there's a bug in your patch

> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-mm2/reiser4-for-2.6.14-mm2-1.patch.gz

------------[ cut here ]------------
kernel BUG at fs/reiser4/block_alloc.c:149!
invalid operand: 0000 [#1]
last sysfs file: /class/vc/vcsa7/dev
Modules linked in: snd_opl3_synth snd_seq_instr snd_seq_midi_emul
snd_ainstr_fm snd_pcm_oss snd_mixer_oss snd_seq_oss snd_seq_midi_event
snd_seq snd_cmipci snd_pcm snd_page_alloc snd_opl3_lib snd_timer
snd_hwdep snd_mpu401_uart snd_rawmidi snd_seq_device snd soundcore ntfs
tuner tvaudio bttv video_buf firmware_class i2c_algo_bit v4l2_common
btcx_risc tveeprom i2c_core videodev ehci_hcd uhci_hcd usbcore via_rhine
lp parport_pc parport loop aes_i586 nvidia rtc
CPU:    0
EIP:    0060:[<c01a11bb>]    Tainted: P      VLI
EFLAGS: 00210297   (2.6.14-mm2)
EIP is at sub_from_ctx_grabbed+0x3b/0x50
eax: 00000000   ebx: 00000000   ecx: 00000001   edx: 00000000
esi: da564cc0   edi: c158d800   ebp: c5b6f2e0   esp: c3013ca4
ds: 007b   es: 007b   ss: 0068
Process java (pid: 7631, threadinfo=c3012000 task=c495ba90)
Stack: 00000001 00000000 c01a21ef da564cc0 00000001 00000000 d36cf960
d36cf960
       d3dd43e0 c01a428d d3dd43e0 00000001 00000000 d36cf960 d36cf960
c5b6f38c
       c01a42ec d36cf960 d3dd43e0 c5b6f38c 00000003 00000001 c01d2f16
c5b6f38c
Call Trace:
 [<c01a21ef>] grabbed2flush_reserved_nolock+0x3f/0x80
 [<c01a428d>] do_jnode_make_dirty+0x11d/0x150
 [<c01a42ec>] jnode_make_dirty_locked+0x2c/0x40
 [<c01d2f16>] save_static_sd+0x86/0x90
 [<c01a431e>] znode_make_dirty+0x1e/0x80
 [<c01bddb2>] update_sd_at+0xd2/0x220
 [<c01bdcc8>] locate_inode_sd+0xe8/0x100
 [<c01bdf7b>] update_sd+0x7b/0xa0
 [<c0195ac5>] preempt_point+0x5/0x20
 [<c01bce38>] write_sd_by_inode_common+0xc8/0xd0
 [<c019fa1e>] init_context+0xe/0x80
 [<c01c0438>] sync_unix_file+0x58/0x80
 [<c01c185c>] write_file+0x9c/0xd0
 [<c0195ac5>] preempt_point+0x5/0x20
 [<c01a28cd>] txn_begin+0x1d/0x30
 [<c01c1ba0>] write_unix_file+0x310/0x5f0
 [<c02ccd4c>] copy_from_user+0x4c/0x90
 [<c01c1890>] write_unix_file+0x0/0x5f0
 [<c015995d>] do_readv_writev+0x18d/0x310
 [<c044d4f3>] schedule+0x313/0x650
 [<c0159b98>] vfs_writev+0x58/0x60
 [<c0159c9b>] sys_writev+0x4b/0xb0
 [<c0103149>] syscall_call+0x7/0xb
Code: 24 14 8b 4c 24 10 8b 56 64 8b 46 60 39 da 76 15 29 c8 19 da 89 46
60 89 56 64 8b 1c 24 8b 74 24 04 83 c4 08 c3 72 04 39 c8 73 e5 <0f> 0b
95 00 32 8d 46 c0 eb db 8d 74 26 00 8d bc 27 00 00 00 00
-------------------------------------------------

Regards,
Thorsten

