From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Reiser4 bug
Date: Sun, 5 Sep 2004 19:07:11 +0300
Message-ID: <20040905160711.GS26192@nysv.org>
References: <20040905142502.GQ26192@nysv.org> <20040905155502.GR26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040905155502.GR26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-list@namesys.com

On Sun, Sep 05, 2004 at 06:55:02PM +0300, Markus T=F6rnqvist wrote:
>Yours truly wrote:
>>I haven't tried nicksched in a while, but it didn't perform as well as
>>Staircase.
>Just gave -rc1-mm3 a shot and had my filesystems say bad things.

OK, some bad luck floating around, I just got the same kind of errors
with -cko5...

Sep  5 19:08:52 shrike kernel: reiser4[http(4585)]: ext_by_ext_coord (fs/re=
iser4/plugin/item/extent_file_ops.c:26)[vs-1650]:
Sep  5 19:08:52 shrike kernel: code: -2 at fs/reiser4/search.c:1214
Sep  5 19:08:52 shrike kernel: ------------[ cut here ]------------
Sep  5 19:08:52 shrike kernel: Modules linked in: snd_bt87x ohci1394 ieee13=
94 snd_emu10k1 snd_rawmidi snd_pcm snd_timer snd_seq_device snd_ac97_codec =
snd_page_alloc snd_util_mem snd_hwdep snd soundcore parport_pc parport evde=
v tun iptable_nat ip_conntrack ip_tables uhci_hcd usbcore tuner tda9887 msp=
3400 bttv video_buf firmware_class i2c_algo_bit v4l2_common btcx_risc video=
dev i2c_dev i2c_core radeon amd_k7_agp agpgart nvram ide_cd cdrom md5 des b=
lowfish oprofile msr cpuid
Sep  5 19:08:52 shrike kernel: CPU:    0
Sep  5 19:08:52 shrike kernel: EIP:    0060:[reiser4_do_panic+536/576]    N=
ot tainted
Sep  5 19:08:52 shrike kernel: EFLAGS: 00210246   (2.6.8.1-cko5)=20
Sep  5 19:08:52 shrike kernel: EIP is at reiser4_do_panic+0x218/0x240
Sep  5 19:08:52 shrike kernel: eax: c05add00   ebx: d2d4ff38   ecx: c05add0=
0   edx: d2d4ff38
Sep  5 19:08:52 shrike kernel: esi: 0e2b005b   edi: c375dd4c   ebp: c3689ca=
0   esp: c375dc44
Sep  5 19:08:52 shrike kernel: ds: 007b   es: 007b   ss: 0068
Sep  5 19:08:52 shrike kernel: Process http (pid: 4585, threadinfo=3Dc375c0=
00 task=3Dc3759830)
Sep  5 19:08:52 shrike kernel: Stack: c0446920 c05ad8c0 c0434b46 0e29005b c=
023b161 c042fc79 c0452900 0000001a=20
Sep  5 19:08:52 shrike kernel:        c375dc70 c375dcc8 c375dd4c c3689ca0 0=
0000009 c374d000 c375dd6c c375c000=20
Sep  5 19:08:52 shrike kernel:        00000000 c375dd4c 00000003 c023d8be 0=
0000000 00000000 c375dd4c c025dccf=20
Sep  5 19:08:52 shrike kernel: Call Trace:
Sep  5 19:08:52 shrike kernel:  [coord_extension_is_ok+545/1088] coord_exte=
nsion_is_ok+0x221/0x440
Sep  5 19:08:52 shrike kernel:  [make_extent+558/976] make_extent+0x22e/0x3=
d0
Sep  5 19:08:52 shrike kernel:  [how_to_write+143/5136] how_to_write+0x8f/0=
x1410
Sep  5 19:08:52 shrike kernel:  [check_jload+55/160] check_jload+0x37/0xa0
Sep  5 19:08:52 shrike kernel:  [file_is_built_of_tails+5/16] file_is_built=
_of_tails+0x5/0x10
Sep  5 19:08:53 shrike kernel:  [capture_extent+248/1536] capture_extent+0x=
f8/0x600
Sep  5 19:08:53 shrike kernel:  [find_or_create_extent+337/544] find_or_cre=
ate_extent+0x151/0x220
Sep  5 19:08:53 shrike kernel:  [shorten_file+359/832] shorten_file+0x167/0=
x340
Sep  5 19:08:53 shrike kernel:  [truncate_file_body+47/64] truncate_file_bo=
dy+0x2f/0x40
Sep  5 19:08:53 shrike kernel:  [setattr_truncate+114/496] setattr_truncate=
+0x72/0x1f0
Sep  5 19:08:53 shrike kernel:  [schedulable+8/112] schedulable+0x8/0x70
Sep  5 19:08:53 shrike kernel:  [setattr_unix_file+44/80] setattr_unix_file=
+0x2c/0x50
Sep  5 19:08:53 shrike kernel:  [reiser4_setattr+127/464] reiser4_setattr+0=
x7f/0x1d0
Sep  5 19:08:53 shrike kernel:  [schedulable+8/112] schedulable+0x8/0x70
Sep  5 19:08:53 shrike kernel:  [notify_change+334/400] notify_change+0x14e=
/0x190
Sep  5 19:08:53 shrike kernel:  [do_truncate+90/160] do_truncate+0x5a/0xa0
Sep  5 19:08:53 shrike kernel:  [sys_ftruncate+253/384] sys_ftruncate+0xfd/=
0x180
Sep  5 19:08:53 shrike kernel:  [do_fcntl+166/320] do_fcntl+0xa6/0x140
Sep  5 19:08:53 shrike kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Sep  5 19:08:53 shrike kernel: Code: 0f 0b 84 00 b5 fc 42 c0 c7 04 24 d5 f8=
 42 c0 c7 44 24 04 c0=20
