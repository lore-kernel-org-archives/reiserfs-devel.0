From: =?iso-8859-1?Q?=22Sven_M=FCller=22?= <musv@gmx.de>
Subject: Kernel Ooops when using kdesu
Date: Thu, 07 Oct 2010 22:35:44 +0200
Message-ID: <20101007203544.222170@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: edward.shishkin@gmail.com
Cc: reiserfs-devel@vger.kernel.org

Hi Edward,=20

according to the advice in Gentoo Forums:=20

http://forums.gentoo.org/viewtopic-t-845764.html

I'll send you the bug report.=20

Behaviour:=20
When I try start a program via kdesu (KDE4) I'll get a Kernel Ooops. It=
's reproducible. The Ooops occurs on x86 and amd64. I've tested it on 2=
=2E6.34 and on 2.6.35 (r1 and r5). And until now it seems that only kde=
su is affected.=20

Configuration:
Kernel: Gentoo-Sources-2.6.35-r5
Root Device is Reiser4
Reiser4 Patch is from Kernel.org (Reiser4-for-2.6.35.patch)
CPU: x86
The Posting in Gentoo Forums (Link) is from a amd64.=20

/var/log/messages:

Oct  7 22:26:32 localhost kernel: BUG: unable to handle kernel NULL poi=
nter dereference at (null)
Oct  7 22:26:32 localhost kernel: IP: [<c01b846a>] checkin_logical_clus=
ter+0xb1/0x176
Oct  7 22:26:32 localhost kernel: *pde =3D 00000000=20
Oct  7 22:26:32 localhost kernel: Oops: 0000 [#1]=20
Oct  7 22:26:32 localhost kernel: last sysfs file: /sys/devices/system/=
cpu/cpu0/cpufreq/scaling_cur_freq
Oct  7 22:26:32 localhost kernel: Modules linked in: pcmcia
Oct  7 22:26:32 localhost kernel:=20
Oct  7 22:26:32 localhost kernel: Pid: 2306, comm: kio_file Not tainted=
 2.6.35-gentoo-r5 #2 Latitude C610            /Latitude C610           =
       =20
Oct  7 22:26:32 localhost kernel: EIP: 0060:[<c01b846a>] EFLAGS: 000102=
46 CPU: 0
Oct  7 22:26:32 localhost kernel: EIP is at checkin_logical_cluster+0xb=
1/0x176
Oct  7 22:26:32 localhost kernel: EAX: 00000001 EBX: c9176d58 ECX: 0000=
0000 EDX: 00000000
Oct  7 22:26:32 localhost kernel: ESI: 00000000 EDI: 00000000 EBP: cb57=
2eb4 ESP: c9176d14
Oct  7 22:26:32 localhost kernel: DS: 007b ES: 007b FS: 0000 GS: 0033 S=
S: 0068
Oct  7 22:26:32 localhost kernel: Process kio_file (pid: 2306, ti=3Dc91=
76000 task=3Dcb376360 task.ti=3Dc9176000)
Oct  7 22:26:32 localhost kernel: Stack:
Oct  7 22:26:32 localhost kernel: 00000000 c9176d58 00000000 cb572eb4 0=
0000000 c9176d58 00000000 cb572eb4
Oct  7 22:26:32 localhost kernel: <0> 00000000 c01bacff 00000000 c91921=
00 00000000 0000000d cb572eb4 c01baf36
Oct  7 22:26:32 localhost kernel: <0> fffffff4 00000000 00000000 000000=
00 00000000 00000001 00000000 00000000
Oct  7 22:26:32 localhost kernel: Call Trace:
Oct  7 22:26:32 localhost kernel: [<c01bacff>] ? capture_page_cluster+0=
xa2/0xc7
Oct  7 22:26:32 localhost kernel: [<c01baf36>] ? write_end_cryptcompres=
s+0x212/0x222
Oct  7 22:26:32 localhost kernel: [<c01b7455>] ? reiser4_write_end_care=
ful+0xe8/0x153
Oct  7 22:26:32 localhost kernel: [<c0148127>] ? pagecache_write_end+0x=
37/0x3e
Oct  7 22:26:32 localhost kernel: [<c01ac107>] ? reiser4_dirty_inode+0x=
8/0x59
Oct  7 22:26:32 localhost kernel: [<c017c356>] ? pipe_to_file+0x109/0x1=
14
Oct  7 22:26:32 localhost kernel: [<c01ac107>] ? reiser4_dirty_inode+0x=
8/0x59
Oct  7 22:26:32 localhost kernel: [<c01ac107>] ? reiser4_dirty_inode+0x=
8/0x59
Oct  7 22:26:32 localhost kernel: [<c017b3ff>] ? splice_from_pipe_feed+=
0x31/0x9e
Oct  7 22:26:32 localhost kernel: [<c017c24d>] ? pipe_to_file+0x0/0x114
Oct  7 22:26:32 localhost kernel: [<c017c1c0>] ? generic_file_splice_wr=
ite+0xa2/0x12f
Oct  7 22:26:32 localhost kernel: [<c017c11e>] ? generic_file_splice_wr=
ite+0x0/0x12f
Oct  7 22:26:32 localhost kernel: [<c017bca0>] ? vfs_splice_from+0x53/0=
x5a
Oct  7 22:26:32 localhost kernel: [<c017c093>] ? direct_splice_actor+0x=
14/0x18
Oct  7 22:26:32 localhost kernel: [<c017bb35>] ? splice_direct_to_actor=
+0xbe/0x172
Oct  7 22:26:32 localhost kernel: [<c017c07f>] ? direct_splice_actor+0x=
0/0x18
Oct  7 22:26:32 localhost kernel: [<c017bc34>] ? do_splice_direct+0x4b/=
0x64
Oct  7 22:26:32 localhost kernel: [<c0166440>] ? do_sendfile+0x16c/0x1b=
5
Oct  7 22:26:32 localhost kernel: [<c01664c9>] ? sys_sendfile64+0x40/0x=
86
Oct  7 22:26:32 localhost kernel: [<c0102510>] ? sysenter_do_call+0x12/=
0x26
Oct  7 22:26:32 localhost kernel: Code: 01 74 09 31 f6 83 f8 02 75 1e e=
b 05 8b 73 3c eb 17 8b 43 0c 31 ff 8b 70 04 03 30 81 c6 ff 0f 00 00 83 =
d7 00 0f ac fe 0c 8b 7b 48 <8b> 07 f6 c4 01 74 24 89 e8 e8 2f 4a fe ff =
e8 ac a3 fe ff 8b 4b=20
Oct  7 22:26:32 localhost kernel: EIP: [<c01b846a>] checkin_logical_clu=
ster+0xb1/0x176 SS:ESP 0068:c9176d14
Oct  7 22:26:32 localhost kernel: CR2: 0000000000000000
Oct  7 22:26:32 localhost kernel: ---[ end trace 401667030bed02db ]---


addr2line -e /usr/src/linux/vmlinux -i c01b846a:

/usr/src/linux/fs/reiser4/plugin/file/cryptcompress.c:1722
/usr/src/linux/fs/reiser4/plugin/file/cryptcompress.c:1780

Let me know if you need any further information. I would be glad if I c=
ould help you.=20

Thx=20
Sven
--=20
GRATIS! Movie-FLAT mit =C3=BCber 300 Videos.=20
Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
