From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: Problem with the latest auto snapshot
Date: Tue, 15 Jun 2004 18:50:44 +0200
Message-ID: <200406151850.44164.henning-04@die.informatik.uni-siegen.de>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de> <20040615080653.GY8091@backtop.namesys.com> <20040615081441.GZ8091@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19198-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040615081441.GZ8091@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alex Zarochentsev <zam@namesys.com>

Am Dienstag, 15. Juni 2004 10:14 schrieb Alex Zarochentsev:
> > Can you also enable CONFIG_REISER4_CHECK and CONFIG_REISER4_DEBUG?  It
> > may help to catch a bug faster.

Hello Alex, 

thanks for your reply.

I restarted with a debug-enabled kernel, after the fsck --build-sb --fix run 
on the three partitions i use. The fsck reports a consistent fs on all of 
them.

The first access to a reiser4 fs during the boot (cleaning the tmp dir) causes 
several kernel oopses. I captured them with pen and paper, as these message 
don't appear in the system log. I try to capture them with the serial console 
on a second pc, but without success.

The first oops:

stack trace
[...]
unlink_common
lookup_hashed
scheduable
init_context
unlink_file
jnode_make_dirty_locked
vfs_unlink
sys_unlink
sys_gedents64
syscall_call
[...]
reiser4[mkdir] context_list_ok (fs/reiser4/context.h: 169)  [nikita-1054]

reiser4 paniced cowardly: assertion failed: context_list_link_invariant(_link)

process mkdir[..]
stack trace 
[....]
mkdir exited with preempt_count 3
bad: scheduling while atomic


After these messages some oopses appear in the syslog:

