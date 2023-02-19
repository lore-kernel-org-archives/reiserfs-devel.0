From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v7 3/6] security: Remove
 security_old_inode_init_security()
Date: Sun, 19 Feb 2023 14:41:51 -0500
Message-ID: <6b695665f9188087fce6e693d46a7d4088ffebd4.camel@linux.ibm.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <20221201104125.919483-4-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=1Lm6G//TtEY+92KWMgEexavCALyHAPzjuFrffbAZvAo=;
 b=jRO5tCNxrXC6dRGkv7AKMoRb7AYwy5I3BUuXgMk1tCHYsz/uUv6U3vKMhm9H0VdMeiOX
 wKufqenv5jErM4jkneDshjJJicXKt8LchVrUjjZu+CvGn2KfGiIF0FlYjVb4NUw6euu7
 4ceffMFznYetxdMZVK0gqZjFCa8JcGJZc1Bj4P6ElsgEutZnoep/XdI4q3V6TIhl+YbH
 4Z4b1+PKkw8JGjzA+qGppRpJWLl4iazqVhQi/xtaSBHocW1lvCdiOFormh2Sok7uCn6X
 jZrN7tiXk2Qj+5xdAgASE3p6UtuaLD593YpawValwWO0+6s8898TBriLiW07uaUCCCiP GQ== 
In-Reply-To: <20221201104125.919483-4-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, 2022-12-01 at 11:41 +0100, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> As the remaining two users reiserfs and ocfs2 switched to
> security_inode_init_security(), security_old_inode_init_security() can be
> now removed.
> 
> Out-of-tree kernel modules should switch to security_inode_init_security()
> too.
> 
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>

Once the ocfs2 (2/6) concerns are addressed,
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

