From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v7 2/6] ocfs2: Switch to security_inode_init_security()
Date: Mon, 20 Feb 2023 13:20:56 +0100
Message-ID: <70d079a7e8b2fa08683b68742a22ba2918765dfc.camel@huaweicloud.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <20221201104125.919483-3-roberto.sassu@huaweicloud.com>
         <a20a6d84d8e682fbff546b80eda75a1918d7c108.camel@linux.ibm.com>
         <aaeee7490cfee1b2163a3c9c894294aaf13e100c.camel@linux.ibm.com>
         <95f9b1dfca0cbff1c6a447dde45c2f835bc1a254.camel@huaweicloud.com>
         <1e93d7b299de3b6cf61b5a5c4be91eb47d864ac6.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1e93d7b299de3b6cf61b5a5c4be91eb47d864ac6.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mimi Zohar <zohar@linux.ibm.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Mon, 2023-02-20 at 06:08 -0500, Mimi Zohar wrote:
> > > > > diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
> > > > > index 95d0611c5fc7..55699c573541 100644
> > > > > @@ -7277,13 +7289,23 @@ int ocfs2_init_security_get(struct inode *inode,
> > > > >  			    const struct qstr *qstr,
> > > > >  			    struct ocfs2_security_xattr_info *si)
> > > > >  {
> > > > > +	int ret;
> > > > > +
> > > > >  	/* check whether ocfs2 support feature xattr */
> > > > >  	if (!ocfs2_supports_xattr(OCFS2_SB(dir->i_sb)))
> > > > >  		return -EOPNOTSUPP;
> > > > > -	if (si)
> > > > > -		return security_old_inode_init_security(inode, dir, qstr,
> > > > > -							&si->name, &si->value,
> > > > > -							&si->value_len);
> > > > > +	if (si) {
> > > > > +		ret = security_inode_init_security(inode, dir, qstr,
> > > > > +						   &ocfs2_initxattrs, si);
> > > > 
> > > > The "if (unlikely(IS_PRIVATE(inode))"  test exists in both
> > > > security_old_inode_init_security() and security_inode_init_security(),
> > > > but return different values.  In the former case, it returns
> > > > -EOPNOTSUPP.  In the latter case, it returns 0.  The question is
> > > > whether or not we need to be concerned about private inodes on ocfs2.  
> > > > If private inodes on ocfs2 are possible, then ocsf2_mknod() or
> > > > ocfs2_symlink() would fail to create the inode or symlink.
> > > 
> > > Correction, previously when returning -EOPNOTSUPP for private inodes,
> > > xattrs would not be wrriten.  By returning 0 without setting si->enable 
> > > to 0, xattrs will be written.
> > 
> > Ok, but if there is a private inode, we would be setting si->enable to
> > zero. Should be ok, I guess.
> 
> si->enable is being set to zero, below, but is conditional on !si-
> > name.
> 
> This is the last concern, otherwise the patch set looks good.

Uhm, if the inode is private, security_inode_init_security() will
immediately return. So, the condition !si->name should be always true.

Thanks

Roberto

> > > > > +		/*
> > > > > +		 * security_inode_init_security() does not return -EOPNOTSUPP,
> > > > > +		 * we have to check the xattr ourselves.
> > > > > +		 */
> > > > > +		if (!ret && !si->name)
> > > > > +			si->enable = 0;
> > > > > +
> > > > > +		return ret;
> > > > > +	}
> > > > >  
> > > > >  	return security_inode_init_security(inode, dir, qstr,
> > > > >  					    &ocfs2_initxattrs, NULL);