Jun 15 18:24:44 sonne kernel: c01dffda
Jun 15 18:24:44 sonne kernel: PREEMPT
Jun 15 18:24:44 sonne kernel: Modules linked in: snd_es1968 snd_ac97_codec 
snd_pcm snd_page_alloc snd
_timer snd_mpu401_uart snd_rawmidi snd_seq_device snd
Jun 15 18:24:44 sonne kernel: CPU:    0
Jun 15 18:24:44 sonne kernel: EIP:    0060:[<c01dffda>]    Not tainted VLI
Jun 15 18:24:44 sonne kernel: EFLAGS: 00010286   (2.6.7-rc3-mm1)
Jun 15 18:24:44 sonne kernel: EIP is at do_jnode_make_dirty+0x9a/0x720
Jun 15 18:24:44 sonne kernel: eax: 00000000   ebx: f7784160   ecx: f73afe8c   
edx: f73ae000
Jun 15 18:24:44 sonne kernel: esi: c01e06bd   edi: f733de40   ebp: f73af850   
esp: f73af80c
Jun 15 18:24:44 sonne kernel: ds: 007b   es: 007b   ss: 0068
Jun 15 18:24:44 sonne kernel: Process rm (pid: 4697, threadinfo=f73ae000 
task=f73b1770)
Jun 15 18:24:44 sonne kernel: Stack: 20000000 0298ffff 00010d3c 00000000 
00000000 c022f970 c022f920 c
022f660
Jun 15 18:24:44 sonne kernel:        0032a29e 00000001 00000000 00000018 
00000001 f7784160 f7784160 f
7784160
Jun 15 18:24:44 sonne kernel:        f7784160 f73af8dc c01e06bd 00000001 
c022e26d f7784160 f73ae000 c
01e0836
Jun 15 18:24:44 sonne kernel: Call Trace:
Jun 15 18:24:44 sonne kernel:  [<c022f970>] kill_head+0x0/0x40
Jun 15 18:24:44 sonne kernel:  [<c022f920>] kill_tail+0x0/0x50
Jun 15 18:24:44 sonne kernel:  [<c022f660>] kill_units+0x0/0x2c0
Jun 15 18:24:44 sonne kernel:  [<c01e06bd>] jnode_make_dirty_locked+0x5d/0x180
Jun 15 18:24:44 sonne kernel:  [<c022e26d>] compact+0x18d/0x490
Jun 15 18:24:44 sonne kernel:  [<c01e0836>] znode_make_dirty+0x56/0x410
Jun 15 18:24:44 sonne kernel:  [<c023087d>] kill_node40+0xbd/0x210
Jun 15 18:24:44 sonne kernel:  [<c01c7bfe>] carry_cut+0x7e/0x1c0
Jun 15 18:24:44 sonne kernel:  [<c01c2213>] carry_on_level+0x63/0x350
Jun 15 18:24:44 sonne kernel:  [<c01c2056>] carry+0x96/0x1f0
Jun 15 18:24:44 sonne kernel:  [<c0229d06>] item_by_coord_node40+0x16/0x140
Jun 15 18:24:44 sonne kernel:  [<c01d082f>] kill_node_content+0x17f/0x350
Jun 15 18:24:44 sonne kernel:  [<c01d4356>] coord_dup+0x16/0x80
Jun 15 18:24:44 sonne kernel:  [<c023e5b1>] rem_entry_cde+0x1a1/0x260
Jun 15 18:24:44 sonne kernel:  [<c0229d06>] item_by_coord_node40+0x16/0x140
Jun 15 18:24:44 sonne kernel:  [<c01e53ec>] extract_key_from_id+0x2c/0xc0
Jun 15 18:24:44 sonne kernel:  [<c02641c1>] rem_entry.22+0x141/0x190
Jun 15 18:24:44 sonne kernel:  [<c01b76a6>] check_jload+0x56/0xa0
Jun 15 18:24:44 sonne kernel:  [<c02645bc>] rem_entry_hashed+0x3ac/0x4b0
Jun 15 18:24:44 sonne kernel:  [<c0265de8>] unlink_common+0x178/0x200
Jun 15 18:24:44 sonne kernel:  [<c026292b>] lookup_hashed+0xab/0x100
Jun 15 18:24:44 sonne kernel:  [<c01b41c8>] schedulable+0x8/0x70
Jun 15 18:24:44 sonne kernel:  [<c01d25bd>] init_context+0xed/0x360
Jun 15 18:24:44 sonne kernel:  [<c020c558>] unlink_file+0x58/0x160
Jun 15 18:24:44 sonne kernel:  [<c01e06bd>] jnode_make_dirty_locked+0x5d/0x180
Jun 15 18:24:44 sonne kernel:  [<c015e1ae>] vfs_unlink+0xee/0x1b0
Jun 15 18:24:44 sonne kernel:  [<c015e324>] sys_unlink+0xb4/0x120
Jun 15 18:24:44 sonne kernel:  [<c0160d06>] sys_getdents64+0x96/0xa0
Jun 15 18:24:44 sonne kernel:  [<c0103ec7>] syscall_call+0x7/0xb
Jun 15 18:24:44 sonne kernel:
Jun 15 18:24:44 sonne kernel: Code: 91 05 00 00 89 b1 a0 00 00 00 8b 45 00 8b 
40 04 89 81 a4 00 00 00
 8b 45 00 8b 00 8b 40 04 89 81 a8 00 00 00 8b 45 00 8b 00 8b 00 <8b> 40 04 89 
81 ac 00 00 00 8b 45 00
 8b 00 8b 00 8b 00 8b 40 04
