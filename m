From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Another panic!
Date: Sun, 21 Nov 2004 21:44:00 +0200
Message-ID: <20041121194400.GX26192@nysv.org>
References: <20041121163755.GV26192@nysv.org> <20041121172031.GW26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22472-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041121172031.GW26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Sun, Nov 21, 2004 at 07:20:31PM +0200, Markus T=F6rnqvist wrote:
>
>Just for the record, seems to be totally reproducible; This time I didn't
>get any info out of it before it totally locked.

I fired up 2.6.10-rc2-mm2 for shits and giggles and see what I got:

Nov 21 21:45:11 shrike kernel: ------------[ cut here ]------------
Nov 21 21:45:11 shrike kernel: kernel BUG at fs/reiser4/plugin/file/tail_co=
nversion.c:58!

Nov 21 21:45:11 shrike kernel: invalid operand: 0000 [#1]
Nov 21 21:45:11 shrike kernel: PREEMPT
Nov 21 21:45:11 shrike kernel: Modules linked in: lp ohci1394 ieee1394 snd_=
emu10k1 snd_rawmidi snd_seq_device snd_ac97_codec snd_pcm snd_timer snd_pag=
e_alloc snd_util_mem snd_hwdep snd soundcore i2c_viapro parport_pc parport =
evdev tun iptable_nat ip_conntrack ip_tables uhci_hcd usbcore tuner tda9887=
 msp3400 bttv video_buf firmware_class i2c_algo_bit v4l2_common btcx_risc v=
ideodev i2c_dev i2c_core
amd_k7_agp agpgart nvram ide_cd md5 des blowfish oprofile msr cpuid

Nov 21 21:45:11 shrike kernel: CPU:    0
Nov 21 21:45:11 shrike kernel: EIP:    0060:[get_nonexclusive_access+38/48]=
   Not tainted VLI
Nov 21 21:45:11 shrike kernel: EFLAGS: 00010286   (2.6.10-rc2-mm2)

Nov 21 21:45:11 shrike kernel: EIP is at get_nonexclusive_access+0x26/0x30
Nov 21 21:45:11 shrike kernel: eax: d985bf30   ebx: d9a16690   ecx: dcb7616=
0   edx: d9a16638
Nov 21 21:45:11 shrike kernel: esi: d9a16660   edi: d9a16638   ebp: dacc054=
4   esp: d985bcb0
Nov 21 21:45:11 shrike kernel: ds: 007b   es: 007b   ss: 0068

Nov 21 21:45:11 shrike kernel: Process apt-get (pid: 5628, threadinfo=3Dd98=
5a000 task=3Ddcf13560)
Nov 21 21:45:11 shrike kernel: Stack: c01f539a b712c000 00000000 00000000 0=
0000000 00000000 00000000 00000000
Nov 21 21:45:11 shrike kernel:        00000000 00000000 00000000 00000000 0=
0000000 00000000 00000000 00000000
Nov 21 21:45:11 shrike kernel:        00000000 00000000 00000000 00000000 0=
0000000 00000000 00000000 00000000

Nov 21 21:45:11 shrike kernel: Call Trace:
Nov 21 21:45:11 shrike kernel:  [unix_file_filemap_nopage+90/176] unix_file=
_filemap_nopage+0x5a/0xb0
Nov 21 21:45:11 shrike kernel:  [do_no_page+179/784] do_no_page+0xb3/0x310
Nov 21 21:45:11 shrike kernel:  [__wait_on_bit_lock+64/96] __wait_on_bit_lo=
ck+0x40/0x60
Nov 21 21:45:11 shrike kernel:  [handle_mm_fault+190/352] handle_mm_fault+0=
xbe/0x160
Nov 21 21:45:11 shrike kernel:  [__follow_page+155/192] __follow_page+0x9b/=
0xc0
Nov 21 21:45:11 shrike kernel:  [get_user_pages+290/896] get_user_pages+0x1=
22/0x380
Nov 21 21:45:11 shrike kernel:  [reiser4_get_user_pages+135/176] reiser4_ge=
t_user_pages+0x87/0xb0
Nov 21 21:45:11 shrike kernel:  [read_unix_file+612/640] read_unix_file+0x2=
64/0x280
Nov 21 21:45:11 shrike kernel:  [reiser4_getattr+94/176] reiser4_getattr+0x=
5e/0xb0

Nov 21 21:45:11 shrike kernel:  [reiser4_read+97/144] reiser4_read+0x61/0x90
Nov 21 21:45:11 shrike kernel:  [sys_fstat64+43/48] sys_fstat64+0x2b/0x30
Nov 21 21:45:11 shrike kernel:  [vfs_read+164/304] vfs_read+0xa4/0x130
Nov 21 21:45:11 shrike kernel:  [sys_read+71/128] sys_read+0x47/0x80

Nov 21 21:45:11 shrike kernel: Code: 0f 00 00 c3 90 89 c2 b8 00 e0 ff ff 21=
 e0 8b 00 8b 80 b8 04 00 00 8b 40 3c 8b 48 08 85 c9 75 0b 89 d0 ff 00 0f 88=
 a3 0f 00 00 c3 <0f> 0b 3a 00 00 32 3c c0 eb eb ba ff ff ff ff 0f c1 10 0f =
88 98

Then I did it again and this is just the output on the screen:
(At least as far as I could quickly copypaste it in ;)

kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:58!
invalid operand: 0000 [#2]
PREEMPT
Modules linked in: lp ohci1394 ieee1394 snd_emu10k1 snd_rawmidi snd_seq_dev=
ice
snd_ac97_codec snd_pcm snd_timer snd_page_alloc snd_util_mem snd_hwdep snd
soundcore i2c_viapro parport_pc parport evdev tun iptable_nat ip_conntrack
ip_tables uhci_hcd usbcore tuner tda9887 msp3400 bttv video_buf firmware_cl=
ass
i2c_algo_bit v4l2_common btcx_risc videodev i2c_dev i2c_core amd_k7_agp
agpgart nvram ide_cd md5 des blowfish oprofile msr cpuid
CPU:    0
EIP:    0060:[<c01f64b6>]    Not tainted VLI
EFLAGS: 00010286   (2.6.10-rc2-mm2)
EIP is at get_nonexclusive_access+0x26/0x30
eax: d9b55f30   ebx: d9a16690   ecx: dcb76160   edx: d9a16638
esi: d9a16660   edi: d9a16638   ebp: db3ecb74   esp: d9b55cb0
ds: 007b   es: 007b   ss: 0068
Process apt-get (pid: 5694, threadinfo=3Dd9b54000 task=3Ddcf13560)
Stack: c01f539a b712c000 00000000 00000000 00000000 00000000 00000000 00000=
000
       00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000=
000
       00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000=
000
Call Trace:

 [<c01f539a>] unix_file_filemap_nopage+0x5a/0xb0
 [<c0142423>] do_no_page+0xb3/0x310
 [<c014284e>] handle_mm_fault+0xbe/0x160
 [<c0140f4b>] __follow_page+0x9b/0xc0
 [<c01410d2>] get_user_pages+0x122/0x380
 [<c01f49a7>] reiser4_get_user_pages+0x87/0xb0
 [<c01f4f54>] read_unix_file+0x264/0x280
 [<c01cd42e>] reiser4_getattr+0x5e/0xb0
 [<c01cdb81>] reiser4_read+0x61/0x90
 [<c0159b8b>] sys_fstat64+0x2b/0x30
 [<c0150694>] vfs_read+0xa4/0x130
 [<c0150977>] sys_read+0x47/0x80
 [<c0102f0d>] sysenter_past_esp+0x52/0x71
Code: 0f 00 00 c3 90 89 c2 b8 00 e0 ff ff 21 e0 8b 00 8b 80 b8 04
 00 00 8b 40 3c 8b 48 08 85 c9 75 0b 89 d0 ff 00 0f 88 a3 0f 00 00
 c3 <0f> 0b 3a 00 00 32 3c c0 eb eb ba ff ff ff ff 0f c1 10 0f 88
 98
 Segmentation fault
             =20
