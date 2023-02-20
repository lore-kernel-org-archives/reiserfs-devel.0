From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v7 6/6] evm: Support multiple LSMs providing an xattr
Date: Mon, 20 Feb 2023 05:56:54 -0500
Message-ID: <7bea1e47e85f8cb340a6ec4f7c04bc5e17c31b99.camel@linux.ibm.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <20221201104125.919483-7-roberto.sassu@huaweicloud.com>
         <1f252850086a39e3c15736f252600d388f6b9c24.camel@linux.ibm.com>
         <ab9245bfb43b96fd8eded8a4ca25f5cae20b9f04.camel@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=RuzZ1LW5t4JYUC60YV0IWi615mVUaWtO9PEMu1O1wdg=;
 b=ecqfE4SNr0Wg0hXNLh+6ZHNcFWlPtdeHf4BVtHEoDppk5NJSfiup/odQYO7Cm3P0b0eV
 h+lMgrztrCDCJMeqRDVkqF469WINMOV22NAfcJsplA9tXZ8wXJntHRusjalRGGfPGNQw
 sYv/uFheiKjGarQWmCNPPNEOgCw71qseA8zF7NtEYvvT8kPNshURsnE7xyL3VpAPu4+r
 IoEk4dd1Mnp1diHNr9kE13cjVrJNMhhKilGL7/gjoFXMNWt2a9mzAtm1o+ebumCcJafh
 uIuxZR0DwPiZMucrlo1ir5YfvkByErYgTTK8RxSdkkAsL62MfLXu2pTMmrdbO2WGYtB7 LA== 
In-Reply-To: <ab9245bfb43b96fd8eded8a4ca25f5cae20b9f04.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Mon, 2023-02-20 at 10:49 +0100, Roberto Sassu wrote:
> On Sun, 2023-02-19 at 14:42 -0500, Mimi Zohar wrote:
> > On Thu, 2022-12-01 at 11:41 +0100, Roberto Sassu wrote:
> > > From: Roberto Sassu <roberto.sassu@huawei.com>
> > > 
> > > Currently, evm_inode_init_security() processes a single LSM xattr from
> > > the array passed by security_inode_init_security(), and calculates the
> > > HMAC on it and other inode metadata.
> > > 
> > > Given that initxattrs() callbacks, called by
> > > security_inode_init_security(), expect that this array is terminated when
> > > the xattr name is set to NULL, reuse the same assumption to scan all xattrs
> > > and to calculate the HMAC on all of them.
> > > 
> > > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > > Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> > 
> > Normally changing the contents of the EVM HMAC calculation would break
> > existing systems.  Assuming for the time being this is safe, at what
> > point will it affect backwards compatability?  Should it be documented
> > now or then?
> 
> Actually, the current patch set continues to fullfill user space
> expectation on the EVM behavior. If the LSM infrastructure created more
> xattrs and EVM calculated the HMAC on just one, there would be a
> problem on subsequent xattr operations and on IMA verification.
> 
> By updating both the LSM infrastructure and EVM to support multiple
> xattrs, everything will continue to work.

Agreed.  Thank you for the reminder of the bug report being addressed
by this patch set.

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

-- 
thanks,

Mimi