Jun 15 18:24:44 sonne kernel:  <6>note: rm[4697] exited with preempt_count 2
Jun 15 18:24:44 sonne kernel: reiser4[mkdir(4698)]: context_list_link_ok 
(fs/reiser4/context.h:169)[n
ikita-1054]:
Jun 15 18:24:44 sonne kernel: pid: -1073742648, comm:
Jun 15 18:24:44 sonne kernel: ^Ilock stack:
Jun 15 18:24:44 sonne kernel: .... nr_signaled -147560344
Jun 15 18:24:44 sonne kernel: .... curpri high
Jun 15 18:24:44 sonne kernel: .... current request: read: b8c085086b8b0000
Jun 15 18:24:44 sonne kernel: .... current locks:
Jun 15 18:24:44 sonne kernel: ...... write: f73417e000000000
Jun 15 18:24:44 sonne kernel: c01cc863
Jun 15 18:24:44 sonne kernel: PREEMPT
Jun 15 18:24:44 sonne kernel: Modules linked in: snd_es1968 snd_ac97_codec 
snd_pcm snd_page_alloc snd
_timer snd_mpu401_uart snd_rawmidi snd_seq_device snd
Jun 15 18:24:44 sonne kernel: CPU:    0
Jun 15 18:24:44 sonne kernel: EIP:    0060:[<c01cc863>]    Not tainted VLI
Jun 15 18:24:44 sonne kernel: EFLAGS: 00010286   (2.6.7-rc3-mm1)
Jun 15 18:24:44 sonne kernel: EIP is at print_lock_stack+0xe3/0x160
Jun 15 18:24:44 sonne kernel: eax: 07db0160   ebx: 07db0160   ecx: c04aa570   
edx: 07db016c
Jun 15 18:24:44 sonne kernel: esi: f73afe98   edi: f73afe30   ebp: f73afdbc   
esp: f73afd40
Jun 15 18:24:44 sonne kernel: ds: 007b   es: 007b   ss: 0068
Jun 15 18:24:44 sonne kernel: Process mkdir (pid: 4698, threadinfo=f73ae000 
task=f73b1770)
Jun 15 18:24:44 sonne kernel: Stack: c045057d c045059a f73afe8c f73afe8c 
c059c5a0 c01d2f60 c0450ddb b
ffffcc8
Jun 15 18:24:44 sonne kernel:        f73b019e f73afe8c c01d2fdf f73ae000 
f73afdbc c01b3e56 c04632a8 c
059c140
Jun 15 18:24:44 sonne kernel:        f73afdbc f73aff00 f73afdbc c01d2536 
c044de23 c04632cc 000000a9 f
787ceb8
Jun 15 18:24:44 sonne kernel: Call Trace:
Jun 15 18:24:44 sonne kernel:  [<c01d2f60>] print_context+0x40/0x70
Jun 15 18:24:44 sonne kernel:  [<c01d2fdf>] print_contexts+0x4f/0x70
Jun 15 18:24:44 sonne kernel:  [<c01b3e56>] reiser4_do_panic+0x96/0x2b0
Jun 15 18:24:44 sonne kernel:  [<c01d2536>] init_context+0x66/0x360
Jun 15 18:24:44 sonne kernel:  [<c020bbcf>] reiser4_lookup+0x2f/0x1b0
Jun 15 18:24:44 sonne kernel:  [<c013a21e>] do_page_cache_readahead+0x9e/0x180
Jun 15 18:24:44 sonne kernel:  [<c0165bfb>] d_lookup+0x1b/0x40
Jun 15 18:24:44 sonne kernel:  [<c015bea8>] real_lookup+0xb8/0xe0
Jun 15 18:24:44 sonne kernel:  [<c015c0ee>] do_lookup+0x7e/0x90
Jun 15 18:24:44 sonne kernel:  [<c015c607>] link_path_walk+0x507/0x9e0
Jun 15 18:24:44 sonne kernel:  [<c015cd24>] path_lookup+0x74/0x130
Jun 15 18:24:44 sonne kernel:  [<c015cf54>] __user_walk+0x44/0x60
Jun 15 18:24:44 sonne kernel:  [<c01582ed>] vfs_stat+0x1d/0x50
Jun 15 18:24:44 sonne kernel:  [<c0144acc>] do_brk+0x1ac/0x200
Jun 15 18:24:44 sonne kernel:  [<c0158972>] sys_stat64+0x12/0x30
Jun 15 18:24:44 sonne kernel:  [<c0143218>] sys_brk+0xc8/0xf0
Jun 15 18:24:44 sonne kernel:  [<c0114e20>] do_page_fault+0x0/0x4cc
Jun 15 18:24:44 sonne kernel:  [<c01048d1>] error_code+0x2d/0x38
Jun 15 18:24:44 sonne kernel:  [<c0103ec7>] syscall_call+0x7/0xb
Jun 15 18:24:44 sonne kernel:
Jun 15 18:24:44 sonne kernel: Code: 4b 08 85 c9 74 1d 8d 51 4c b8 92 05 45 c0 
8b 89 80 00 00 00 85 c9
 b9 9f 05 45 c0 0f 4e c1 e8 55 cc 02 00 8b 53 0c 8d 42 f4 89 c3 <8b> 40 0c 83 
e8 0c 0f 18 00 90 39 d6
 75 c6 b8 00 e0 ff ff 21 e0
