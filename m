From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Wed, 31 May 2023 11:49:30 +0200
Message-ID: <1020d006-c698-aacc-bcc3-92e5b237ef91@huaweicloud.com>
References: <0000000000007bedb605f119ed9f@google.com>
 <00000000000000964605faf87416@google.com>
 <CAHC9VhTZ=Esk+JxgAjch2J44WuLixe-SZMXW2iGHpLdrdMKQ=g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CAHC9VhTZ=Esk+JxgAjch2J44WuLixe-SZMXW2iGHpLdrdMKQ=g@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Paul Moore <paul@paul-moore.com>, syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
Cc: hdanton@sina.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com, peterz@infradead.org, mingo@redhat.com, will@kernel.org

On 5/5/2023 11:36 PM, Paul Moore wrote:
> On Fri, May 5, 2023 at 4:51=E2=80=AFPM syzbot
> <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com> wrote:
>>
>> syzbot has bisected this issue to:
>>
>> commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
>> Author: Roberto Sassu <roberto.sassu@huawei.com>
>> Date:   Fri Mar 31 12:32:18 2023 +0000
>>
>>      reiserfs: Add security prefix to xattr name in reiserfs_security_wr=
ite()
>>
>> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D144031822=
80000
>> start commit:   3c4aa4434377 Merge tag 'ceph-for-6.4-rc1' of https://git=
hu..
>> git tree:       upstream
>> final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D164031822=
80000
>> console output: https://syzkaller.appspot.com/x/log.txt?x=3D124031822800=
00
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D73a06f6ef2d5=
b492
>> dashboard link: https://syzkaller.appspot.com/bug?extid=3D8fb64a61fdd96b=
50f3b8
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1244241428=
0000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D176a73182800=
00
>>
>> Reported-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com
>> Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in rei=
serfs_security_write()")
>>
>> For information about bisection process see: https://goo.gl/tpsmEJ#bisec=
tion
>=20
> I don't think Roberto's patch identified above is the actual root
> cause of this problem as reiserfs_xattr_set_handle() is called in
> reiserfs_security_write() both before and after the patch.  However,
> due to some bad logic in reiserfs_security_write() which Roberto
> corrected, I'm thinking that it is possible this code is being
> exercised for the first time and syzbot is starting to trigger a
> locking issue in the reiserfs code ... ?

+ Jan, Jeff (which basically restructured the lock)

+ Petr, Ingo, Will

I involve the lockdep experts, to get a bit of help on this.

First of all, the lockdep warning is trivial to reproduce:

# dd if=3D/dev/zero of=3Dreiserfs.img bs=3D1M count=3D100
# losetup -f --show reiserfs.img
/dev/loop0
# mkfs.reiserfs /dev/loop0
# mount /dev/loop0 /mnt/
# touch file0

In the testing system, Smack is the major LSM.

Ok, so the warning here is clear:

https://syzkaller.appspot.com/x/log.txt?x=3D12403182280000

However, I was looking if that can really happen. From this:

[   77.746561][ T5418] -> #1 (&sbi->lock){+.+.}-{3:3}:
[   77.753772][ T5418]        lock_acquire+0x23e/0x630
[   77.758792][ T5418]        __mutex_lock_common+0x1d8/0x2530
[   77.764504][ T5418]        mutex_lock_nested+0x1b/0x20
[   77.769868][ T5418]        reiserfs_write_lock+0x70/0xc0
[   77.775321][ T5418]        reiserfs_mkdir+0x321/0x870

I see that the lock is taken in reiserfs_write_lock(), while lockdep says:

[   77.710227][ T5418] but task is already holding lock:
[   77.717587][ T5418] ffff88807568d090 (&sbi->lock){+.+.}-{3:3}, at:=20
reiserfs_write_lock_nested+0x4a/0xb0

which is in a different place, I believe here:

int reiserfs_paste_into_item(struct reiserfs_transaction_handle *th,
                              /* Path to the pasted item. */
[...]

         depth =3D reiserfs_write_unlock_nested(sb);
         dquot_free_space_nodirty(inode, pasted_size);
         reiserfs_write_lock_nested(sb, depth);
         return retval;
}

This is called by reiserfs_add_entry(), which is called by=20
reiserfs_create() (it is in the lockdep trace). After returning to=20
reiserfs_create(), d_instantiate_new() is called.

I don't know exactly, I take the part that the lock is held. But if it=20
is held, how d_instantiate_new() can be executed in another task?

static int reiserfs_create(struct mnt_idmap *idmap, struct inode *dir,
                         struct dentry *dentry, umode_t mode, bool excl)
{

[...]

         reiserfs_write_lock(dir->i_sb);

         retval =3D journal_begin(&th, dir->i_sb, jbegin_count);

[...]

         d_instantiate_new(dentry, inode);
         retval =3D journal_end(&th);

out_failed:
         reiserfs_write_unlock(dir->i_sb);

If the lock is held, the scenario lockdep describes cannot happen. Any=20
thoughts?

Thanks

Roberto

