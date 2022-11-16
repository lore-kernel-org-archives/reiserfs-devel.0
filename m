From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v4 1/5] reiserfs: Add missing calls to
 reiserfs_security_free()
Date: Wed, 16 Nov 2022 16:03:45 -0500
Message-ID: <e46fb092970bd12a8461a513f1cf8b63e4f54714.camel@linux.ibm.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
         <20221110094639.3086409-2-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Hm6PNSbhq9LhjwmrseFl2/g4hvgBcTxn6rmb+SYDL5c=;
 b=bNf/hxDYWOMp2O92YGnU7xVy3OwLgzGKpoVrHxy71bXWxTVCuL3T4OjnGMiRmoNWY5jc
 4neXymNU7N3SWSRlsGuvGqlLNTBzshBiwOpW/ti3Yeao0Y5IqkCjTqkJXa41qNSOpBs0
 rFMtoeJgl7zqed+Ygvs9Z+93uf39ebgpUeCkvgGVQQg35HV7qvK2yRg8JHyOrk2joV2c
 iPliU5nmIm9OCIWNTJpJOAu/vR436Y4qwsCFhDhGcoPRXohNoRqje2nfof3tHjpvWPPD
 BTFQK24dmOHGygvTHBtfoETW2mlXR3yu9EBiJKpZR7UygS4xSvq9nGhybFtp0XqV6elX WA== 
In-Reply-To: <20221110094639.3086409-2-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, stable@vger.kernel.org, Jeff Mahoney <jeffm@suse.com>, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

On Thu, 2022-11-10 at 10:46 +0100, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> Commit 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes
> during inode creation") defined reiserfs_security_free() to free the name
> and value of a security xattr allocated by the active LSM through
> security_old_inode_init_security(). However, this function is not called
> in the reiserfs code.
> 
> Thus, add a call to reiserfs_security_free() whenever
> reiserfs_security_init() is called, and initialize value to NULL, to avoid
> to call kfree() on an uninitialized pointer.
> 
> Finally, remove the kfree() for the xattr name, as it is not allocated
> anymore.
> 
> Fixes: 57fe60df6241 ("reiserfs: add atomic addition of selinux attributes during inode creation")
> Cc: stable@vger.kernel.org
> Cc: Jeff Mahoney <jeffm@suse.com>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Reported-by: Mimi Zohar <zohar@linux.ibm.com>
> Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

