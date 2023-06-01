From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Thu, 1 Jun 2023 17:22:54 -0400
Message-ID: <29fcea18-d720-d5df-0e00-eb448e6bbfcf@suse.com>
References: <0000000000007bedb605f119ed9f@google.com>
 <00000000000000964605faf87416@google.com>
 <CAHC9VhTZ=Esk+JxgAjch2J44WuLixe-SZMXW2iGHpLdrdMKQ=g@mail.gmail.com>
 <1020d006-c698-aacc-bcc3-92e5b237ef91@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHm/wLjaXbRtHbLiJPV0mrtBAtky9Eog48Ym5ZYeMUM=;
 b=kGvbgibgq2Rj2CBQxjgvrRlhhJIYNG4ajyJaOqOtKSrk8iNnXlTTe/0F7exfd90jeA/ma/+RE+njJnvQVNuuUfsTZ0E6NLSUYL3BPwUNpKw9LSAJZarDhrplikEQz4aJIJjtZ6lfvKsSUEQNa4NNL2Ioni3K9L6beBo4BE4MFhgUeq4/Q6CGyO2lCRYI94X5GQROMoFlBxe9yn+80eZGYaVZ40b36kXrCKR/XB0qBQyGGS60+XoSYhAQ5gfv30dgM9D0IPX8Ub2sEeVAmX9FzsPtDbp20rgfDgbhDtTjzx17uVXpevThkKVRCg9YI9dHWWUhF7Of2eWc2hD7naHp+Q==
Content-Language: en-US
In-Reply-To: <1020d006-c698-aacc-bcc3-92e5b237ef91@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, Paul Moore <paul@paul-moore.com>, syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
Cc: hdanton@sina.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com, peterz@infradead.org, mingo@redhat.com, will@kernel.org

On 5/31/23 05:49, Roberto Sassu wrote:
> On 5/5/2023 11:36 PM, Paul Moore wrote:
>> On Fri, May 5, 2023 at 4:51 PM syzbot
>> <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com> wrote:
>>>
>>> syzbot has bisected this issue to:
>>>
>>> commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
>>> Author: Roberto Sassu <roberto.sassu@huawei.com>
>>> Date:   Fri Mar 31 12:32:18 2023 +0000
>>>
>>>      reiserfs: Add security prefix to xattr name in 
>>> reiserfs_security_write()
>>>
>>> bisection log:  
>>> https://syzkaller.appspot.com/x/bisect.txt?x=14403182280000
>>> start commit:   3c4aa4434377 Merge tag 'ceph-for-6.4-rc1' of 
>>> https://githu..
>>> git tree:       upstream
>>> final oops:     
>>> https://syzkaller.appspot.com/x/report.txt?x=16403182280000
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=12403182280000
>>> kernel config:  
>>> https://syzkaller.appspot.com/x/.config?x=73a06f6ef2d5b492
>>> dashboard link: 
>>> https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
>>> syz repro:      
>>> https://syzkaller.appspot.com/x/repro.syz?x=12442414280000
>>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=176a7318280000
>>>
>>> Reported-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com
>>> Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in 
>>> reiserfs_security_write()")
>>>
>>> For information about bisection process see: 
>>> https://goo.gl/tpsmEJ#bisection
>>
>> I don't think Roberto's patch identified above is the actual root
>> cause of this problem as reiserfs_xattr_set_handle() is called in
>> reiserfs_security_write() both before and after the patch.  However,
>> due to some bad logic in reiserfs_security_write() which Roberto
>> corrected, I'm thinking that it is possible this code is being
>> exercised for the first time and syzbot is starting to trigger a
>> locking issue in the reiserfs code ... ?
> 
> + Jan, Jeff (which basically restructured the lock)
> 
> + Petr, Ingo, Will
> 
> I involve the lockdep experts, to get a bit of help on this.

Yep, looks like that's been broken since it was added in 2009.  Since 
there can't be any users of it, it'd make sense to drop the security 
xattr support from reiserfs entirely.

> First of all, the lockdep warning is trivial to reproduce:
> 
> # dd if=/dev/zero of=reiserfs.img bs=1M count=100
> # losetup -f --show reiserfs.img
> /dev/loop0
> # mkfs.reiserfs /dev/loop0
> # mount /dev/loop0 /mnt/
> # touch file0
> 
> In the testing system, Smack is the major LSM.
> 
> Ok, so the warning here is clear:
> 
> https://syzkaller.appspot.com/x/log.txt?x=12403182280000
> 
> However, I was looking if that can really happen. From this:
> 
> [   77.746561][ T5418] -> #1 (&sbi->lock){+.+.}-{3:3}:
> [   77.753772][ T5418]        lock_acquire+0x23e/0x630
> [   77.758792][ T5418]        __mutex_lock_common+0x1d8/0x2530
> [   77.764504][ T5418]        mutex_lock_nested+0x1b/0x20
> [   77.769868][ T5418]        reiserfs_write_lock+0x70/0xc0
> [   77.775321][ T5418]        reiserfs_mkdir+0x321/0x870
> 
> I see that the lock is taken in reiserfs_write_lock(), while lockdep says:
> 
> [   77.710227][ T5418] but task is already holding lock:
> [   77.717587][ T5418] ffff88807568d090 (&sbi->lock){+.+.}-{3:3}, at: 
> reiserfs_write_lock_nested+0x4a/0xb0
> 
> which is in a different place, I believe here:
> 
> int reiserfs_paste_into_item(struct reiserfs_transaction_handle *th,
>                               /* Path to the pasted item. */
> [...]
> 
>          depth = reiserfs_write_unlock_nested(sb);
>          dquot_free_space_nodirty(inode, pasted_size);
>          reiserfs_write_lock_nested(sb, depth);
>          return retval;
> }
> 
> This is called by reiserfs_add_entry(), which is called by 
> reiserfs_create() (it is in the lockdep trace). After returning to 
> reiserfs_create(), d_instantiate_new() is called.
> 
> I don't know exactly, I take the part that the lock is held. But if it 
> is held, how d_instantiate_new() can be executed in another task?
> 
> static int reiserfs_create(struct mnt_idmap *idmap, struct inode *dir,
>                          struct dentry *dentry, umode_t mode, bool excl)
> {
> 
> [...]
> 
>          reiserfs_write_lock(dir->i_sb);
> 
>          retval = journal_begin(&th, dir->i_sb, jbegin_count);
> 
> [...]
> 
>          d_instantiate_new(dentry, inode);
>          retval = journal_end(&th);
> 
> out_failed:
>          reiserfs_write_unlock(dir->i_sb);
> 
> If the lock is held, the scenario lockdep describes cannot happen. Any 
> thoughts?

It's important to understand that the reiserfs write lock was added as a 
subsystem-specific replacement for the BKL.  Given that reiserfs was 
dying already back then, it made more sense from a time management 
perspective to emulate that behavior internally rather than use new 
locking when practically nobody cared anymore.

See reiserfs_write_unlock_nested and reiserfs_write_lock_nested paired 
throughout the code.  It drops the lock when it passes a point where 
it's likely to schedule, just like the BKL would have.

Yes, it's a mess.  Just let it die quietly.

-Jeff

-- 
Jeff Mahoney
VP Engineering, Linux Systems