Jun 15 18:24:44 sonne kernel:  <6>note: mkdir[4698] exited with preempt_count 
3
Jun 15 18:24:44 sonne kernel:  [<c03f8562>] schedule+0x462/0x470
Jun 15 18:24:44 sonne kernel:  [<c0140a3f>] zap_pmd_range+0x3f/0x60
Jun 15 18:24:44 sonne kernel:  [<c030a267>] poke_blanked_console+0x67/0xc0
Jun 15 18:24:44 sonne kernel:  [<c0140a9d>] unmap_page_range+0x3d/0x70
Jun 15 18:24:44 sonne kernel:  [<c0140c74>] unmap_vmas+0x1a4/0x1c0
Jun 15 18:24:44 sonne kernel:  [<c0144b97>] exit_mmap+0x77/0x150
Jun 15 18:24:44 sonne kernel:  [<c0117e0e>] mmput+0x5e/0x90
Jun 15 18:24:44 sonne kernel:  [<c011bb5a>] do_exit+0x14a/0x3e0
Jun 15 18:24:44 sonne kernel:  [<c0104fc1>] die+0xf1/0x100
Jun 15 18:24:44 sonne kernel:  [<c0114e20>] do_page_fault+0x0/0x4cc
Jun 15 18:24:44 sonne kernel:  [<c0114fd4>] do_page_fault+0x1b4/0x4cc
Jun 15 18:24:44 sonne kernel:  [<c012067e>] __mod_timer+0x12e/0x1a0
Jun 15 18:24:44 sonne kernel:  [<c030a267>] poke_blanked_console+0x67/0xc0
Jun 15 18:24:44 sonne kernel:  [<c0305e53>] set_cursor+0x63/0x80
Jun 15 18:24:44 sonne kernel:  [<c030925d>] vt_console_print+0x1fd/0x2d0
Jun 15 18:24:44 sonne kernel:  [<c0305e53>] set_cursor+0x63/0x80
Jun 15 18:24:44 sonne kernel:  [<c0309060>] vt_console_print+0x0/0x2d0
Jun 15 18:24:44 sonne kernel:  [<c0119ea2>] __call_console_drivers+0x42/0x50
Jun 15 18:24:44 sonne kernel:  [<c0119f95>] call_console_drivers+0x75/0x100
Jun 15 18:24:44 sonne kernel:  [<c0114e20>] do_page_fault+0x0/0x4cc
Jun 15 18:24:44 sonne kernel:  [<c01048d1>] error_code+0x2d/0x38
Jun 15 18:24:44 sonne kernel:  [<c01cc863>] print_lock_stack+0xe3/0x160
Jun 15 18:24:44 sonne kernel:  [<c01d2f60>] print_context+0x40/0x70
Jun 15 18:24:44 sonne kernel:  [<c01d2fdf>] print_contexts+0x4f/0x70
Jun 15 18:24:44 sonne kernel:  [<c01b3e56>] reiser4_do_panic+0x96/0x2b0
Jun 15 18:24:44 sonne kernel:  [<c01d2536>] init_context+0x66/0x360
Jun 15 18:24:44 sonne kernel:  [<c020bbcf>] reiser4_lookup+0x2f/0x1b0
Jun 15 18:24:44 sonne kernel:  [<c013a21e>] do_page_cache_readahead+0x9e/0x180
Jun 15 18:24:44 sonne kernel:  [<c0165bfb>] d_lookup+0x1b/0x40
Jun 15 18:24:44 sonne kernel:  [<c015bea8>] real_lookup+0xb8/0xe0
Jun 15 18:24:44 sonne kernel:  [<c015c0ee>] do_lookup+0x7e/0x90
Jun 15 18:24:44 sonne kernel:  [<c015c607>] link_path_walk+0x507/0x9e0
Jun 15 18:24:44 sonne kernel:  [<c015cd24>] path_lookup+0x74/0x130
Jun 15 18:24:44 sonne kernel:  [<c015cf54>] __user_walk+0x44/0x60
Jun 15 18:24:44 sonne kernel:  [<c01582ed>] vfs_stat+0x1d/0x50
Jun 15 18:24:44 sonne kernel:  [<c0144acc>] do_brk+0x1ac/0x200
Jun 15 18:24:44 sonne kernel:  [<c0158972>] sys_stat64+0x12/0x30
Jun 15 18:24:44 sonne kernel:  [<c0143218>] sys_brk+0xc8/0xf0
Jun 15 18:24:44 sonne kernel:  [<c0114e20>] do_page_fault+0x0/0x4cc
Jun 15 18:24:44 sonne kernel:  [<c01048d1>] error_code+0x2d/0x38
Jun 15 18:24:44 sonne kernel:  [<c0103ec7>] syscall_call+0x7/0xb
Jun 15 18:24:44 sonne kernel:
Jun 15 18:24:44 sonne kernel: reiser4[ktxnmgrd:hdd1:t(4415)]: 
context_list_link_ok (fs/reiser4/contex
t.h:169)[nikita-1054]:
Jun 15 18:24:44 sonne kernel: ------------[ cut here ]------------
Jun 15 18:24:44 sonne kernel: PREEMPT
Jun 15 18:24:44 sonne kernel: Modules linked in: snd_es1968 snd_ac97_codec 
snd_pcm snd_page_alloc snd
_timer snd_mpu401_uart snd_rawmidi snd_seq_device snd
Jun 15 18:24:44 sonne kernel: CPU:    0
Jun 15 18:24:44 sonne kernel: EIP:    0060:[<c01b3fc4>]    Not tainted VLI
Jun 15 18:24:44 sonne kernel: EFLAGS: 00010202   (2.6.7-rc3-mm1)
Jun 15 18:24:44 sonne kernel: EIP is at reiser4_do_panic+0x204/0x2b0
Jun 15 18:24:44 sonne kernel: eax: 00000000   ebx: 00000001   ecx: c044de23   
edx: f7a9beec
Jun 15 18:24:44 sonne kernel: esi: f7a9beec   edi: f7a9bf60   ebp: f7ab4090   
esp: f7a9beac
Jun 15 18:24:44 sonne kernel: ds: 007b   es: 007b   ss: 0068
Jun 15 18:24:44 sonne kernel: Process ktxnmgrd:hdd1:t (pid: 4415, 
threadinfo=f7a9a000 task=f7ab4090)
Jun 15 18:24:44 sonne kernel: Stack: c01b4768 f73aff00 f7a9beec f73aff00 
f7a9beec c01d2536 c044de23 c
04632cc
Jun 15 18:24:44 sonne kernel:        000000a9 f78788f4 f7a9beec f78aee14 
c01ff667 00000000 00000000 f
7ab4090
Jun 15 18:24:44 sonne kernel:        4b1b5d0b 00000000 00000001 f7a9bef8 
f7a9bef8 f7a9bf00 f7a9bf00 0
0000000
Jun 15 18:24:44 sonne kernel: Call Trace:
Jun 15 18:24:44 sonne kernel:  [<c01b4768>] report_err+0x8/0xb0
Jun 15 18:24:44 sonne kernel:  [<c01d2536>] init_context+0x66/0x360
Jun 15 18:24:44 sonne kernel:  [<c01ff667>] scan_mgr+0x37/0x120
Jun 15 18:24:44 sonne kernel:  [<c02d1fef>] snprintf+0x1f/0x30
Jun 15 18:24:44 sonne kernel:  [<c01ff446>] ktxnmgrd+0x166/0x1f0
Jun 15 18:24:44 sonne kernel:  [<c01ff2e0>] ktxnmgrd+0x0/0x1f0
Jun 15 18:24:44 sonne kernel:  [<c010227d>] kernel_thread_helper+0x5/0x18
Jun 15 18:24:44 sonne kernel:
Jun 15 18:24:44 sonne kernel: Code: d2 0f 84 4e ff ff ff 8b 00 39 c8 0f 85 44 
ff ff ff 39 42 04 0f 85
 3b ff ff ff b8 00 e0 ff ff 21 e0 ff 48 14 8b 40 08 a8 08 75 1c <0f> 0b 84 00 
