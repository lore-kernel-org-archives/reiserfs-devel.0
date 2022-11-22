From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v4 1/5] reiserfs: Add missing calls to
 reiserfs_security_free()
Date: Tue, 22 Nov 2022 09:11:50 +0100
Message-ID: <aa51b845dca6021282b5b2ae260020a3a5cfb5c6.camel@huaweicloud.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
         <20221110094639.3086409-2-roberto.sassu@huaweicloud.com>
         <CAHC9VhQ9WftDrF1R--ZYJXOv-YbVU-Pr1Ob_deDwEWm8OcQ-TA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhQ9WftDrF1R--ZYJXOv-YbVU-Pr1Ob_deDwEWm8OcQ-TA@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Moore <paul@paul-moore.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, stable@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>

On Mon, 2022-11-21 at 18:41 -0500, Paul Moore wrote:
> On Thu, Nov 10, 2022 at 4:47 AM Roberto Sassu
> <roberto.sassu@huaweicloud.com> wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> > 
> > Commit 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes
> > during inode creation") defined reiserfs_security_free() to free the name
> > and value of a security xattr allocated by the active LSM through
> > security_old_inode_init_security(). However, this function is not called
> > in the reiserfs code.
> > 
> > Thus, add a call to reiserfs_security_free() whenever
> > reiserfs_security_init() is called, and initialize value to NULL, to avoid
> > to call kfree() on an uninitialized pointer.
> > 
> > Finally, remove the kfree() for the xattr name, as it is not allocated
> > anymore.
> > 
> > Fixes: 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes during inode creation")
> > Cc: stable@vger.kernel.org
> > Cc: Jeff Mahoney <jeffm@suse.com>
> > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Reported-by: Mimi Zohar <zohar@linux.ibm.com>
> > Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > ---
> >  fs/reiserfs/namei.c          | 4 ++++
> >  fs/reiserfs/xattr_security.c | 2 +-
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> If I'm understanding this patch correctly, this is a standalone
> bugfix, right?  Any reason this shouldn't be merged now, independent
> of the rest of patches in this patchset?

Yes. It would be fine for me to pick this sooner.

Thanks

Roberto

> > diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
> > index 3d7a35d6a18b..b916859992ec 100644
> > --- a/fs/reiserfs/namei.c
> > +++ b/fs/reiserfs/namei.c
> > @@ -696,6 +696,7 @@ static int reiserfs_create(struct user_namespace *mnt_userns, struct inode *dir,
> > 
> >  out_failed:
> >         reiserfs_write_unlock(dir->i_sb);
> > +       reiserfs_security_free(&security);
> >         return retval;
> >  }
> > 
> > @@ -779,6 +780,7 @@ static int reiserfs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
> > 
> >  out_failed:
> >         reiserfs_write_unlock(dir->i_sb);
> > +       reiserfs_security_free(&security);
> >         return retval;
> >  }
> > 
> > @@ -878,6 +880,7 @@ static int reiserfs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
> >         retval = journal_end(&th);
> >  out_failed:
> >         reiserfs_write_unlock(dir->i_sb);
> > +       reiserfs_security_free(&security);
> >         return retval;
> >  }
> > 
> > @@ -1194,6 +1197,7 @@ static int reiserfs_symlink(struct user_namespace *mnt_userns,
> >         retval = journal_end(&th);
> >  out_failed:
> >         reiserfs_write_unlock(parent_dir->i_sb);
> > +       reiserfs_security_free(&security);
> >         return retval;
> >  }
> > 
> > diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
> > index 8965c8e5e172..857a65b05726 100644
> > --- a/fs/reiserfs/xattr_security.c
> > +++ b/fs/reiserfs/xattr_security.c
> > @@ -50,6 +50,7 @@ int reiserfs_security_init(struct inode *dir, struct inode *inode,
> >         int error;
> > 
> >         sec->name = NULL;
> > +       sec->value = NULL;
> > 
> >         /* Don't add selinux attributes on xattrs - they'll never get used */
> >         if (IS_PRIVATE(dir))
> > @@ -95,7 +96,6 @@ int reiserfs_security_write(struct reiserfs_transaction_handle *th,
> > 
> >  void reiserfs_security_free(struct reiserfs_security_handle *sec)
> >  {
> > -       kfree(sec->name);
> >         kfree(sec->value);
> >         sec->name = NULL;
> >         sec->value = NULL;
> > --
> > 2.25.1
> > 
> 
> 