Sep  5 19:08:59 shrike kernel:  reiser4[cc1(4582)]: txnh_list_link_ok (fs/r=
eiser4/txnmgr.c:286)[nikita-1054]:
Sep  5 19:08:59 shrike kernel: code: -2 at fs/reiser4/search.c:1278
Sep  5 19:08:59 shrike kernel: ------------[ cut here ]------------
Sep  5 19:08:59 shrike kernel: Modules linked in: snd_bt87x ohci1394 ieee13=
94 snd_emu10k1 snd_rawmidi snd_pcm snd_timer snd_seq_device snd_ac97_codec =
snd_page_alloc snd_util_mem snd_hwdep snd soundcore parport_pc parport evde=
v tun iptable_nat ip_conntrack ip_tables uhci_hcd usbcore tuner tda9887 msp=
3400 bttv video_buf firmware_class i2c_algo_bit v4l2_common btcx_risc video=
dev i2c_dev i2c_core radeon amd_k7_agp agpgart nvram ide_cd cdrom md5 des b=
lowfish oprofile msr cpuid
Sep  5 19:08:59 shrike kernel: CPU:    0
Sep  5 19:08:59 shrike kernel: EIP:    0060:[reiser4_do_panic+536/576]    N=
ot tainted
Sep  5 19:08:59 shrike kernel: EFLAGS: 00210202   (2.6.8.1-cko5)=20
Sep  5 19:08:59 shrike kernel: EIP is at reiser4_do_panic+0x218/0x240
Sep  5 19:08:59 shrike kernel: eax: 00000025   ebx: 00000001   ecx: c042fc7=
9   edx: 0000684d
Sep  5 19:08:59 shrike kernel: esi: d4c64160   edi: d2d4fdd0   ebp: 0000000=
8   esp: d2d4f9c8
Sep  5 19:08:59 shrike kernel: ds: 007b   es: 007b   ss: 0068
Sep  5 19:08:59 shrike kernel: Process cc1 (pid: 4582, threadinfo=3Dd2d4e00=
0 task=3Dd9d7a170)
Sep  5 19:08:59 shrike kernel: Stack: c042fd4a fffffffe c0434b46 c375de98 c=
01c9204 c042fc79 c0449f00 0000011e=20
Sep  5 19:08:59 shrike kernel:        d4c64160 d5dc7b80 d2d4fdd0 c01cb3e2 0=
0000000 00028000 00000000 d5dc7b80=20
Sep  5 19:08:59 shrike kernel:        00000000 00000008 d4c64160 c01c84e2 0=
0000001 dffd9a00 c01e5ba3 d2d4fdd0=20
Sep  5 19:08:59 shrike kernel: Call Trace:
Sep  5 19:08:59 shrike kernel:  [capture_assign_txnh_nolock+164/576] captur=
e_assign_txnh_nolock+0xa4/0x240
Sep  5 19:08:59 shrike kernel:  [capture_assign_txnh+242/592] capture_assig=
n_txnh+0xf2/0x250
Sep  5 19:08:59 shrike kernel:  [try_capture_block+370/880] try_capture_blo=
ck+0x172/0x370
Sep  5 19:08:59 shrike kernel:  [write_tree_log+179/512] write_tree_log+0xb=
3/0x200
Sep  5 19:08:59 shrike kernel:  [try_capture+104/304] try_capture+0x68/0x130
Sep  5 19:08:59 shrike kernel:  [longterm_lock_tryfast+77/272] longterm_loc=
k_tryfast+0x4d/0x110
Sep  5 19:08:59 shrike kernel:  [schedulable+8/112] schedulable+0x8/0x70
Sep  5 19:08:59 shrike kernel:  [longterm_lock_znode+1520/1792] longterm_lo=
ck_znode+0x5f0/0x700
Sep  5 19:08:59 shrike kernel:  [cfq_add_crq_rb+68/80] cfq_add_crq_rb+0x44/=
0x50
Sep  5 19:08:59 shrike kernel:  [get_htable+10/32] get_htable+0xa/0x20
Sep  5 19:08:59 shrike kernel:  [zlook+149/560] zlook+0x95/0x230
Sep  5 19:08:59 shrike kernel:  [prepare_object_lookup+68/592] prepare_obje=
ct_lookup+0x44/0x250
Sep  5 19:08:59 shrike kernel:  [schedulable+8/112] schedulable+0x8/0x70
Sep  5 19:08:59 shrike kernel:  [traverse_tree+1192/1824] traverse_tree+0x4=
a8/0x720
Sep  5 19:08:59 shrike kernel:  [coord_by_handle+41/80] coord_by_handle+0x2=
9/0x50
Sep  5 19:08:59 shrike kernel:  [object_lookup+266/912] object_lookup+0x10a=
/0x390
Sep  5 19:08:59 shrike kernel:  [find_file_item+363/688] find_file_item+0x1=
6b/0x2b0
Sep  5 19:08:59 shrike kernel:  [readpage_unix_file+347/2320] readpage_unix=
_file+0x15b/0x910
Sep  5 19:09:00 shrike kernel:  [dst_output+0/48] dst_output+0x0/0x30
Sep  5 19:09:00 shrike kernel:  [activate_task+104/128] activate_task+0x68/=
0x80
Sep  5 19:09:00 shrike kernel:  [reiser4_readpage+194/624] reiser4_readpage=
+0xc2/0x270
Sep  5 19:09:00 shrike kernel:  [page_cache_read+149/208] page_cache_read+0=
x95/0xd0
Sep  5 19:09:00 shrike kernel:  [filemap_nopage+668/752] filemap_nopage+0x2=
9c/0x2f0
Sep  5 19:09:00 shrike kernel:  [unix_file_filemap_nopage+72/192] unix_file=
_filemap_nopage+0x48/0xc0
Sep  5 19:09:00 shrike kernel:  [do_anonymous_page+247/320] do_anonymous_pa=
ge+0xf7/0x140
Sep  5 19:09:00 shrike kernel:  [do_no_page+137/656] do_no_page+0x89/0x290
Sep  5 19:09:00 shrike kernel:  [handle_mm_fault+190/288] handle_mm_fault+0=
xbe/0x120
Sep  5 19:09:00 shrike kernel:  [do_page_fault+308/1286] do_page_fault+0x13=
4/0x506
Sep  5 19:09:00 shrike kernel:  [schedule+437/816] schedule+0x1b5/0x330
Sep  5 19:09:00 shrike kernel:  [do_page_fault+0/1286] do_page_fault+0x0/0x=
506
Sep  5 19:09:00 shrike kernel:  [error_code+45/56] error_code+0x2d/0x38
Sep  5 19:09:00 shrike kernel: Code: 0f 0b 84 00 b5 fc 42 c0 c7 04 24 d5 f8=
 42 c0 c7 44 24 04 c0=20
