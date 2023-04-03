From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v10 0/4] evm: Do HMAC of multiple per LSM xattrs for new
 inodes
Date: Mon, 03 Apr 2023 06:36:33 -0400
Message-ID: <3b6c773045d73ba1dcdb80dd9c6b7afcbd62cc42.camel@linux.ibm.com>
References: <20230331123221.3273328-1-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=6Znlgc7WgH1YZnYgmuzPeUYORB1yzDqcHa2rVABuxc4=;
 b=IUYkLbtVR7usaQuKXuG914mA0g/1veQghrL12MU8R3zQaCrcNzfisFbQlAuWLfDsp277
 G50YhmEr4jviXpf3hHMoPzTFGWXEu2u7rjSFTaJ0NA5U3F8amhqLSdwaaN1k+nQqRW/J
 V9RSL9OAsCX3SVYu+k56mVQzJi1cfUlmcdLZfA81+x54ZnbnazUJ0Q9fxyh9tXXCgHbw
 O49BSpBBeaD8YulWRdokV46Dq2+BxsG3CpHgaz42v7tgWqjPlQgmZcyQIXsRlw+lvQfG
 TtvMGGt3nlWDEngOR2NQP+Xv9OgdnED7glvQfMv1eXuuhN+VxqpCxiigrZZzZvvMdfxS 7Q== 
In-Reply-To: <20230331123221.3273328-1-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Fri, 2023-03-31 at 14:32 +0200, Roberto Sassu wrote:

> Changelog
> 
> v9:
> - Ensure in reiserfs_security_write() that the full xattr name is not
>   larger than XATTR_NAME_MAX
> - Rename num_filled_xattrs to xattr_count everywhere (suggested by Paul)
> - Rename lsm_find_xattr_slot() to lsm_get_xattr_slot() and add a proper
>   documentation (suggested by Paul)
> - Return zero instead of -EOPNOTSUPP in evm_inode_init_security()
>   (suggested by Paul)
> - Remove additional checks of new_xattrs array in
>   security_inode_init_security() (suggested by Paul)
> - Handle the !initxattrs case similarly to the initxattrs case, except for
>   not allocating the new_xattrs array in the former (suggested by Paul)
> - Remove local variable xattr in security_inode_init_security(), and use
>   xattr_count instead for loop termination (suggested by Paul)
> 
> v8:
> - Add a new reiserfs patch to write the full xattr name
> - Add num_filled_xattrs parameter to inode_init_security hook (suggested by
>   Paul) and evm_inode_init_security()
> - Change default return value of inode_init_security hook to -EOPNOTSUPP
> - Rename lbs_xattr field of lsm_blob_sizes to lbs_xattr_count
> - Introduce lsm_find_xattr_slot() helper
> - Rename lsm_xattr parameter of evm_init_hmac() to xattrs
> - Retrieve the EVM xattr slot with lsm_find_xattr_slot() and double check
>   with the xattr array terminator
> - Remove security_check_compact_filled_xattrs() (suggested by Paul)

Much better without security_check_compact_filled_xattrs().  Thank you!

> - Update security_inode_init_security() documentation
> - Ensure that inode_init_security hook incremented the number of filled
>   slots if it returned zero
> - Ensure that xattr name and value are non-NULL in the filled slots
> - Add the xattr name assignment after the xattr value one (suggested by
>   Paul)
> - Drop patches 1 - 3 (already in lsm/next)
> 

-- 
thanks,

Mimi

