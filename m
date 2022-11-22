From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v4 1/5] reiserfs: Add missing calls to reiserfs_security_free()
Date: Tue, 22 Nov 2022 17:47:31 -0500
Message-ID: <CAHC9VhRBc_XeeCki3zqP40tpO-z2xja=yyMadr9_yLhGcgU3Vg@mail.gmail.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
 <20221110094639.3086409-2-roberto.sassu@huaweicloud.com> <CAHC9VhQ9WftDrF1R--ZYJXOv-YbVU-Pr1Ob_deDwEWm8OcQ-TA@mail.gmail.com>
 <aa51b845dca6021282b5b2ae260020a3a5cfb5c6.camel@huaweicloud.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OhM08xoktc6ZKNdEIG+FP/1L4abUAxOrd/YTmOzlE3I=;
        b=6HmnQaIAantqrLzDIs1GjTCygWym7grq9246f18l84sVPSkZfEkVFN+W2jIZ+PKiwV
         7NV62WeikSpliju9ikhNf0Y5nTCZcwZpG8MvcDxyOKPDWTzYp1I4MmYPc4TKasYJLHMW
         YHYfcAC63t/ADeojSlZVxmdz4TcX8+FQkvveHe7GRoSHHjcyzqpfcAq45xwfgMQekOGM
         6DNHDmEFfWIZi6oNNMsf4+ixjZLItHxN38ifIKwu6xGsLZ9plHyTZ6PLhqE2wLii7DhR
         z3dDzLgBzGz4Yh9tb7q7IAv9AbRsVruHZlo+vrMROW2GZz5qgB1cDCMzhpZd2lIEItoQ
         L9Kg==
In-Reply-To: <aa51b845dca6021282b5b2ae260020a3a5cfb5c6.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, stable@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>

On Tue, Nov 22, 2022 at 3:12 AM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
> On Mon, 2022-11-21 at 18:41 -0500, Paul Moore wrote:
> > On Thu, Nov 10, 2022 at 4:47 AM Roberto Sassu
> > <roberto.sassu@huaweicloud.com> wrote:
> > > From: Roberto Sassu <roberto.sassu@huawei.com>
> > >
> > > Commit 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes
> > > during inode creation") defined reiserfs_security_free() to free the name
> > > and value of a security xattr allocated by the active LSM through
> > > security_old_inode_init_security(). However, this function is not called
> > > in the reiserfs code.
> > >
> > > Thus, add a call to reiserfs_security_free() whenever
> > > reiserfs_security_init() is called, and initialize value to NULL, to avoid
> > > to call kfree() on an uninitialized pointer.
> > >
> > > Finally, remove the kfree() for the xattr name, as it is not allocated
> > > anymore.
> > >
> > > Fixes: 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes during inode creation")
> > > Cc: stable@vger.kernel.org
> > > Cc: Jeff Mahoney <jeffm@suse.com>
> > > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > > Reported-by: Mimi Zohar <zohar@linux.ibm.com>
> > > Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > > ---
> > >  fs/reiserfs/namei.c          | 4 ++++
> > >  fs/reiserfs/xattr_security.c | 2 +-
> > >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > If I'm understanding this patch correctly, this is a standalone
> > bugfix, right?  Any reason this shouldn't be merged now, independent
> > of the rest of patches in this patchset?
>
> Yes. It would be fine for me to pick this sooner.

Okay, as it's been almost two weeks with no comments from the reiserfs
folks and this looks okay to me I'm going to go ahead and pull this
into the lsm/next branch as it's at least "LSM adjacent" :)  As it is
lsm/next and not lsm/stable-6.1, this should give the reiserfs folks
another couple of weeks to object if they find this to be problematic.

Thanks all.

-- 
paul-moore.com