Sep  5 19:09:00 shrike kernel:  reiser4[as(4583)]: txnh_list_link_ok (fs/re=
iser4/txnmgr.c:286)[nikita-1054]:
Sep  5 19:09:00 shrike kernel: code: -2 at fs/reiser4/search.c:1278
Sep  5 19:09:00 shrike kernel: ------------[ cut here ]------------
Sep  5 19:09:00 shrike kernel: Modules linked in: snd_bt87x ohci1394 ieee13=
94 snd_emu10k1 snd_rawmidi snd_pcm snd_timer snd_seq_device snd_ac97_codec =
snd_page_alloc snd_util_mem snd_hwdep snd soundcore parport_pc parport evde=
v tun iptable_nat ip_conntrack ip_tables uhci_hcd usbcore tuner tda9887 msp=
3400 bttv video_buf firmware_class i2c_algo_bit v4l2_common btcx_risc video=
dev i2c_dev i2c_core radeon amd_k7_agp agpgart nvram ide_cd cdrom md5 des b=
lowfish oprofile msr cpuid
Sep  5 19:09:00 shrike kernel: CPU:    0
Sep  5 19:09:00 shrike kernel: EIP:    0060:[reiser4_do_panic+536/576]    N=
ot tainted
Sep  5 19:09:00 shrike kernel: EFLAGS: 00210202   (2.6.8.1-cko5)=20
Sep  5 19:09:00 shrike kernel: EIP is at reiser4_do_panic+0x218/0x240
Sep  5 19:09:00 shrike kernel: eax: 00000025   ebx: 00000001   ecx: c042fc7=
9   edx: 000072ee
Sep  5 19:09:00 shrike kernel: esi: d4c64160   edi: d2d61f00   ebp: 0000000=
8   esp: d2d61a00
Sep  5 19:09:00 shrike kernel: ds: 007b   es: 007b   ss: 0068
Sep  5 19:09:00 shrike kernel: Process as (pid: 4583, threadinfo=3Dd2d60000=
 task=3Dd9d7b250)
