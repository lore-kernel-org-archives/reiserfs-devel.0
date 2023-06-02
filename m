From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Fri, 02 Jun 2023 18:46:27 +0200
Message-ID: <d1148a9e210dda23592d63ad64e7c1f9af23adea.camel@huaweicloud.com>
References: <0000000000007bedb605f119ed9f@google.com>
         <00000000000000964605faf87416@google.com>
         <CAHC9VhTZ=Esk+JxgAjch2J44WuLixe-SZMXW2iGHpLdrdMKQ=g@mail.gmail.com>
         <1020d006-c698-aacc-bcc3-92e5b237ef91@huaweicloud.com>
         <29fcea18-d720-d5df-0e00-eb448e6bbfcf@suse.com>
         <07c825a21fb4c57f4290158e529d32f4e0e0fbf0.camel@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <07c825a21fb4c57f4290158e529d32f4e0e0fbf0.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Jeff Mahoney <jeffm@suse.com>, Paul Moore <paul@paul-moore.com>, syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
Cc: hdanton@sina.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com, peterz@infradead.org, mingo@redhat.com, will@kernel.org, Jan Kara <jack@suse.cz>

On Fri, 2023-06-02 at 09:20 +0200, Roberto Sassu wrote:
> On Thu, 2023-06-01 at 17:22 -0400, Jeff Mahoney wrote:
> > On 5/31/23 05:49, Roberto Sassu wrote:
> > > On 5/5/2023 11:36 PM, Paul Moore wrote:
> > > > On Fri, May 5, 2023 at 4:51=E2=80=AFPM syzbot
> > > > <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com> wrote:
> > > > > syzbot has bisected this issue to:
> > > > >=20
> > > > > commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
> > > > > Author: Roberto Sassu <roberto.sassu@huawei.com>
> > > > > Date:   Fri Mar 31 12:32:18 2023 +0000
> > > > >=20
> > > > >      reiserfs: Add security prefix to xattr name in=20
> > > > > reiserfs_security_write()
> > > > >=20
> > > > > bisection log: =20
> > > > > https://syzkaller.appspot.com/x/bisect.txt?x=3D14403182280000
> > > > > start commit:   3c4aa4434377 Merge tag 'ceph-for-6.4-rc1' of=20
> > > > > https://githu..
> > > > > git tree:       upstream
> > > > > final oops:    =20
> > > > > https://syzkaller.appspot.com/x/report.txt?x=3D16403182280000
> > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D12403=
182280000
> > > > > kernel config: =20
> > > > > https://syzkaller.appspot.com/x/.config?x=3D73a06f6ef2d5b492
> > > > > dashboard link:=20
> > > > > https://syzkaller.appspot.com/bug?extid=3D8fb64a61fdd96b50f3b8
> > > > > syz repro:     =20
> > > > > https://syzkaller.appspot.com/x/repro.syz?x=3D12442414280000
> > > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D176a7=
318280000
> > > > >=20
> > > > > Reported-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com
> > > > > Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name=
 in=20
> > > > > reiserfs_security_write()")
> > > > >=20
> > > > > For information about bisection process see:=20
> > > > > https://goo.gl/tpsmEJ#bisection
> > > >=20
> > > > I don't think Roberto's patch identified above is the actual root
> > > > cause of this problem as reiserfs_xattr_set_handle() is called in
> > > > reiserfs_security_write() both before and after the patch.  However,
> > > > due to some bad logic in reiserfs_security_write() which Roberto
> > > > corrected, I'm thinking that it is possible this code is being
> > > > exercised for the first time and syzbot is starting to trigger a
> > > > locking issue in the reiserfs code ... ?
> > >=20
> > > + Jan, Jeff (which basically restructured the lock)
> > >=20
> > > + Petr, Ingo, Will
>=20
> Peter, clearly (sorry!)
>=20
> > I involve the lockdep experts, to get a bit of help on this.
> >=20
> > Yep, looks like that's been broken since it was added in 2009.  Since=20
> > there can't be any users of it, it'd make sense to drop the security=20
> > xattr support from reiserfs entirely.
>=20
> Thanks, Jeff. Will make a patch to implement your suggestion.

Ok, I tried first to disable security xattr initialization and keep the
xattr handler.

