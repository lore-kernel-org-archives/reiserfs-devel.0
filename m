From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v7 2/6] ocfs2: Switch to security_inode_init_security()
Date: Mon, 20 Feb 2023 06:08:59 -0500
Message-ID: <1e93d7b299de3b6cf61b5a5c4be91eb47d864ac6.camel@linux.ibm.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <20221201104125.919483-3-roberto.sassu@huaweicloud.com>
         <a20a6d84d8e682fbff546b80eda75a1918d7c108.camel@linux.ibm.com>
         <aaeee7490cfee1b2163a3c9c894294aaf13e100c.camel@linux.ibm.com>
         <95f9b1dfca0cbff1c6a447dde45c2f835bc1a254.camel@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=iaff3ymAW5HS/2O66xYNAHjFL1PE3JHi2WMFx/EOoTU=;
 b=gGXn0ElsRvpMwlsc3zR4Nb+UQaretD+157EGIQ4UtgX8oR3+XPvJmaaLtfm1fkNCRBlP
 Y2HcHjhzlbisyNy9PNLv+0B8uMss+3b0mFBtj8VOrAxzwimmsAXoEV551kvchJKSxjQQ
 G9R8W9PdBIECBY3PwwgSu5zR/vjucaQYfaKjiqZOBAh+DC+yZA5C8dWB+IlGlBzEpRyp
 R7Q3No76DQP3YYzofJEp24qBC6fViy2wyc1+AupZ1oZ8smXIkjpErQH4J0ZTjCf/Bofg
 CghLsHWLmdWovYY3T/A15rALxH+14Jyne0Etw5ttORvmKKoq0mWHw28RHuT/DSeqG3cq /w== 
In-Reply-To: <95f9b1dfca0cbff1c6a447dde45c2f835bc1a254.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

> > > > diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
> > > > index 95d0611c5fc7..55699c573541 100644

> > > > @@ -7277,13 +7289,23 @@ int ocfs2_init_security_get(struct inode *inode,
> > > >  			    const struct qstr *qstr,
> > > >  			    struct ocfs2_security_xattr_info *si)
> > > >  {
> > > > +	int ret;
> > > > +
> > > >  	/* check whether ocfs2 support feature xattr */
> > > >  	if (!ocfs2_supports_xattr(OCFS2_SB(dir->i_sb)))
> > > >  		return -EOPNOTSUPP;
> > > > -	if (si)
> > > > -		return security_old_inode_init_security(inode, dir, qstr,
> > > > -							&si->name, &si->value,
> > > > -							&si->value_len);
> > > > +	if (si) {
> > > > +		ret = security_inode_init_security(inode, dir, qstr,
> > > > +						   &ocfs2_initxattrs, si);
> > > 
> > > The "if (unlikely(IS_PRIVATE(inode))"  test exists in both
> > > security_old_inode_init_security() and security_inode_init_security(),
> > > but return different values.  In the former case, it returns
> > > -EOPNOTSUPP.  In the latter case, it returns 0.  The question is
> > > whether or not we need to be concerned about private inodes on ocfs2.  
> > > If private inodes on ocfs2 are possible, then ocsf2_mknod() or
> > > ocfs2_symlink() would fail to create the inode or symlink.
> > 
> > Correction, previously when returning -EOPNOTSUPP for private inodes,
> > xattrs would not be wrriten.  By returning 0 without setting si->enable 
> > to 0, xattrs will be written.
> 
> Ok, but if there is a private inode, we would be setting si->enable to
> zero. Should be ok, I guess.

si->enable is being set to zero, below, but is conditional on !si-
>name.

This is the last concern, otherwise the patch set looks good.

> > > > +		/*
> > > > +		 * security_inode_init_security() does not return -EOPNOTSUPP,
> > > > +		 * we have to check the xattr ourselves.
> > > > +		 */
> > > > +		if (!ret && !si->name)
> > > > +			si->enable = 0;
> > > > +
> > > > +		return ret;
> > > > +	}
> > > >  
> > > >  	return security_inode_init_security(inode, dir, qstr,
> > > >  					    &ocfs2_initxattrs, NULL);
> 
-- 
thanks,

Mimi