Sep  5 19:09:00 shrike kernel: Stack: c042fd4a fffffffe c0434b46 c375de98 c=
01c9204 c042fc79 c0449f00 0000011e=20
Sep  5 19:09:00 shrike kernel:        d4c64160 d36b85e0 d2d61f00 c01cb3e2 0=
000006c d2d61a58 dffd9a00 d36b85e0=20
Sep  5 19:09:00 shrike kernel:        00000000 00000008 d4c64160 c01c84e2 0=
0000001 00000000 2e2e2e2e d2d61f00=20
Sep  5 19:09:00 shrike kernel: Call Trace:
Sep  5 19:09:00 shrike kernel:  [capture_assign_txnh_nolock+164/576] captur=
e_assign_txnh_nolock+0xa4/0x240
Sep  5 19:09:00 shrike kernel:  [capture_assign_txnh+242/592] capture_assig=
n_txnh+0xf2/0x250
Sep  5 19:09:00 shrike kernel:  [try_capture_block+370/880] try_capture_blo=
ck+0x172/0x370
Sep  5 19:09:00 shrike kernel:  [try_capture+104/304] try_capture+0x68/0x130
Sep  5 19:09:00 shrike kernel:  [longterm_lock_znode+1350/1792] longterm_lo=
ck_znode+0x546/0x700
Sep  5 19:09:00 shrike kernel:  [cfq_insert_request+217/272] cfq_insert_req=
uest+0xd9/0x110
Sep  5 19:09:00 shrike kernel:  [get_htable+10/32] get_htable+0xa/0x20
Sep  5 19:09:00 shrike kernel:  [zlook+149/560] zlook+0x95/0x230
Sep  5 19:09:00 shrike kernel:  [prepare_object_lookup+68/592] prepare_obje=
ct_lookup+0x44/0x250
Sep  5 19:09:00 shrike kernel:  [schedulable+8/112] schedulable+0x8/0x70
Sep  5 19:09:00 shrike kernel:  [traverse_tree+1192/1824] traverse_tree+0x4=
a8/0x720
Sep  5 19:09:00 shrike kernel:  [coord_by_handle+41/80] coord_by_handle+0x2=
9/0x50
Sep  5 19:09:00 shrike kernel:  [object_lookup+266/912] object_lookup+0x10a=
/0x390
Sep  5 19:09:00 shrike kernel:  [find_file_item+363/688] find_file_item+0x1=
6b/0x2b0
Sep  5 19:09:00 shrike kernel:  [append_and_or_overwrite+371/2064] append_a=
nd_or_overwrite+0x173/0x810
Sep  5 19:09:00 shrike kernel:  [__ide_dma_begin+34/48] __ide_dma_begin+0x2=
2/0x30
Sep  5 19:09:00 shrike kernel:  [write_flow+160/240] write_flow+0xa0/0xf0
Sep  5 19:09:00 shrike kernel:  [append_hole+157/320] append_hole+0x9d/0x140
Sep  5 19:09:00 shrike kernel:  [write_file+59/224] write_file+0x3b/0xe0
Sep  5 19:09:00 shrike kernel:  [write_unix_file+565/864] write_unix_file+0=
x235/0x360
Sep  5 19:09:00 shrike kernel:  [filemap_nopage+446/752] filemap_nopage+0x1=
be/0x2f0
Sep  5 19:09:00 shrike kernel:  [reiser4_write+286/848] reiser4_write+0x11e=
/0x350
Sep  5 19:09:00 shrike kernel:  [do_anonymous_page+247/320] do_anonymous_pa=
ge+0xf7/0x140
Sep  5 19:09:00 shrike kernel:  [vfs_write+176/256] vfs_write+0xb0/0x100
Sep  5 19:09:00 shrike kernel:  [copy_to_user+50/80] copy_to_user+0x32/0x50
Sep  5 19:09:00 shrike kernel:  [sys_write+71/128] sys_write+0x47/0x80
Sep  5 19:09:00 shrike kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Sep  5 19:09:00 shrike kernel: Code: 0f 0b 84 00 b5 fc 42 c0 c7 04 24 d5 f8=
 42 c0 c7 44 24 04 c0=20
