From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v4 2/5] security: Rewrite
 security_old_inode_init_security()
Date: Tue, 22 Nov 2022 09:29:40 +0100
Message-ID: <339eff96ebcd4c7ecba2ed56751fd2636fa52f73.camel@huaweicloud.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
         <20221110094639.3086409-3-roberto.sassu@huaweicloud.com>
         <3dc4f389ead98972cb7d09ef285a0065decb0ad0.camel@linux.ibm.com>
         <aa5fa8c5f231115c58012352124df57d16a01e41.camel@huaweicloud.com>
         <7812899531b2bd936b25fde8fc2f1c2a6080b2bd.camel@linux.ibm.com>
         <CAHC9VhTvcgOjXAH51Vnk66kEjXfjUS2aJjXjJmU-rwLT53vWPw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhTvcgOjXAH51Vnk66kEjXfjUS2aJjXjJmU-rwLT53vWPw@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Moore <paul@paul-moore.com>, Mimi Zohar <zohar@linux.ibm.com>
Cc: dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, ocfs2-devel@oss.oracle.com

On Mon, 2022-11-21 at 18:55 -0500, Paul Moore wrote:
> On Mon, Nov 21, 2022 at 3:54 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
> > On Mon, 2022-11-21 at 10:45 +0100, Roberto Sassu wrote:
> > > > As ocfs2 already defines initxattrs, that leaves only reiserfs missing
> > > > initxattrs().  A better, cleaner solution would be to define one.
> > > 
> > > If I understood why security_old_inode_init_security() is called
> > > instead of security_inode_init_security(), the reason seems that the
> > > filesystem code uses the length of the obtained xattr to make some
> > > calculations (e.g. reserve space). The xattr is written at a later
> > > time.
> > > 
> > > Since for reiserfs there is a plan to deprecate it, it probably
> > > wouldn't be worth to support the creation of multiple xattrs. I would
> > > define a callback to take the first xattr and make a copy, so that
> > > calling security_inode_init_security() + reiserfs_initxattrs() is
> > > equivalent to calling security_old_inode_init_security().
> 
> FWIW, reiserfs isn't going to be removed until 2025, I'm hopeful we
> can remove the IMA/EVM special cases before then :)

Well, we are not that far...

> > > But then, this is what anyway I was doing with the
> > > security_initxattrs() callback, for all callers of security_old_inode_i
> > > nit_security().
> > > 
> > > Also, security_old_inode_init_security() is exported to kernel modules.
> > > Maybe, it is used somewhere. So, unless we plan to remove it
> > > completely, it should be probably be fixed to avoid multiple LSMs
> > > successfully setting an xattr, and losing the memory of all except the
> > > last (which this patch fixes by calling security_inode_init_security()).
> 
> I would much rather remove security_old_inode_init_security() then
> worry about what out-of-tree modules might be using it.  Hopefully we
> can resolve the ocfs2 usage and get ocfs2 exclusively on the new hook
> without too much trouble, which means all we have left is reiserfs ...
> how difficult would you expect the conversion to be for reiserfs?

Ok for removing security_old_inode_init_security().

For reiserfs, I guess maintaining the current behavior of setting only
one xattr should be easy. For multiple xattrs, I need to understand
exactly how many blocks need to be reserved.

> > > If there is still the preference, I will implement the reiserfs
> > > callback and make a fix for security_old_inode_init_security().
> > 
> > There's no sense in doing both, as the purpose of defining a reiserfs
> > initxattrs function was to clean up this code making it more readable.

The fix for security_old_inode_init_security(), stopping at the first
LSM returning zero, was to avoid the memory leak. Will not be needed if
the function is removed.

Roberto

