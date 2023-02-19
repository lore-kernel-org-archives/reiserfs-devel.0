From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v7 6/6] evm: Support multiple LSMs providing an xattr
Date: Sun, 19 Feb 2023 14:42:11 -0500
Message-ID: <1f252850086a39e3c15736f252600d388f6b9c24.camel@linux.ibm.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <20221201104125.919483-7-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=CYJ3eVTHiOWV/HXfh9LoWzkEjLJj1zuaaERAokCGMZs=;
 b=bjvkbRBpdRlQYGx8F56LZ84vecCQkZCmXwUUKkStfqw17eZhU5SifB+n2Zi0Mg5Wj9sN
 qF96Ef4o2I+KpYf56z7dDs9QTSrIkIpr1/4kyD4kHcATim1bhy8CcQkJx62tSW4boqZZ
 Ues6C+peWWA9xHhZRSqFAIMoP5eQ4R/eg/4NaeojKtHgD5cvlGuGo2nXcnGU0NoHrTsW
 IX+f7mQr+qCWdlgjEO/7bqygXpVKD3guhiiFnhZwAsHBF4XyZONsk9pFkyhdHZH/Sal7
 Ag7nvl+ztC18vkJm4mOogFRItX/Wo0GYVuwgo9JTa+BvSrgvpmSm0yOLNpsxG/5fxB0g Hg== 
In-Reply-To: <20221201104125.919483-7-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, 2022-12-01 at 11:41 +0100, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> Currently, evm_inode_init_security() processes a single LSM xattr from
> the array passed by security_inode_init_security(), and calculates the
> HMAC on it and other inode metadata.
> 
> Given that initxattrs() callbacks, called by
> security_inode_init_security(), expect that this array is terminated when
> the xattr name is set to NULL, reuse the same assumption to scan all xattrs
> and to calculate the HMAC on all of them.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>


Normally changing the contents of the EVM HMAC calculation would break
existing systems.  Assuming for the time being this is safe, at what
point will it affect backwards compatability?  Should it be documented
now or then?

-- 
thanks,

Mimi

