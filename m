From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
Date: Thu, 1 Jun 2023 22:19:40 +0200
Message-ID: <8a48ede1-3a45-7c3c-39e9-36001ac09283@huaweicloud.com>
References: <00000000000000964605faf87416@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <00000000000000964605faf87416@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>, hdanton@sina.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, paul@paul-moore.com, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com, Jan Kara <jack@suse.cz>, Jeff Mahoney <jeffm@suse.com>

On 5/5/2023 10:51 PM, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
> Author: Roberto Sassu <roberto.sassu@huawei.com>
> Date:   Fri Mar 31 12:32:18 2023 +0000
> 
>      reiserfs: Add security prefix to xattr name in reiserfs_security_write()
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14403182280000
> start commit:   3c4aa4434377 Merge tag 'ceph-for-6.4-rc1' of https://githu..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=16403182280000
> console output: https://syzkaller.appspot.com/x/log.txt?x=12403182280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=73a06f6ef2d5b492
> dashboard link: https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12442414280000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=176a7318280000
> 
> Reported-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com
> Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in reiserfs_security_write()")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -689,7 +689,9 @@ static int reiserfs_create(struct mnt_idmap *idmap, struct inode *dir,
         reiserfs_update_inode_transaction(inode);
         reiserfs_update_inode_transaction(dir);

+       reiserfs_write_unlock(dir->i_sb);
         d_instantiate_new(dentry, inode);
+       reiserfs_write_lock(dir->i_sb);
         retval = journal_end(&th);

  out_failed:
@@ -773,7 +775,9 @@ static int reiserfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
                 goto out_failed;
         }

+       reiserfs_write_unlock(dir->i_sb);
         d_instantiate_new(dentry, inode);
+       reiserfs_write_lock(dir->i_sb);
         retval = journal_end(&th);

  out_failed:
@@ -874,7 +878,9 @@ static int reiserfs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
         /* the above add_entry did not update dir's stat data */
         reiserfs_update_sd(&th, dir);

+       reiserfs_write_unlock(dir->i_sb);
         d_instantiate_new(dentry, inode);
+       reiserfs_write_lock(dir->i_sb);
         retval = journal_end(&th);
  out_failed:
         reiserfs_write_unlock(dir->i_sb);
@@ -1191,7 +1197,9 @@ static int reiserfs_symlink(struct mnt_idmap *idmap,
                 goto out_failed;
         }

+       reiserfs_write_unlock(parent_dir->i_sb);
         d_instantiate_new(dentry, inode);
+       reiserfs_write_lock(parent_dir->i_sb);
         retval = journal_end(&th);
  out_failed:
         reiserfs_write_unlock(parent_dir->i_sb);

