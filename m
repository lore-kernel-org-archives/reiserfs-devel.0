From: Xuan Baldauf <xuan--2004.05.21--reiserfs-list--namesys.com@baldauf.org>
Subject: bug report?
Date: Fri, 21 May 2004 20:41:15 +0200
Message-ID: <40AE4D4B.80803@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-18810-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

I just want to report what happens if a ide controller (or cabling=20
thereof) gets mad. The reiserfs filesystem was not unmountable after=20
that event. Maybe reiserfs should not panic in such an event? (It could=20
keep buffers dirty and allow unclean unmounts so that the gone=20
filesystem could be unlinked from the VFS)

plato:~ # uname -a
Linux plato 2.6.6 #3 Thu May 20 14:27:37 CEST 2004 i686 i686 i386 GNU/Linux
plato:~ #



May 21 19:52:33 plato kernel: hda: dma_timer_expiry: dma status =3D=3D 0x61
May 21 19:52:43 plato kernel: hda: DMA timeout error
May 21 19:52:43 plato kernel: hda: dma timeout error: status=3D0xd0 { Busy }
May 21 19:52:43 plato kernel:
May 21 19:52:43 plato kernel: hda: DMA disabled
May 21 19:52:43 plato kernel: hdb: DMA disabled
May 21 19:53:18 plato kernel: ide0: reset timed-out, status=3D0xd0
May 21 19:53:18 plato kernel: hda: status timeout: status=3D0xd0 { Busy }
May 21 19:53:18 plato kernel:
May 21 19:53:18 plato kernel: hda: drive not ready for command
May 21 19:53:48 plato kernel: ide0: reset timed-out, status=3D0xd0
May 21 19:53:48 plato kernel: end_request: I/O error, dev hda, sector=20
48023788
May 21 19:53:48 plato kernel: end_request: I/O error, dev hda, sector=20
2443300
May 21 19:53:48 plato kernel: Buffer I/O error on device hda3, logical=20
block 8210
May 21 19:53:48 plato kernel: lost page write due to I/O error on hda3
May 21 19:53:48 plato kernel: end_request: I/O error, dev hda, sector=20
2545732
May 21 19:53:48 plato kernel: reiserfs: journal-837: IO error during=20
journal replay
May 21 19:53:48 plato kernel: journal-712: buffer write failed
May 21 19:53:48 plato kernel: ------------[ cut here ]------------
May 21 19:53:48 plato kernel: kernel BUG at fs/reiserfs/prints.c:338!
May 21 19:53:48 plato kernel: invalid operand: 0000 [#1]
May 21 19:53:48 plato kernel: PREEMPT
May 21 19:53:48 plato kernel: CPU:    0
May 21 19:53:48 plato kernel: EIP:    0060:[<c019ba19>]    Not tainted
May 21 19:53:48 plato kernel: EFLAGS: 00010282   (2.6.6)
May 21 19:53:48 plato kernel: EIP is at reiserfs_panic+0x29/0x60
May 21 19:53:48 plato kernel: eax: 00000024   ebx: c134d400   ecx:=20
00000000   edx: d285ff60
May 21 19:53:48 plato kernel: esi: d3790d50   edi: 00000001   ebp:=20
c138bd40   esp: c138bd30
May 21 19:53:48 plato kernel: ds: 007b   es: 007b   ss: 0068
May 21 19:53:48 plato kernel: Process pdflush (pid: 7,=20
threadinfo=3Dc138a000 task=3Dc138f0d0)
May 21 19:53:48 plato kernel: Stack: c02c428f c037b9e0 d3790d50 c134d400=20
c138bd54 c01a768a c134d400 c02cd980
May 21 19:53:48 plato kernel:        00000001 c138bd94 c01a7aa9 cc6a4270=20
cc6a4840 cc6a4300 ce246b10 ce246b70
May 21 19:53:48 plato kernel:        00000001 00000001 00000001 00000001=20
d3790d50 c134d400 d3790d50 d3790d50
May 21 19:53:48 plato kernel: Call Trace:
May 21 19:53:48 plato kernel:  [<c01a768a>]=20
update_journal_header_block+0x2a/0x30
May 21 19:53:48 plato kernel:  [<c01a7aa9>] flush_journal_list+0x389/0x580
May 21 19:53:48 plato kernel:  [<c01a8079>]=20
flush_used_journal_lists+0xa9/0xc0
May 21 19:53:48 plato kernel:  [<c01ab325>]=20
flush_old_journal_lists+0x45/0x70
May 21 19:53:48 plato kernel:  [<c01abcc8>] do_journal_end+0x978/0xa80
May 21 19:53:48 plato kernel:  [<c01aa9a5>] journal_end_sync+0x45/0x90
May 21 19:53:48 plato kernel:  [<c019871d>] reiserfs_sync_fs+0x4d/0xa0
May 21 19:53:48 plato kernel:  [<c015538d>] sync_supers+0x9d/0xb0
May 21 19:53:48 plato kernel:  [<c0139a15>] wb_kupdate+0x45/0x140
May 21 19:53:48 plato kernel:  [<c02a9bc8>] schedule+0x1c8/0x5d0
May 21 19:53:48 plato kernel:  [<c013a380>] __pdflush+0xd0/0x1e0
May 21 19:53:48 plato kernel:  [<c0117b09>] set_user_nice+0x129/0x130
May 21 19:53:48 plato kernel:  [<c013a4ae>] pdflush+0x1e/0x20
May 21 19:53:48 plato kernel:  [<c01399d0>] wb_kupdate+0x0/0x140
May 21 19:53:48 plato kernel:  [<c012b9ca>] kthread+0x8a/0xd0
May 21 19:53:48 plato kernel:  [<c013a490>] pdflush+0x0/0x20
May 21 19:53:48 plato kernel:  [<c012b940>] kthread+0x0/0xd0
May 21 19:53:48 plato kernel:  [<c01032a5>] kernel_thread_helper+0x5/0x10
May 21 19:53:48 plato kernel:
May 21 19:53:48 plato kernel: Code: 0f 0b 52 01 f2 81 2c c0 c7 44 24 08=20
e0 b9 37 c0 b8 55 7e 2c
May 21 19:53:48 plato kernel:  end_request: I/O error, dev hda, sector=20
2394332
May 21 19:53:48 plato kernel: Buffer I/O error on device hda3, logical=20
block 2089
May 21 19:53:48 plato kernel: lost page write due to I/O error on hda3
May 21 19:53:48 plato kernel: end_request: I/O error, dev hda, sector=20
2394340
May 21 19:53:48 plato kernel: Buffer I/O error on device hda3, logical=20
block 2090
May 21 19:53:48 plato kernel: lost page write due to I/O error on hda3
May 21 19:53:48 plato kernel: journal-601, buffer write failed
May 21 19:53:48 plato kernel: ------------[ cut here ]------------
May 21 19:53:48 plato kernel: kernel BUG at fs/reiserfs/prints.c:338!
May 21 19:53:48 plato kernel: invalid operand: 0000 [#2]
May 21 19:53:48 plato kernel: PREEMPT
May 21 19:53:48 plato kernel: CPU:    0
May 21 19:53:48 plato kernel: EIP:    0060:[<c019ba19>]    Not tainted
May 21 19:53:48 plato kernel: EFLAGS: 00010292   (2.6.6)
May 21 19:53:48 plato kernel: EIP is at reiserfs_panic+0x29/0x60
May 21 19:53:48 plato kernel: eax: 00000024   ebx: c134d400   ecx:=20
00000000   edx: d285ff60
May 21 19:53:48 plato kernel: esi: d37900d0   edi: c134d400   ebp:=20
c130bf04   esp: c130bef4
May 21 19:53:48 plato kernel: ds: 007b   es: 007b   ss: 0068
May 21 19:53:48 plato kernel: Process reiserfs/0 (pid: 11,=20
threadinfo=3Dc130a000 task=3Dd3b85670)
May 21 19:53:48 plato kernel: Stack: c02c428f c037b9e0 d37900d0 c134d400=20
c130bf34 c01a7449 c134d400 c02cd860
May 21 19:53:48 plato kernel:        c0302a40 d37900e8 00000001 c134d400=20
cc6a4300 c130a000 c134d400 d499d120
May 21 19:53:48 plato kernel:        c130bf44 c01aaa6c d499d11c c130a000=20
c130bfc8 c0128537 00003537 000001a4
May 21 19:53:48 plato kernel: Call Trace:
May 21 19:53:48 plato kernel:  [<c01a7449>] flush_commit_list+0x3c9/0x3e0
May 21 19:53:48 plato kernel:  [<c01aaa6c>] flush_async_commits+0x7c/0xc0
May 21 19:53:48 plato kernel:  [<c0128537>] worker_thread+0x197/0x250
May 21 19:53:48 plato kernel:  [<c01aa9f0>] flush_async_commits+0x0/0xc0
May 21 19:53:48 plato kernel:  [<c01177e0>] default_wake_function+0x0/0x10
May 21 19:53:48 plato kernel:  [<c01177e0>] default_wake_function+0x0/0x10
May 21 19:53:48 plato kernel:  [<c012b9ca>] kthread+0x8a/0xd0
May 21 19:53:48 plato kernel:  [<c01283a0>] worker_thread+0x0/0x250
May 21 19:53:48 plato kernel:  [<c012b940>] kthread+0x0/0xd0
May 21 19:53:48 plato kernel:  [<c01032a5>] kernel_thread_helper+0x5/0x10
May 21 19:53:48 plato kernel:
May 21 19:53:48 plato kernel: Code: 0f 0b 52 01 f2 81 2c c0 c7 44 24 08=20
e0 b9 37 c0 b8 55 7e 2c
May 21 19:53:48 plato kernel:  <4>vs-13070: reiserfs_read_locked_inode:=20
i/o failure occurred trying to find stat data of [5334942 5334984 0x0 SD]
May 21 19:53:48 plato kernel: vs-13070: reiserfs_read_locked_inode: i/o=20
failure occurred trying to find stat data of [2 142790 0x0 SD]
May 21 19:53:48 plato kernel: end_request: I/O error, dev hda, sector=20
2545732
May 21 19:53:48 plato kernel: vs-13070: reiserfs_read_locked_inode: i/o=20
failure occurred trying to find stat data of [2 142792 0x0 SD]


ciao,
Xu=E2n.

