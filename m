From: Laurent Riffard <laurent.riffard@free.fr>
Subject: kernel oops with Reiser4/19.01.2004-fixed
Date: Thu, 29 Jan 2004 00:37:57 +0100
Message-ID: <401847D5.8020208@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060502010107080808070502"
Return-path: <reiserfs-list-return-16645-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------060502010107080808070502
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hello,

Here is the log of a kernel oops (kernel 2.6.1 + supermount +
Reiser4/19.01.2004-fixed). It happened last night. Azureus, a
java-written Bittorent client was running, it is set up to
download files to the faulty reiser4 filesystem.

[root@antares root]# df -h /dev/hdb7
Sys. de fich.         Tail. Occ. Disp. %Occ. Mont=E9 sur
/dev/hdb7              20G   16G  3,3G  83% /mnt/diske
[root@antares root]# mount
/dev/hdb7 on /mnt/diske type reiser4=20
(rw,noexec,nosuid,nodev,user=3Dlaurent)

--=20
laurent


--------------060502010107080808070502
Content-Type: text/plain;
 name="syslog"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="syslog"


Jan 28 04:15:40 antares kernel: attempt to access beyond end of device
Jan 28 04:15:40 antares kernel: hdb7: rw=1, want=1932196768, limit=41945652
Jan 28 04:15:40 antares kernel: reiser4[ktxnmgrd:run(2910)]: update_blocknr_hint_default (fs/reiser4/block_alloc.c:648)[zam-676]:
Jan 28 04:15:40 antares kernel: WARNING: block number 7307497714779250547 is too large to be used in a blocknr hint
Jan 28 04:15:40 antares kernel: 
Jan 28 04:15:40 antares kernel: attempt to access beyond end of device
Jan 28 04:15:40 antares kernel: hdb7: rw=1, want=81755032, limit=41945652
Jan 28 04:15:40 antares kernel: reiser4[ktxnmgrd:run(2910)]: reiser4_handle_error (fs/reiser4/vfs_ops.c:1539)[foobar-42]:
Jan 28 04:15:40 antares kernel: reiser4 panicked cowardly: Filesystem error occured
Jan 28 04:15:40 antares kernel: 
Jan 28 04:15:40 antares kernel: ------------[ cut here ]------------
Jan 28 04:15:40 antares kernel: kernel BUG at fs/reiser4/debug.c:75!
Jan 28 04:15:40 antares kernel: invalid operand: 0000 [#1]
Jan 28 04:15:40 antares kernel: CPU:    0
Jan 28 04:15:40 antares kernel: EIP:    0060:[reiser4_do_panic+16/208]    Not tainted
Jan 28 04:15:40 antares kernel: EIP:    0060:[<c019e900>]    Not tainted
Jan 28 04:15:40 antares kernel: EFLAGS: 00010246
Jan 28 04:15:40 antares kernel: EIP is at reiser4_do_panic+0x10/0xd0
Jan 28 04:15:40 antares kernel: eax: 00000000   ebx: c941c974   ecx: 00000001   edx: c50ce1f4
Jan 28 04:15:40 antares kernel: esi: 00000000   edi: c5427de8   ebp: c5427d98   esp: c5427d88
Jan 28 04:15:40 antares kernel: ds: 007b   es: 007b   ss: 0068
Jan 28 04:15:41 antares kernel: Process ktxnmgrd:run (pid: 2910, threadinfo=c5426000 task=c54392e0)
Jan 28 04:15:41 antares kernel: Stack: c941c974 00000001 c02e69f9 c5427da4 c5427dbc c01bcb83 c02e69df 00000001 
Jan 28 04:15:41 antares kernel:        c02e69d5 c02d605c c02e6757 00000603 cef5e4c8 c5427dd8 c01b7017 cef5e4c8 
Jan 28 04:15:41 antares kernel:        c5427de8 c21e3e84 c5427de8 c50ce1f4 c5427df4 c01b7045 c21e3e84 c5427de8 
Jan 28 04:15:41 antares kernel: Call Trace:
Jan 28 04:15:41 antares kernel:  [reiser4_handle_error+195/224] reiser4_handle_error+0xc3/0xe0
Jan 28 04:15:41 antares kernel:  [<c01bcb83>] reiser4_handle_error+0xc3/0xe0
Jan 28 04:15:41 antares kernel:  [finish_all_fq+151/160] finish_all_fq+0x97/0xa0
Jan 28 04:15:41 antares kernel:  [<c01b7017>] finish_all_fq+0x97/0xa0
Jan 28 04:15:41 antares kernel:  [current_atom_finish_all_fq+37/96] current_atom_finish_all_fq+0x25/0x60
Jan 28 04:15:41 antares kernel:  [<c01b7045>] current_atom_finish_all_fq+0x25/0x60
Jan 28 04:15:41 antares kernel:  [reiser4_write_logs+471/592] reiser4_write_logs+0x1d7/0x250
Jan 28 04:15:41 antares kernel:  [<c01b2c67>] reiser4_write_logs+0x1d7/0x250
Jan 28 04:15:41 antares kernel:  [commit_current_atom+309/496] commit_current_atom+0x135/0x1f0
Jan 28 04:15:41 antares kernel:  [<c01abc25>] commit_current_atom+0x135/0x1f0
Jan 28 04:15:41 antares kernel:  [atom_free+117/128] atom_free+0x75/0x80
Jan 28 04:15:41 antares kernel:  [<c01ab745>] atom_free+0x75/0x80
Jan 28 04:15:41 antares kernel:  [try_commit_txnh+200/384] try_commit_txnh+0xc8/0x180
Jan 28 04:15:41 antares kernel:  [<c01ac258>] try_commit_txnh+0xc8/0x180
Jan 28 04:15:41 antares kernel:  [commit_txnh+51/160] commit_txnh+0x33/0xa0
Jan 28 04:15:41 antares kernel:  [<c01ac343>] commit_txnh+0x33/0xa0
Jan 28 04:15:41 antares kernel:  [__wake_up_locked+34/48] __wake_up_locked+0x22/0x30
Jan 28 04:15:41 antares kernel:  [<c01172d2>] __wake_up_locked+0x22/0x30
Jan 28 04:15:41 antares kernel:  [txn_end+69/80] txn_end+0x45/0x50
Jan 28 04:15:41 antares kernel:  [<c01ab495>] txn_end+0x45/0x50
Jan 28 04:15:41 antares kernel:  [commit_some_atoms+175/208] commit_some_atoms+0xaf/0xd0
Jan 28 04:15:41 antares kernel:  [<c01abf2f>] commit_some_atoms+0xaf/0xd0
Jan 28 04:15:41 antares kernel:  [scan_mgr+47/80] scan_mgr+0x2f/0x50
Jan 28 04:15:41 antares kernel:  [<c01b799f>] scan_mgr+0x2f/0x50
Jan 28 04:15:41 antares kernel:  [ktxnmgrd+360/496] ktxnmgrd+0x168/0x1f0
Jan 28 04:15:41 antares kernel:  [<c01b7708>] ktxnmgrd+0x168/0x1f0
Jan 28 04:15:41 antares kernel:  [ktxnmgrd+0/496] ktxnmgrd+0x0/0x1f0
Jan 28 04:15:41 antares kernel:  [<c01b75a0>] ktxnmgrd+0x0/0x1f0
Jan 28 04:15:41 antares kernel:  [kernel_thread_helper+5/12] kernel_thread_helper+0x5/0xc
Jan 28 04:15:41 antares kernel:  [<c0107029>] kernel_thread_helper+0x5/0xc
Jan 28 04:15:41 antares kernel: 
Jan 28 04:15:41 antares kernel: Code: 0f 0b 4b 00 20 5e 2e c0 c7 04 24 b0 a1 2f c0 c7 44 24 04 40 


--------------060502010107080808070502--

