From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: reiser4-2.6.18-rc2-mm1: possible circular locking dependency
 detected in txn_end
Date: Mon, 14 Aug 2006 15:02:02 +0200
Message-ID: <44E0744A.2000304@free.fr>
References: <44CD0115.4010608@free.fr> <44D2112A.7080705@free.fr> <44DDD707.1000506@free.fr> <200608141550.41663.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29594-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200608141550.41663.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Alexander Zarochentsev <zam@namesys.com>

Le 14.08.2006 13:50, Vladimir V. Saveliev a =E9crit :
> Hello
>=20
> On Saturday 12 August 2006 17:26, Laurent Riffard wrote:
>> Le 03.08.2006 17:07, Laurent Riffard a =E9crit :
>>> Le 03.08.2006 08:09, Alexander Zarochentsev a =E9crit :
>>>> On Tuesday 01 August 2006 01:29, Laurent Riffard wrote:
>>>>> Le 31.07.2006 21:55, Vladimir V. Saveliev a =E9crit :
>>>>>> Hello
>>>>>>
>>>>>> What kind of load did you run on reiser4 at that time?
>>>>> I just formatted a new 2GB Reiser4 FS, then I moved a whole ccache
>>>>> cache tree to this new FS (cache size was about 20~30 Mbytes).
>>>>> Something like:
>>>>>
>>>>> # mkfs.reiser4 /dev/vglinux1/ccache
>>>>> # mount -tauto -onoatime /dev/vglinux1/ccache /mnt/disk
>>>>> # mv ~laurent/.ccache/* /mnt/disk/
>>>> I was not able to reproduce it.  Can you please try the following patc=
h?
>>>>
>>>>
>>>> lock validator friendly locking of new atom in
>>>> atom_begin_and_assign_to_txnh and locking of two atoms.
>>>>
>>>> Signed-off-by: Alexander Zarochentsev <zam@namesys.com>
>>>> ---
>>>>
>>>>  fs/reiser4/txnmgr.c |   14 ++++++++------
>>>>  fs/reiser4/txnmgr.h |   15 +++++++++++++++
>>>>  2 files changed, 23 insertions(+), 6 deletions(-)
>> [patch snipped]
>>
>>> I tried this patch: it's slow as hell (CPU is ~100% system) and it
>>> panics when syncing...
>>>
>>> reiser4 panicked cowardly: reiser4[shutdown(1904)]: spin_lock_atom
>>> (fs/reiser4/txmgr.h:509)[]:
>> Hello,
>>
>> I tried again with linux 2.6.18-rc3-mm2+hotfixes.
>>
>>     # booted to runlevel 1
>>     ~$ mount
>>     ...
>>     /dev/mapper/vglinux1-lvhome on /home type reiserfs (rw)
>>     /dev/mapper/vglinux1-lvccache on /home/laurent/.ccache type reiser4
>> (rw,nosuid,nodev,noatime) ...
>>
>>     ~$ df ~/.ccache
>>     Filesystem            Size  Used Avail Use% Mounted on
>>     /dev/mapper/vglinux1-lvccache
>>                           2.0G   53M  1.9G   3% /home/laurent/.ccache
>>
>>     ~$ time mv ~/.ccache/* ~/tmp/ccache
>>     0.10user 6.01system 0:07.92elapsed 77%CPU (0avgtext+0avgdata
>> 0maxresident)k 0inputs+0outputs (1major+296minor)pagefaults 0swaps
>>
>> dmesg output:
>>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>>     [ INFO: possible circular locking dependency detected ]
>>     -------------------------------------------------------
>>     mv/1255 is trying to acquire lock:
>>      (&txnh->hlock){--..}, at: [<e101f0cf>] txn_end+0x191/0x368 [reiser4]
>>
>>     but task is already holding lock:
>>      (&atom->alock){--..}, at: [<e101b674>] txnh_get_atom+0xf6/0x39e
>> [reiser4]
>>
>>     which lock already depends on the new lock.
>>
>>
>>     the existing dependency chain (in reverse order) is:
>>
>>     -> #1 (&atom->alock){--..}:
>>            [<c012ce82>] lock_acquire+0x60/0x80
>>            [<c0291c08>] _spin_lock+0x19/0x28
>>            [<e101cc0b>] try_capture+0x7cf/0x1cd7 [reiser4]
>>            [<e10096e5>] longterm_lock_znode+0x427/0x84f [reiser4]
>>            [<e1038fe7>] seal_validate+0x221/0x5ee [reiser4]
>>            [<e10652a1>] find_entry+0x126/0x307 [reiser4]
>>            [<e1065974>] rem_entry_common+0xe9/0x4ba [reiser4]
>>            [<e104c9bc>] unlink_common+0x258/0x364 [reiser4]
>>            [<c015f7bc>] vfs_unlink+0x47/0x87
>>            [<c01611b4>] do_unlinkat+0x8c/0x122
>>            [<c016125a>] sys_unlink+0x10/0x12
>>            [<c0102c39>] sysenter_past_esp+0x56/0x8d
>>
>>     -> #0 (&txnh->hlock){--..}:
>>            [<c012ce82>] lock_acquire+0x60/0x80
>>            [<c0291c08>] _spin_lock+0x19/0x28
>>            [<e101f0cf>] txn_end+0x191/0x368 [reiser4]
>>            [<e10109b5>] reiser4_exit_context+0x1c2/0x571 [reiser4]
>>            [<e104cabd>] unlink_common+0x359/0x364 [reiser4]
>>            [<c015f7bc>] vfs_unlink+0x47/0x87
>>            [<c01611b4>] do_unlinkat+0x8c/0x122
>>            [<c016125a>] sys_unlink+0x10/0x12
>>            [<c0102c39>] sysenter_past_esp+0x56/0x8d
>>
>>     other info that might help us debug this:
>>
>>     3 locks held by mv/1255:
>>      #0:  (&inode->i_mutex/1){--..}, at: [<c0161181>]
>> do_unlinkat+0x59/0x122 #1:  (&inode->i_mutex){--..}, at: [<c0290a94>]
>> mutex_lock+0x21/0x24 #2:  (&atom->alock){--..}, at: [<e101b674>]
>> txnh_get_atom+0xf6/0x39e [reiser4]
>>
>>     stack backtrace:
>>      [<c0103a97>] show_trace+0xd/0x10
>>      [<c0103ff6>] dump_stack+0x19/0x1b
>>      [<c012c20d>] print_circular_bug_tail+0x59/0x64
>>      [<c012ca2c>] __lock_acquire+0x814/0x9a5
>>      [<c012ce82>] lock_acquire+0x60/0x80
>>      [<c0291c08>] _spin_lock+0x19/0x28
>>      [<e101f0cf>] txn_end+0x191/0x368 [reiser4]
>>      [<e10109b5>] reiser4_exit_context+0x1c2/0x571 [reiser4]
>>      [<e104cabd>] unlink_common+0x359/0x364 [reiser4]
>>      [<c015f7bc>] vfs_unlink+0x47/0x87
>>      [<c01611b4>] do_unlinkat+0x8c/0x122
>>      [<c016125a>] sys_unlink+0x10/0x12
>>      [<c0102c39>] sysenter_past_esp+0x56/0x8d
>>
>>
>>     ~$ time sync
>>     0.00user 0.02system 0:00.49elapsed 4%CPU (0avgtext+0avgdata
>> 0maxresident)k 0inputs+0outputs (1major+202minor)pagefaults 0swaps
>>
>> Move the files backward...
>>     ~$ time mv ~/tmp/ccache/* ~/.ccache/
>>     0.11user 3.98system 0:04.09elapsed 100%CPU (0avgtext+0avgdata
>> 0maxresident)k 0inputs+0outputs (0major+286minor)pagefaults 0swaps
>>
>>     ~$ time sync
>>     0.00user 0.00system 0:01.86elapsed 0%CPU (0avgtext+0avgdata
>> 0maxresident)k 0inputs+0outputs (0major+204minor)pagefaults 0swaps
>>
>> So this problem still appears in 2.6.18-rc3-mm2+hotfixes.
>>
>> I applied the patch zam sent 01 August 2006. Compile, boot to
>> runlevel 1 and test again. The warning went away but it's now really
>> really slow:
>>
>>     ~$ time mv ~/.ccache/* ~/tmp/ccache
>>     0.09user 15.82system 0:16.08elapsed 98%CPU (0avgtext+0avgdata
>> 0maxresident)k 0inputs+0outputs (0major+299minor)pagefaults 0swaps
>>
>> ouch! 16s versus 8s.
>>
>>     ~$ time sync
>>     0.00user 0.10system 0:00.58elapsed 17%CPU (0avgtext+0avgdata
>> 0maxresident)k 0inputs+0outputs (0major+205minor)pagefaults 0swaps
>>
>> Move the files backward...
>>     ~$ time mv ~/tmp/ccache/* ~/.ccache/
>>     0.11user 27.20system 0:27.33elapsed 99%CPU (0avgtext+0avgdata
>> 0maxresident)k 0inputs+0outputs (0major+286minor)pagefaults 0swaps
>>
>> 27s versus 4s previously.
>>
>>     ~$ time sync
>>     0.00user 0.02system 0:04.35elapsed 0%CPU (0avgtext+0avgdata
>> 0maxresident)k 0inputs+0outputs (0major+204minor)pagefaults 0swaps
>>
>> once again...
>>     ~$ time ~/.ccache/* ~/tmp/ccache
>>     0.09user 37.43system 0:37.71elapsed 99%CPU (0avgtext+0avgdata
>> 0maxresident)k 0inputs+0outputs (0major+298minor)pagefaults 0swaps
>>
>>     ~$ time sync
>>     0.00user 0.08system 0:00.44elapsed 19%CPU (0avgtext+0avgdata
>> 0maxresident)k 0inputs+0outputs (0major+204minor)pagefaults 0swaps
>>
>> What's going on ? Let's have a look at vmstat output
>>     ~$ vmstat 3 &
>>     [1] 1394
>>     ~$ procs -----------memory---------- ---swap-- -----io---- --system--
>> ----cpu---- r  b   swpd   free   buff  cache   si   so    bi    bo   in =
 =20
>> cs us sy id wa 1  0      0 438688   9684  45612    0    0    70    90  2=
69=20
>>   50  1 15 81  3 0  0      0 438688   9684  45612    0    0     0     0 =

>> 350    58  0  1 99  0 0  0      0 438688   9688  45612    0    0     0  =
 =20
>> 3  251    10  0  0 100  0 0  0      0 438704   9688  45612    0    0    =
 0=20
>>    0  257    10  0  0 100  0 time mv ~/tmp/ccache/* ~/.ccache/
>>
>>      1  0      0 437944   9728  45684    0    0     0    13  270    25  0
>> 76 23  0 1  0      0 437448   9732  46384    0    0     0     4  251    =
 8=20
>> 0 100  0  0 1  0      0 437448   9784  46096    0    0     0    17  252 =
 =20
>> 16  0 100  0  0 1  0      0 436828   9908  45984    0    0     0    43  =
254
>>    12  0 100  0  0 1  0      0 436580   9908  45844    0    0     0     =
0=20
>> 250     8  0 100  0  0 1  0      0 436208  10004  46252    0    0     0 =
 =20
>> 42  260    12  0 100  0  0 1  0      0 435836  10004  46176    0    0   =
  0
>>     0  251     7  1 99  0  0 1  0      0 434968  10096  46868    0    0 =
  =20
>> 0    31  251    11  0 100  0  0 1  0      0 435092  10144  46112    0   =
 0=20
>>    0    16  251    12  0 100  0  0 0.07user 29.02system 0:29.10elapsed
>> 99%CPU (0avgtext+0avgdata 0maxresident)k 0inputs+0outputs
>> (0major+287minor)pagefaults 0swaps
>>     ~$
>>      0  0      0 434968  10144  45960    0    0     0     0  251    11  0
>> 92  8  0 0  0      0 434968  10192  45960    0    0     0    29  255    =
11=20
>> 0  0 99  1 0  0      0 434984  10192  45960    0    0     0     0  255  =
=20
>> 27  0  0 100  0 kill %1
>>     ~$
>>     [1]+  Complete              vmstat 3
>>
>> See? 100% system CPU. Without the patch, I have about 60% user and
>> 30% system.
>>
>> This patch seems to solve the "possible circular locking dependency
>> detected in txn_end". Moreover, it seems to solve the "possible
>> circular locking dependency detected wile unmounting reiser4 FS" I
>> reported in another thread.
>>
>> But it still panics while syncing:
>>     reiser4 panicked cowardly: reiser4[sync(23302)]: spin_lock_atom
>> (fs/reiser4/txnmgr.h:509)[]: Kernel panic - not syncing:
>> reiser4[sync(23302)]: spin_lock_atom (fs/reiser4/txnmgr.h:509)[]:
>>
>=20
> Sorry, I am confused. In the above I see that sync completed because you =
were=20
> able to time it. Please describe how to reproduce the panic.


Oups! I forgot some explanations... Sorry for that.

During the timed test, I was timing the "mv", saw the completion and=20
then I timed the "sync" (ie a few seconds after the end of the "mv").=20

I've got the panic later: I was compiling a kernel (on a reiser4 FS)=20
and I issued a "sync" during the compilation. Actually, the compilation=20
process involves 2 distinct reiser4 FS: /home/laurent/kernel/ and=20
/home/laurent/.ccache/.=20

  $ mount
  /dev/mapper/vglinux1-lvhome on /home type reiserfs (rw)
  /dev/mapper/vglinux1-lvccache on /home/laurent/.ccache type reiser4 (rw,n=
osuid,nodev,noatime)
  /dev/mapper/vglinux1-lvkernel on /home/laurent/kernel type reiser4 (rw,no=
suid,nodev,noatime)
=20
In the timed tests, I didn't try to sync _during_ the "mv".

--=20
laurent