Setting the security xattr manually triggers a lockdep warning. Even
worse, setting a trusted xattr manually triggers that too. So, not sure
how we should proceed.

Have you looked at:

https://lore.kernel.org/linux-kernel/8a48ede1-3a45-7c3c-39e9-36001ac09283@h=
uaweicloud.com/

That silences the lockdep warning, but I'm far from saying that it
won't have any side effect...

Thanks

Roberto

> Meanwhile, I learned how to read lockdep a bit better. The following
> format could have helped me to understand it more quickly. The proposal
> is simply to change #n to CPU#n at the top of the trace, define labels
> L#n for the locks, and add them where effectively are held.
>=20
> [   77.746561][ T5418] -> CPU1 (&sbi->lock){+.+.}-{3:3}:
> [   77.753772][ T5418]        lock_acquire+0x23e/0x630
> [   77.758792][ T5418]        __mutex_lock_common+0x1d8/0x2530
> [   77.764504][ T5418]   (L3) mutex_lock_nested+0x1b/0x20
> [   77.769868][ T5418]        reiserfs_write_lock+0x70/0xc0
> [   77.775321][ T5418]        reiserfs_mkdir+0x321/0x870
> [   77.780509][ T5418]   (L2) open_xa_dir+0x259/0x540
> [   77.785440][ T5418]        xattr_lookup+0x17/0x210
> [   77.790378][ T5418]        reiserfs_xattr_set_handle+0xda/0xc80
> [   77.796448][ T5418]        reiserfs_security_write+0x134/0x190
> [   77.802416][ T5418]        reiserfs_new_inode+0x13bf/0x1a90
> [   77.808124][ T5418]        reiserfs_create+0x3b1/0x680
> [   77.813399][ T5418]        path_openat+0xf1e/0x2c10
> [   77.818415][ T5418]        do_filp_open+0x22a/0x440
> [   77.823433][ T5418]        do_sys_openat2+0x10f/0x430
> [   77.828624][ T5418]        __x64_sys_creat+0x11e/0x160
> [   77.833905][ T5418]        do_syscall_64+0x41/0xc0
> [   77.838926][ T5418]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [   77.845514][ T5418]=20
> [   77.845514][ T5418] -> CPU0 (&type->i_mutex_dir_key#8/3){+.+.}-{3:3}:
> [   77.854118][ T5418]        validate_chain+0x166b/0x58e0
> [   77.859488][ T5418]        __lock_acquire+0x125b/0x1f80
> [   77.864853][ T5418]        lock_acquire+0x23e/0x630
> [   77.869909][ T5418]   (L4) down_write_nested+0x3d/0x50
> [   77.875186][ T5418]        open_xa_dir+0x134/0x540
> [   77.880117][ T5418]        xattr_lookup+0x17/0x210
> [   77.885050][ T5418]        reiserfs_xattr_get+0xe1/0x4a0
> [   77.890501][ T5418]        __vfs_getxattr+0x2fe/0x350
> [   77.895802][ T5418]        smk_fetch+0x98/0xf0
> [   77.900382][ T5418]        smack_d_instantiate+0x5d5/0xa20
> [   77.906018][ T5418]        security_d_instantiate+0x6b/0xb0
> [   77.911736][ T5418]        d_instantiate_new+0x5e/0xe0
> [   77.917013][ T5418]   (L1) reiserfs_create+0x5ee/0x680
> [   77.922293][ T5418]        path_openat+0xf1e/0x2c10
> [   77.927308][ T5418]        do_filp_open+0x22a/0x440
> [   77.932330][ T5418]        do_sys_openat2+0x10f/0x430
> [   77.937515][ T5418]        __x64_sys_creat+0x11e/0x160
> [   77.942874][ T5418]        do_syscall_64+0x41/0xc0
> [   77.947796][ T5418]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [   77.954200][ T5418]=20
> [   77.954200][ T5418] other info that might help us debug this:
> [   77.954200][ T5418]=20
> [   77.964508][ T5418]  Possible unsafe locking scenario:
> [   77.964508][ T5418]=20
> [   77.972034][ T5418]   CPU0                         CPU1
> [   77.977394][ T5418]   ----                         ----
> [   77.982748][ T5418]   L1: lock(&sbi->lock);
> [   77.986726][ T5418]                                L2: lock(&type->i_m=
utex_dir_key#8/3);
> [   77.994618][ T5418]                                L3: lock(&sbi->lock=
);
> [   78.001118][ T5418]   L4: lock(&type->i_mutex_dir_key#8/3);
>=20
> Thanks
>=20
> Roberto
>=20
> > > First of all, the lockdep warning is trivial to reproduce:
> > >=20
> > > # dd if=3D/dev/zero of=3Dreiserfs.img bs=3D1M count=3D100
> > > # losetup -f --show reiserfs.img
> > > /dev/loop0
> > > # mkfs.reiserfs /dev/loop0
> > > # mount /dev/loop0 /mnt/
> > > # touch file0
> > >=20
> > > In the testing system, Smack is the major LSM.
> > >=20
> > > Ok, so the warning here is clear:
> > >=20
> > > https://syzkaller.appspot.com/x/log.txt?x=3D12403182280000
> > >=20
> > > However, I was looking if that can really happen. From this:
> > >=20
> > > [   77.746561][ T5418] -> #1 (&sbi->lock){+.+.}-{3:3}:
> > > [   77.753772][ T5418]        lock_acquire+0x23e/0x630
> > > [   77.758792][ T5418]        __mutex_lock_common+0x1d8/0x2530
> > > [   77.764504][ T5418]        mutex_lock_nested+0x1b/0x20
> > > [   77.769868][ T5418]        reiserfs_write_lock+0x70/0xc0
> > > [   77.775321][ T5418]        reiserfs_mkdir+0x321/0x870
> > >=20
> > > I see that the lock is taken in reiserfs_write_lock(), while lockdep =
says:
> > >=20
> > > [   77.710227][ T5418] but task is already holding lock:
> > > [   77.717587][ T5418] ffff88807568d090 (&sbi->lock){+.+.}-{3:3}, at:=
=20
> > > reiserfs_write_lock_nested+0x4a/0xb0
> > >=20
> > > which is in a different place, I believe here:
> > >=20
> > > int reiserfs_paste_into_item(struct reiserfs_transaction_handle *th,
> > >                               /* Path to the pasted item. */
> > > [...]
> > >=20
> > >          depth =3D reiserfs_write_unlock_nested(sb);
> > >          dquot_free_space_nodirty(inode, pasted_size);
> > >          reiserfs_write_lock_nested(sb, depth);
> > >          return retval;
> > > }
> > >=20
> > > This is called by reiserfs_add_entry(), which is called by=20
> > > reiserfs_create() (it is in the lockdep trace). After returning to=20
> > > reiserfs_create(), d_instantiate_new() is called.
> > >=20
> > > I don't know exactly, I take the part that the lock is held. But if i=
t=20
> > > is held, how d_instantiate_new() can be executed in another task?
> > >=20
> > > static int reiserfs_create(struct mnt_idmap *idmap, struct inode *dir,
> > >                          struct dentry *dentry, umode_t mode, bool ex=
cl)
> > > {
> > >=20
> > > [...]
> > >=20
> > >          reiserfs_write_lock(dir->i_sb);
> > >=20
> > >          retval =3D journal_begin(&th, dir->i_sb, jbegin_count);
> > >=20
> > > [...]
> > >=20
> > >          d_instantiate_new(dentry, inode);
> > >          retval =3D journal_end(&th);
> > >=20
> > > out_failed:
> > >          reiserfs_write_unlock(dir->i_sb);
> > >=20
> > > If the lock is held, the scenario lockdep describes cannot happen. An=
y=20
> > > thoughts?
> >=20
> > It's important to understand that the reiserfs write lock was added as =
a=20
> > subsystem-specific replacement for the BKL.  Given that reiserfs was=20
> > dying already back then, it made more sense from a time management=20
> > perspective to emulate that behavior internally rather than use new=20
> > locking when practically nobody cared anymore.
> >=20
> > See reiserfs_write_unlock_nested and reiserfs_write_lock_nested paired =

> > throughout the code.  It drops the lock when it passes a point where=20
> > it's likely to schedule, just like the BKL would have.
> >=20
> > Yes, it's a mess.  Just let it die quietly.
> >=20
> > -Jeff
> >=20

