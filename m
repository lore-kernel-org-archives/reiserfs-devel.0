From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: reiser4 panicked cowardly
Date: Wed, 08 Sep 2004 03:34:08 +0200
Message-ID: <413E6190.5070803@dermichi.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000709010906030806040100"
Return-path: <reiserfs-list-return-21610-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------000709010906030806040100
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello List!
I managed to get a "reiser4 panicked cowardly" error today. It was more 
by accident than on purpose. Anyway here is what i did:
- I created a partition /dev/sda1 with a size of 1009 cylinders
- mkfs.reiser4 /dev/sda1; mount; umount (everything ok so far)
- I deleted the partition and recreated it with a size of 500 cylinders
- I mounted it again -> it showed the old size (I expected the mount to 
fail, reiser3 worked that way)
- I copied some data to it. As soon as reiser4 wanted to access outside 
the partition i got "reiser4 panicked cowardly: Filesystem error occured"
- After this i wasn't able to unmount the partition or to shutdown the 
machine. I had to do the magic sysreq key trick.

The full log from /var/log/syslog is attached

ps: i know this was rather stupid, but IMHO reiser4 shouldn't panic...

--------------000709010906030806040100
Content-Type: text/plain;
 name="panicked_cowardly.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="panicked_cowardly.txt"

