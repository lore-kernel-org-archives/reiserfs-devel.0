From: Michael Schwietering <michael@corp.mercuryin.es>
Subject: OOPS-ERRORS
Date: Mon, 5 Apr 2004 14:00:42 +0200
Message-ID: <200404051400.42345.michael@corp.mercuryin.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

I get this on reiserfs, and sync does not come back again... Anyone has ide=
as?=20
Or do you need more specific infos?

Unable to handle kernel paging request at virtual address 00100000
c1a1140c
*pde =3D 00000000
Oops: 0002 2.4.21-198-default #1 Thu Mar 11 17:43:56 UTC 2004
CPU: =A0 =A00
EIP: =A0 =A00010:[<c1a1140c>] =A0 =A0Not tainted
EFLAGS: 00010217
eax: c1a113d0 =A0 ebx: c1cf0540 =A0 ecx: c1cf0560 =A0 edx: 00100000
esi: c3399f24 =A0 edi: 00000000 =A0 ebp: c1cf0540 =A0 esp: c3399f0c
ds: 0018 =A0 es: 0018 =A0 ss: 0018
Process pop3d (pid: 27062, stackpage=3Dc3399000)
Stack: c1cf0540 c015e15b c1cf0540 c1cf05ac c1a0733e c1cf0540 ddf84800 00000=
001=20
=A0 =A0 =A0 =A000000000 00000144 0035ddf5 00000000 00000000 ddf84800 c1cf05=
40 c1a07310=20
=A0 =A0 =A0 =A0c1a301a0 cfb938e0 c015ea87 c1cf0540 cfb938e0 c1cf0540 c3399f=
90 c015c57c=20
Call Trace: =A0 =A0 =A0 =A0 [<c015e15b>] (12) [<c1a0733e>] (44) [<c1a07310>=
] (04)
=A0 [<c1a301a0>] (08) [<c015ea87>] (20) [<c015c57c>] (16) [<c015c61d>] (16)
=A0 [<c0154e2e>] (56) [<c0109073>] (60)
Code: ff 0a 0f 94 c0 84 c0 75 1b c7 83 6c 01 00 00 00 00 00 00 5b=20


>>EIP; c1a1140c <[reiserfs]reiserfs_clear_inode+3c/80> =A0 <=3D=3D=3D=3D=3D

>>eax; c1a113d0 <[reiserfs]reiserfs_clear_inode+0/80>
>>ebx; c1cf0540 <[sd_mod].bss.end+1452a1/814dc1>
>>ecx; c1cf0560 <[sd_mod].bss.end+1452c1/814dc1>
>>edx; 00100000 Before first symbol
>>esi; c3399f24 <[st].bss.end+3c33c1/5194fd>
>>ebp; c1cf0540 <[sd_mod].bss.end+1452a1/814dc1>
>>esp; c3399f0c <[st].bss.end+3c33a9/5194fd>

Trace; c015e15b <clear_inode+cb/f0>
Trace; c1a0733e <[reiserfs]reiserfs_delete_inode+2e/d0>
Trace; c1a07310 <[reiserfs]reiserfs_delete_inode+0/d0>
Trace; c1a301a0 <[reiserfs]reiserfs_sops+0/50>
Trace; c015ea87 <iput+f7/220>
Trace; c015c57c <dentry_iput+3c/70>
Trace; c015c61d <dput+6d/140>
Trace; c0154e2e <sys_unlink+ce/110>
Trace; c0109073 <system_call+33/40>

Code; =A0c1a1140c <[reiserfs]reiserfs_clear_inode+3c/80>
00000000 <_EIP>:
Code; =A0c1a1140c <[reiserfs]reiserfs_clear_inode+3c/80> =A0 <=3D=3D=3D=3D=
=3D
=A0 =A00: =A0 ff 0a =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 decl =A0 (%edx)=
 =A0 <=3D=3D=3D=3D=3D
Code; =A0c1a1140e <[reiserfs]reiserfs_clear_inode+3e/80>
=A0 =A02: =A0 0f 94 c0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sete =A0 %al
Code; =A0c1a11411 <[reiserfs]reiserfs_clear_inode+41/80>
=A0 =A05: =A0 84 c0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 test =A0 %al,%al
Code; =A0c1a11413 <[reiserfs]reiserfs_clear_inode+43/80>
=A0 =A07: =A0 75 1b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 jne =A0 =A024 <=
_EIP+0x24> c1a11430=20
<[reiserfs]reiserfs_clear_inode+60/80>
Code; =A0c1a11415 <[reiserfs]reiserfs_clear_inode+45/80>
=A0 =A09: =A0 c7 83 6c 01 00 00 00 =A0 =A0 =A0movl =A0 $0x0,0x16c(%ebx)
Code; =A0c1a1141c <[reiserfs]reiserfs_clear_inode+4c/80>
=A0 10: =A0 00 00 00=20
Code; =A0c1a1141f <[reiserfs]reiserfs_clear_inode+4f/80>
=A0 13: =A0 5b =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pop =A0 =A0%e=
bx


____________________________
Michael Schwietering


