From: =?iso-8859-1?Q?Oscar_Garc=EDa?= <ogarcia@atlasit.com>
Subject: Problem with ReiserFS + NFS + Convolo (more)
Date: Sat, 14 Jun 2003 14:49:08 +0200
Message-ID: <006101c33273$5a065c60$1501a8c0@int.atlassolutions.net>
Reply-To: =?iso-8859-1?Q?Oscar_Garc=EDa?= <ogarcia@atlasit.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_005E_01C33284.1C52DBD0"
Return-path: <reiserfs-list-return-14542-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: eramos@atlasit.com

------=_NextPart_000_005E_01C33284.1C52DBD0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Following the previous email, I also got this errors (some time ago). =
The side effects (uptime, processes blocking, no service) are exactly =
the same, as well as the setup. Are they related to the the last one?

Thanks in advance!

May 28 02:10:59 cluster1 kernel: ReiserFS version 3.6.25
May 28 02:11:00 cluster1 kernel: 12223
May 28 02:11:00 cluster1 kernel: B_FREE_SPACE =
(PATH_H_PBUFFER(tb->tb_path,0)) =3D 716; MAX_CHILD_SIZ
E (4072) - dc_size( [dc_number=3D0, dc_size=3D10077], 0 ) [3192] =3D 880
May 28 02:11:00 cluster1 kernel: 0: reiserfs_rmdir
May 28 02:11:00 cluster1 kernel: PAP-12365: check_after_balance_leaf: S =
is incorrectinvalid operan
d: 0000
May 28 02:11:00 cluster1 kernel: CPU:    1
May 28 02:11:00 cluster1 kernel: EIP:    0010:[reiserfs_panic+41/96]    =
Not tainted
May 28 02:11:00 cluster1 kernel: EIP:    0010:[<c01bb239>]    Not =
tainted
May 28 02:11:00 cluster1 kernel: EFLAGS: 00010292
May 28 02:11:00 cluster1 kernel: eax: 00000036   ebx: c02acea0   ecx: =
00000001   edx: 00000001
May 28 02:11:00 cluster1 kernel: esi: f7703c00   edi: 000002cc   ebp: =
f6b09cc4   esp: f6b09bd4
May 28 02:11:00 cluster1 kernel: ds: 0018   es: 0018   ss: 0018
May 28 02:11:00 cluster1 kernel: Process rm (pid: 1423, =
stackpage=3Df6b09000)
May 28 02:11:00 cluster1 kernel: Stack: c02983b0 c03723a0 c02acea0 =
f6b09bf8 f67cf000 f7703c00 c01a
cea6 f7703c00
May 28 02:11:00 cluster1 kernel:        c02acea0 000002cc f6b09cc4 =
00000001 00000000 00000000 c01a
d06b f6b09cc4
May 28 02:11:00 cluster1 kernel:        f6b09cc4 00000000 00000000 =
00000063 f6b09c48 f6b09c30 f6b0
9c30 00000000
May 28 02:11:00 cluster1 kernel: Call Trace: =
[check_after_balance_leaf+454/464] [do_balance+235/36
8] [fix_nodes+919/1472] [fix_nodes+935/1472] [do_page_fault+0/1307]
May 28 02:11:00 cluster1 kernel:    [reiserfs_cut_from_item+1364/1424] =
[reiserfs_rmdir+332/624] [v
fs_rmdir+364/512] [lookup_hash+70/192] [sys_rmdir+167/240] =
[system_call+51/64]
May 28 02:11:00 cluster1 kernel:    [<c01c6504>] [<c01ae5bc>] =
[<c014532c>] [<c0144516>] [<c0145467
>] [<c0107253>]
May 28 02:11:00 cluster1 kernel:
May 28 02:11:00 cluster1 kernel: Code: 0f 0b 68 a0 23 37 c0 85 f6 74 12 =
66 8b 46 08 25 ff ff 00 00


May 27 18:36:25 cluster1 kernel: 0: reiserfs_get_block
May 27 18:36:25 cluster1 kernel: 1: file_release
May 27 18:36:25 cluster1 kernel: 2: reiserfs_vfs_truncate_file
May 27 18:36:25 cluster1 kernel: 3: reiserfs_create
May 27 18:36:25 cluster1 kernel: PAP-5140: search_by_key: schedule =
occurred in do_balance!invalid operand: 0000
May 27 18:36:25 cluster1 kernel: CPU:    0
May 27 18:36:25 cluster1 kernel: EIP:    0010:[reiserfs_panic+41/96]    =
Not tainted
May 27 18:36:25 cluster1 kernel: EIP:    0010:[<c01bb239>]    Not =
tainted
May 27 18:36:25 cluster1 kernel: EFLAGS: 00010282
May 27 18:36:25 cluster1 kernel: eax: 0000003c   ebx: c02b6e00   ecx: =
00000001   edx: 00000001
May 27 18:36:25 cluster1 kernel: esi: f1988c00   edi: f1988c00   ebp: =
f5955b2c   esp: c3e69d50
May 27 18:36:25 cluster1 kernel: ds: 0018   es: 0018   ss: 0018
May 27 18:36:25 cluster1 kernel: Process proftpd (pid: 9842, =
stackpage=3Dc3e69000)
May 27 18:36:25 cluster1 kernel: Stack: c02983b0 c03723a0 c02b6e00 =
c3e69d74 c028d260 00000001 c01c401a f1988c00
May 27 18:36:25 cluster1 kernel:        c02b6e00 c029cb46 00000000 =
c0168414 f74aa660 f61e7250 00000000 00000000
May 27 18:36:25 cluster1 kernel:        00000000 e5eb2ac0 00000028 =
c028d260 c028d250 00000014 2482bf08 f3f46420
May 27 18:36:25 cluster1 kernel: Call Trace: [search_by_key+6634/8016] =
[do_get_write_access+1492/1536] [search_by_entry_key+31/
672] [reiserfs_find_entry+151/336] [journal_dirty_data+446/464]
May 27 18:36:25 cluster1 kernel: Call Trace: [<c01c401a>] [<c0168414>] =
[<c01ad23f>] [<c01ad9a7>] [<c016892e>]
May 27 18:36:25 cluster1 kernel:    [reiserfs_lookup+112/224] =
[locks_delete_lock+196/208] [d_alloc+25/368] [real_lookup+115/256
] [link_path_walk+1477/2080] [getname+95/160]
May 27 18:36:25 cluster1 kernel:    [<c01adad0>] [<c0149c14>] =
[<c014c6b9>] [<c01437e3>] [<c0143f65>] [<c014346f>]
May 27 18:36:25 cluster1 kernel:    [__user_walk+51/80] =
[sys_stat64+20/112] [error_code+52/64] [system_call+51/64]
May 27 18:36:25 cluster1 kernel:    [<c0144633>] [<c0140e84>] =
[<c0107364>] [<c0107253>]
May 27 18:36:25 cluster1 kernel:
May 27 18:36:25 cluster1 kernel: Code: 0f 0b 68 a0 23 37 c0 85 f6 74 12 =
66 8b 46 08 25 ff ff 00 00
------=_NextPart_000_005E_01C33284.1C52DBD0--