Sep  8 03:10:42 criminal kernel: attempt to access beyond end of device
Sep  8 03:10:42 criminal kernel: sda1: rw=1, want=206928, limit=123938
Sep  8 03:10:42 criminal kernel: attempt to access beyond end of device
Sep  8 03:10:42 criminal kernel: sda1: rw=1, want=207168, limit=123938
Sep  8 03:10:42 criminal kernel: attempt to access beyond end of device
Sep  8 03:10:42 criminal kernel: sda1: rw=1, want=207352, limit=123938
Sep  8 03:10:44 criminal kernel: reiser4[cp(8959)]: reiser4_handle_error (fs/reiser4/vfs_ops.c:1394)[foobar-42]:
Sep  8 03:10:44 criminal kernel: reiser4 panicked cowardly: Filesystem error occured
Sep  8 03:10:44 criminal kernel: 
Sep  8 03:10:44 criminal kernel: ------------[ cut here ]------------
Sep  8 03:10:44 criminal kernel: kernel BUG at fs/reiser4/debug.c:132!
Sep  8 03:10:44 criminal kernel: invalid operand: 0000 [#1]
Sep  8 03:10:44 criminal kernel: PREEMPT 
Sep  8 03:10:44 criminal kernel: Modules linked in: nvidia
Sep  8 03:10:44 criminal kernel: CPU:    0
Sep  8 03:10:44 criminal kernel: EIP:    0060:[<c01b6591>]    Tainted: P   VLI
Sep  8 03:10:44 criminal kernel: EFLAGS: 00010246   (2.6.9-rc1-mm1) 
Sep  8 03:10:44 criminal kernel: EIP is at reiser4_do_panic+0x11/0xe0
Sep  8 03:10:44 criminal kernel: eax: 00000000   ebx: d5bf4000   ecx: c048a970   edx: d1aef800
Sep  8 03:10:44 criminal kernel: esi: 00000000   edi: d5bf4000   ebp: d5bf5bb0   esp: d5bf5b54
Sep  8 03:10:44 criminal kernel: ds: 007b   es: 007b   ss: 0068
Sep  8 03:10:44 criminal kernel: Process cp (pid: 8959, threadinfo=d5bf4000 task=dbc10e50)
Sep  8 03:10:44 criminal kernel: Stack: d68e6200 00000001 c04363df d5bf5b70 d68e6200 c01d6a4f c04363c5 00000001 
Sep  8 03:10:44 criminal kernel:        c04363bb c0420135 c04361a7 00000572 ce5e6260 c01d0fae ce5e6260 d5bf5bb0 
Sep  8 03:10:44 criminal kernel:        dcf9f660 d5bf5bb0 d5bf5c14 d5bf5e18 c01d0fd4 dcf9f660 d5bf5bb0 000028cb 
Sep  8 03:10:44 criminal kernel: Call Trace:
Sep  8 03:10:44 criminal kernel:  [<c01d6a4f>] reiser4_handle_error+0xcf/0xd0
Sep  8 03:10:44 criminal kernel:  [<c01d0fae>] finish_all_fq+0x9e/0xa0
Sep  8 03:10:44 criminal kernel:  [<c01d0fd4>] current_atom_finish_all_fq+0x24/0x70
Sep  8 03:10:44 criminal kernel:  [<c01c409e>] current_atom_complete_writes+0xe/0x30
Sep  8 03:10:44 criminal kernel:  [<c01c41c0>] commit_current_atom+0x100/0x230
Sep  8 03:10:44 criminal kernel:  [<c01c4b90>] try_commit_txnh+0x140/0x1d0
Sep  8 03:10:44 criminal kernel:  [<c01c4c4d>] commit_txnh+0x2d/0xb0
Sep  8 03:10:44 criminal kernel:  [<c01c3969>] txn_end+0x39/0x40
Sep  8 03:10:44 criminal kernel:  [<c01c3983>] txn_restart+0x13/0x30
Sep  8 03:10:44 criminal kernel:  [<c01c39ba>] txn_restart_current+0x1a/0x20
Sep  8 03:10:44 criminal kernel:  [<c01d5910>] reiser4_throttle_write+0x10/0x30
Sep  8 03:10:44 criminal kernel:  [<c01eec8c>] item_balance_dirty_pages+0x9c/0x120
Sep  8 03:10:44 criminal kernel:  [<c01f390f>] extent_balance_dirty_pages+0x2f/0x40
Sep  8 03:10:44 criminal kernel:  [<c01f3f64>] extent_write_flow+0x3e4/0x630
Sep  8 03:10:44 criminal kernel:  [<c01f4300>] write_extent+0x0/0x50
Sep  8 03:10:44 criminal kernel:  [<c0204099>] append_and_or_overwrite+0x219/0x410
Sep  8 03:10:44 criminal kernel:  [<c0204315>] write_flow+0x85/0x90
Sep  8 03:10:44 criminal kernel:  [<c020455c>] write_file+0x6c/0x90
Sep  8 03:10:44 criminal kernel:  [<c020477e>] write_unix_file+0x1fe/0x2c0
Sep  8 03:10:44 criminal kernel:  [<c01c391d>] txn_begin+0x1d/0x30
Sep  8 03:10:44 criminal kernel:  [<c01d7c07>] reiser4_write+0x77/0xd0
Sep  8 03:10:44 criminal kernel:  [<c01d7b90>] reiser4_write+0x0/0xd0
Sep  8 03:10:44 criminal kernel:  [<c0151e68>] vfs_write+0xb8/0x130
Sep  8 03:10:44 criminal kernel:  [<c0151fb1>] sys_write+0x51/0x80
Sep  8 03:10:44 criminal kernel:  [<c0104135>] sysenter_past_esp+0x52/0x71
Sep  8 03:10:44 criminal kernel: Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 83 ec 14 8b 0d 80 fb 56 c0 89 5c 24 10 85 c9 74 1c <0f> 0b 84 00 7e 59 43 c0 c7 04 24 e0 6a 45 c0 c7 44 24 04 a0 fb 
Sep  8 03:10:44 criminal kernel:  <6>note: cp[8959] exited with preempt_count 1
Sep  8 03:10:44 criminal kernel: bad: scheduling while atomic!
Sep  8 03:10:44 criminal kernel:  [<c0419e48>] schedule+0x4c8/0x4d0
Sep  8 03:10:44 criminal kernel:  [<c0141dbb>] unmap_page_range+0x4b/0x80
Sep  8 03:10:44 criminal kernel:  [<c0141faa>] unmap_vmas+0x1ba/0x1d0
Sep  8 03:10:44 criminal kernel:  [<c01464d3>] exit_mmap+0x83/0x160
Sep  8 03:10:44 criminal kernel:  [<c0118101>] mmput+0x71/0xd0
Sep  8 03:10:44 criminal kernel:  [<c011c53a>] do_exit+0x14a/0x410
Sep  8 03:10:44 criminal kernel:  [<c01057a0>] do_invalid_op+0x0/0x120
Sep  8 03:10:44 criminal kernel:  [<c01053e8>] die+0x188/0x190
Sep  8 03:10:44 criminal kernel:  [<c01b6591>] reiser4_do_panic+0x11/0xe0
Sep  8 03:10:44 criminal kernel:  [<c0115cb6>] fixup_exception+0x16/0x60
Sep  8 03:10:44 criminal kernel:  [<c01058b2>] do_invalid_op+0x112/0x120
Sep  8 03:10:44 criminal kernel:  [<c02cd11f>] poke_blanked_console+0x6f/0xc0
Sep  8 03:10:44 criminal kernel:  [<c01b6591>] reiser4_do_panic+0x11/0xe0
Sep  8 03:10:44 criminal kernel:  [<c011a29c>] __call_console_drivers+0x5c/0x60
Sep  8 03:10:44 criminal kernel:  [<c011a395>] call_console_drivers+0x65/0x120
Sep  8 03:10:44 criminal kernel:  [<c011a7d2>] release_console_sem+0xd2/0xe0
Sep  8 03:10:44 criminal kernel:  [<c0104b91>] error_code+0x2d/0x38
Sep  8 03:10:44 criminal kernel:  [<c01b6591>] reiser4_do_panic+0x11/0xe0
Sep  8 03:10:44 criminal kernel:  [<c01d6a4f>] reiser4_handle_error+0xcf/0xd0
Sep  8 03:10:44 criminal kernel:  [<c01d0fae>] finish_all_fq+0x9e/0xa0
Sep  8 03:10:44 criminal kernel:  [<c01d0fd4>] current_atom_finish_all_fq+0x24/0x70
Sep  8 03:10:44 criminal kernel:  [<c01c409e>] current_atom_complete_writes+0xe/0x30
Sep  8 03:10:44 criminal kernel:  [<c01c41c0>] commit_current_atom+0x100/0x230
Sep  8 03:10:44 criminal kernel:  [<c01c4b90>] try_commit_txnh+0x140/0x1d0
Sep  8 03:10:44 criminal kernel:  [<c01c4c4d>] commit_txnh+0x2d/0xb0
Sep  8 03:10:44 criminal kernel:  [<c01c3969>] txn_end+0x39/0x40
Sep  8 03:10:44 criminal kernel:  [<c01c3983>] txn_restart+0x13/0x30
Sep  8 03:10:44 criminal kernel:  [<c01c39ba>] txn_restart_current+0x1a/0x20
Sep  8 03:10:44 criminal kernel:  [<c01d5910>] reiser4_throttle_write+0x10/0x30
Sep  8 03:10:44 criminal kernel:  [<c01eec8c>] item_balance_dirty_pages+0x9c/0x120
Sep  8 03:10:44 criminal kernel:  [<c01f390f>] extent_balance_dirty_pages+0x2f/0x40
Sep  8 03:10:44 criminal kernel:  [<c01f3f64>] extent_write_flow+0x3e4/0x630
Sep  8 03:10:44 criminal kernel:  [<c01f4300>] write_extent+0x0/0x50
Sep  8 03:10:44 criminal kernel:  [<c0204099>] append_and_or_overwrite+0x219/0x410
Sep  8 03:10:44 criminal kernel:  [<c0204315>] write_flow+0x85/0x90
Sep  8 03:10:44 criminal kernel:  [<c020455c>] write_file+0x6c/0x90
Sep  8 03:10:44 criminal kernel:  [<c020477e>] write_unix_file+0x1fe/0x2c0
Sep  8 03:10:44 criminal kernel:  [<c01c391d>] txn_begin+0x1d/0x30
Sep  8 03:10:44 criminal kernel:  [<c01d7c07>] reiser4_write+0x77/0xd0
Sep  8 03:10:44 criminal kernel:  [<c01d7b90>] reiser4_write+0x0/0xd0
Sep  8 03:10:44 criminal kernel:  [<c0151e68>] vfs_write+0xb8/0x130
Sep  8 03:10:44 criminal kernel:  [<c0151fb1>] sys_write+0x51/0x80
Sep  8 03:10:44 criminal kernel:  [<c0104135>] sysenter_past_esp+0x52/0x71
Sep  8 03:10:44 criminal kernel: bad: scheduling while atomic!
Sep  8 03:10:44 criminal kernel:  [<c0419e48>] schedule+0x4c8/0x4d0
Sep  8 03:10:44 criminal kernel:  [<c0121f14>] __mod_timer+0x134/0x1a0
Sep  8 03:10:44 criminal kernel:  [<c041a363>] schedule_timeout+0x63/0xc0
Sep  8 03:10:44 criminal kernel:  [<c0122a30>] process_timeout+0x0/0x10
Sep  8 03:10:44 criminal kernel:  [<c025e810>] smb_add_request+0x160/0x2c0
Sep  8 03:10:44 criminal kernel:  [<c0117dc0>] autoremove_wake_function+0x0/0x60
Sep  8 03:10:44 criminal kernel:  [<c0117dc0>] autoremove_wake_function+0x0/0x60
Sep  8 03:10:44 criminal kernel:  [<c025e2be>] smb_do_alloc_request+0x2e/0xb0
Sep  8 03:10:44 criminal kernel:  [<c0256503>] smb_request_ok+0x33/0x90
Sep  8 03:10:44 criminal kernel:  [<c0256d31>] smb_proc_close+0x91/0xc0
Sep  8 03:10:44 criminal kernel:  [<c0256de9>] smb_proc_close_inode+0x89/0xe0
Sep  8 03:10:44 criminal kernel:  [<c0256e77>] smb_close+0x37/0x40
Sep  8 03:10:44 criminal kernel:  [<c025d7c6>] smb_file_release+0x86/0x90
Sep  8 03:10:44 criminal kernel:  [<c0152ca0>] __fput+0x110/0x130
Sep  8 03:10:44 criminal kernel:  [<c01513a9>] filp_close+0x59/0x90
Sep  8 03:10:44 criminal kernel:  [<c011b7e6>] put_files_struct+0x56/0xc0
Sep  8 03:10:44 criminal kernel:  [<c011c575>] do_exit+0x185/0x410
Sep  8 03:10:44 criminal kernel:  [<c01057a0>] do_invalid_op+0x0/0x120
Sep  8 03:10:44 criminal kernel:  [<c01053e8>] die+0x188/0x190
Sep  8 03:10:44 criminal kernel:  [<c01b6591>] reiser4_do_panic+0x11/0xe0
Sep  8 03:10:44 criminal kernel:  [<c0115cb6>] fixup_exception+0x16/0x60
Sep  8 03:10:44 criminal kernel:  [<c01058b2>] do_invalid_op+0x112/0x120
Sep  8 03:10:44 criminal kernel:  [<c02cd11f>] poke_blanked_console+0x6f/0xc0
Sep  8 03:10:44 criminal kernel:  [<c01b6591>] reiser4_do_panic+0x11/0xe0
Sep  8 03:10:44 criminal kernel:  [<c011a29c>] __call_console_drivers+0x5c/0x60
Sep  8 03:10:44 criminal kernel:  [<c011a395>] call_console_drivers+0x65/0x120
Sep  8 03:10:44 criminal kernel:  [<c011a7d2>] release_console_sem+0xd2/0xe0
Sep  8 03:10:44 criminal kernel:  [<c0104b91>] error_code+0x2d/0x38
Sep  8 03:10:44 criminal kernel:  [<c01b6591>] reiser4_do_panic+0x11/0xe0
Sep  8 03:10:44 criminal kernel:  [<c01d6a4f>] reiser4_handle_error+0xcf/0xd0
Sep  8 03:10:44 criminal kernel:  [<c01d0fae>] finish_all_fq+0x9e/0xa0
Sep  8 03:10:44 criminal kernel:  [<c01d0fd4>] current_atom_finish_all_fq+0x24/0x70
Sep  8 03:10:44 criminal kernel:  [<c01c409e>] current_atom_complete_writes+0xe/0x30
Sep  8 03:10:44 criminal kernel:  [<c01c41c0>] commit_current_atom+0x100/0x230
Sep  8 03:10:44 criminal kernel:  [<c01c4b90>] try_commit_txnh+0x140/0x1d0
Sep  8 03:10:44 criminal kernel:  [<c01c4c4d>] commit_txnh+0x2d/0xb0
Sep  8 03:10:44 criminal kernel:  [<c01c3969>] txn_end+0x39/0x40
Sep  8 03:10:44 criminal kernel:  [<c01c3983>] txn_restart+0x13/0x30
Sep  8 03:10:44 criminal kernel:  [<c01c39ba>] txn_restart_current+0x1a/0x20
Sep  8 03:10:44 criminal kernel:  [<c01d5910>] reiser4_throttle_write+0x10/0x30
Sep  8 03:10:44 criminal kernel:  [<c01eec8c>] item_balance_dirty_pages+0x9c/0x120
Sep  8 03:10:44 criminal kernel:  [<c01f390f>] extent_balance_dirty_pages+0x2f/0x40
Sep  8 03:10:44 criminal kernel:  [<c01f3f64>] extent_write_flow+0x3e4/0x630
Sep  8 03:10:44 criminal kernel:  [<c01f4300>] write_extent+0x0/0x50
Sep  8 03:10:44 criminal kernel:  [<c0204099>] append_and_or_overwrite+0x219/0x410
Sep  8 03:10:44 criminal kernel:  [<c0204315>] write_flow+0x85/0x90
Sep  8 03:10:44 criminal kernel:  [<c020455c>] write_file+0x6c/0x90
Sep  8 03:10:44 criminal kernel:  [<c020477e>] write_unix_file+0x1fe/0x2c0
Sep  8 03:10:44 criminal kernel:  [<c01c391d>] txn_begin+0x1d/0x30
Sep  8 03:10:44 criminal kernel:  [<c01d7c07>] reiser4_write+0x77/0xd0
Sep  8 03:10:44 criminal kernel:  [<c01d7b90>] reiser4_write+0x0/0xd0
Sep  8 03:10:44 criminal kernel:  [<c0151e68>] vfs_write+0xb8/0x130
Sep  8 03:10:44 criminal kernel:  [<c0151fb1>] sys_write+0x51/0x80
Sep  8 03:10:44 criminal kernel:  [<c0104135>] sysenter_past_esp+0x52/0x71
S

--------------000709010906030806040100--
