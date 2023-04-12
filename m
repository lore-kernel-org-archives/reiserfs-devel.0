From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH] Smack modifications for: security: Allow all LSMs to
 provide xattrs for inode_init_security hook
Date: Wed, 12 Apr 2023 13:29:38 -0700
Message-ID: <72b46d0f-75c7-ac18-4984-2bf1d6dad352@schaufler-ca.com>
References: <c7f38789-fe47-8289-e73a-4d07fbaf791d@schaufler-ca.com>
 <20230411172337.340518-1-roberto.sassu@huaweicloud.com>
 <2dc6486f-ce9b-f171-14fe-48a90386e1b7@schaufler-ca.com>
 <8e7705972a0f306922d8bc4893cf940e319abb19.camel@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1681331385; bh=2/Rleu8Lgu7q0ljiF/HtbOjKUdbZsdOnZo+57VAAZvM=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=ZNQe0acWsnezWAr9imAaYciSRhEGmpeG1bneEIx+25R7FTEUE04Urvs3s0T3Ws0mAhAzF2YOZM10zL87RJGe/BMhmpQjp4xkpiNYctVpJLoztHCo2UgefsRxv1JNMkWyKKQjVFx8xhGAKdwUKl4XZruZrXqkHCGSUTqQoTY5b9DAsaIAZo9V3vXa9EH5k5fcg3vxc4uuS36sunTxJDFOCmWWzQvbbXg97/KdmqWNcjfMeD2xFFMbHAI7WX2WMh0B4x1hRT5Nomx0Jmk0rd/H+UIDvXM8WEHw6LF/O2h8jo9Xo8dUhWuucog/Fen7PpBqP+ricJsmESMSAp3/YGtP2w==
Content-Language: en-US
In-Reply-To: <8e7705972a0f306922d8bc4893cf940e319abb19.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, Casey Schaufler <casey@schaufler-ca.com>

On 4/12/2023 12:22 AM, Roberto Sassu wrote:
> On Tue, 2023-04-11 at 10:54 -0700, Casey Schaufler wrote:
>> On 4/11/2023 10:23 AM, Roberto Sassu wrote:
>>> From: Roberto Sassu <roberto.sassu@huawei.com>
>>>
>>> Very very quick modification. Not tested.
>>>
>>> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
>>> ---
>>>  security/smack/smack.h     |  2 +-
>>>  security/smack/smack_lsm.c | 42 ++++++++++++++++++++------------------
>>>  2 files changed, 23 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/security/smack/smack.h b/security/smack/smack.h
>>> index e2239be7bd6..f00c8498c60 100644
>>> --- a/security/smack/smack.h
>>> +++ b/security/smack/smack.h
>>> @@ -127,7 +127,7 @@ struct task_smack {
>>>  
>>>  #define	SMK_INODE_INSTANT	0x01	/* inode is instantiated */
>>>  #define	SMK_INODE_TRANSMUTE	0x02	/* directory is transmuting */
>>> -#define	SMK_INODE_CHANGED	0x04	/* smack was transmuted */
>>> +#define	SMK_INODE_CHANGED	0x04	/* smack was transmuted (unused) */
>> See below ...
>>
>>>  #define	SMK_INODE_IMPURE	0x08	/* involved in an impure transaction */
>>>  
>>>  /*
>>> diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
>>> index 8392983334b..b43820bdbd0 100644
>>> --- a/security/smack/smack_lsm.c
>>> +++ b/security/smack/smack_lsm.c
>>> @@ -54,12 +54,12 @@
>>>  
>>>  /*
>>>   * Smack uses multiple xattrs.
>>> - * SMACK64 - for access control, SMACK64EXEC - label for the program,
>>> - * SMACK64MMAP - controls library loading,
>>> + * SMACK64 - for access control,
>>>   * SMACK64TRANSMUTE - label initialization,
>>> - * Not saved on files - SMACK64IPIN and SMACK64IPOUT
>>> + * Not saved on files - SMACK64IPIN and SMACK64IPOUT,
>>> + * Must be set explicitly - SMACK64EXEC and SMACK64MMAP
>>>   */
>>> -#define SMACK_INODE_INIT_XATTRS 4
>>> +#define SMACK_INODE_INIT_XATTRS 2
>>>  
>>>  #ifdef SMACK_IPV6_PORT_LABELING
>>>  static DEFINE_MUTEX(smack_ipv6_lock);
>>> @@ -957,11 +957,11 @@ static int smack_inode_init_security(struct inode *inode, struct inode *dir,
>>>  				     const struct qstr *qstr,
>>>  				     struct xattr *xattrs, int *xattr_count)
>>>  {
>>> -	struct inode_smack *issp = smack_inode(inode);
>>>  	struct smack_known *skp = smk_of_current();
>>>  	struct smack_known *isp = smk_of_inode(inode);
>>>  	struct smack_known *dsp = smk_of_inode(dir);
>>>  	struct xattr *xattr = lsm_get_xattr_slot(xattrs, xattr_count);
>>> +	struct xattr *xattr2;
>> I'm going to channel Paul and suggest this be xattr_transmute instead of xattr2.
>> It also looks like it could move to be declared in the if clause.
>>
>>>  	int may;
>>>  
>>>  	if (xattr) {
>>> @@ -979,7 +979,17 @@ static int smack_inode_init_security(struct inode *inode, struct inode *dir,
>>>  		if (may > 0 && ((may & MAY_TRANSMUTE) != 0) &&
>>>  		    smk_inode_transmutable(dir)) {
>>>  			isp = dsp;
>>> -			issp->smk_flags |= SMK_INODE_CHANGED;
>> I think you need to keep this. More below.
>>
>>> +			xattr2 = lsm_get_xattr_slot(xattrs, xattr_count);
>>> +			if (xattr2) {
>>> +				xattr2->value = kmemdup(TRANS_TRUE,
>>> +							TRANS_TRUE_SIZE,
>>> +							GFP_NOFS);
>>> +				if (xattr2->value == NULL)
>>> +					return -ENOMEM;
>>> +
>>> +				xattr2->value_len = TRANS_TRUE_SIZE;
>>> +				xattr2->name = XATTR_NAME_SMACKTRANSMUTE;
>>> +			}
>>>  		}
>>>  
>>>  		xattr->value = kstrdup(isp->smk_known, GFP_NOFS);
>>> @@ -3512,20 +3522,12 @@ static void smack_d_instantiate(struct dentry *opt_dentry, struct inode *inode)
>>>  			 * If there is a transmute attribute on the
>>>  			 * directory mark the inode.
>>>  			 */
>>> -			if (isp->smk_flags & SMK_INODE_CHANGED) {
>>> -				isp->smk_flags &= ~SMK_INODE_CHANGED;
>>> -				rc = __vfs_setxattr(&nop_mnt_idmap, dp, inode,
>>> -					XATTR_NAME_SMACKTRANSMUTE,
>>> -					TRANS_TRUE, TRANS_TRUE_SIZE,
>>> -					0);
>>> -			} else {
>>> -				rc = __vfs_getxattr(dp, inode,
>>> -					XATTR_NAME_SMACKTRANSMUTE, trattr,
>>> -					TRANS_TRUE_SIZE);
>>> -				if (rc >= 0 && strncmp(trattr, TRANS_TRUE,
>>> -						       TRANS_TRUE_SIZE) != 0)
>>> -					rc = -EINVAL;
>>> -			}
>>> +			rc = __vfs_getxattr(dp, inode,
>>> +					    XATTR_NAME_SMACKTRANSMUTE, trattr,
>>> +					    TRANS_TRUE_SIZE);
>>> +			if (rc >= 0 && strncmp(trattr, TRANS_TRUE,
>>> +					       TRANS_TRUE_SIZE) != 0)
>>> +				rc = -EINVAL;
>> Where is the SMACK64_TRANSMUTE attribute going to get set on the file?
>> It's not going to get set in smack_init_inode_security(). The inode will
> Isn't that the purpose of the inode_init_security hook?

No. It initializes the in-memory inode. 

> After all LSMs provide one or multiple xattrs, xattrs are going to be
> written to the disk with the initxattr() callback of filesystems.
>
> There is a small mistake above (XATTR_SMACK_TRANSMUTE instead
> of XATTR_NAME_SMACKTRANSMUTE, as we are providing just the suffix).
>
> After fixing that, Smack tests succeed:

It's over a decade since I seriously looked at this code path,
but I'm pretty sure the __vfs_setxattr() call is necessary to get
the attribute written out. With your change the in-memory inode will
get the attribute, but if you reboot it won't be on the directory.

>
> 95 Passed, 0 Failed, 100% Success rate
>
> There was a test failing in dir-transmute.sh, before I fixed the xattr
> name.
>
> Thanks
>
> Roberto
>
>> know it's transmuting, but it won't get to disk without the __vfs_setxattr()
>> here in smack_d_instantiate(). Now, it's been a long time since that code
>> was written, so I could be wrong, but I'm pretty sure about that.
>>
>> I think that you should be fine with the changes in smack_init_inode_security(),
>> and leaving smack_d_instantiate() untouched. 
>>
>>>  			if (rc >= 0)
>>>  				transflag = SMK_INODE_TRANSMUTE;
>>>  		}
