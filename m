From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: reiserfs lockdep complaint
Date: Wed, 30 May 2012 15:18:27 +0300
Message-ID: <1338380307.2536.70.camel@sauron.fi.intel.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-WXtIK1AackAIUelf73Gq"
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org, Linux FS Maling List <linux-fsdevel@vger.kernel.org>


--=-WXtIK1AackAIUelf73Gq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I get the following lockdep complaint when test reiserfs in the 3.4
kernel using xfstests. Ideas?

[453445.527861] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[453445.527977] [ INFO: possible circular locking dependency detected ]
[453445.528085] 3.4.0+ #73 Not tainted
[453445.528085] -------------------------------------------------------
[453445.528085] setfattr/25622 is trying to acquire lock:
[453445.528085]  (&ei->tailpack){+.+.+.}, at: [<ffffffffa00d42b9>] reiserfs=
_vfs_truncate_file+0x29/0x50 [reiserfs]
[453445.528085]=20
[453445.528085] but task is already holding lock:
[453445.528085]  (&REISERFS_SB(s)->lock){+.+.+.}, at: [<ffffffffa00f1299>] =
reiserfs_write_lock+0x39/0x60 [reiserfs]
[453445.528085]=20
[453445.528085] which lock already depends on the new lock.
[453445.528085]=20
[453445.528085]=20
[453445.528085] the existing dependency chain (in reverse order) is:
[453445.528085]=20
[453445.528085] -> #1 (&REISERFS_SB(s)->lock){+.+.+.}:
[453445.528085]        [<ffffffff810b90e2>] lock_acquire+0x92/0x140
[453445.528085]        [<ffffffff8161ff40>] mutex_lock_nested+0x70/0x360
[453445.528085]        [<ffffffffa00f1299>] reiserfs_write_lock+0x39/0x60 [=
reiserfs]
[453445.528085]        [<ffffffffa00d459f>] reiserfs_file_release+0x14f/0x3=
40 [reiserfs]
[453445.528085]        [<ffffffff8119569d>] fput+0xfd/0x270
[453445.528085]        [<ffffffff81191a96>] filp_close+0x66/0x90
[453445.528085]        [<ffffffff8105daf3>] put_files_struct+0x103/0x1c0
[453445.528085]        [<ffffffff8105dc72>] exit_files+0x52/0x60
[453445.528085]        [<ffffffff8105e134>] do_exit+0x174/0x900
[453445.528085]        [<ffffffff8105ec0c>] do_group_exit+0x4c/0xb0
[453445.528085]        [<ffffffff8105ec87>] sys_exit_group+0x17/0x20
[453445.528085]        [<ffffffff8162bee9>] system_call_fastpath+0x16/0x1b
[453445.528085]=20
[453445.528085] -> #0 (&ei->tailpack){+.+.+.}:
[453445.528085]        [<ffffffff810b85d8>] __lock_acquire+0x1658/0x1b80
[453445.528085]        [<ffffffff810b90e2>] lock_acquire+0x92/0x140
[453445.528085]        [<ffffffff8161ff40>] mutex_lock_nested+0x70/0x360
[453445.528085]        [<ffffffffa00d42b9>] reiserfs_vfs_truncate_file+0x29=
/0x50 [reiserfs]
[453445.528085]        [<ffffffff8113e383>] vmtruncate+0x53/0x60
[453445.528085]        [<ffffffffa00d41da>] reiserfs_setattr+0x2ea/0x3a0 [r=
eiserfs]
[453445.528085]        [<ffffffffa00f06bb>] reiserfs_xattr_set_handle+0x47b=
/0x4e0 [reiserfs]
[453445.528085]        [<ffffffffa00f07dc>] reiserfs_xattr_set+0xbc/0x160 [=
reiserfs]
[453445.528085]        [<ffffffffa00f1467>] user_set+0x77/0x90 [reiserfs]
[453445.528085]        [<ffffffffa00f0cc8>] reiserfs_setxattr+0xb8/0xf0 [re=
iserfs]
[453445.528085]        [<ffffffff811b724b>] __vfs_setxattr_noperm+0x7b/0x1c=
0
[453445.528085]        [<ffffffff811b7454>] vfs_setxattr+0xc4/0xd0
[453445.528085]        [<ffffffff811b7553>] setxattr+0xf3/0x1a0
[453445.528085]        [<ffffffff811b78e5>] sys_lsetxattr+0x95/0xb0
[453445.528085]        [<ffffffff8162bee9>] system_call_fastpath+0x16/0x1b
[453445.528085]=20
[453445.528085] other info that might help us debug this:
[453445.528085]=20
[453445.528085]  Possible unsafe locking scenario:
[453445.528085]=20
[453445.528085]        CPU0                    CPU1
[453445.528085]        ----                    ----
[453445.528085]   lock(&REISERFS_SB(s)->lock);
[453445.528085]                                lock(&ei->tailpack);
[453445.528085]                                lock(&REISERFS_SB(s)->lock);
[453445.528085]   lock(&ei->tailpack);
[453445.528085]=20
[453445.528085]  *** DEADLOCK ***
[453445.528085]=20
[453445.528085] 4 locks held by setfattr/25622:
[453445.528085]  #0:  (&sb->s_type->i_mutex_key#14){+.+.+.}, at: [<ffffffff=
811b740d>] vfs_setxattr+0x7d/0xd0
[453445.528085]  #1:  (&REISERFS_I(inode)->i_xattr_sem){++++..}, at: [<ffff=
ffffa00f02de>] reiserfs_xattr_set_handle+0x9e/0x4e0 [reiserfs]
[453445.528085]  #2:  (&sb->s_type->i_mutex_key#14/3){+.+...}, at: [<ffffff=
ffa00f0696>] reiserfs_xattr_set_handle+0x456/0x4e0 [reiserfs]
[453445.528085]  #3:  (&REISERFS_SB(s)->lock){+.+.+.}, at: [<ffffffffa00f12=
99>] reiserfs_write_lock+0x39/0x60 [reiserfs]
[453445.528085]=20
[453445.528085] stack backtrace:
[453445.528085] Pid: 25622, comm: setfattr Not tainted 3.4.0+ #73
[453445.528085] Call Trace:
[453445.528085]  [<ffffffff816180a5>] print_circular_bug+0x1fb/0x20c
[453445.528085]  [<ffffffff811319ca>] ? find_get_pages+0x2a/0x210
[453445.528085]  [<ffffffff810b85d8>] __lock_acquire+0x1658/0x1b80
[453445.528085]  [<ffffffff810b9b95>] ? trace_hardirqs_on_caller+0x105/0x19=
0
[453445.528085]  [<ffffffff81620e45>] ? __mutex_unlock_slowpath+0xe5/0x180
[453445.528085]  [<ffffffffa00d42b9>] ? reiserfs_vfs_truncate_file+0x29/0x5=
0 [reiserfs]
[453445.528085]  [<ffffffff810b90e2>] lock_acquire+0x92/0x140
[453445.528085]  [<ffffffffa00d42b9>] ? reiserfs_vfs_truncate_file+0x29/0x5=
0 [reiserfs]
[453445.528085]  [<ffffffff8161ff40>] mutex_lock_nested+0x70/0x360
[453445.528085]  [<ffffffffa00d42b9>] ? reiserfs_vfs_truncate_file+0x29/0x5=
0 [reiserfs]
[453445.528085]  [<ffffffffa00d42b9>] reiserfs_vfs_truncate_file+0x29/0x50 =
[reiserfs]
[453445.528085]  [<ffffffff8113e383>] vmtruncate+0x53/0x60
[453445.528085]  [<ffffffffa00d41da>] reiserfs_setattr+0x2ea/0x3a0 [reiserf=
s]
[453445.528085]  [<ffffffff81620160>] ? mutex_lock_nested+0x290/0x360
[453445.528085]  [<ffffffffa00f06bb>] reiserfs_xattr_set_handle+0x47b/0x4e0=
 [reiserfs]
