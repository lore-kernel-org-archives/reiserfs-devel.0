From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v4 5/5] evm: Support multiple LSMs providing an xattr
Date: Thu, 17 Nov 2022 12:09:44 -0500
Message-ID: <eda23c9935712cf122bb6a8929b53835d56df6cb.camel@linux.ibm.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
         <20221110094639.3086409-6-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=P6bVVTs1DEkKUn+owkyBSAOzyaJeKvl7bEJ6DG9N340=;
 b=p22IQdwLtM/mDQhoB3qaw6HO3DKxYDerJhvBI/tU3eNxGzf6oDnidoSVWCb1710IFMXV
 Qy+CBXqKfmN/2XZfNewyG5ISBhszpSRf58Sd5XIx79MU0kIo8TBiKm2V3i3C59OE+4Rp
 gWFaY5PPHqiKyiO3/muSdDHcSPc2ebjmv17WJZ1+6nkMCiR7L+ZA0JN9TNB3xi23GG1k
 BsGQ2OcJQkwROtWQBecgZa6ZR2VmZ09JAKfEQjlagCUOZ3hQEKozxAsy5s+EcOlQLI48
 wmUFERd0QHgkpCINJxj2MjDZMKVjZHnZUS3GQTql9j7ZrbVIs/fkK/IBG9qzLA4fH3Iy bA== 
In-Reply-To: <20221110094639.3086409-6-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, 2022-11-10 at 10:46 +0100, Roberto Sassu wrote:
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

Thanks, Roberto.  This looks good.

Mimi

