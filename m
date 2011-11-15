From: Knut Petersen <Knut_Petersen@t-online.de>
Subject: kernel 3.1.1 / 3.1.0 reiserfs locking problems
Date: Tue, 15 Nov 2011 14:59:21 +0100
Message-ID: <4EC27039.6010904@t-online.de>
References: <4EAE5DE3.2020205@t-online.de> <CA+55aFzuWD1xRhQNLfe0ey_-1vACwY=ofD5PXSzL_5UeDRbk8g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFzuWD1xRhQNLfe0ey_-1vACwY=ofD5PXSzL_5UeDRbk8g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, Greg KH <gregkh@suse.de>, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Frederic Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Jeff Mahoney <jeffm@suse.com>

Am 31.10.2011 16:08, schrieb Linus Torvalds:

With kernel 3.1.1 there is another reiserfs related lock probleme:

Nov 15 11:37:27 golem kernel: [ 1986.896976]
Nov 15 11:37:27 golem kernel: [ 1986.896979] =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Nov 15 11:37:27 golem kernel: [ 1986.896990] [ INFO: inconsistent lock =
state ]
Nov 15 11:37:27 golem kernel: [ 1986.896997] 3.1.1-main #8
Nov 15 11:37:27 golem kernel: [ 1986.897001] --------------------------=
-------
Nov 15 11:37:27 golem kernel: [ 1986.897007] inconsistent {RECLAIM_FS-O=
N-W} -> {IN-RECLAIM_FS-W} usage.
Nov 15 11:37:27 golem kernel: [ 1986.897016] kswapd0/16 [HC0[0]:SC0[0]:=
HE1:SE1] takes:
Nov 15 11:37:27 golem kernel: [ 1986.897023]  (&REISERFS_SB(s)->lock){+=
=2E+.?.}, at: [<c01f8bd4>] reiserfs_write_lock+0x20/0x2a
Nov 15 11:37:27 golem kernel: [ 1986.897044] {RECLAIM_FS-ON-W} state wa=
s registered at:
Nov 15 11:37:27 golem kernel: [ 1986.897050]   [<c014a5b9>] mark_held_l=
ocks+0xae/0xd0
Nov 15 11:37:27 golem kernel: [ 1986.897060]   [<c014aab3>] lockdep_tra=
ce_alloc+0x7d/0x91
Nov 15 11:37:27 golem kernel: [ 1986.897068]   [<c0190ee0>] kmem_cache_=
alloc+0x1a/0x93
Nov 15 11:37:27 golem kernel: [ 1986.897078]   [<c01e7728>] reiserfs_al=
loc_inode+0x13/0x3d
Nov 15 11:37:27 golem kernel: [ 1986.897088]   [<c01a5b06>] alloc_inode=
+0x14/0x5f
Nov 15 11:37:27 golem kernel: [ 1986.897097]   [<c01a5cb9>] iget5_locke=
d+0x62/0x13a
Nov 15 11:37:27 golem kernel: [ 1986.897106]   [<c01e99e0>] reiserfs_fi=
ll_super+0x410/0x8b9
Nov 15 11:37:27 golem kernel: [ 1986.897114]   [<c01953da>] mount_bdev+=
0x10b/0x159
Nov 15 11:37:27 golem kernel: [ 1986.897123]   [<c01e764d>] get_super_b=
lock+0x10/0x12
Nov 15 11:37:27 golem kernel: [ 1986.897131]   [<c0195b38>] mount_fs+0x=
59/0x12d
Nov 15 11:37:27 golem kernel: [ 1986.897138]   [<c01a80d1>] vfs_kern_mo=
unt+0x45/0x7a
Nov 15 11:37:27 golem kernel: [ 1986.897147]   [<c01a83e3>] do_kern_mou=
nt+0x2f/0xb0
Nov 15 11:37:27 golem kernel: [ 1986.897155]   [<c01a987a>] do_mount+0x=
5c2/0x612
Nov 15 11:37:27 golem kernel: [ 1986.897163]   [<c01a9a72>] sys_mount+0=
x61/0x8f
Nov 15 11:37:27 golem kernel: [ 1986.897170]   [<c044060c>] sysenter_do=
_call+0x12/0x32
Nov 15 11:37:27 golem kernel: [ 1986.897181] irq event stamp: 7509691
Nov 15 11:37:27 golem kernel: [ 1986.897186] hardirqs last  enabled at =
(7509691): [<c0190f34>] kmem_cache_alloc+0x6e/0x93
Nov 15 11:37:27 golem kernel: [ 1986.897197] hardirqs last disabled at =
(7509690): [<c0190eea>] kmem_cache_alloc+0x24/0x93
Nov 15 11:37:27 golem kernel: [ 1986.897209] softirqs last  enabled at =
(7508896): [<c01294bd>] __do_softirq+0xee/0xfd
Nov 15 11:37:27 golem kernel: [ 1986.897222] softirqs last disabled at =
(7508859): [<c01030ed>] do_softirq+0x50/0x9d
Nov 15 11:37:27 golem kernel: [ 1986.897234]
Nov 15 11:37:27 golem kernel: [ 1986.897235] other info that might help=
 us debug this:
Nov 15 11:37:27 golem kernel: [ 1986.897242]  Possible unsafe locking s=
cenario:
Nov 15 11:37:27 golem kernel: [ 1986.897244]
Nov 15 11:37:27 golem kernel: [ 1986.897250]        CPU0
Nov 15 11:37:27 golem kernel: [ 1986.897254]        ----
Nov 15 11:37:27 golem kernel: [ 1986.897257]   lock(&REISERFS_SB(s)->lo=
ck);
Nov 15 11:37:27 golem kernel: [ 1986.897265] <Interrupt>
Nov 15 11:37:27 golem kernel: [ 1986.897269]     lock(&REISERFS_SB(s)->=
lock);
Nov 15 11:37:27 golem kernel: [ 1986.897276]
Nov 15 11:37:27 golem kernel: [ 1986.897277]  *** DEADLOCK ***
Nov 15 11:37:27 golem kernel: [ 1986.897278]
Nov 15 11:37:27 golem kernel: [ 1986.897286] no locks held by kswapd0/1=
6.
Nov 15 11:37:27 golem kernel: [ 1986.897291]
Nov 15 11:37:27 golem kernel: [ 1986.897292] stack backtrace:
Nov 15 11:37:27 golem kernel: [ 1986.897299] Pid: 16, comm: kswapd0 Not=
 tainted 3.1.1-main #8
