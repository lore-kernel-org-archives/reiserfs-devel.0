From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v7 2/6] ocfs2: Switch to security_inode_init_security()
Date: Mon, 20 Feb 2023 10:27:14 +0100
Message-ID: <95f9b1dfca0cbff1c6a447dde45c2f835bc1a254.camel@huaweicloud.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <20221201104125.919483-3-roberto.sassu@huaweicloud.com>
         <a20a6d84d8e682fbff546b80eda75a1918d7c108.camel@linux.ibm.com>
         <aaeee7490cfee1b2163a3c9c894294aaf13e100c.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <aaeee7490cfee1b2163a3c9c894294aaf13e100c.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mimi Zohar <zohar@linux.ibm.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Fri, 2023-02-17 at 16:30 -0500, Mimi Zohar wrote:
> On Fri, 2023-02-17 at 14:51 -0500, Mimi Zohar wrote:
> > On Thu, 2022-12-01 at 11:41 +0100, Roberto Sassu wrote:
> > > From: Roberto Sassu <roberto.sassu@huawei.com>
> > > 
> > > In preparation for removing security_old_inode_init_security(), switch to
> > > security_inode_init_security().
> > > 
> > > Extend the existing ocfs2_initxattrs() to take the
> > > ocfs2_security_xattr_info structure from fs_info, and populate the
> > > name/value/len triple with the first xattr provided by LSMs.
> > > 
> > > As fs_info was not used before, ocfs2_initxattrs() can now handle the case
> > > of replicating the behavior of security_old_inode_init_security(), i.e.
> > > just obtaining the xattr, in addition to setting all xattrs provided by
> > > LSMs.
> > > 
> > > Supporting multiple xattrs is not currently supported where
> > > security_old_inode_init_security() was called (mknod, symlink), as it
> > > requires non-trivial changes that can be done at a later time. Like for
> > > reiserfs, even if EVM is invoked, it will not provide an xattr (if it is
> > > not the first to set it, its xattr will be discarded; if it is the first,
> > > it does not have xattrs to calculate the HMAC on).
> > > 
> > > Finally, modify the handling of the return value from
> > > ocfs2_init_security_get(). As security_inode_init_security() does not
> > > return -EOPNOTSUPP, remove this case and directly handle the error if the
> > > return value is not zero.
> > > 
> > > However, the previous case of receiving -EOPNOTSUPP should be still
> > > taken into account, as security_inode_init_security() could return zero
> > > without setting xattrs and ocfs2 would consider it as if the xattr was set.
> > > 
> > > Instead, if security_inode_init_security() returned zero, look at the xattr
> > > if it was set, and behave accordingly, i.e. set si->enable to zero to
> > > notify to the functions following ocfs2_init_security_get() that the xattr
> > > is not available (same as if security_old_inode_init_security() returned
> > > -EOPNOTSUPP).
> > > 
> > > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > > Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> > 
> > My previous review missed a couple of concerns.
> > 
> > > ---
> > >  fs/ocfs2/namei.c | 18 ++++++------------
> > >  fs/ocfs2/xattr.c | 30 ++++++++++++++++++++++++++----
> > >  2 files changed, 32 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/fs/ocfs2/namei.c b/fs/ocfs2/namei.c
> > > index 05f32989bad6..55fba81cd2d1 100644
> > > --- a/fs/ocfs2/namei.c
> > > +++ b/fs/ocfs2/namei.c
> > > @@ -242,6 +242,7 @@ static int ocfs2_mknod(struct user_namespace *mnt_userns,
> > >  	int want_meta = 0;
> > >  	int xattr_credits = 0;
> > >  	struct ocfs2_security_xattr_info si = {
> > > +		.name = NULL,
> > >  		.enable = 1,
> > >  	};
> > >  	int did_quota_inode = 0;
> > > @@ -315,12 +316,8 @@ static int ocfs2_mknod(struct user_namespace *mnt_userns,
> > >  	/* get security xattr */
> > >  	status = ocfs2_init_security_get(inode, dir, &dentry->d_name, &si);
> > >  	if (status) {
> > > -		if (status == -EOPNOTSUPP)
> > > -			si.enable = 0;
> > > -		else {
> > > -			mlog_errno(status);
> > > -			goto leave;
> > > -		}
> > 
> > Although security_inode_init_security() does not return -EOPNOTSUPP, 
> > ocfs2_init_security_get() could.  Refer to commit 8154da3d2114 ("ocfs2:
> > Add incompatible flag for extended attribute").   It was added as a
> > temporary solution back in 2008, so it is highly unlikely that it is
> > still needed.
> > 
> > > +		mlog_errno(status);
> > > +		goto leave;
> > 
> > Without the -EOPNOTSUPP test, ocfs2_mknod() would not create the inode;
> > and similarly ocfs2_symlink(), below, would not create the symlink.  It
> > would be safer not to remove the -EOPNOTSUPP test.
> > 
> > >  	}
> > >  
> > >  	/* calculate meta data/clusters for setting security and acl xattr */
> > > @@ -1805,6 +1802,7 @@ static int ocfs2_symlink(struct user_namespace *mnt_userns,
> > >  	int want_clusters = 0;
> > >  	int xattr_credits = 0;
> > >  	struct ocfs2_security_xattr_info si = {
> > > +		.name = NULL,
> > >  		.enable = 1,
> > >  	};
> > >  	int did_quota = 0, did_quota_inode = 0;
> > > @@ -1875,12 +1873,8 @@ static int ocfs2_symlink(struct user_namespace *mnt_userns,
> > >  	/* get security xattr */
> > >  	status = ocfs2_init_security_get(inode, dir, &dentry->d_name, &si);
> > >  	if (status) {
> > > -		if (status == -EOPNOTSUPP)
> > > -			si.enable = 0;
> > > -		else {
> > > -			mlog_errno(status);
> > > -			goto bail;
> > > -		}
> > > +		mlog_errno(status);
> > > +		goto bail;
> > >  	}
> > >  
> > >  	/* calculate meta data/clusters for setting security xattr */
> > > diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
> > > index 95d0611c5fc7..55699c573541 100644
> > > --- a/fs/ocfs2/xattr.c
> > > +++ b/fs/ocfs2/xattr.c
> > > @@ -7259,9 +7259,21 @@ static int ocfs2_xattr_security_set(const struct xattr_handler *handler,
> > >  static int ocfs2_initxattrs(struct inode *inode, const struct xattr *xattr_array,
> > >  		     void *fs_info)
> > >  {
> > > +	struct ocfs2_security_xattr_info *si = fs_info;
> > >  	const struct xattr *xattr;
> > >  	int err = 0;
> > >  
> > > +	if (si) {
> > > +		si->value = kmemdup(xattr_array->value, xattr_array->value_len,
> > > +				    GFP_KERNEL);
> > > +		if (!si->value)
> > > +			return -ENOMEM;
> > > +
> > > +		si->name = xattr_array->name;
> > > +		si->value_len = xattr_array->value_len;
> > > +		return 0;
> > > +	}
> > > +
> > >  	for (xattr = xattr_array; xattr->name != NULL; xattr++) {
> > >  		err = ocfs2_xattr_set(inode, OCFS2_XATTR_INDEX_SECURITY,
> > >  				      xattr->name, xattr->value,
> > > @@ -7277,13 +7289,23 @@ int ocfs2_init_security_get(struct inode *inode,
> > >  			    const struct qstr *qstr,
> > >  			    struct ocfs2_security_xattr_info *si)
> > >  {
> > > +	int ret;
> > > +
> > >  	/* check whether ocfs2 support feature xattr */
> > >  	if (!ocfs2_supports_xattr(OCFS2_SB(dir->i_sb)))
> > >  		return -EOPNOTSUPP;
> > > -	if (si)
> > > -		return security_old_inode_init_security(inode, dir, qstr,
> > > -							&si->name, &si->value,
> > > -							&si->value_len);
> > > +	if (si) {
> > > +		ret = security_inode_init_security(inode, dir, qstr,
> > > +						   &ocfs2_initxattrs, si);
> > 
> > The "if (unlikely(IS_PRIVATE(inode))"  test exists in both
> > security_old_inode_init_security() and security_inode_init_security(),
> > but return different values.  In the former case, it returns
> > -EOPNOTSUPP.  In the latter case, it returns 0.  The question is
> > whether or not we need to be concerned about private inodes on ocfs2.  
> > If private inodes on ocfs2 are possible, then ocsf2_mknod() or
> > ocfs2_symlink() would fail to create the inode or symlink.
> 
> Correction, previously when returning -EOPNOTSUPP for private inodes,
> xattrs would not be wrriten.  By returning 0 without setting si->enable 
> to 0, xattrs will be written.

Ok, but if there is a private inode, we would be setting si->enable to
zero. Should be ok, I guess.

Thanks

Roberto

> > > +		/*
> > > +		 * security_inode_init_security() does not return -EOPNOTSUPP,
> > > +		 * we have to check the xattr ourselves.
> > > +		 */
> > > +		if (!ret && !si->name)
> > > +			si->enable = 0;
> > > +
> > > +		return ret;
> > > +	}
> > >  
> > >  	return security_inode_init_security(inode, dir, qstr,
> > >  					    &ocfs2_initxattrs, NULL);

