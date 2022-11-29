From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v6 4/6] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Tue, 29 Nov 2022 07:39:42 -0800
Message-ID: <50232f2b-d5ce-1e5a-3f5b-8d3eb53fe1ec@schaufler-ca.com>
References: <20221123154712.752074-1-roberto.sassu@huaweicloud.com>
 <20221123154712.752074-5-roberto.sassu@huaweicloud.com>
 <13350b79f708cb089e2ff2ee5cead52bafb10982.camel@linux.ibm.com>
 <bb63eba9a9f24558f4a1acd9bf012b59b5c6e98e.camel@huaweicloud.com>
 <9859294adb0a9b9587ea7fb70a836a312aaf3c69.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1669736389; bh=aS4qJAF4z8K3/s5yGPKxlY1D2luVFB8NMnvEFjOx3S8=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=UCIRYfwJp5dnGKfLWNOCIDvxQZp4JMl8Ebh7ryzXxAMfE1mc5NF4igvFnWL6+NkGFVF3rxe4/oa5TDAMPqAqpuw5CGUu0Rusos4DjUc1BbQXt8gMGQiJ49V8gCaeC3NFpQQZHol8bfrjtLBujY01g3wDrHrstNbOckEkj+r4//CafwKbpv3a+A5hfZ1IsiiG+tZvOETbXPheXY/binn4bWW08BxM7QLHh0Vie9Y2zED9iW+BCbijyfyf2eTDPG66WcsIPzf3FxcSrzp1coaPJqnCx0GzeNLbMJzvNvHXyl3ubcDaBC3m/jEuOzEH093wMqhStd+C5zyJpux9iYozCw==
Content-Language: en-US
In-Reply-To: <9859294adb0a9b9587ea7fb70a836a312aaf3c69.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, casey@schaufler-ca.com

On 11/29/2022 3:23 AM, Mimi Zohar wrote:
> On Thu, 2022-11-24 at 09:17 +0100, Roberto Sassu wrote:
>> On Wed, 2022-11-23 at 20:14 -0500, Mimi Zohar wrote:
>>> Hi Roberto,
>>>
>>> On Wed, 2022-11-23 at 16:47 +0100, Roberto Sassu wrote:
>>>>  int security_inode_init_security(struct inode *inode, struct inode *dir,
>>>>                                  const struct qstr *qstr,
>>>>                                  const initxattrs initxattrs, void *fs_data)
>>>>  {
>>>> -       struct xattr new_xattrs[MAX_LSM_EVM_XATTR + 1];
>>>> -       struct xattr *lsm_xattr, *evm_xattr, *xattr;
>>>> -       int ret;
>>>> +       struct security_hook_list *P;
>>>> +       struct xattr *new_xattrs;
>>>> +       struct xattr *xattr;
>>>> +       int ret = -EOPNOTSUPP, num_filled_xattrs = 0;
>>>>  
>>>>         if (unlikely(IS_PRIVATE(inode)))
>>>>                 return 0;
>>>>  
>>>> +       if (!blob_sizes.lbs_xattr)
>>>> +               return 0;
>>>> +
>>>>         if (!initxattrs)
>>>>                 return call_int_hook(inode_init_security, -EOPNOTSUPP, inode,
>>>> -                                    dir, qstr, NULL, NULL, NULL);
>>>> -       memset(new_xattrs, 0, sizeof(new_xattrs));
>>>> -       lsm_xattr = new_xattrs;
>>>> -       ret = call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir, qstr,
>>>> -                                               &lsm_xattr->name,
>>>> -                                               &lsm_xattr->value,
>>>> -                                               &lsm_xattr->value_len);
>>>> -       if (ret)
>>>> +                                   dir, qstr, NULL);
>>>> +       /* Allocate +1 for EVM and +1 as terminator. */
>>>> +       new_xattrs = kcalloc(blob_sizes.lbs_xattr + 2, sizeof(*new_xattrs),
>>>> +                            GFP_NOFS);
>>>> +       if (!new_xattrs)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       hlist_for_each_entry(P, &security_hook_heads.inode_init_security,
>>>> +                            list) {
>>>> +               ret = P->hook.inode_init_security(inode, dir, qstr, new_xattrs);
>>>> +               if (ret && ret != -EOPNOTSUPP)
>>>> +                       goto out;
>>>> +               if (ret == -EOPNOTSUPP)
>>>> +                       continue;
>>> In this context, -EOPNOTSUPP originally signified that the filesystem
>>> does not support writing xattrs.  Writing any xattr would fail. 
>>> Returning -ENODATA for no LSM xattr(s) data would seem to be more
>>> appropriate than -EOPNOTSUPP.
>> Hi Mimi
>>
>> I thought about adding new return values. Currently only -EOPNOTSUPP
>> and -ENOMEM are expected as errors.
>>
>> However, changing the conventions would mean revisiting the LSMs code
>> and ensuring that they follow the new conventions.
>>
>> I would be more in favor of not touching it.
> Casey, Paul, any comment?

I don't see value in adding -ENODATA as a value special to
the infrastructure. What would the infrastructure do differently?
The use of -EOPNOTSUPP isn't consistent throughout, and the amount
of "correctness" you get by returning -ENODATA is really small.

>
>>>> +               /*
>>>> +                * As the number of xattrs reserved by LSMs is not directly
>>>> +                * available, directly use the total number blob_sizes.lbs_xattr
>>>> +                * to keep the code simple, while being not the most efficient
>>>> +                * way.
>>>> +                */
>>>> +               ret = security_check_compact_filled_xattrs(new_xattrs,
>>>> +                                                          blob_sizes.lbs_xattr,
>>>> +                                                          &num_filled_xattrs);
>>>> +               if (ret < 0) {
>>>> +                       ret = -ENOMEM;
>>>> +                       goto out;
>>>> +               }
>>>> +       }
>>>> +
>>>> +       if (!num_filled_xattrs)
>>>>                 goto out;
>>>>  
>>>> -       evm_xattr = lsm_xattr + 1;
>>>> -       ret = evm_inode_init_security(inode, lsm_xattr, evm_xattr);
>>>> +       ret = evm_inode_init_security(inode, new_xattrs,
>>>> +                                     new_xattrs + num_filled_xattrs);
>>>>         if (ret)
>>>>                 goto out;
>>>>         ret = initxattrs(inode, new_xattrs, fs_data);
>>>>  out:
>>>>         for (xattr = new_xattrs; xattr->value != NULL; xattr++)
>>>>                 kfree(xattr->value);
>>>> +       kfree(new_xattrs);
>>>>         return (ret == -EOPNOTSUPP) ? 0 : ret;
>>>>  }
>>> b
>