Nov 15 11:37:27 golem kernel: [ 1986.897306] Call Trace:
Nov 15 11:37:27 golem kernel: [ 1986.897314]  [<c0439e76>] ? printk+0xf=
/0x11
Nov 15 11:37:27 golem kernel: [ 1986.897324]  [<c01482d1>] print_usage_=
bug+0x20e/0x21a
Nov 15 11:37:27 golem kernel: [ 1986.897332]  [<c01479b8>] ? print_irq_=
inversion_bug+0x172/0x172
Nov 15 11:37:27 golem kernel: [ 1986.897341]  [<c014855c>] mark_lock+0x=
27f/0x483
Nov 15 11:37:27 golem kernel: [ 1986.897349]  [<c0148d88>] __lock_acqui=
re+0x628/0x1472
Nov 15 11:37:27 golem kernel: [ 1986.897358]  [<c0149fae>] lock_acquire=
+0x47/0x5e
Nov 15 11:37:27 golem kernel: [ 1986.897366]  [<c01f8bd4>] ? reiserfs_w=
rite_lock+0x20/0x2a
Nov 15 11:37:27 golem kernel: [ 1986.897384]  [<c01f8bd4>] ? reiserfs_w=
rite_lock+0x20/0x2a
Nov 15 11:37:27 golem kernel: [ 1986.897397]  [<c043b5ef>] mutex_lock_n=
ested+0x35/0x26f
Nov 15 11:37:27 golem kernel: [ 1986.897409]  [<c01f8bd4>] ? reiserfs_w=
rite_lock+0x20/0x2a
Nov 15 11:37:27 golem kernel: [ 1986.897421]  [<c01f8bd4>] reiserfs_wri=
te_lock+0x20/0x2a
Nov 15 11:37:27 golem kernel: [ 1986.897433]  [<c01e2edd>] map_block_fo=
r_writepage+0xc9/0x590
Nov 15 11:37:27 golem kernel: [ 1986.897448]  [<c01b1706>] ? create_emp=
ty_buffers+0x33/0x8f
Nov 15 11:37:27 golem kernel: [ 1986.897461]  [<c0121124>] ? get_parent=
_ip+0xb/0x31
Nov 15 11:37:27 golem kernel: [ 1986.897472]  [<c043ef7f>] ? sub_preemp=
t_count+0x81/0x8e
Nov 15 11:37:27 golem kernel: [ 1986.897485]  [<c043cae0>] ? _raw_spin_=
unlock+0x27/0x3d
Nov 15 11:37:27 golem kernel: [ 1986.897496]  [<c0121124>] ? get_parent=
_ip+0xb/0x31
Nov 15 11:37:27 golem kernel: [ 1986.897508]  [<c01e355d>] reiserfs_wri=
tepage+0x1b9/0x3e7
Nov 15 11:37:27 golem kernel: [ 1986.897521]  [<c0173b40>] ? clear_page=
_dirty_for_io+0xcb/0xde
Nov 15 11:37:27 golem kernel: [ 1986.897533]  [<c014a6e3>] ? trace_hard=
irqs_on_caller+0x108/0x138
Nov 15 11:37:27 golem kernel: [ 1986.897546]  [<c014a71e>] ? trace_hard=
irqs_on+0xb/0xd
Nov 15 11:37:27 golem kernel: [ 1986.897559]  [<c0177b38>] shrink_page_=
list+0x34f/0x5e2
Nov 15 11:37:27 golem kernel: [ 1986.897572]  [<c01780a7>] shrink_inact=
ive_list+0x172/0x22c
Nov 15 11:37:27 golem kernel: [ 1986.897585]  [<c0178464>] shrink_zone+=
0x303/0x3b1
Nov 15 11:37:27 golem kernel: [ 1986.897597]  [<c043cae0>] ? _raw_spin_=
unlock+0x27/0x3d
Nov 15 11:37:27 golem kernel: [ 1986.897611]  [<c01788c9>] kswapd+0x3b7=
/0x5f2
Nov 15 11:37:27 golem kernel: [ 1986.897622]  [<c01788c9>] ? kswapd+0x3=
b7/0x5f2
Nov 15 11:37:27 golem kernel: [ 1986.897637]  [<c0138cde>] ? wake_up_bi=
t+0x1b/0x1b
Nov 15 11:37:27 golem kernel: [ 1986.897649]  [<c0178512>] ? shrink_zon=
e+0x3b1/0x3b1
Nov 15 11:37:27 golem kernel: [ 1986.897661]  [<c0138a87>] kthread+0x61=
/0x66
Nov 15 11:37:27 golem kernel: [ 1986.897673]  [<c0138a26>] ? __init_kth=
read_worker+0x42/0x42
Nov 15 11:37:27 golem kernel: [ 1986.897686]  [<c0440bba>] kernel_threa=
d_helper+0x6/0xd

I don=B4t know exactly what I was doing at that time  - probably I edit=
ed a _huge_ image gimp.


> [ Added a few more people to the cc ]
>
> On Mon, Oct 31, 2011 at 1:35 AM, Knut Petersen
> <Knut_Petersen@t-online.de>  wrote:
>> After a " rm -r /verybigdir" (about 12G on a 25G reiserfs 3.6partiti=
on)
>> I found the following report about a circular locking dependency in
>> kernel 3.1.0
> Heh. There is even a comment about the ordering violation:
>
> /* We use I_MUTEX_CHILD here to silence lockdep. It's safe because xa=
ttr
>   * mutation ops aren't called during rename or splace, which are the
>   * only other users of I_MUTEX_CHILD. It violates the ordering, but =
that's
>   * better than allocating another subclass just for this code. */
>
> and apparently the comment is wrong: we *do* end up looking up xattrs
> during splice, due to the security_inode_need_killpriv() thing.
>
> So I think this needs a suid (or sgid) file that has xattrs and is re=
moved.
>
> That said, I suspect this is a false positive, because the actual
> unlink can never happen while somebody is splicing to/from the same
> file at the same time (because then the iput wouldn't be the last one
> for the inode, and the file removal would be delayed until the file
> has been closed for the last time).
>
> But the hacky use of "I_MUTEX_CHILD" is basically not the proper way
> to silence the lockdep splat.
>
> Anybody?
>
>                    Linus
>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
