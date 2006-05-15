From: Joe Feise <jfeise@feise.com>
Subject: [BUG] reiser4 crash 2.6.17-rc3-mm1
Date: Mon, 15 May 2006 10:36:41 -0700
Message-ID: <4468BC29.4000502@feise.com>
Reply-To: jfeise@feise.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28621-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

2.6.17-rc3-mm1 plus the latest reiser4-radix-tree-direct-data-fix.patch patch.

-Joe

=============
dmesg output:
=============
BUG: unable to handle kernel NULL pointer dereference at virtual address
0000003c
 printing eip:
c01c8dca
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
last sysfs file: /class/net/ppp0/type
Modules linked in: ppp_async crc_ccitt pl2303 usbserial softdog cisco_ipsec
snd_pcm_oss snd_mixer_oss snd_cs46xx gameport snd_rawmidi snd_seq_device
snd_ac97_codec snd_ac97_bus snd_pcm snd_timer snd soundcore snd_page_alloc
zoran i2c_algo_bit videodev saa7111 i2c_core pegasus arc4 ppp_mppe
ppp_deflate ppp_generic slhc usblp
CPU:    0
EIP:    0060:[<c01c8dca>]    Tainted: P      VLI
EFLAGS: 00010202   (2.6.17-rc3-mm1 #5)
EIP is at fuse_not_fused_lock_owners+0x79/0x1e7
eax: fffffffc   ebx: d4824590   ecx: 00000008   edx: d48245a4
esi: fffffffc   edi: d9d97680   ebp: f782a000   esp: f782bb50
ds: 007b   es: 007b   ss: 0068
Process patch (pid: 10605, threadinfo=f782a000 task=e85e2570)
Stack: <0>ca9a2df0 c55bc880 ca9a2d80 c55bc8c4 00000000 d9d97680 ca9a2d80
f782a000
       c01c8b0b c01c047a f782bba0 00000008 c55bc8c4 00000000 ca9a2d80 c55bc8c4
       00000000 c01c8c97 f782bba0 00000002 00000000 fffffe09 c55bc884 f782a000
Call Trace:
 <c01c8b0b> try_capture_block+0x179/0x27b   <c01c047a>
free_space_shortage+0x2b/0x52
 <c01c8c97> try_capture+0x72/0xe1   <c01c28f5> longterm_lock_znode+0x21a/0x2ab
 <c01d1234> cbk_cache_scan_slots+0x123/0x2d6   <c01d1414>
cbk_cache_search+0x2d/0x4e
 <c01d0278> coord_by_handle+0x8/0x19   <c01d0245> object_lookup+0xab/0xd6
 <c01bf970> done_carry_level+0x5b/0x6e   <c01c4bf6> cut_tree_object+0x77/0x1b9
 <c01c63e5> reiser4_grab+0xaf/0xf2   <c01c647f> reiser4_grab_space+0x57/0x7f
 <c01c64f4> reiser4_grab_reserved+0x4d/0x15d   <c01c24f8>
longterm_unlock_znode+0xb6/0x187
 <c01df340> reserve_cut_iteration+0x59/0x69   <c01df4ab>
cut_file_items+0xd8/0x177
 <c01df599> shorten_file+0x4a/0x20a   <c01df350> update_file_size+0x0/0x83
 <c01df879> truncate_file_body+0x8c/0x90   <c01bc487> preempt_point+0x5/0x1d
 <c01e232f> delete_object_unix_file+0x4a/0xe2   <c01c4f14>
_init_context+0x54/0x78
 <c01d3c1d> reiser4_delete_inode+0x6b/0xca   <c016b5f4> d_delete+0xe0/0xe6
 <c01d3bb2> reiser4_delete_inode+0x0/0xca   <c016d056>
generic_delete_inode+0xaa/0x150
 <c016d2bc> iput+0x53/0x65   <c0163b29> do_unlinkat+0xb9/0xfa
 <c0164781> sys_renameat+0x61/0x73   <c01647ba> sys_rename+0x27/0x2b
 <c0448d2f> syscall_call+0x7/0xb   <c044007b> svc_recv+0x3bc/0x504
Code: 44 24 08 8b 50 70 8d 5a ec 8b 43 14 0f 18 00 90 3b 14 24 0f 84 19 01
00 00 89 f5 8b 43 04 e8 f8 c1 ff ff 3b 44 24 04 89 c6 74 0c <8b> 40 40 3b 78
08 0f 85 33 01 00 00 8b 53 14 8d 42 ec 89 c3 8b
EIP: [<c01c8dca>] fuse_not_fused_lock_owners+0x79/0x1e7 SS:ESP 0068:f782bb50
 <6>note: patch[10605] exited with preempt_count 2

