From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v5 2/6] ocfs2: Switch to security_inode_init_security()
Date: Thu, 24 Nov 2022 09:11:44 +0100
Message-ID: <44de9254c7abf1c836142cf3262450de1912bbc0.camel@huaweicloud.com>
References: <20221123095202.599252-1-roberto.sassu@huaweicloud.com>
         <20221123095202.599252-3-roberto.sassu@huaweicloud.com>
         <052d91687e813110cc1e1d762ea086cc8085114a.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <052d91687e813110cc1e1d762ea086cc8085114a.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mimi Zohar <zohar@linux.ibm.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, Casey Schaufler <casey@schaufler-ca.com>
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Wed, 2022-11-23 at 12:46 -0500, Mimi Zohar wrote:
> On Wed, 2022-11-23 at 10:51 +0100, Roberto Sassu wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> > 
> > In preparation for removing security_old_inode_init_security(), switch to
> > security_inode_init_security().
> > 
> > Extend the existing ocfs2_initxattrs() to take the
> > ocfs2_security_xattr_info structure from fs_info, and populate the
> > name/value/len triple with the first xattr provided by LSMs. Supporting
> > multiple xattrs is not currently supported, as it requires non-trivial
> > changes that can be done at a later time.
> 
> ocfs2 already defines ocfs2_init_security_get() as a wrapper around
> calling either security_old_inode_init_security() or
> security_inode_init_security().  Based on "si" one or the other hook is
> called.  ocfs2_initxattrs is already defined.
> 
>         struct ocfs2_security_xattr_info si = {
>                 .name = NULL,
>                 .enable = 1,
>         };
> 
> The main difference between calling security_old_inode_init_security or
> security_inode_init_security() is whether or not security.evm is
> calculated and written.

Uhm, it seems unfortunately more complicated.

Calling security_old_inode_init_security() allows filesystems to get
the xattr, do some calculations (e.g. for reservation) and then write
the xattr.

The initxattrs() callback to be passed to
security_inode_init_security() is meant to let filesystems provide a
filesystem-specific way of writing the xattrs, just after LSMs provided
them. This seems incompatible with the old behavior, as a filesystem
might need to do the calculations in the middle before writing the
xattrs.

The initxattrs() callback, when security_old_inode_init_security() was
used, is just a way of emulating the old behavior, i.e. returning the
xattr to the caller.

It should be possible, I guess, to handle more xattrs but if the code
was designed to handle one, it would be better if the filesystem
maintainers add support for it.

Thanks

Roberto

