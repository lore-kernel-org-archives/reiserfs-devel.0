From: "Alexey Polyakov" <alexey.polyakov@gmail.com>
Subject: Kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:80
Date: Sun, 7 May 2006 01:19:51 +0400
Message-ID: <b5d90b2a0605061419o66bbefa7r8f90d728afe2e4bf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28579-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hi!
I have two servers running reiser4 as root and data partitions.
Both are using 2.6.15.x kernels with reiser4-for-2.6.15-1.patch.
One is i386 UP with md over SATA, another is x86_64 SMP with i2o over
hardware raid.
I tried upgrading kernels on both servers to 2.6.16-cks9 (thats
basically 2.6.16.12 with some non-io related patches applied).
Both give me the same kind of error a few minutes after boot (during
intensive io):

May  4 14:12:12 titanic kernel: ----------- [cut here ] ---------
[please bite here ] ---------
May  4 14:12:21 titanic kernel: Kernel BUG at
fs/reiser4/plugin/file/tail_conversion.c:80
May  4 14:12:21 titanic kernel: invalid opcode: 0000 [1] SMP
May  4 14:12:21 titanic kernel: CPU 3
May  4 14:12:21 titanic kernel: Modules linked in:
May  4 14:12:21 titanic kernel: Pid: 2723, comm: ci Not tainted 2.6.16-cks9=
 #1
May  4 14:12:21 titanic kernel: RIP: 0010:[<ffffffff80210f73>]
<ffffffff80210f73>{get_nonexclusive_access+35}
May  4 14:12:22 titanic kernel: RSP: 0018:ffff8100f0d6dc88  EFLAGS: 0001028=
6
May  4 14:12:32 titanic kernel: RAX: ffff8101d106bd40 RBX:
ffff8101c7c740f8 RCX: 00002b4bc74f2000
May  4 14:12:49 titanic kernel: RDX: 0000000000000000 RSI:
0000000000000000 RDI: ffff8101c7c740f8
May  4 14:12:49 titanic kernel: RBP: 0000000000000000 R08:
ffff810037e05680 R09: 0000000000000000
May  4 14:12:56 titanic kernel: R10: 0000000000000000 R11:
0000000000000000 R12: ffff8101c4ca2080
May  4 14:13:03 titanic kernel: R13: ffff8100f0d6dde8 R14:
ffff8101c7c74198 R15: ffff8101debd4200
May  4 14:13:03 titanic kernel: FS:  00002b4bc73f1b00(0000)
GS:ffff8101045370c0(0000) knlGS:0000000000000000
May  4 14:13:03 titanic kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
000000008005003b
May  4 14:13:03 titanic kernel: CR2: 00000000005caff0 CR3:
00000000f25b1000 CR4: 00000000000006e0
May  4 14:13:14 titanic kernel: Process ci (pid: 2723, threadinfo
ffff8100f0d6c000, task ffff81000c0ad080)
May  4 14:13:17 titanic kernel: Stack: ffff8101c7c740f8
ffffffff8022704b ffff8101e07dd928 ffff8101d106bd40
May  4 14:13:17 titanic kernel:        ffff8101fee3a8f0
000000008038fd89 0000000100000000 ffff8101ffcbe020
May  4 14:13:17 titanic kernel:        000000000023230d ffff8101ddabc6d0
May  4 14:13:17 titanic kernel: Call Trace:
<ffffffff8022704b>{write_extent+1595}
<ffffffff802294b1>{item_length_by_coord+17}
May  4 14:13:17 titanic kernel:      =20
<ffffffff802244a9>{nr_units_extent+9}
<ffffffff80225df8>{init_coord_extension_extent+120}
May  4 14:13:17 titanic kernel:      =20
<ffffffff8020deb6>{find_file_item+182}
<ffffffff801f25eb>{reiser4_grab+155}
May  4 14:13:20 titanic kernel:      =20
<ffffffff80226a10>{write_extent+0} <ffffffff8020f8e5>{write_flow+709}
May  4 14:13:20 titanic kernel:      =20
<ffffffff8010b7f1>{error_exit+0} <ffffffff8038d4a2>{__down_read+18}
May  4 14:13:20 titanic kernel:      =20
<ffffffff8021030b>{write_unix_file+923}
<ffffffff80178dac>{vfs_write+236}
May  4 14:13:20 titanic kernel:      =20
<ffffffff80178f53>{sys_write+83} <ffffffff8010aaf6>{system_call+126}
May  4 14:13:20 titanic kernel:
May  4 14:13:20 titanic kernel: Code: 0f 0b 68 b0 c8 3b 80 c2 50 00 66
66 90 e8 3b b6 17 00 48 89
May  4 14:13:21 titanic kernel: RIP
<ffffffff80210f73>{get_nonexclusive_access+35} RSP <ffff8100f0d6dc88>
May  4 14:13:21 titanic kernel:  <4><4>reiser4[ci(2723)]:
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May  4 14:13:21 titanic kernel: WARNING: out of memory?
May  4 14:13:21 titanic kernel: <4>reiser4[ci(2723)]:
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May  4 14:13:21 titanic kernel: WARNING: out of memory?
May  4 14:13:21 titanic kernel: <4>reiser4[ci(2723)]:
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May  4 14:13:21 titanic kernel: WARNING: out of memory?
May  4 14:13:21 titanic kernel: <4>reiser4[ci(2723)]:
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May  4 14:13:22 titanic kernel: WARNING: out of memory?
May  4 14:13:23 titanic kernel: <4>reiser4[ci(2723)]:
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May  4 14:13:25 titanic kernel: WARNING: out of memory?
May  4 14:13:25 titanic kernel: <4>reiser4[ci(2723)]:
release_unix_file (fs/reiser4/plugin/file/file.c:2670)[vs-44]:
May  4 14:13:25 titanic kernel: WARNING: out of memory?
May  4 14:13:25 titanic kernel: ----------- [cut here ] ---------
[please bite here ] ---------

After that happens, processes get stuck in D state, and only hard reboot he=
lps.
Is there any patches that might help with this issue? Should I provide
any additional information to help with this bug?

Thanks.

--
Alexey Polyakov