[453445.528085]  [<ffffffffa00f07dc>] reiserfs_xattr_set+0xbc/0x160 [reiser=
fs]
[453445.528085]  [<ffffffffa00f1467>] user_set+0x77/0x90 [reiserfs]
[453445.528085]  [<ffffffffa00f0cc8>] reiserfs_setxattr+0xb8/0xf0 [reiserfs=
]
[453445.528085]  [<ffffffff811b724b>] __vfs_setxattr_noperm+0x7b/0x1c0
[453445.528085]  [<ffffffff811b7454>] vfs_setxattr+0xc4/0xd0
[453445.528085]  [<ffffffff811b7553>] setxattr+0xf3/0x1a0
[453445.528085]  [<ffffffff8119f403>] ? putname+0x33/0x50
[453445.528085]  [<ffffffff811a3cb3>] ? user_path_at_empty+0x63/0xa0
[453445.528085]  [<ffffffff8115c556>] ? do_brk+0x246/0x360
[453445.528085]  [<ffffffff81623cd5>] ? retint_swapgs+0x13/0x1b
[453445.528085]  [<ffffffff811b78e5>] sys_lsetxattr+0x95/0xb0
[453445.528085]  [<ffffffff8162bee9>] system_call_fastpath+0x16/0x1b

--=20
Best Regards,
Artem Bityutskiy

--=-WXtIK1AackAIUelf73Gq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPxhATAAoJECmIfjd9wqK0JwUQAKLd2JBV0zJN3lpGjwAxsh11
gMg2Bc3PKvVsgajPURpIOkO8aPyZnG/AByLUn1dgh9jLttTQ1F55rbv+JVVkBaPv
hy8HjabdaLUvMERbVaI3JFF0vYkACe5aMPeZSl+s/jQVwV3/utFJs7Omu0Hgwx5O
NyinhZsAMIfl+6cIjwehzZ211n5wf3Yfrdo6XAsqVEPw2op9hZrkU8sARDFv4lKx
57Zm2O1cjudyMtxmE8aBauoGIPvwECbIbSMREUzM0Xw3pOCMfuvFyEM6MJh4liyh
Ci8PALDRxHDUV8IWD4ge2hdbWNJtt1dnBwBAxG+ekkLfS8VsWhcxqURuQXMTiT/C
Dsmdloaa4togejMHqFiB5sAFIAeh1RVNsimXCZvV30Z4anjF69VPzBU0U8iLcS3W
CUCCgZVBrke63sQV3R7YXwv4v54cCAFCpCqcAQGA+GMxcQyG7ZZhCWjgUuXxNOcp
jq2dwHNbY3m6rrur24zrqyoeq4+ASXCB1jgziemfPPsQamsDqlqrm0vYIDmFayXk
yUNwQ8cKkPjbgkpKb/T3w3YPmY/SSBD+P6QVRaISevbZAXwWcs9tdxUfy2qK7v6P
1bHCW/yeM/j2o3qkO3jT9AHJczrdiWEduMHx9LXkAcCHJrEpbfCooKDXWuJLdGF6
dmlDZoootZYSu/cyJuWM
=DRRL
-----END PGP SIGNATURE-----

--=-WXtIK1AackAIUelf73Gq--