39 de 44 c0 c7 04 24 4a
 01 48 c0 c7 44 24 04 40 c1
Jun 15 18:24:44 sonne kernel:  <6>note: ktxnmgrd:hdd1:t[4415] exited with 
preempt_count 2
Jun 15 18:24:44 sonne kernel: reiser4[ktxnmgrd:hdd6:t(4417)]: 
context_list_link_ok (fs/reiser4/contex
t.h:169)[nikita-1054]:
Jun 15 18:24:44 sonne kernel: ------------[ cut here ]------------
Jun 15 18:24:44 sonne kernel: PREEMPT
Jun 15 18:24:44 sonne kernel: Modules linked in: snd_es1968 snd_ac97_codec 
snd_pcm snd_page_alloc snd
_timer snd_mpu401_uart snd_rawmidi snd_seq_device snd
Jun 15 18:24:44 sonne kernel: CPU:    0
Jun 15 18:24:44 sonne kernel: EIP:    0060:[<c01b3fc4>]    Not tainted VLI
Jun 15 18:24:44 sonne kernel: EFLAGS: 00010202   (2.6.7-rc3-mm1)
Jun 15 18:24:44 sonne kernel: EIP is at reiser4_do_panic+0x204/0x2b0
Jun 15 18:24:44 sonne kernel: eax: 00000000   ebx: 00000001   ecx: c044de23   
edx: f7943eec
Jun 15 18:24:44 sonne kernel: esi: f7943eec   edi: f7943f60   ebp: f7a98bf0   
esp: f7943eac
Jun 15 18:24:44 sonne kernel: ds: 007b   es: 007b   ss: 0068
Jun 15 18:24:44 sonne kernel: Process ktxnmgrd:hdd6:t (pid: 4417, 
threadinfo=f7942000 task=f7a98bf0)
Jun 15 18:24:44 sonne kernel: Stack: c01b4768 f73aff00 f7943eec f73aff00 
f7943eec c01d2536 c044de23 c
04632cc
Jun 15 18:24:44 sonne kernel:        000000a9 f78780f4 f7943eec f78ae5d4 
c01ff667 00000000 00000000 f
7a98bf0
Jun 15 18:24:44 sonne kernel:        4b1b5d0b 00000000 00000001 f7943ef8 
f7943ef8 f7943f00 f7943f00 0
0000000
Jun 15 18:24:44 sonne kernel: Call Trace:
Jun 15 18:24:44 sonne kernel:  [<c01b4768>] report_err+0x8/0xb0
Jun 15 18:24:44 sonne kernel:  [<c01d2536>] init_context+0x66/0x360
Jun 15 18:24:44 sonne kernel:  [<c01ff667>] scan_mgr+0x37/0x120
Jun 15 18:24:44 sonne kernel:  [<c02d1fef>] snprintf+0x1f/0x30
Jun 15 18:24:44 sonne kernel:  [<c01ff446>] ktxnmgrd+0x166/0x1f0
Jun 15 18:24:44 sonne kernel:  [<c01ff2e0>] ktxnmgrd+0x0/0x1f0
Jun 15 18:24:44 sonne kernel:  [<c010227d>] kernel_thread_helper+0x5/0x18
Jun 15 18:24:44 sonne kernel:
Jun 15 18:24:44 sonne kernel: Code: d2 0f 84 4e ff ff ff 8b 00 39 c8 0f 85 44 
ff ff ff 39 42 04 0f 85
 3b ff ff ff b8 00 e0 ff ff 21 e0 ff 48 14 8b 40 08 a8 08 75 1c <0f> 0b 84 00 
