From: "David Dabbs" <david@dabbs.net>
Subject: reiser4 mount problem
Date: Tue, 3 Aug 2004 05:52:51 -0500
Message-ID: <20040803105540.4B77915D76@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Using the reiser4 07.30-19.36-linux-2.6.8-rc2-mm1.diff.gz snapshot I can
mkfs.reiser4 okay, but attempting to mount either segfaults or locks up.

I rebuilt libaal (0.5.3) as well as reiser4fsprogs (0.5.6) just to be sure
but the problem remains. Here is the fs-relevant section from my .config

CONFIG_REISER4_FS=y
CONFIG_REISER4_LARGE_KEY=y
# CONFIG_REISER4_CHECK is not set
CONFIG_REISER4_USE_EFLUSH=y
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
CONFIG_REISERFS_FS_XATTR=y
CONFIG_REISERFS_FS_POSIX_ACL=y
CONFIG_REISERFS_FS_SECURITY=y


Oops from the logs:


Unable to handle kernel paging request at virtual address 00020004
  printing eip:
 c01c09ca
 *pde = 00000000
 Oops: 0000 [#1]
 PREEMPT 
 Modules linked in: edd joydev sg st sd_mod sr_mod scsi_mod nvram usbserial
parport_pc lp parport snd_seq_oss snd_pcm_oss snd_mixer_oss snd_seq_midi
snd_seq_midi_event snd_opl3_synth snd_seq_instr snd_seq_midi_emul snd_seq
snd_ainstr_fm speedstep_lib freq_table snd_cs4236 snd_opl3_lib snd_hwdep
snd_cs4236_lib snd_mpu401_uart snd_rawmidi snd_seq_device snd_cs4231_lib
snd_pcm snd_timer snd soundcore ipv6 snd_page_alloc usbhid intel_agp agpgart
uhci_hcd af_packet evdev 3c59x usbcore dm_mod
 CPU:    0
 EIP:    0060:[clog_link_object+122/272]    Not tainted VLI
 EIP:    0060:[<c01c09ca>]    Not tainted VLI
 EFLAGS: 00210286   (2.6.8-rc2-mm1) 
 EIP is at clog_link_object+0x7a/0x110
 eax: 00020000   ebx: c7c8a000   ecx: c7f2a660   edx: 00000000
 esi: c04ec3c4   edi: c7f2a660   ebp: c7c8ab80   esp: c7c8ab70
 ds: 007b   es: 007b   ss: 0068
 Process mount (pid: 9674, threadinfo=c7c8a000 task=ce160290)
 Stack: 00000001 c7c8ac58 c7f2a660 c7c8ae14 c7f2a660 c01c73ce c7c8ae14
00000000 
        00000000 c01c77e5 c7c8a000 00000000 c7c8ae14 c7f2a660 c01c78a2
00000001 
        00000000 00000000 c7c8a000 c7c8ae14 00000001 c01c7a87 c7c8adf0
c7c8ae50 
 Call Trace:
  [lock_object+78/144] lock_object+0x4e/0x90
  [<c01c73ce>] lock_object+0x4e/0x90
  [lock_tail+101/144] lock_tail+0x65/0x90
  [<c01c77e5>] lock_tail+0x65/0x90
  [longterm_lock_tryfast+146/240] longterm_lock_tryfast+0x92/0xf0
  [<c01c78a2>] longterm_lock_tryfast+0x92/0xf0
  [longterm_lock_znode+391/720] longterm_lock_znode+0x187/0x2d0
  [<c01c7a87>] longterm_lock_znode+0x187/0x2d0
  [traverse_tree+313/624] traverse_tree+0x139/0x270
  [<c01d7539>] traverse_tree+0x139/0x270
  [cbk_cache_search+65/96] cbk_cache_search+0x41/0x60
  [<c01d8021>] cbk_cache_search+0x41/0x60
  [coord_by_key+194/240] coord_by_key+0xc2/0xf0
  [<c01d6c92>] coord_by_key+0xc2/0xf0
  [lookup_sd+105/192] lookup_sd+0x69/0xc0
  [<c01e7449>] lookup_sd+0x69/0xc0
  [read_inode+86/352] read_inode+0x56/0x160
  [<c01dd5c6>] read_inode+0x56/0x160
  [reiser4_iget+231/336] reiser4_iget+0xe7/0x150
  [<c01dd8e7>] reiser4_iget+0xe7/0x150
  [init_locked_inode+0/96] init_locked_inode+0x0/0x60
  [<c01dd6d0>] init_locked_inode+0x0/0x60
  [_init_fs_root+49/288] _init_fs_root+0x31/0x120
  [<c01e60b1>] _init_fs_root+0x31/0x120
  [d_cursor_init_at+71/160] d_cursor_init_at+0x47/0xa0
  [<c02021f7>] d_cursor_init_at+0x47/0xa0
  [reiser4_fill_super+48/96] reiser4_fill_super+0x30/0x60
  [<c01e6280>] reiser4_fill_super+0x30/0x60
  [get_sb_bdev+227/320] get_sb_bdev+0xe3/0x140
  [<c015d8c3>] get_sb_bdev+0xe3/0x140
  [reiser4_get_sb+25/32] reiser4_get_sb+0x19/0x20
  [<c01df609>] reiser4_get_sb+0x19/0x20
  [reiser4_fill_super+0/96] reiser4_fill_super+0x0/0x60
  [<c01e6250>] reiser4_fill_super+0x0/0x60
  [do_kern_mount+154/384] do_kern_mount+0x9a/0x180
  [<c015db3a>] do_kern_mount+0x9a/0x180
  [do_new_mount+111/224] do_new_mount+0x6f/0xe0
  [<c017467f>] do_new_mount+0x6f/0xe0
  [do_mount+435/496] do_mount+0x1b3/0x1f0
  [<c0174de3>] do_mount+0x1b3/0x1f0
  [copy_from_user+52/112] copy_from_user+0x34/0x70
  [<c0270194>] copy_from_user+0x34/0x70
  [copy_mount_options+89/192] copy_mount_options+0x59/0xc0
  [<c0174bc9>] copy_mount_options+0x59/0xc0
  [sys_mount+153/272] sys_mount+0x99/0x110
  [<c01751b9>] sys_mount+0x99/0x110
  [sysenter_past_esp+82/113] sysenter_past_esp+0x52/0x71
  [<c0105f69>] sysenter_past_esp+0x52/0x71
 Code: a3 a8 c3 4e c0 89 9a c8 c3 4e c0 bb 00 f0 ff ff 21 e3 8b 03 8b 80 88
00 00 00 89 82 c4 c3 4e c0 8b 4d 00 8b 41 04 89 46 10 8b 01 <8b> 40 04 89 46
14 8b 01 8b 00 8b 40 04 89 46 18 8b 01 8b 00 8b 
  <6>note: mount[9674] exited with preempt_count 3
 bad: scheduling while atomic!
  [schedule+1159/1344] schedule+0x487/0x540
  [<c039b307>] schedule+0x487/0x540
  [zap_pmd_range+73/112] zap_pmd_range+0x49/0x70
  [<c01465a9>] zap_pmd_range+0x49/0x70
  [unmap_page_range+61/112] unmap_page_range+0x3d/0x70
  [<c014660d>] unmap_page_range+0x3d/0x70
  [unmap_vmas+520/544] unmap_vmas+0x208/0x220
  [<c0146848>] unmap_vmas+0x208/0x220
  [exit_mmap+121/336] exit_mmap+0x79/0x150
  [<c014ae49>] exit_mmap+0x79/0x150
  [mmput+94/160] mmput+0x5e/0xa0
  [<c011cd7e>] mmput+0x5e/0xa0
  [do_exit+346/1040] do_exit+0x15a/0x410
  [<c012135a>] do_exit+0x15a/0x410
  [die+314/320] die+0x13a/0x140
  [<c010713a>] die+0x13a/0x140
  [do_page_fault+0/1358] do_page_fault+0x0/0x54e
  [<c0119450>] do_page_fault+0x0/0x54e
  [do_page_fault+1012/1358] do_page_fault+0x3f4/0x54e
  [<c0119844>] do_page_fault+0x3f4/0x54e
  [schedule+666/1344] schedule+0x29a/0x540
  [<c039b11a>] schedule+0x29a/0x540
  [ide_do_request+674/832] ide_do_request+0x2a2/0x340
  [<c02e72a2>] ide_do_request+0x2a2/0x340
  [do_page_fault+0/1358] do_page_fault+0x0/0x54e
  [<c0119450>] do_page_fault+0x0/0x54e
  [error_code+45/56] error_code+0x2d/0x38
  [<c0106a09>] error_code+0x2d/0x38
  [clog_link_object+122/272] clog_link_object+0x7a/0x110
  [<c01c09ca>] clog_link_object+0x7a/0x110
  [lock_object+78/144] lock_object+0x4e/0x90
  [<c01c73ce>] lock_object+0x4e/0x90
  [lock_tail+101/144] lock_tail+0x65/0x90
  [<c01c77e5>] lock_tail+0x65/0x90
  [longterm_lock_tryfast+146/240] longterm_lock_tryfast+0x92/0xf0
  [<c01c78a2>] longterm_lock_tryfast+0x92/0xf0
  [longterm_lock_znode+391/720] longterm_lock_znode+0x187/0x2d0
  [<c01c7a87>] longterm_lock_znode+0x187/0x2d0
  [traverse_tree+313/624] traverse_tree+0x139/0x270
  [<c01d7539>] traverse_tree+0x139/0x270
  [cbk_cache_search+65/96] cbk_cache_search+0x41/0x60
  [<c01d8021>] cbk_cache_search+0x41/0x60
  [coord_by_key+194/240] coord_by_key+0xc2/0xf0
  [<c01d6c92>] coord_by_key+0xc2/0xf0
  [lookup_sd+105/192] lookup_sd+0x69/0xc0
  [<c01e7449>] lookup_sd+0x69/0xc0
  [read_inode+86/352] read_inode+0x56/0x160
  [<c01dd5c6>] read_inode+0x56/0x160
  [reiser4_iget+231/336] reiser4_iget+0xe7/0x150
  [<c01dd8e7>] reiser4_iget+0xe7/0x150
  [init_locked_inode+0/96] init_locked_inode+0x0/0x60
  [<c01dd6d0>] init_locked_inode+0x0/0x60
  [_init_fs_root+49/288] _init_fs_root+0x31/0x120
  [<c01e60b1>] _init_fs_root+0x31/0x120
  [d_cursor_init_at+71/160] d_cursor_init_at+0x47/0xa0
  [<c02021f7>] d_cursor_init_at+0x47/0xa0
  [reiser4_fill_super+48/96] reiser4_fill_super+0x30/0x60
  [<c01e6280>] reiser4_fill_super+0x30/0x60
  [get_sb_bdev+227/320] get_sb_bdev+0xe3/0x140
  [<c015d8c3>] get_sb_bdev+0xe3/0x140
  [reiser4_get_sb+25/32] reiser4_get_sb+0x19/0x20
  [<c01df609>] reiser4_get_sb+0x19/0x20
  [reiser4_fill_super+0/96] reiser4_fill_super+0x0/0x60
  [<c01e6250>] reiser4_fill_super+0x0/0x60
  [do_kern_mount+154/384] do_kern_mount+0x9a/0x180
  [<c015db3a>] do_kern_mount+0x9a/0x180
  [do_new_mount+111/224] do_new_mount+0x6f/0xe0
  [<c017467f>] do_new_mount+0x6f/0xe0
  [do_mount+435/496] do_mount+0x1b3/0x1f0
  [<c0174de3>] do_mount+0x1b3/0x1f0
  [copy_from_user+52/112] copy_from_user+0x34/0x70
  [<c0270194>] copy_from_user+0x34/0x70
  [copy_mount_options+89/192] copy_mount_options+0x59/0xc0
  [<c0174bc9>] copy_mount_options+0x59/0xc0
  [sys_mount+153/272] sys_mount+0x99/0x110
  [<c01751b9>] sys_mount+0x99/0x110
  [sysenter_past_esp+82/113] sysenter_past_esp+0x52/0x71
  [<c0105f69>] sysenter_past_esp+0x52/0x71


I hope that the solution is not to rebuild with the most recent snapshot. I
was hoping to finish up some benchmarking...Sigh.

David


