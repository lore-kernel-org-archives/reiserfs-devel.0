From: Knut Petersen <Knut_Petersen@t-online.de>
Subject: reiserfs: possible circular locking dependency detected
Date: Thu, 05 Jul 2012 08:38:41 +0200
Message-ID: <4FF53671.5000400@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>

I don=C2=B4t know if this problem is fixed in the current kernel, so ha=
ve a look at the
following messsage about a possible locking problem I got on a spare ma=
chine
during heavy disk activity:

Jul 1 10:49:50 linux-iffr kernel: [73168.724207]
Jul 1 10:49:50 linux-iffr kernel: [73168.725665] =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Jul 1 10:49:50 linux-iffr kernel: [73168.727179] [ INFO: possible circu=
lar locking dependency detected ]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] 3.3.5-main #17 Not tai=
nted
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] ----------------------=
---------------------------------
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] mv/17705 is trying to =
acquire lock:
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] (&type->i_mutex_dir_ke=
y#3/2){+.+.+.}, at: [<c022000d>] delete_one_xattr+0x51/0x9c
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] but task is already ho=
lding lock:
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] (&type->i_mutex_dir_ke=
y#3/3){+.+.+.}, at: [<c02204bd>] reiserfs_for_each_xattr+0x1d3/0x225
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] which lock already dep=
ends on the new lock.
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] the existing dependenc=
y chain (in reverse order) is:
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] -> #1 (&type->i_mutex_=
dir_key#3/3){+.+.+.}:
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0153b87>] lock_acqu=
ire+0xaf/0xcd
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c049508d>] mutex_loc=
k_nested+0x3a/0x27a
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0220106>] open_xa_d=
ir+0x42/0x155
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0220347>] reiserfs_=
for_each_xattr+0x5d/0x225
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0220527>] reiserfs_=
delete_xattrs+0x18/0x42
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c02085f6>] reiserfs_=
evict_inode+0x87/0x11d
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c9c3f>] evict+0x8=
d/0x134
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01ca0c7>] iput+0x15=
c/0x161
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c7000>] d_kill+0x=
c5/0xe0
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c7611>] dput+0x12=
a/0x135
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c2a18>] sys_renam=
eat+0x19e/0x1e3
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c2a74>] sys_renam=
e+0x17/0x1b
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0497305>] syscall_c=
all+0x7/0xb
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] -> #0 (&type->i_mutex_=
dir_key#3/2){+.+.+.}:
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0153224>] __lock_ac=
quire+0xd88/0x12b8
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0153b87>] lock_acqu=
ire+0xaf/0xcd
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c049508d>] mutex_loc=
k_nested+0x3a/0x27a
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c022000d>] delete_on=
e_xattr+0x51/0x9c
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c02204cc>] reiserfs_=
for_each_xattr+0x1e2/0x225
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0220527>] reiserfs_=
delete_xattrs+0x18/0x42
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c02085f6>] reiserfs_=
evict_inode+0x87/0x11d
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c9c3f>] evict+0x8=
d/0x134
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01ca0c7>] iput+0x15=
c/0x161
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c12ff>] do_unlink=
at+0xde/0x118
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c268e>] sys_unlin=
kat+0x32/0x35
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0497305>] syscall_c=
all+0x7/0xb
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] other info that might =
help us debug this:
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] Possible unsafe lockin=
g scenario:
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] CPU0 CPU1
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] ---- ----
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] lock(&type->i_mutex_di=
r_key#3/3);
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] lock(&type->i_mutex_di=
r_key#3/2);
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] lock(&type->i_mutex_di=
r_key#3/3);
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] lock(&type->i_mutex_di=
r_key#3/2);
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] *** DEADLOCK ***
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] 1 lock held by mv/1770=
5:
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] #0: (&type->i_mutex_di=
r_key#3/3){+.+.+.}, at: [<c02204bd>] reiserfs_for_each_xattr+0x1d3/0x22=
5
Jul 1 10:49:50 linux-iffr kernel: [73168.728028]
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] stack backtrace:
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] Pid: 17705, comm: mv N=
ot tainted 3.3.5-main #17
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] Call Trace:
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c012096f>] ? console=
_unlock+0x1bc/0x1e2
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0490d9c>] print_cir=
cular_bug+0x215/0x222
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0153224>] __lock_ac=
quire+0xd88/0x12b8
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c022000d>] ? delete_=
one_xattr+0x51/0x9c
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0153b87>] lock_acqu=
ire+0xaf/0xcd
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c022000d>] ? delete_=
one_xattr+0x51/0x9c
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c022000d>] ? delete_=
one_xattr+0x51/0x9c
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c049508d>] mutex_loc=
k_nested+0x3a/0x27a
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c022000d>] ? delete_=
one_xattr+0x51/0x9c
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c015428c>] ? trace_h=
ardirqs_on+0xb/0xd
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c022000d>] delete_on=
e_xattr+0x51/0x9c
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c02204cc>] reiserfs_=
for_each_xattr+0x1e2/0x225
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c021ffbc>] ? xattr_u=
nlink+0x70/0x70
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0220527>] reiserfs_=
delete_xattrs+0x18/0x42
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c02085f6>] reiserfs_=
evict_inode+0x87/0x11d
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0496f9a>] ? _raw_sp=
in_unlock+0x2c/0x42
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0499816>] ? sub_pre=
empt_count+0x90/0x9d
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c9c3f>] evict+0x8=
d/0x134
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01ca0c7>] iput+0x15=
c/0x161
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c12ff>] do_unlink=
at+0xde/0x118
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01e5224>] ? dnotify=
_flush+0x2f/0xa6
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0497338>] ? restore=
_all+0xf/0xf
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c01c268e>] sys_unlin=
kat+0x32/0x35
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0497305>] syscall_c=
all+0x7/0xb
Jul 1 10:49:50 linux-iffr kernel: [73168.728028] [<c0490000>] ? no_cont=
ext+0x6f/0x1a3
