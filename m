From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v5 0/6] evm: Prepare for moving to the LSM infrastructure
Date: Wed, 23 Nov 2022 08:06:38 -0500
Message-ID: <bddfe0f41b05dd8efd6991487ff2525a8503dd84.camel@linux.ibm.com>
References: <20221123095202.599252-1-roberto.sassu@huaweicloud.com>
         <ccf1937cfdcc5bb28dcc7a58785dd0c65d974597.camel@linux.ibm.com>
         <22f47b9d2cade322f9037133b0940640423f9590.camel@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=vDySJw+RE1dcnmUvFnvraOg2YS5K9nq98jTHqlpHG18=;
 b=RczVDxgd1m7SeAvqgYnIhMYTied/i9m6YC+mlJUUMkN2R7PXui+VjLg8iYe06fhz515I
 OqGZrXAKGUKvZSfH4eRGeuL9BUr7vzUKvDPf7VLXmDGwxD/d7hDh8itl9rzs/V5VZBUY
 6xndXZOIMDiLX5xtX3up8kNWqtPJoFtkXjdw2ck5REJ5p5h3ovFUqtpk2ik/XFUfUkOI
 MsIEVYv/GJt6L3qSw1l+n3/uUBOjfoVuO/0XfaMfeeHDQn2Ae02cvsL7J9l+gXubmes1
 PrOli1HGa52SmNq7H4OIKo2oBqI62KMDF0OnwXbJSHjyoBP+Pa/i/kQUsabs8j8y5roN Pw== 
In-Reply-To: <22f47b9d2cade322f9037133b0940640423f9590.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Wed, 2022-11-23 at 13:44 +0100, Roberto Sassu wrote:
> On Wed, 2022-11-23 at 07:28 -0500, Mimi Zohar wrote:
> > Hi Roberto,
> > 
> > On Wed, 2022-11-23 at 10:51 +0100, Roberto Sassu wrote:
> > > From: Roberto Sassu <roberto.sassu@huawei.com>
> > > 
> > > One of the challenges that must be tackled to move IMA and EVM to the LSM
> > > infrastructure is to ensure that EVM is capable to correctly handle
> > > multiple stacked LSMs providing an xattr at file creation. At the moment,
> > > there are few issues that would prevent a correct integration. This patch
> > > set aims at solving them.
> > 
> > Let's take a step back and understand the purpose of this patch set. 
> > Regardless of whether IMA and EVM are moved to the "LSM
> > infrastructure", EVM needs to support per LSM xattrs.  A side affect is
> > the removal of the security_old_inode_init_security hook.  This patch
> > set cover letter and patch descriptions should be limited to EVM
> > support for per LSM (multiple) xattrs.  The motivation, concerns, and
> > problems of making IMA and EVM LSMs will be documented in the patch set
> > that actual makes them LSMs.  Please remove all references to "move IMA
> > and EVM to the LSM infrastructure".
> 
> Hi Mimi
> 
> ok, will do.
> 
> > When EVM was upstreamed, there were filesystem limitations on the
> > number and size of the extended attributes.  In addition there were
> > performance concerns, which resulted in staging the LSM, IMA and EVM
> > xattrs, before calling initxattrs to write them at the same time.  With
> > this patch set, not only are per LSM xattrs supported, but multiple per
> > LSM xattrs are supported as well.  Have the size limitation concerns
> > been addressed by the different filesystems?   If not, then at minimum
> > this patch set needs to at least mention it and the possible
> > ramifications.
> 
> With your patch, 9d8f13ba3f483 ("security: new
> security_inode_init_security API adds function callback") you made it
> possible to set multiple xattrs at inode creation time.

True, and even then there were concerns.

> This patch set pushes further to the limits, as there could be more
> xattrs to be added to the inode. I will mention that.

Thanks

> If there are too many xattrs, I guess the only solution would be to use
> less LSMs, or a different filesystem. The per filesystem limit could be
> increased separately case by case.

Agreed, but unless it is documented somewhere, nobody but us will know
there is a potential problem.  At least document it here in the cover
letter, which we'll include in the merge message.

FYI, the xattr.7 man page contains a section "Filesystem differences".

-- 
thanks,

Mimi

