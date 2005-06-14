From: "M" <martin@luminoussheep.net>
Subject: REISERFS: panic... Trying to log block (prints.c:362)
Date: Tue, 14 Jun 2005 09:08:45 +0100 (BST)
Message-ID: <61572.194.72.110.12.1118736525.squirrel@luminoussheep.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-24373-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

I'm trying to copy a reiserfs filesystem from a pata drive to a sata drive
(both reiserfs) and the kernel panics every time I try with an error
similar to the below:

Jun 14 07:10:41 localhost kernel: Linux version 2.6.12-rc6 (root@myth)
(gcc version 3.3.5 (Debian 1:3.3.5-8)) #5 Mon Jun 13 20:03:38 BST 2005

Jun 14 07:14:36 localhost kernel: REISERFS: panic (device sda2):
journal-2332: Trying to log block 471, which is a log block
Jun 14 07:14:36 localhost kernel:
Jun 14 07:14:36 localhost kernel: ------------[ cut here ]------------
Jun 14 07:14:36 localhost kernel: kernel BUG at fs/reiserfs/prints.c:362!
Jun 14 07:14:36 localhost kernel: invalid operand: 0000 [#1]
Jun 14 07:14:36 localhost kernel: PREEMPT
Jun 14 07:14:36 localhost kernel: Modules linked in: ipv6 lirc_gpio
lirc_dev rtc snd_via82xx snd_ac97_codec snd_mpu401_uart snd_rawmidi
snd_seq_device via_
agp ehci_hcd joydev tsdev evdev usbhid uhci_hcd usbcore via_rhine mii
snd_pcm_oss snd_pcm snd_timer snd_page_alloc snd_mixer_oss snd soundcore
dvb_bt8xx nx
t6000 mt352 sp887x dst_ca dst cx24110 or51211 bt878 tuner bttv video_buf
i2c_algo_bit v4l2_common btcx_risc tveeprom dvb_core i2c_dev via_v4l_drv
videodev
agpgart vt1211 eeprom i2c_sensor i2c_isa i2c_viapro i2c_core psmouse
ide_cd cdrom unix
Jun 14 07:14:36 localhost kernel: CPU:    0
Jun 14 07:14:36 localhost kernel: EIP:    0060:[<c01ab8b2>]    Tainted: PF
    VLI
Jun 14 07:14:36 localhost kernel: EFLAGS: 00010296   (2.6.12-rc6)
Jun 14 07:14:36 localhost kernel: EIP is at reiserfs_panic+0x52/0x80
Jun 14 07:14:36 localhost kernel: eax: 00000065   ebx: c02eb2c3   ecx:
c032298c   edx: c032298c
Jun 14 07:14:36 localhost kernel: esi: d9dcf000   edi: d9dcf140   ebp:
e178afe8   esp: dbc6ae18
Jun 14 07:14:36 localhost kernel: ds: 007b   es: 007b   ss: 0068
Jun 14 07:14:36 localhost kernel: Process pdflush (pid: 116,
threadinfo=dbc6a000 task=dbf27060)
Jun 14 07:14:36 localhost kernel: Stack: c02eefa0 d9dcf140 c03e4940
00000000 e17866ec c02f17a0 c01bbf85 d9dcf000
Jun 14 07:14:36 localhost kernel:        c02f17a0 000001d7 00000000
c01ba075 d9dcf000 c02ebac1 00002012 d5f43180
Jun 14 07:14:36 localhost kernel:        cfdbf938 000003fa 0000000e
c017e6d7 da0e6160 00000004 00000000 00000025
Jun 14 07:14:36 localhost kernel: Call Trace:
Jun 14 07:14:36 localhost kernel:  [<c01bbf85>] do_journal_end+0xa25/0xa30
Jun 14 07:14:36 localhost kernel:  [<c01ba075>] do_journal_begin_r+0x25/0x2b0
Jun 14 07:14:36 localhost kernel:  [<c017e6d7>]
__writeback_single_inode+0x67/0x160
Jun 14 07:14:36 localhost kernel:  [<c01bab95>] journal_end_sync+0x55/0xa0
Jun 14 07:14:36 localhost kernel:  [<c01a80f9>] reiserfs_sync_fs+0x69/0x80
Jun 14 07:14:36 localhost kernel:  [<c0141e08>] get_dirty_limits+0x18/0xd0
Jun 14 07:14:36 localhost kernel:  [<c01a8128>]
reiserfs_write_super+0x18/0x20
Jun 14 07:14:36 localhost kernel:  [<c016188f>] sync_supers+0x9f/0xb0
Jun 14 07:14:36 localhost kernel:  [<c0142268>] wb_kupdate+0x28/0x110
Jun 14 07:14:36 localhost kernel:  [<c0142c8a>] __pdflush+0xca/0x1d0
Jun 14 07:14:36 localhost kernel:  [<c0142d90>] pdflush+0x0/0x30
Jun 14 07:14:36 localhost kernel:  [<c0142db6>] pdflush+0x26/0x30
Jun 14 07:14:36 localhost kernel:  [<c0142240>] wb_kupdate+0x0/0x110
Jun 14 07:14:36 localhost kernel:  [<c0142d90>] pdflush+0x0/0x30
Jun 14 07:14:36 localhost kernel:  [<c012edfa>] kthread+0xaa/0xb0
Jun 14 07:14:36 localhost kernel:  [<c012ed50>] kthread+0x0/0xb0
Jun 14 07:14:36 localhost kernel:  [<c010133d>] kernel_thread_helper+0x5/0x18
Jun 14 07:14:36 localhost kernel: Code: 01 00 00 89 04 24 e8 0e fd ff ff
c7 04 24 a0 ef 2e c0 85 f6 89 d8 0f 45 c7 ba 40 49 3e c0 89 54 24 08 89 44
24 04 e
8 de f2 f6 ff <0f> 0b 6a 01 23 b8 2e c0 c7 04 24 e0 ef 2e c0 85 f6 be 40
49 3e


I'm using a command similar to
tar -clf - / | tar -C /mnt -xf -
So I'm hitting both fs hard I'm guessing this is a preemtion and locking
problem? Would turning off preemntion help?

-- 
Thanks,
M


