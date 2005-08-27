From: Ronald Moesbergen <ronald.moesbergen@gmail.com>
Subject: Re: Reiser4 oops with 2.6.13-rc6-mm2
Date: Sat, 27 Aug 2005 21:56:36 +0200
Message-ID: <656cfae8050827125641d35176@mail.gmail.com>
References: <656cfae8050827090370d11864@mail.gmail.com>
	 <4310A781.9050607@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25668-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4310A781.9050607@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "evilninja@gmx.net" <evilninja@gmx.net>
Cc: reiserfs-list@namesys.com

Well, I just successfully reproduced this without the nvidia module
loaded. The oops looks very similar:

 kernel: Unable to handle kernel NULL pointer dereference at virtual
address 00000000
 kernel:  printing eip:
 kernel: b01a1317
 kernel: *pde =3D 00000000
 kernel: Oops: 0002 [#1]
 kernel: PREEMPT SMP
 kernel: last sysfs file: /class/vc/vcsa8/dev
 kernel: Modules linked in: vmnet vmmon
 kernel: CPU:    1
 kernel: EIP:    0060:[lock_object+84/127]    Tainted: P      VLI
 kernel: EIP:    0060:[<b01a1317>]    Tainted: P      VLI
 kernel: EFLAGS: 00013202   (2.6.13-rc6-mm2)
 kernel: EIP is at lock_object+0x54/0x7f
 kernel: eax: de86be94   ebx: 00000000   ecx: ec287e80   edx: ec287e94
 kernel: esi: eae23d80   edi: ec287ec8   ebp: ec287ec8   esp: ec287b48
 kernel: ds: 007b   es: 007b   ss: 0068
 kernel: Process vmware-vmx (pid: 5580, threadinfo=3Dec286000 task=3Deecc9a=
30)
 kernel: Stack: eae23d80 00000000 ec287ec8 b01a16e7 ec287ec8 eae23db4
00000000 eae23df0
 kernel:        b01a17ba ec287ec8 00000000 00000000 00000001 00000000
00000000 ec287ec8
 kernel:        eae23d80 eae23df0 b01a18ad ec287ec8 00000000 ffffffff
ffffffff ec287c88
 kernel: Call Trace:
 kernel:  [lock_tail+80/113] lock_tail+0x50/0x71
 kernel:  [<b01a16e7>] lock_tail+0x50/0x71
 kernel:  [longterm_lock_tryfast+178/229] longterm_lock_tryfast+0xb2/0xe5
 kernel:  [<b01a17ba>] longterm_lock_tryfast+0xb2/0xe5
 kernel:  [longterm_lock_znode+192/695] longterm_lock_znode+0xc0/0x2b7
 kernel:  [<b01a18ad>] longterm_lock_znode+0xc0/0x2b7
 kernel:  [cbk_cache_scan_slots+320/754] cbk_cache_scan_slots+0x140/0x2f2
 kernel:  [<b01b228d>] cbk_cache_scan_slots+0x140/0x2f2
 kernel:  [schedule+1320/3501] schedule+0x528/0xdad
 kernel:  [<b039568c>] schedule+0x528/0xdad
 kernel:  [cbk_cache_search+39/92] cbk_cache_search+0x27/0x5c
 kernel:  [<b01b2466>] cbk_cache_search+0x27/0x5c
 kernel:  [coord_by_handle+16/41] coord_by_handle+0x10/0x29
 kernel:  [<b01b110f>] coord_by_handle+0x10/0x29
 kernel:  [object_lookup+188/230] object_lookup+0xbc/0xe6
 kernel:  [<b01b10d5>] object_lookup+0xbc/0xe6
 kernel:  [find_file_item+322/482] find_file_item+0x142/0x1e2
 kernel:  [<b01e4d71>] find_file_item+0x142/0x1e2
 kernel:  [read_file+185/530] read_file+0xb9/0x212
 kernel:  [<b01e6d83>] read_file+0xb9/0x212
 kernel:  [txn_begin+29/33] txn_begin+0x1d/0x21
 kernel:  [<b01a74b1>] txn_begin+0x1d/0x21
 kernel:  [read_unix_file+532/831] read_unix_file+0x214/0x33f
 kernel:  [<b01e70fe>] read_unix_file+0x214/0x33f
 kernel:  [init_context+117/189] init_context+0x75/0xbd
 kernel:  [<b01a47dd>] init_context+0x75/0xbd
 kernel:  [reiser4_read+143/255] reiser4_read+0x8f/0xff
 kernel:  [<b01baade>] reiser4_read+0x8f/0xff
 kernel:  [vfs_read+328/333] vfs_read+0x148/0x14d
 kernel:  [<b015e7e6>] vfs_read+0x148/0x14d
 kernel:  [sys_pread64+112/125] sys_pread64+0x70/0x7d
 kernel:  [<b015ebd4>] sys_pread64+0x70/0x7d
 kernel:  [sysenter_past_esp+84/117] sysenter_past_esp+0x54/0x75
 kernel:  [<b0102d9b>] sysenter_past_esp+0x54/0x75
 kernel: Code: 04 89 71 08 8d 51 0c 8b 58 04 89 41 0c 89 50 04 89 13
89 5a 04 8d 51 14 83 47 18 01 8b 86 84 00 00 00 8b 58 04 89 41 14 89
50 04 <89> 13 89 5a 04 c7 01 00 00 00 00 8b 57 0c 85 d2 74 04 83 46 7c
 kernel:  <3>BUG: vmware-vmx[5580] exited with nonzero preempt_count 1!

One more thing that might be of interest: the reiser4 partition is on
an md-raid0 volume. Hope this helps.

Ronald.


On 8/27/05, evilninja@gmx.net <evilninja@gmx.net> wrote:
> Ronald Moesbergen schrieb:
> > Hi,
> >
> > While running a vmware virtual machine from a reiser4 filesystem, my
> > machine consistently locks up and produces the following OOPS:
> >
> > kernel: Oops: 0002 [#1]
> > kernel: PREEMPT SMP
> > kernel: last sysfs file: /class/vc/vcsa8/dev
> > kernel: Modules linked in: vmnet vmmon nvidia
>=20
> is this reproducible and is it reproducible when you don't run this
> inside vmware? the tainted kernel could make it hard to find a solution
> here...
>=20
> Christian.
>
