From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v4 2/5] security: Rewrite
 security_old_inode_init_security()
Date: Fri, 18 Nov 2022 10:04:37 +0100
Message-ID: <5758e5c4-9c8b-4492-3ecd-ba6607fc2899@huaweicloud.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
 <20221110094639.3086409-3-roberto.sassu@huaweicloud.com>
 <3dc4f389ead98972cb7d09ef285a0065decb0ad0.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <3dc4f389ead98972cb7d09ef285a0065decb0ad0.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, ocfs2-devel@oss.oracle.com

On 11/17/2022 2:03 PM, Mimi Zohar wrote:
> Hi Roberto,
> 
> On Thu, 2022-11-10 at 10:46 +0100, Roberto Sassu wrote:
>> From: Roberto Sassu <roberto.sassu@huawei.com>
>>
>> Rewrite security_old_inode_init_security() to call
>> security_inode_init_security() before making changes to support multiple
>> LSMs providing xattrs. Do it so that the required changes are done only in
>> one place.
> 
> Only security_inode_init_security() has support for EVM.   Making
> security_old_inode_init_security() a wrapper for
> security_inode_init_security() could result in security.evm extended
> attributes being created that previously weren't created.

Hi Mimi

yes, I thought about this problem. In fact, it should not matter too 
much. Since security_old_inode_init_security() supports setting only one 
xattr: if there is an LSM xattr, that one will be set, and the EVM one 
will be discarded; if there is no LSM xattr, EVM would not add one.

> In fact ocfs2 defines ocfs2_init_security_get() as a wrapper for both
> the old and new inode_init_security calls based on the caller's
> preference.   Only mknod and symlink seem to use the old function.
> Wondering why do they differentiate between callers?  (Cc'ing the ocfs2
> mailing list as they're affected by this change.)
> 
> "[PATCH v4 1/5] reiserfs: Add missing calls to
> reiserfs_security_free()"  fixed a memory leak.  I couldn't tell if
> there was a similar memory leak in ocfs2, the only other user of
> security_old_inode_init_security().

Will look into it.

> As ocfs2 already defines initxattrs, that leaves only reiserfs missing
> initxattrs().  A better, cleaner solution would be to define one.

Yes, great idea!

Thanks

Roberto

> thanks,
> 
> Mimi
> 
>>
>> Define the security_initxattrs() callback and pass it to
>> security_inode_init_security() as argument, to obtain the first xattr
>> provided by LSMs.
>>
>> This behavior is a bit different from the current one. Before this patch
>> calling call_int_hook() could cause multiple LSMs to provide an xattr,
>> since call_int_hook() does not stop when an LSM returns zero. The caller of
>> security_old_inode_init_security() receives the last xattr set. The pointer
>> of the xattr value of previous LSMs is lost, causing memory leaks.
>>
>> However, in practice, this scenario does not happen as the only in-tree
>> LSMs providing an xattr at inode creation time are SELinux and Smack, which
>> are mutually exclusive.
>>
>> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>b

