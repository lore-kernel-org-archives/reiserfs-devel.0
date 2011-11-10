From: Pierre Ynard <linkfanel@yahoo.fr>
Subject: Oops on reiserfs corruption
Date: Thu, 10 Nov 2011 23:13:46 +0100
Message-ID: <20111110221346.GA20887@via.ecp.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

Hello,

A reiserfs filesystem on my system got randomly corrupted, and then
would trigger a 100% reproducible oops:


[  178.016969] PAX: suspicious general protection fault: 0000 [#1]=20
[  178.017141] last sysfs file: /sys/module/x_tables/initstate
[  178.017234] Modules linked in: af_packet ts_bm xt_tcpudp xt_string t=
un dummy sit tunnel4 ipt_MASQUERADE iptable_nat nf_nat nf_conntrack_ipv=
4 nf_conntrack nf_defrag_ipv4 ip_tables x_tables dm_mod pata_ali 3c59x =
mii ipv6 unix
[  178.018237]=20
[  178.018312] Pid: 1816, comm: rm Not tainted 2.6.39.3-grsec #1 =20
[  178.018481] EIP: 0060:[<000e29b2>] EFLAGS: 00010286 CPU: 0
[  178.018577] EAX: 00000000 EBX: c204fb4b ECX: 00000000 EDX: c03c3e00
[  178.018682] ESI: ffffffff EDI: c204f73e EBP: c03c3e00 ESP: c03c3d70
[  178.018784]  DS: 0068 ES: 0068 FS: 0000 GS: 007b SS: 0068
[  178.018885] Process rm (pid: 1816, ti=3Dc7b585a8 task=3Dc7b58380 tas=
k.ti=3Dc7b585a8)
[  178.018996] Stack:
[  178.019063]  c03a3380 c204fb3e c03c3e28 c7b12200 c01ffab8 000e8fda 0=
0000001 00000000
[  178.019452]  00000000 00000000 00000000 c76f3a48 00000001 c76f38c0 0=
0000088 c76f3888
[  178.019840]  00000074 000f360b c7b12200 c8cd7000 000f0369 00000000 c=
7b12200 c1868d7b
[  178.020230] Call Trace:
[  178.020335]  [<000e8fda>] ? search_for_position_by_key+0x1a/0x2b0
[  178.020463]  [<000f360b>] ? reiserfs_write_lock+0x1b/0x30
[  178.020572]  [<000f0369>] ? do_journal_end.clone.38+0x209/0xc60
[  178.020703]  [<000e2c7c>] ? __reiserfs_error+0x1c/0xb0
[  178.020807]  [<000eac5e>] ? reiserfs_do_truncate+0x47e/0x580
[  178.020920]  [<000f31bf>] ? reiserfs_for_each_xattr+0x23f/0x3c0
[  178.021047]  [<00076dfe>] ? try_to_unmap_file+0xfe/0x470
[  178.021154]  [<00076dff>] ? try_to_unmap_file+0xff/0x470
[  178.021271]  [<006b113d>] ? 0x6b113c
[  178.021365]  [<000ead85>] ? reiserfs_delete_object+0x25/0x60
[  178.021478]  [<000d77fb>] ? reiserfs_evict_inode+0xab/0xe0
[  178.021584]  [<006b113d>] ? 0x6b113c
[  178.021688]  [<0009dde6>] ? evict+0x46/0x110
[  178.021784]  [<00094d38>] ? do_unlinkat+0xe8/0x1f0
[  178.021888]  [<00076dff>] ? try_to_unmap_file+0xff/0x470
[  178.021915]  [<00207c60>] ? syscall_call+0x7/0xb
[  178.021915] Code: ff 00 00 52 8b 48 08 51 8b 50 04 52 8b 00 50 68 28=
 52 86 c1 57 e8 2f 4f 04 00 83 c4 1c e9 e7 fd ff ff 8d 6e 04 8b 36 85 f=
6 74 75 <8a> 46 10 ba 5b f6 86 c1 84 c0 74 1b 3c 03 74 79 ba 2c 88 86 c=
1=20
[  178.021915] EIP: [<000e29b2>] prepare_error_buf+0x3b2/0x4b0 SS:ESP 0=
068:c03c3d70
[  178.024828] ---[ end trace a7de6d386ed5b2d8 ]---
[  178.024925] ------------[ cut here ]------------


I tried and ran into it on both 3.0.8-grsec and 2.6.39.3-grsec kernels.
Sorry for the non-vanilla kernel, I just got rid of the problem with a
fsck as quickly as possible. I thought I'd report it anyway.

Regards,

--=20
Pierre Ynard
"Une =E2me dans un corps, c'est comme un dessin sur une feuille de papi=
er."
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