Sep  5 19:09:02 shrike kernel:  <4>atkbd.c: Unknown key released (translate=
d set 2, code 0x81 on isa0060/serio0).
Sep  5 19:09:02 shrike kernel: atkbd.c: Use 'setkeycodes e001 <keycode>' to=
 make it known.
Sep  5 19:09:13 shrike kernel: reiser4[mprime(4578)]: txnh_list_link_ok (fs=
/reiser4/txnmgr.c:286)[nikita-1054]:
Sep  5 19:09:13 shrike kernel: code: -2 at fs/reiser4/search.c:1278
Sep  5 19:09:13 shrike kernel: ------------[ cut here ]------------
Sep  5 19:09:13 shrike kernel: Modules linked in: snd_bt87x ohci1394 ieee13=
94 snd_emu10k1 snd_rawmidi snd_pcm snd_timer snd_seq_device snd_ac97_codec =
snd_page_alloc snd_util_mem snd_hwdep snd soundcore parport_pc parport evde=
v tun iptable_nat ip_conntrack ip_tables uhci_hcd usbcore tuner tda9887 msp=
3400 bttv video_buf firmware_class i2c_algo_bit v4l2_common btcx_risc video=
dev i2c_dev i2c_core radeon amd_k7_agp agpgart nvram ide_cd cdrom md5 des b=
lowfish oprofile msr cpuid
Sep  5 19:09:13 shrike kernel: CPU:    0
Sep  5 19:09:13 shrike kernel: EIP:    0060:[reiser4_do_panic+536/576]    N=
ot tainted
Sep  5 19:09:13 shrike kernel: EFLAGS: 00010202   (2.6.8.1-cko5)=20
Sep  5 19:09:13 shrike kernel: EIP is at reiser4_do_panic+0x218/0x240
Sep  5 19:09:13 shrike kernel: eax: 00000025   ebx: 00000001   ecx: c042fc7=
9   edx: 00007d70
Sep  5 19:09:13 shrike kernel: esi: d4c64160   edi: d53e3e24   ebp: 0000000=
8   esp: d53e39bc
Sep  5 19:09:13 shrike kernel: ds: 007b   es: 007b   ss: 0068
Sep  5 19:09:13 shrike kernel: Process mprime (pid: 4578, threadinfo=3Dd53e=
2000 task=3Dda2de0d0)
Sep  5 19:09:13 shrike kernel: Stack: c042fd4a fffffffe c0434b46 c375de98 c=
01c9204 c042fc79 c0449f00 0000011e=20
Sep  5 19:09:13 shrike kernel:        d4c64160 dfc6c160 d53e3e24 c01cb3e2 0=
0000000 c01e9db2 000000d0 dfc6c160=20
Sep  5 19:09:13 shrike kernel:        00000000 00000008 d4c64160 c01c84e2 0=
0000001 d53e3cc4 d53e3cc4 d53e3e24=20
Sep  5 19:09:13 shrike kernel: Call Trace:
Sep  5 19:09:13 shrike kernel:  [capture_assign_txnh_nolock+164/576] captur=
e_assign_txnh_nolock+0xa4/0x240
Sep  5 19:09:13 shrike kernel:  [capture_assign_txnh+242/592] capture_assig=
n_txnh+0xf2/0x250
Sep  5 19:09:13 shrike kernel:  [reiser4_block_count+18/176] reiser4_block_=
count+0x12/0xb0
Sep  5 19:09:13 shrike kernel:  [try_capture_block+370/880] try_capture_blo=
ck+0x172/0x370
Sep  5 19:09:13 shrike kernel:  [try_capture+104/304] try_capture+0x68/0x130
Sep  5 19:09:13 shrike kernel:  [key_at_node40+74/272] key_at_node40+0x4a/0=
x110
Sep  5 19:09:13 shrike kernel:  [longterm_lock_tryfast+77/272] longterm_loc=
k_tryfast+0x4d/0x110
Sep  5 19:09:13 shrike kernel:  [schedulable+8/112] schedulable+0x8/0x70
Sep  5 19:09:13 shrike kernel:  [longterm_lock_znode+1520/1792] longterm_lo=
ck_znode+0x5f0/0x700
Sep  5 19:09:13 shrike kernel:  [reiser4_check_block+27/32] reiser4_check_b=
lock+0x1b/0x20
Sep  5 19:09:13 shrike kernel:  [zget+721/1600] zget+0x2d1/0x640
Sep  5 19:09:13 shrike kernel:  [cbk_level_lookup+116/1376] cbk_level_looku=
p+0x74/0x560
Sep  5 19:09:13 shrike kernel:  [return_err+46/176] return_err+0x2e/0xb0
Sep  5 19:09:13 shrike kernel:  [move_lh_internal+715/2064] move_lh_interna=
l+0x2cb/0x810
Sep  5 19:09:13 shrike kernel:  [traverse_tree+291/1824] traverse_tree+0x12=
3/0x720
Sep  5 19:09:13 shrike kernel:  [coord_by_handle+41/80] coord_by_handle+0x2=
9/0x50
Sep  5 19:09:13 shrike kernel:  [coord_by_key+252/800] coord_by_key+0xfc/0x=
320
Sep  5 19:09:13 shrike kernel:  [reiser4_exit_context+14/144] reiser4_exit_=
context+0xe/0x90
Sep  5 19:09:13 shrike kernel:  [insert_by_key+106/368] insert_by_key+0x6a/=
0x170
Sep  5 19:09:13 shrike kernel:  [store_black_box+165/448] store_black_box+0=
xa5/0x1c0
Sep  5 19:09:13 shrike kernel:  [safe_link_add+89/160] safe_link_add+0x59/0=
xa0
Sep  5 19:09:13 shrike kernel:  [setattr_truncate+416/496] setattr_truncate=
+0x1a0/0x1f0
Sep  5 19:09:13 shrike kernel:  [schedulable+8/112] schedulable+0x8/0x70
Sep  5 19:09:13 shrike kernel:  [setattr_unix_file+44/80] setattr_unix_file=
+0x2c/0x50
Sep  5 19:09:13 shrike kernel:  [reiser4_setattr+127/464] reiser4_setattr+0=
x7f/0x1d0
Sep  5 19:09:13 shrike kernel:  [reiser4_iget_complete+58/208] reiser4_iget=
_complete+0x3a/0xd0
Sep  5 19:09:13 shrike kernel:  [notify_change+334/400] notify_change+0x14e=
/0x190
Sep  5 19:09:13 shrike kernel:  [do_truncate+90/160] do_truncate+0x5a/0xa0
Sep  5 19:09:13 shrike kernel:  [cached_lookup+110/128] cached_lookup+0x6e/=
0x80
Sep  5 19:09:13 shrike kernel:  [reiser4_permission+0/128] reiser4_permissi=
on+0x0/0x80
Sep  5 19:09:13 shrike kernel:  [may_open+351/448] may_open+0x15f/0x1c0
Sep  5 19:09:13 shrike kernel:  [open_namei+160/1328] open_namei+0xa0/0x530
Sep  5 19:09:13 shrike kernel:  [filp_open+45/80] filp_open+0x2d/0x50
Sep  5 19:09:13 shrike kernel:  [get_unused_fd+40/176] get_unused_fd+0x28/0=
xb0
Sep  5 19:09:13 shrike kernel:  [sys_open+77/128] sys_open+0x4d/0x80
Sep  5 19:09:13 shrike kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Sep  5 19:09:13 shrike kernel: Code: 0f 0b 84 00 b5 fc 42 c0 c7 04 24 d5 f8=
 42 c0 c7 44 24 04 c0=20

In my config I have:
CONFIG_REISER4_FS=3Dy
CONFIG_REISER4_LARGE_KEY=3Dy
CONFIG_REISER4_CHECK=3Dy
CONFIG_REISER4_DEBUG=3Dy
CONFIG_REISER4_DEBUG_NODE=3Dy
CONFIG_REISER4_EVENT_LOG=3Dy

Going to try -cko5 without debugging, just for shits and giggles :P

--=20
mjt

