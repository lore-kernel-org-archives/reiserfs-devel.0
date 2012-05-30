From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: reiserfs lockdep complaint
Date: Wed, 30 May 2012 19:50:18 +0300
Message-ID: <1338396618.2536.103.camel@sauron.fi.intel.com>
References: <1338380307.2536.70.camel@sauron.fi.intel.com>
	 <1338384129.2536.71.camel@sauron.fi.intel.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-52mDA/yibHyx8wfMZT1q"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1338384129.2536.71.camel@sauron.fi.intel.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org
Cc: Linux FS Maling List <linux-fsdevel@vger.kernel.org>


--=-52mDA/yibHyx8wfMZT1q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-30 at 16:22 +0300, Artem Bityutskiy wrote:
> On Wed, 2012-05-30 at 15:18 +0300, Artem Bityutskiy wrote:
> > Hi,
> >=20
> > I get the following lockdep complaint when test reiserfs in the 3.4
> > kernel using xfstests. Ideas?
>=20
> Reiserfs subsequently deadlocks, but it does not look like this lockdep
> warning is related to that deadlock, but I am not sure.

Not sure I'll have enough time to dig into this because reiserfs locking
is crazy - there is the reiserfs-specific BKL which probably pushed down
in the past and broke reiserfs. Anyway, I have useful dump:

It looks like what is happening is that the first fsstress takes the
rieserfs write lock and then tries to take a quota lock.

The second fsstress took the write lock, then the quota lock, then
dropped the write lock, and it was taken by the first fsstress, and then
it tries to re-acquire the write lock.

Not sure though.

[ 2760.486253] INFO: lockdep is turned off.
[ 2760.486474] INFO: task fsstress:1066 blocked for more than 120 seconds.
[ 2760.487186] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[ 2760.487627] fsstress        D ffff88030c68fa80     0  1066   1057 0x0000=
0000
[ 2760.487925]  ffff8801cd9a1be8 0000000000000046 ffffffff811eec4d 00000000=
00000002
[ 2760.488409]  ffff8801cd985f40 ffff8801cd9a1fd8 ffff8801cd9a1fd8 ffff8801=
cd9a1fd8
[ 2760.488862]  ffff8801cd980000 ffff8801cd985f40 0000000000000000 ffff8801=
cd9a0000
[ 2760.489352] Call Trace:
[ 2760.489547]  [<ffffffff811eec4d>] ? dquot_acquire+0x4d/0x150
[ 2760.489798]  [<ffffffff81622089>] schedule+0x29/0x70
[ 2760.490063]  [<ffffffff816223c7>] schedule_preempt_disabled+0x27/0x40
[ 2760.490330]  [<ffffffff81620047>] mutex_lock_nested+0x177/0x360
[ 2760.490585]  [<ffffffff811eec4d>] ? dquot_acquire+0x4d/0x150
[ 2760.490836]  [<ffffffff811f0410>] ? dqget+0xa0/0x3a0
[ 2760.491099]  [<ffffffff811eec4d>] dquot_acquire+0x4d/0x150
[ 2760.491351]  [<ffffffffa0055e28>] reiserfs_acquire_dquot+0x78/0xc0 [reis=
erfs]
[ 2760.491629]  [<ffffffff811f0660>] dqget+0x2f0/0x3a0
[ 2760.491873]  [<ffffffff811f255f>] dquot_transfer+0x5f/0xd0
[ 2760.492149]  [<ffffffffa005020b>] reiserfs_setattr+0x31b/0x3a0 [reiserfs=
]
[ 2760.492422]  [<ffffffff811afb7a>] notify_change+0x1aa/0x340
[ 2760.492675]  [<ffffffff81191972>] chown_common+0x72/0x90
[ 2760.492921]  [<ffffffff81192a5e>] sys_lchown+0x7e/0x90
[ 2760.493192]  [<ffffffff8162bee9>] system_call_fastpath+0x16/0x1b
[ 2760.493450] INFO: lockdep is turned off.
[ 2760.493669] INFO: task fsstress:1067 blocked for more than 120 seconds.
[ 2760.493934] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.
[ 2760.494397] fsstress        D ffff88030c489e68     0  1067   1057 0x0000=
0000
[ 2760.494689]  ffff8802ff5bd9d8 0000000000000046 ffffffffa006d299 00000000=
00000002
[ 2760.495168]  ffff8801cd980000 ffff8802ff5bdfd8 ffff8802ff5bdfd8 ffff8802=
ff5bdfd8
[ 2760.495623]  ffffffff81c13020 ffff8801cd980000 ffff8802ff5bd9b8 ffff8802=
ff5bc000
[ 2760.496109] Call Trace:
[ 2760.496308]  [<ffffffffa006d299>] ? reiserfs_write_lock+0x39/0x60 [reise=
rfs]
[ 2760.496585]  [<ffffffff81622089>] schedule+0x29/0x70
[ 2760.496823]  [<ffffffff816223c7>] schedule_preempt_disabled+0x27/0x40
[ 2760.497114]  [<ffffffff81620047>] mutex_lock_nested+0x177/0x360
[ 2760.497373]  [<ffffffffa006d299>] ? reiserfs_write_lock+0x39/0x60 [reise=
rfs]
[ 2760.497650]  [<ffffffff8162192f>] ? __schedule+0x3bf/0x810
[ 2760.497902]  [<ffffffff810f86bf>] ? rcu_irq_exit+0x8f/0xe0
[ 2760.498181]  [<ffffffffa006d299>] reiserfs_write_lock+0x39/0x60 [reiserf=
s]
[ 2760.498458]  [<ffffffffa006e95c>] reiserfs_cond_resched.part.8+0x1b/0x1f=
 [reiserfs]
