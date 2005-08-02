From: sudo Yang <sudoyang@gmail.com>
Subject: journal too big
Date: Tue, 2 Aug 2005 09:48:47 -0700
Message-ID: <4f52331f050802094839f9ad7@mail.gmail.com>
Reply-To: sudo Yang <sudoyang@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25290-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Some of our systems are getting a kernel panic.  This error is logged
to /var/log/messages:

Jul 23 09:52:13 csd01a-bld kernel: REISERFS: panic (device sdb1):
journal-1413: journal_mark_dirty: j_len (1024) is too big
Jul 23 09:52:13 csd01a-bld kernel:
Jul 23 09:52:13 csd01a-bld kernel: ------------[ cut here ]------------
Jul 23 09:52:13 csd01a-bld kernel: kernel BUG at fs/reiserfs/prints.c:362!
Jul 23 09:52:13 csd01a-bld kernel: invalid operand: 0000 [#1]
Jul 23 09:52:13 csd01a-bld kernel: SMP
Jul 23 09:52:13 csd01a-bld kernel: Modules linked in: e1000 reiserfs
ext3 jbd 3w_xxxx sd_mod scsi_mod
Jul 23 09:52:13 csd01a-bld kernel: CPU:    3
Jul 23 09:52:13 csd01a-bld kernel: EIP:    0060:[<f88f8ab2>]    Not tainted
Jul 23 09:52:13 csd01a-bld kernel: EFLAGS: 00010282   (2.6.8-1.521smp)
Jul 23 09:52:13 csd01a-bld kernel: EIP is at reiserfs_panic+0x36/0x56 [reis=
erfs]
Jul 23 09:52:13 csd01a-bld kernel: eax: 0000005d   ebx: f890e771 =20
ecx: f7f92d5c   edx: f7f92d5c
Jul 23 09:52:13 csd01a-bld kernel: esi: f7f92c00   edi: f7f92d5c =20
ebp: f7f92c00   esp: f3422a64
Jul 23 09:52:13 csd01a-bld kernel: ds: 007b   es: 007b   ss: 0068
Jul 23 09:52:13 csd01a-bld kernel: Process ncftpd (pid: 27978,
threadinfo=3Df3422000 task=3Df3432db0)
Jul 23 09:52:13 csd01a-bld kernel: Stack: f890e781 f7f92d5c f891aba0
f3422e04 ffffffff f59a95f8 f890553b f7f92c00
Jul 23 09:52:13 csd01a-bld kernel:        f8910995 00000400 00007fff
00000000 00007fff f7f92c00 00001059 f886f000
Jul 23 09:52:13 csd01a-bld kernel:        f88e45a2 f5799ba8 f7d74000
082cffff 5418fb54 f3422e04 082cffff bd88316c
Jul 23 09:52:13 csd01a-bld kernel: Call Trace:
Jul 23 09:52:13 csd01a-bld kernel:  [<f890553b>]
journal_mark_dirty+0xff/0x245 [reiserfs]
Jul 23 09:52:13 csd01a-bld kernel:  [<f88e45a2>]
_reiserfs_free_block+0xe2/0x160 [reiserfs]
Jul 23 09:52:13 csd01a-bld kernel:  [<f88fe717>]
prepare_for_delete_or_cut+0x5e2/0x654 [reiserfs]
Jul 23 09:52:13 csd01a-bld kernel:  [<f88ff320>]
reiserfs_cut_from_item+0x93/0x42e [reiserfs]
Jul 23 09:52:13 csd01a-bld kernel:  [<f88ffa14>]
reiserfs_do_truncate+0x2fb/0x44d [reiserfs]
Jul 23 09:52:13 csd01a-bld kernel:  [<f8905418>]
journal_begin+0x7d/0xa1 [reiserfs]
Jul 23 09:52:13 csd01a-bld kernel:  [<f88ee42a>]
reiserfs_truncate_file+0x107/0x1ff [reiserfs]
Jul 23 09:52:13 csd01a-bld kernel:  [<0214b894>] vmtruncate+0xc6/0xf0
Jul 23 09:52:13 csd01a-bld kernel:  [<02175dbd>] inode_setattr+0x5e/0x11e
Jul 23 09:52:13 csd01a-bld kernel:  [<f88ef9fc>]
reiserfs_setattr+0x1ad/0x22c [reiserfs]
Jul 23 09:52:13 csd01a-bld kernel:  [<02175fdf>] notify_change+0x10c/0x1dd
Jul 23 09:52:13 csd01a-bld kernel:  [<021596c4>] do_truncate+0x87/0xbc
Jul 23 09:52:13 csd01a-bld kernel:  [<02167dcf>] permission+0x41/0x46
Jul 23 09:52:13 csd01a-bld kernel:  [<021699f7>] may_open+0x1b5/0x200
Jul 23 09:52:13 csd01a-bld kernel:  [<02169cf9>] open_namei+0x2b7/0x5e2
Jul 23 09:52:13 csd01a-bld kernel:  [<0215a4d6>] filp_open+0x23/0x3c
Jul 23 09:52:13 csd01a-bld kernel:  [<0215a6e7>] get_unused_fd+0x53/0xf3
Jul 23 09:52:13 csd01a-bld kernel:  [<0215a8c0>] sys_open+0x31/0x7d
Jul 23 09:52:13 csd01a-bld kernel: Code: 0f 0b 6a 01 a5 e7 90 f8 83 c4
0c 85 f6 68 a0 ab 91 f8 0f 45

We'r eusing ReiserfsFS 3.x.  What does this error mean?  What can we
do about it?

Thanks
