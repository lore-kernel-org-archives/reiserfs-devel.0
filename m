From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: Working Reiser4 patch for kernel 2.6.6(-mm2)?
Date: Fri, 4 Jun 2004 14:14:04 +0200
Message-ID: <200406041414.04917.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

May this be the same problem? I tried to repeat my "benchmark" with kernel=
=20
2.6.7, but was not able to copy a directory to reiser4. I could create file=
s=20
with touch, but copying gave this error message (and the cp process hangs a=
s=20
D+):=20
kernel 2.6.7-rc1
+ 2.6.7-rc1-mm1.bz2
+ reiser4-2004.06.02-19.39-linux-2.6.7-rc1-mm1.diff.gz
patching + compiling without errors

Jun  3 23:28:01 linux kernel: CPU:    0
Jun  3 23:28:01 linux kernel: EIP:    0060:[<00000000>]    Not tainted VLI
Jun  3 23:28:01 linux kernel: EFLAGS: 00010246   (2.6.7-rc1-mm1)
Jun  3 23:28:01 linux kernel: EIP is at 0x0
Jun  3 23:28:01 linux kernel: eax: efd4bae0   ebx: efd4bae0   ecx: efd4bad4=
  =20
edx: 00000000
Jun  3 23:28:01 linux kernel: esi: efd4bc7c   edi: c03b50e8   ebp: 00000001=
  =20
esp: efd4bad0
Jun  3 23:28:01 linux kernel: ds: 007b   es: 007b   ss: 0068
Jun  3 23:28:01 linux kernel: Process pdflush (pid: 38, threadinfo=3Defd4a0=
00=20
task=3Defd6f120)
Jun  3 23:28:01 linux kernel: Stack: c01ba127 00000000 00000000 00000000=20
dd635b40 00000001 00000
105 ffffffff
Jun  3 23:28:01 linux kernel:        00000000 00000000 00000000 efd4bafc=20
efd4bafc efd4bb04 efd4b
b04 efd4bb34
Jun  3 23:28:01 linux kernel:        00000000 efd4bc7c efd4bb34 efd4bcd4=20
c01b9f15 00000000 c01b0
70d 00000000
Jun  3 23:28:01 linux kernel: Call Trace:
Jun  3 23:28:01 linux kernel:  [<c01ba127>] scan_by_coord+0xa7/0x2e0
Jun  3 23:28:01 linux kernel:  [<c01b9f15>] scan_unformatted+0x115/0x1b0
Jun  3 23:28:01 linux kernel:  [<c01b070d>] longterm_lock_znode+0xed/0x240
Jun  3 23:28:01 linux kernel:  [<c01acabd>] zload_ra+0x1d/0x20
Jun  3 23:28:01 linux kernel:  [<c01b9dad>] scan_common+0x2d/0x60
Jun  3 23:28:01 linux kernel:  [<c01b7dce>] jnode_flush+0x2ee/0x300
Jun  3 23:28:01 linux kernel:  [<c01b7fae>] flush_current_atom+0x1ae/0x220
Jun  3 23:28:01 linux kernel:  [<c01b5b91>] try_commit_txnh+0x161/0x180
Jun  3 23:28:01 linux kernel:  [<c01b5bdf>] commit_txnh+0x2f/0xa0
Jun  3 23:28:01 linux kernel:  [<c01b4e9e>] txn_end+0x2e/0x40
Jun  3 23:28:01 linux kernel:  [<c01b4eb8>] txn_restart+0x8/0x20
Jun  3 23:28:01 linux kernel:  [<c01b5588>] force_commit_atom_nolock+0x18/0=
x20
Jun  3 23:28:01 linux kernel:  [<c01b565e>] txnmgr_force_commit_all+0x9e/0x=
b0
Jun  3 23:28:01 linux kernel:  [<c01c2350>] writeout+0x20/0xb0
Jun  3 23:28:01 linux kernel:  [<c01c240c>] reiser4_sync_inodes+0x2c/0x50
Jun  3 23:28:01 linux kernel:  [<c01c23e0>] reiser4_sync_inodes+0x0/0x50
Jun  3 23:28:01 linux kernel:  [<c0169f39>] sync_sb_inodes+0x19/0x20
Jun  3 23:28:01 linux kernel:  [<c016a007>] sync_inodes_sb+0x67/0xa0
Jun  3 23:28:01 linux kernel:  [<c016b197>] mpage_writepages+0xf7/0x300
Jun  3 23:28:01 linux kernel:  [<c013a870>] pdflush+0x0/0x20
Jun  3 23:28:01 linux kernel:  [<c016a0c9>] sync_inodes+0x19/0x80
Jun  3 23:28:01 linux kernel:  [<c01505c1>] do_sync+0x11/0x60
Jun  3 23:28:01 linux kernel:  [<c015061a>] sys_sync+0xa/0x10
Jun  3 23:28:01 linux kernel:  [<c013a7c2>] __pdflush+0xd2/0x180
Jun  3 23:28:01 linux kernel:  [<c013a88a>] pdflush+0x1a/0x20
Jun  3 23:28:01 linux kernel:  [<c013a080>] laptop_flush+0x0/0x10
Jun  3 23:28:01 linux kernel:  [<c013a870>] pdflush+0x0/0x20
Jun  3 23:28:01 linux kernel:  [<c012ae9c>] kthread+0x7c/0xb0
Jun  3 23:28:01 linux kernel:  [<c012ae20>] kthread+0x0/0xb0
Jun  3 23:28:01 linux kernel:  [<c010424d>] kernel_thread_helper+0x5/0x18
Jun  3 23:28:01 linux kernel:
Jun  3 23:28:01 linux kernel: Code:  Bad EIP value.
=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger

