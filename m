From: Kacper Wysocki <kacperw@online.no>
Subject: reiser4 problems in 2.6.10-rc1-mm
Date: Wed, 17 Nov 2004 04:55:53 +0000
Message-ID: <1100667360l.1027l.0l@comotion>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-h6bIlRsya9oPAGpsRBOb";
 protocol="application/pgp-signature"; micalg=PGP-SHA1
Return-path: <reiserfs-list-return-22391-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--=-h6bIlRsya9oPAGpsRBOb
Content-Type: multipart/mixed; boundary="=-HjyJzVHdxWui2XD437hA"

--=-HjyJzVHdxWui2XD437hA
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I decided to try out reiser4 yesterday, when I got a new harddrive for =20
my laptop. In the process, I had some terrible problems, and gave up =20
after a good full day of trying to make it work.

System: Thinkpad 240, debian sid, kernel 2.6.10-rc1-mm5

Configuration: kernel config attached. reiser4 was set up with =20
'mkfs.reiser4 /dev/hda1', no fancy tweaks. root filesystem was rsync'ed =20
from old to new harddrive using a usb laptop harddrive enclosure.

Steps to reproduce: run 'apt-get update' (or any apt-get command =20
really, and some other apps as well). 'apt-get update' will fetch all =20
the index files and then oops on 'reading package lists..' First time =20
after reboot: recoverable kernel oops. Second time: process enters =20
unkillable sleep, as does strace and gdb when attempting to attach to =20
it.

fixes attempted:
Thinking apt or its dependencies were corrupted, I reinstalled apt, =20
libc6, libstdc++ and libgcc, but can still reproduce the error. I also =20
disabled 'Preempt Big Kernel Lock' and the newer IO schedulers thinking =20
they might have something to do with it, but alas, no go. Finally I =20
disabled preempt altogether, yet that did not help either.
The new -mm kernel, 2.6.10-rc2-mm1 came out tonight, so I gave that a =20
try as well.

I finally booted into single user mode and ran an fsck.reiser4, found =20
tons of errors. Repairing the filesystem with --build-fs, then =20
rebooting just made the whole thing oops until it hit max oops depth.

other symptoms:
processes lock up randomly (vim, gdb, reboot process...)
system froze hard a couple of times in X.. Magic SysReq never completes =20
an emergency sync after a lockup, but does reboot the system.

Just in case this might be a hardware problem, the new harddrive is a =20
Toshiba 20GB MK2023GAS-(PM), but it works fine in any other =20
configuration (as a non-root drive, reiserfs 3 etc)

I'm pretty much giving up on this, as it's cost me far more time than I =20
can afford spending. However, I would like to know whether there is =20
something essential that I've missed - surely there must be something =20
unique about my setup that is causing such difficulties?

Cheers,
Kacper

--=-HjyJzVHdxWui2XD437hA
Content-Type: text/plain; charset=us-ascii; name=reiser4-bug-preempt
Content-Disposition: attachment; filename=reiser4-bug-preempt
Content-Transfer-Encoding: quoted-printable

Nov 16 10:25:33 debbie kernel: kernel BUG at fs/reiser4/plugin/file/tail_co=
nversion.c:32!
Nov 16 10:25:33 debbie kernel: invalid operand: 0000 [#1]
Nov 16 10:25:33 debbie kernel: PREEMPT=20
Nov 16 10:25:33 debbie kernel: Modules linked in: airo_cs airo snd_es1938 s=
nd_pcm snd_page_alloc snd_opl3_lib snd_timer snd_hwdep snd_mpu401_uart snd_=
rawmidi snd_seq_device snd esssolo1 gameport
Nov 16 10:25:33 debbie kernel: CPU:    0
Nov 16 10:25:33 debbie kernel: EIP:    0060:[get_exclusive_access+46/64]   =
 Not tainted VLI
Nov 16 10:25:33 debbie kernel: EFLAGS: 00010282   (2.6.10-rc1-mm5-debbie)=20
Nov 16 10:25:33 debbie kernel: EIP is at get_exclusive_access+0x2e/0x40
Nov 16 10:25:33 debbie kernel: eax: ca5766b8   ebx: 00000001   ecx: 0000000=
0   edx: cb849140
Nov 16 10:25:33 debbie kernel: esi: 00000000   edi: ca5766b8   ebp: ca57671=
0   esp: ca8a5dfc
Nov 16 10:25:33 debbie kernel: ds: 007b   es: 007b   ss: 0068
Nov 16 10:25:33 debbie kernel: Process apt-get (pid: 2357, threadinfo=3Dca8=
a4000 task=3Dcb9a4040)
Nov 16 10:25:33 debbie kernel: Stack: c02197f1 ca5766b8 b711f000 0080d8d0 0=
0000001 ca8a5e34 003a5661 ca8a4000=20
Nov 16 10:25:33 debbie kernel:        63706b67 00000001 00000001 0080d8d0 0=
0000000 00000008 00008000 c1154500=20
Nov 16 10:25:33 debbie kernel:        c1154060 c114af00 c10f66e0 c10f6840 c=
10f6860 c10f6880 c1148d80 00000000=20
Nov 16 10:25:33 debbie kernel: Call Trace:
Nov 16 10:25:33 debbie kernel:  [write_unix_file+465/1088] write_unix_file+=
0x1d1/0x440
Nov 16 10:25:33 debbie kernel:  [init_context+108/160] init_context+0x6c/0x=
a0
Nov 16 10:25:33 debbie kernel:  [reiser4_write+119/208] reiser4_write+0x77/=
0xd0
Nov 16 10:25:33 debbie kernel:  [vfs_write+200/368] vfs_write+0xc8/0x170
Nov 16 10:25:33 debbie kernel:  [do_fcntl+258/464] do_fcntl+0x102/0x1d0
Nov 16 10:25:33 debbie kernel:  [sys_write+81/128] sys_write+0x51/0x80
Nov 16 10:25:33 debbie kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Nov 16 10:25:33 debbie kernel: Code: ff ff 8b 44 24 04 21 e2 8b 12 8b 92 b8=
 04 00 00 8b 52 3c 8b 52 08 85 d2 75 11 ba 01 00 ff ff 0f c1 10 85 d2 0f 85=
 fd 11 00 00 c3 <0f> 0b 20 00 20 76 49 c0 eb e5 90 8d b4 26 00 00 00 00 8b =
44 24=20




--=-HjyJzVHdxWui2XD437hA
Content-Type: text/plain; charset=us-ascii; name=reiser4-bug-nopreempt
Content-Disposition: attachment; filename=reiser4-bug-nopreempt
Content-Transfer-Encoding: quoted-printable

Nov 16 11:05:13 debbie kernel: kernel BUG at fs/reiser4/plugin/file/tail_co=
nversion.c:32!
Nov 16 11:05:13 debbie kernel: invalid operand: 0000 [#1]
Nov 16 11:05:13 debbie kernel: Modules linked in: airo_cs airo snd_es1938 s=
nd_pcm snd_page_alloc snd_opl3_lib snd_timer snd_hwdep snd_mpu401_uart snd_=
rawmidi snd_seq_device snd esssolo1 gameport
Nov 16 11:05:13 debbie kernel: CPU:    0
Nov 16 11:05:13 debbie kernel: EIP:    0060:[get_exclusive_access+46/64]   =
 Not tainted VLI
Nov 16 11:05:13 debbie kernel: EFLAGS: 00010282   (2.6.10-rc1-mm5-debbie)=20
Nov 16 11:05:13 debbie kernel: EIP is at get_exclusive_access+0x2e/0x40
Nov 16 11:05:13 debbie kernel: eax: ca65c498   ebx: 00000001   ecx: 0000000=
0   edx: cac7c840
Nov 16 11:05:13 debbie kernel: esi: 00000000   edi: ca65c498   ebp: ca65c4f=
0   esp: caf11dfc
Nov 16 11:05:13 debbie kernel: ds: 007b   es: 007b   ss: 0068
Nov 16 11:05:13 debbie kernel: Process apt-get (pid: 2459, threadinfo=3Dcaf=
10000 task=3Dcb55ca80)
Nov 16 11:05:13 debbie kernel: Stack: c02053a1 ca65c498 b711f000 0080d8d0 0=
0000001 caf11e34 003a5661 caf10000=20
Nov 16 11:05:13 debbie kernel:        63706b67 00000001 00000001 0080d8d0 0=
0000000 00000008 00008000 c1150560=20
Nov 16 11:05:13 debbie kernel:        c114d9e0 c114b980 c10e99a0 c10e99c0 c=
10e99e0 c10e9a00 c114a900 00000000=20
Nov 16 11:05:13 debbie kernel: Call Trace:
Nov 16 11:05:13 debbie kernel:  [write_unix_file+465/1088] write_unix_file+=
0x1d1/0x440
Nov 16 11:05:13 debbie kernel:  [init_context+108/160] init_context+0x6c/0x=
a0
Nov 16 11:05:13 debbie kernel:  [reiser4_write+119/208] reiser4_write+0x77/=
0xd0
Nov 16 11:05:13 debbie kernel:  [vfs_write+200/368] vfs_write+0xc8/0x170
Nov 16 11:05:13 debbie kernel:  [sys_write+81/128] sys_write+0x51/0x80
Nov 16 11:05:13 debbie kernel:  [syscall_call+7/11] syscall_call+0x7/0xb
Nov 16 11:05:13 debbie kernel: Code: ff ff 8b 44 24 04 21 e2 8b 12 8b 92 b8=
 04 00 00 8b 52 3c 8b 52 08 85 d2 75 11 ba 01 00 ff ff 0f c1 10 85 d2 0f 85=
 fd 11 00 00 c3 <0f> 0b 20 00 20 b7 46 c0 eb e5 90 8d b4 26 00 00 00 00 8b =
44 24=20




--=-HjyJzVHdxWui2XD437hA
Content-Type: application/x-gzip; name=reiser4-config.gz
Content-Disposition: attachment; filename=reiser4-config.gz
Content-Transfer-Encoding: base64

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
y53azJLPFBah+R68VFH+A4fcaV+tiwAA

--=-HjyJzVHdxWui2XD437hA--

--=-h6bIlRsya9oPAGpsRBOb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBmtng+LsaKQiaxYYRAvfEAJ9DzUbOAcrAs4+c281sWO3c3/7nhQCZASFe
FQP7nj1uTFfNozo09tsvfgU=
=xGE4
-----END PGP SIGNATURE-----

--=-h6bIlRsya9oPAGpsRBOb--