[ 2760.498911]  [<ffffffffa004d35e>] reiserfs_update_sd_size+0x2be/0x2d0 [r=
eiserfs]
[ 2760.499372]  [<ffffffffa0065b00>] ? reiserfs_add_ordered_list+0x30/0x110=
 [reiserfs]
[ 2760.499817]  [<ffffffffa005696b>] reiserfs_dirty_inode+0x8b/0xa0 [reiser=
fs]
[ 2760.500119]  [<ffffffff811bd8bc>] __mark_inode_dirty+0x3c/0x240
[ 2760.500378]  [<ffffffffa0056c1d>] reiserfs_quota_write+0x29d/0x340 [reis=
erfs]
[ 2760.500655]  [<ffffffff811f45f3>] qtree_write_dquot+0xc3/0x160
[ 2760.500911]  [<ffffffffa006d299>] ? reiserfs_write_lock+0x39/0x60 [reise=
rfs]
[ 2760.501217]  [<ffffffff811f299c>] v2_write_dquot+0x2c/0x30
[ 2760.501467]  [<ffffffff811f1d4e>] dquot_commit+0xce/0xe0
[ 2760.501713]  [<ffffffffa0055ee8>] reiserfs_write_dquot+0x78/0xc0 [reiser=
fs]
[ 2760.501988]  [<ffffffff811f1c5c>] dquot_quota_sync+0x30c/0x330
[ 2760.502272]  [<ffffffff811c2510>] ? __sync_filesystem+0x90/0x90
[ 2760.502529]  [<ffffffff811c24bc>] __sync_filesystem+0x3c/0x90
[ 2760.502782]  [<ffffffff811c252f>] sync_one_sb+0x1f/0x30
[ 2760.503050]  [<ffffffff81197211>] iterate_supers+0xf1/0x100
[ 2760.503302]  [<ffffffff811c25e0>] sys_sync+0x30/0x70
[ 2760.503541]  [<ffffffff8162bee9>] system_call_fastpath+0x16/0x1b


--=20
Best Regards,
Artem Bityutskiy

--=-52mDA/yibHyx8wfMZT1q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPxk/KAAoJECmIfjd9wqK08GcP/1fm/PyfY3S9rsjN4sxTmRUj
2R1KuFwKRI/eAYm0GUsXJnCTYOLkgKPoT7Kq1F0RZhZvi2Q50GmS9ZoroPjZrE27
Azr8XBRXGjMnK+jbGUQ/+RN+koReENNJyOS7ZIPvnDaxu8iURtn7ky2GXXXNdWMa
BLqxLv9vFGAl04UgZDYa/jSkG8b1LmEOKWX1OAcj5SRfFdMMNmXIk2QZQIYpsSv4
8o5yg8+dnTo+lima3ES3yYhH6mLlEpBkCcXIqFh26ZX4npJop5w0R6MIF2YorXJz
0Zd8nKjdsGhh7GLJ+HbZ0jY7Y/ST7MjT36Z5xSVR3xRXkT4N5Oyj5L/8K3P4IBJ8
7TMVBnS5ocPF/yWJOArsvpIMDE4Wf1G1hfSY6XrGWMbkgTHg4+tQ1+AKuQC95D28
OabBsJSSh3Jzy3BYrQNYkytXtpXLGpD7C7i0hZ4LelymVHW5JZbkmoj8qaEC4Vdr
56IQiGmX3P9Hi3BdrD5Y+QcsFMW5z8uaaSQWUbtVMVZKGGgPREB1dnEXw0H8EoYj
DQhJIC02901bqsrCzzT+uq1IdcYXX31yRn4jo5bxJpwmG3vphc18alE18kQwjjw6
sYp+05F8/ymqfNp8uNTwtBfWJK6+LeAyzSzdPF1owAL8dwv8txrREhSG7BJwlYEE
RZYTvHCcIhHqbdwBT/He
=aANE
-----END PGP SIGNATURE-----

--=-52mDA/yibHyx8wfMZT1q--