39 de 44 c0 c7 04 24 4a
 01 48 c0 c7 44 24 04 40 c1
Jun 15 18:24:44 sonne kernel:  <6>note: ktxnmgrd:hdd6:t[4417] exited with 
preempt_count 2
Jun 15 18:24:44 sonne kernel: reiser4[ktxnmgrd:hdd8:t(4419)]: 
context_list_link_ok (fs/reiser4/contex
t.h:169)[nikita-1054]:
Jun 15 18:24:44 sonne kernel: ------------[ cut here ]------------
Jun 15 18:24:44 sonne kernel: PREEMPT
Jun 15 18:24:44 sonne kernel: Modules linked in: snd_es1968 snd_ac97_codec 
snd_pcm snd_page_alloc snd
_timer snd_mpu401_uart snd_rawmidi snd_seq_device snd
Jun 15 18:24:44 sonne kernel: CPU:    0
Jun 15 18:24:44 sonne kernel: EIP:    0060:[<c01b3fc4>]    Not tainted VLI
Jun 15 18:24:44 sonne kernel: EFLAGS: 00010202   (2.6.7-rc3-mm1)
Jun 15 18:24:44 sonne kernel: EIP is at reiser4_do_panic+0x204/0x2b0
Jun 15 18:24:44 sonne kernel: eax: 00000000   ebx: 00000001   ecx: c044de23   
edx: f791feec
Jun 15 18:24:44 sonne kernel: esi: f791feec   edi: f791ff60   ebp: f7a980b0   
esp: f791feac
Jun 15 18:24:44 sonne kernel: ds: 007b   es: 007b   ss: 0068
Jun 15 18:24:44 sonne kernel: Process ktxnmgrd:hdd8:t (pid: 4419, 
threadinfo=f791e000 task=f7a980b0)
Jun 15 18:24:44 sonne kernel: Stack: c01b4768 f73aff00 f791feec f73aff00 
f791feec c01d2536 c044de23 c
04632cc
Jun 15 18:24:44 sonne kernel:        000000a9 f78568f4 f791feec f7868cd4 
c01ff667 00000000 00000000 f
7a980b0
Jun 15 18:24:44 sonne kernel:        4b1b5d0b 00000000 00000001 f791fef8 
f791fef8 f791ff00 f791ff00 0
0000000
Jun 15 18:24:44 sonne kernel: Call Trace:
Jun 15 18:24:44 sonne kernel:  [<c01b4768>] report_err+0x8/0xb0
Jun 15 18:24:44 sonne kernel:  [<c01d2536>] init_context+0x66/0x360
Jun 15 18:24:44 sonne kernel:  [<c01ff667>] scan_mgr+0x37/0x120
Jun 15 18:24:44 sonne kernel:  [<c02d1fef>] snprintf+0x1f/0x30
Jun 15 18:24:44 sonne kernel:  [<c01ff446>] ktxnmgrd+0x166/0x1f0
Jun 15 18:24:44 sonne kernel:  [<c01ff2e0>] ktxnmgrd+0x0/0x1f0
Jun 15 18:24:44 sonne kernel:  [<c010227d>] kernel_thread_helper+0x5/0x18
Jun 15 18:24:44 sonne kernel:
Jun 15 18:24:44 sonne kernel: Code: d2 0f 84 4e ff ff ff 8b 00 39 c8 0f 85 44 
ff ff ff 39 42 04 0f 85
 3b ff ff ff b8 00 e0 ff ff 21 e0 ff 48 14 8b 40 08 a8 08 75 1c <0f> 0b 84 00 
