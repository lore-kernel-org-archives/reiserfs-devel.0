From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v7 4/6] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Mon, 20 Feb 2023 07:43:24 -0500
Message-ID: <22f48112c2fbc2812317c33af13accb022e9abdf.camel@linux.ibm.com>
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
         <20221201104125.919483-5-roberto.sassu@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=RjFiIL2vWgM7tyrPIzie4SN6UpJPtmIUWHUc+QpTxjc=;
 b=pc7eJe6H4AvhAHMxn++6uGWF1g7J+9JXzTOhLh8tpEXZCg3xL9Et43K6QhpMtShldcg0
 VWlfCjbGzxtdCpe+5Hbxz+tmk2gqQHRw6Mp3L45SISfSb9z5b0hhJ0+wCPIrozNC1xoo
 e7GOCKAAeV2GQ182WX57HHKFZcnCB+xK9vdvslbyflieZYUpxUcKwMnjEnKxTcspIetN
 vHSJoR+fgF3F+VMaMv90Dn3jofybEF28li3MwKDvZOfaqDisw6GiCNLALZBU2zm7uIi7
 C43zBNiZpksGSYZ7Rdb8S1UglV2FzuTg1m6MQ4zLTRVCFH3Wy1lXwJyVu1aCkIbCqaeI +w== 
In-Reply-To: <20221201104125.919483-5-roberto.sassu@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, 2022-12-01 at 11:41 +0100, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> Currently, security_inode_init_security() supports only one LSM providing
> an xattr and EVM calculating the HMAC on that xattr, plus other inode
> metadata.
> 
> Allow all LSMs to provide one or multiple xattrs, by extending the security
> blob reservation mechanism. Introduce the new lbs_xattr field of the
> lsm_blob_sizes structure, so that each LSM can specify how many xattrs it
> needs, and the LSM infrastructure knows how many xattr slots it should
> allocate.
> 
> Dynamically allocate the xattrs array to be populated by LSMs with the
> inode_init_security hook, and pass it to the latter instead of the
> name/value/len triple. Update the documentation accordingly, and fix the
> description of the xattr name, as it is not allocated anymore.
> 
> Since the LSM infrastructure, at initialization time, updates the number of
> the requested xattrs provided by each LSM with a corresponding offset in
> the security blob (in this case the xattr array), it makes straightforward
> for an LSM to access the right position in the xattr array.
> 
> There is still the issue that an LSM might not fill the xattr, even if it
> requests it (legitimate case, for example it might have been loaded but not
> initialized with a policy). Since users of the xattr array (e.g. the
> initxattrs() callbacks) detect the end of the xattr array by checking if
> the xattr name is NULL, not filling an xattr would cause those users to
> stop scanning xattrs prematurely.
> 
> Solve that issue by introducing security_check_compact_filled_xattrs(),
> which does a basic check of the xattr array (if the xattr name is filled,
> the xattr value should be too, and viceversa), and compacts the xattr array
> by removing the holes.
> 
> An alternative solution would be to let users of the xattr array know the
> number of elements of that array, so that they don't have to check the
> termination. However, this seems more invasive, compared to a simple move
> of few array elements.
> 
> security_check_compact_filled_xattrs() also determines how many xattrs in
> the xattr array have been filled. If there is none, skip
> evm_inode_init_security() and initxattrs(). Skipping the former also avoids
> EVM to crash the kernel, as it is expecting a filled xattr.
> 
> Finally, adapt both SELinux and Smack to use the new definition of the
> inode_init_security hook, and to correctly fill the designated slots in the
> xattr array. For Smack, reserve space for the other defined xattrs although
> they are not set yet in smack_inode_init_security().
> 
> Reported-by: Nicolas Bouchinet <nicolas.bouchinet@clip-os.org> (EVM crash)
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

