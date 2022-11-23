From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v6 0/6] evm: Do HMAC of multiple per LSM xattrs for new
 inodes
Date: Wed, 23 Nov 2022 11:22:59 -0500
Message-ID: <33329a29d779096e043f53c681f26ef32b093e5c.camel@linux.ibm.com>
References: <20221123154712.752074-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=DGIE0IcQ/4Ob6lIB9Xu6gY2wRn88lzgW3JmHywvHzKA=;
 b=hKMi4em2yrex+9WFg6mkd4/u+MFEF25CWOax2DqMDNRabnG05st9JP2dlFR3UQPWS0iJ
 cReqe+AjYto7WBrqkhmsnD/iZOZTbxt3VRmWY574QVbpn0LInmZRjnfpfjZGInoUWQ/2
 uUmqcCwJI+y922b2xrmjR+cngRdBbqO6HLHFQdkF9h/WK93zqUaKst0LmWJrelPgAna3
 mH7jZzjJ5VUrPR4g9yKvD6VmrkBeX/vAMlKV96nA1AaPAds/elFZePuoX/RhqIlqzt41
 BbV9+w0pmwlxHepYFue1BcrWcFEN4vFxnH0LGlsk7kVI5VZ2Oo7+HM2dC3mReTa/A870 bQ== 
In-Reply-To: <20221123154712.752074-1-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

Hi Roberto,

On Wed, 2022-11-23 at 16:47 +0100, Roberto Sassu wrote:
> The second problem this patch set addresses is the limitation of the
> call_int_hook() of stopping the loop when the return value from a hook
> implementation is not zero. Unfortunately, for the inode_init_security hook
> it is a legitimate case to return -EOPNOTSUPP, but this would not
> necessarily mean that there is an error to report to the LSM infrastructure
> but just that an LSM does not will to set an xattr. Other LSMs should be
> still consulted as well.

This is just a heads up.  In reviewing the ocfs2 v5 patch, I realized
the meaning of -EOPNOTSUPP is being overloaded to mean multiple things.
Originally, -EOPNOTSUPP meant that the file system didn't implement
xattr support.  Now, it is being used to also mean no LSM xattr.  In
the former case, none of the LSM xattrs would be written.  In the
latter case, some of them will be written.

I'm not convinced that overloading the -EOPNOTSUPP is a good idea.  
Still reviewing the patch set...

-- 
thanks,

Mimi

