From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v4 2/5] security: Rewrite security_old_inode_init_security()
Date: Mon, 21 Nov 2022 18:55:59 -0500
Message-ID: <CAHC9VhTvcgOjXAH51Vnk66kEjXfjUS2aJjXjJmU-rwLT53vWPw@mail.gmail.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
 <20221110094639.3086409-3-roberto.sassu@huaweicloud.com> <3dc4f389ead98972cb7d09ef285a0065decb0ad0.camel@linux.ibm.com>
 <aa5fa8c5f231115c58012352124df57d16a01e41.camel@huaweicloud.com> <7812899531b2bd936b25fde8fc2f1c2a6080b2bd.camel@linux.ibm.com>
Mime-Version: 1.0
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sFqoA3xlAXzNwNaJLAB412Ok7P7Z69MnqdPRYsS/dcY=;
        b=UGMGIxl4MlQMRNDDoJWW1JeWd1Saa+VY7wYO0h5+ALzBmXWpD2TS+rloS5mLWItbTu
         dmLO6NI0/V1oHyb1t8W3cmApDUm4Tye2vUImDyToVFtk3M6GOw5Inchh/UMvHT2e/+Mq
         TZ0Zu/FXa04YRFFPQkZkOCpTQLS0EdUOIT0pN4L3oxkVk6sF6dYFnXSdIODc7wwURPgb
         9uoLDRbPa4Hxw+5ALlkY5tWI5ZiDCeNk3+/eGSw7eJ37LD7LmjdzmNfuwXTxMuQBy69L
         SQx4AJf0J8sU68MUvZMsMSHdQOZmK/LoNgQ2SeuUcyj1Hy7Nep6MNCRwXKjnXY74GtT0
         A1eQ==
In-Reply-To: <7812899531b2bd936b25fde8fc2f1c2a6080b2bd.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, ocfs2-devel@oss.oracle.com

On Mon, Nov 21, 2022 at 3:54 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> On Mon, 2022-11-21 at 10:45 +0100, Roberto Sassu wrote:
> > > As ocfs2 already defines initxattrs, that leaves only reiserfs missing
> > > initxattrs().  A better, cleaner solution would be to define one.
> >
> > If I understood why security_old_inode_init_security() is called
> > instead of security_inode_init_security(), the reason seems that the
> > filesystem code uses the length of the obtained xattr to make some
> > calculations (e.g. reserve space). The xattr is written at a later
> > time.
> >
> > Since for reiserfs there is a plan to deprecate it, it probably
> > wouldn't be worth to support the creation of multiple xattrs. I would
> > define a callback to take the first xattr and make a copy, so that
> > calling security_inode_init_security() + reiserfs_initxattrs() is
> > equivalent to calling security_old_inode_init_security().

FWIW, reiserfs isn't going to be removed until 2025, I'm hopeful we
can remove the IMA/EVM special cases before then :)

> > But then, this is what anyway I was doing with the
> > security_initxattrs() callback, for all callers of security_old_inode_i
> > nit_security().
> >
> > Also, security_old_inode_init_security() is exported to kernel modules.
> > Maybe, it is used somewhere. So, unless we plan to remove it
> > completely, it should be probably be fixed to avoid multiple LSMs
> > successfully setting an xattr, and losing the memory of all except the
> > last (which this patch fixes by calling security_inode_init_security()).

I would much rather remove security_old_inode_init_security() then
worry about what out-of-tree modules might be using it.  Hopefully we
can resolve the ocfs2 usage and get ocfs2 exclusively on the new hook
without too much trouble, which means all we have left is reiserfs ...
how difficult would you expect the conversion to be for reiserfs?

> > If there is still the preference, I will implement the reiserfs
> > callback and make a fix for security_old_inode_init_security().
>
> There's no sense in doing both, as the purpose of defining a reiserfs
> initxattrs function was to clean up this code making it more readable.
>
> Mimi

-- 
paul-moore.com
