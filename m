From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v7 6/6] evm: Support multiple LSMs providing an xattr
Date: Mon, 20 Feb 2023 10:49:37 +0100
Message-ID: <ab9245bfb43b96fd8eded8a4ca25f5cae20b9f04.camel@huaweicloud.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <20221201104125.919483-7-roberto.sassu@huaweicloud.com>
         <1f252850086a39e3c15736f252600d388f6b9c24.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1f252850086a39e3c15736f252600d388f6b9c24.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mimi Zohar <zohar@linux.ibm.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Sun, 2023-02-19 at 14:42 -0500, Mimi Zohar wrote:
> On Thu, 2022-12-01 at 11:41 +0100, Roberto Sassu wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> > 
> > Currently, evm_inode_init_security() processes a single LSM xattr from
> > the array passed by security_inode_init_security(), and calculates the
> > HMAC on it and other inode metadata.
> > 
> > Given that initxattrs() callbacks, called by
> > security_inode_init_security(), expect that this array is terminated when
> > the xattr name is set to NULL, reuse the same assumption to scan all xattrs
> > and to calculate the HMAC on all of them.
> > 
> > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> 
> Normally changing the contents of the EVM HMAC calculation would break
> existing systems.  Assuming for the time being this is safe, at what
> point will it affect backwards compatability?  Should it be documented
> now or then?

Actually, the current patch set continues to fullfill user space
expectation on the EVM behavior. If the LSM infrastructure created more
xattrs and EVM calculated the HMAC on just one, there would be a
problem on subsequent xattr operations and on IMA verification.

By updating both the LSM infrastructure and EVM to support multiple
xattrs, everything will continue to work.

Thanks

Roberto