39 de 44 c0 c7 04 24 4a
 01 48 c0 c7 44 24 04 40 c1
Jun 15 18:24:44 sonne kernel:  <6>note: ktxnmgrd:hdd8:t[4419] exited with 
preempt_count 2


reiser4 kernel config:

CONFIG_REISER4_FS=y
# CONFIG_REISER4_FS_SYSCALL is not set
CONFIG_REISER4_LARGE_KEY=y
CONFIG_REISER4_CHECK=y
CONFIG_REISER4_DEBUG=y
# CONFIG_REISER4_FS_SYSCALL_DEBUG is not set
# CONFIG_REISER4_DEBUG_MODIFY is not set
# CONFIG_REISER4_DEBUG_MEMCPY is not set
# CONFIG_REISER4_DEBUG_NODE is not set
# CONFIG_REISER4_ZERO_NEW_NODE is not set
# CONFIG_REISER4_TRACE is not set
# CONFIG_REISER4_EVENT_LOG is not set
# CONFIG_REISER4_STATS is not set
# CONFIG_REISER4_PROF is not set
CONFIG_REISER4_DEBUG_OUTPUT=y
# CONFIG_REISER4_NOOPT is not set
CONFIG_REISER4_USE_EFLUSH=y
# CONFIG_REISER4_COPY_ON_CAPTURE is not set
# CONFIG_REISER4_BADBLOCKS is not set


Hope you could use this report.

Best regards,

Henning