> Perhaps it is time to remove the call to
> security_old_inode_init_security() in ocfs2_init_security_get().  We
> need to hear back from the ocfs2 community.  Mark?  Joel?
> 
> As noted previously this change affects mknod and symlinks.
> 
> Mimi
> 
> > As fs_info was not used before, ocfs2_initxattrs() can now handle the case
> > of replicating the behavior of security_old_inode_init_security(), i.e.
> > just obtaining the xattr, in addition to setting all xattrs provided by
> > LSMs.
> > 
> > Finally, modify the handling of the return value from
> > ocfs2_init_security_get(). As security_inode_init_security() does not
> > return -EOPNOTSUPP, remove this case and directly handle the error if the
> > return value is not zero.
> > 
> > However, the previous case of receiving -EOPNOTSUPP should be still
> > taken into account, as security_inode_init_security() could return zero
> > without setting xattrs and ocfs2 would consider it as if the xattr was set.
> > 
> > Instead, if security_inode_init_security() returned zero, look at the xattr
> > if it was set, and behave accordingly, i.e. set si->enable to zero to
> > notify to the functions following ocfs2_init_security_get() that the xattr
> > is not available (same as if security_old_inode_init_security() returned
> > -EOPNOTSUPP).
> > 
> > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > ---
> >  fs/ocfs2/namei.c | 18 ++++++------------
> >  fs/ocfs2/xattr.c | 30 ++++++++++++++++++++++++++----
> >  2 files changed, 32 insertions(+), 16 deletions(-)
> > 
> > diff --git a/fs/ocfs2/namei.c b/fs/ocfs2/namei.c
> > index 05f32989bad6..55fba81cd2d1 100644
> > --- a/fs/ocfs2/namei.c
> > +++ b/fs/ocfs2/namei.c
> > @@ -242,6 +242,7 @@ static int ocfs2_mknod(struct user_namespace *mnt_userns,
> >  	int want_meta = 0;
> >  	int xattr_credits = 0;
> >  	struct ocfs2_security_xattr_info si = {
> > +		.name = NULL,
> >  		.enable = 1,
> >  	};
> >  	int did_quota_inode = 0;
> > @@ -315,12 +316,8 @@ static int ocfs2_mknod(struct user_namespace *mnt_userns,
> >  	/* get security xattr */
> >  	status = ocfs2_init_security_get(inode, dir, &dentry->d_name, &si);
> >  	if (status) {
> > -		if (status == -EOPNOTSUPP)
> > -			si.enable = 0;
> > -		else {
> > -			mlog_errno(status);
> > -			goto leave;
> > -		}
> > +		mlog_errno(status);
> > +		goto leave;
> >  	}
> >  
> >  	/* calculate meta data/clusters for setting security and acl xattr */
> > @@ -1805,6 +1802,7 @@ static int ocfs2_symlink(struct user_namespace *mnt_userns,
> >  	int want_clusters = 0;
> >  	int xattr_credits = 0;
> >  	struct ocfs2_security_xattr_info si = {
> > +		.name = NULL,
> >  		.enable = 1,
> >  	};
> >  	int did_quota = 0, did_quota_inode = 0;
> > @@ -1875,12 +1873,8 @@ static int ocfs2_symlink(struct user_namespace *mnt_userns,
> >  	/* get security xattr */
> >  	status = ocfs2_init_security_get(inode, dir, &dentry->d_name, &si);
> >  	if (status) {
> > -		if (status == -EOPNOTSUPP)
> > -			si.enable = 0;
> > -		else {
> > -			mlog_errno(status);
> > -			goto bail;
> > -		}
> > +		mlog_errno(status);
> > +		goto bail;
> >  	}
> >  
> >  	/* calculate meta data/clusters for setting security xattr */
> > diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
> > index 95d0611c5fc7..55699c573541 100644
> > --- a/fs/ocfs2/xattr.c
> > +++ b/fs/ocfs2/xattr.c
> > @@ -7259,9 +7259,21 @@ static int ocfs2_xattr_security_set(const struct xattr_handler *handler,
> >  static int ocfs2_initxattrs(struct inode *inode, const struct xattr *xattr_array,
> >  		     void *fs_info)
> >  {
> > +	struct ocfs2_security_xattr_info *si = fs_info;
> >  	const struct xattr *xattr;
> >  	int err = 0;
> >  
> > +	if (si) {
> > +		si->value = kmemdup(xattr_array->value, xattr_array->value_len,
> > +				    GFP_KERNEL);
> > +		if (!si->value)
> > +			return -ENOMEM;
> > +
> > +		si->name = xattr_array->name;
> > +		si->value_len = xattr_array->value_len;
> > +		return 0;
> > +	}
> > +
> >  	for (xattr = xattr_array; xattr->name != NULL; xattr++) {
> >  		err = ocfs2_xattr_set(inode, OCFS2_XATTR_INDEX_SECURITY,
> >  				      xattr->name, xattr->value,
> > @@ -7277,13 +7289,23 @@ int ocfs2_init_security_get(struct inode *inode,
> >  			    const struct qstr *qstr,
> >  			    struct ocfs2_security_xattr_info *si)
> >  {
> > +	int ret;
> > +
> >  	/* check whether ocfs2 support feature xattr */
> >  	if (!ocfs2_supports_xattr(OCFS2_SB(dir->i_sb)))
> >  		return -EOPNOTSUPP;
> > -	if (si)
> > -		return security_old_inode_init_security(inode, dir, qstr,
> > -							&si->name, &si->value,
> > -							&si->value_len);
> > +	if (si) {
> > +		ret = security_inode_init_security(inode, dir, qstr,
> > +						   &ocfs2_initxattrs, si);
> > +		/*
> > +		 * security_inode_init_security() does not return -EOPNOTSUPP,
> > +		 * we have to check the xattr ourselves.
> > +		 */
> > +		if (!ret && !si->name)
> > +			si->enable = 0;
> > +
> > +		return ret;
> > +	}
> >  
> >  	return security_inode_init_security(inode, dir, qstr,
> >  					    &ocfs2_initxattrs, NULL);

