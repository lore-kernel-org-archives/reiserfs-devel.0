From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v6 4/6] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Thu, 24 Nov 2022 09:17:51 +0100
Message-ID: <bb63eba9a9f24558f4a1acd9bf012b59b5c6e98e.camel@huaweicloud.com>
References: <20221123154712.752074-1-roberto.sassu@huaweicloud.com>
         <20221123154712.752074-5-roberto.sassu@huaweicloud.com>
         <13350b79f708cb089e2ff2ee5cead52bafb10982.camel@linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <13350b79f708cb089e2ff2ee5cead52bafb10982.camel@linux.ibm.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mimi Zohar <zohar@linux.ibm.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Wed, 2022-11-23 at 20:14 -0500, Mimi Zohar wrote:
> Hi Roberto,
> 
> On Wed, 2022-11-23 at 16:47 +0100, Roberto Sassu wrote:
> >  int security_inode_init_security(struct inode *inode, struct inode *dir,
> >                                  const struct qstr *qstr,
> >                                  const initxattrs initxattrs, void *fs_data)
> >  {
> > -       struct xattr new_xattrs[MAX_LSM_EVM_XATTR + 1];
> > -       struct xattr *lsm_xattr, *evm_xattr, *xattr;
> > -       int ret;
> > +       struct security_hook_list *P;
> > +       struct xattr *new_xattrs;
> > +       struct xattr *xattr;
> > +       int ret = -EOPNOTSUPP, num_filled_xattrs = 0;
> >  
> >         if (unlikely(IS_PRIVATE(inode)))
> >                 return 0;
> >  
> > +       if (!blob_sizes.lbs_xattr)
> > +               return 0;
> > +
> >         if (!initxattrs)
> >                 return call_int_hook(inode_init_security, -EOPNOTSUPP, inode,
> > -                                    dir, qstr, NULL, NULL, NULL);
> > -       memset(new_xattrs, 0, sizeof(new_xattrs));
> > -       lsm_xattr = new_xattrs;
> > -       ret = call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir, qstr,
> > -                                               &lsm_xattr->name,
> > -                                               &lsm_xattr->value,
> > -                                               &lsm_xattr->value_len);
> > -       if (ret)
> > +                                   dir, qstr, NULL);
> > +       /* Allocate +1 for EVM and +1 as terminator. */
> > +       new_xattrs = kcalloc(blob_sizes.lbs_xattr + 2, sizeof(*new_xattrs),
> > +                            GFP_NOFS);
> > +       if (!new_xattrs)
> > +               return -ENOMEM;
> > +
> > +       hlist_for_each_entry(P, &security_hook_heads.inode_init_security,
> > +                            list) {
> > +               ret = P->hook.inode_init_security(inode, dir, qstr, new_xattrs);
> > +               if (ret && ret != -EOPNOTSUPP)
> > +                       goto out;
> > +               if (ret == -EOPNOTSUPP)
> > +                       continue;
> 
> In this context, -EOPNOTSUPP originally signified that the filesystem
> does not support writing xattrs.  Writing any xattr would fail. 
> Returning -ENODATA for no LSM xattr(s) data would seem to be more
> appropriate than -EOPNOTSUPP.

Hi Mimi

I thought about adding new return values. Currently only -EOPNOTSUPP
and -ENOMEM are expected as errors.

However, changing the conventions would mean revisiting the LSMs code
and ensuring that they follow the new conventions.

I would be more in favor of not touching it.

Thanks

Roberto

> thanks,
> 
> Mimi
> 
> > +               /*
> > +                * As the number of xattrs reserved by LSMs is not directly
> > +                * available, directly use the total number blob_sizes.lbs_xattr
> > +                * to keep the code simple, while being not the most efficient
> > +                * way.
> > +                */
> > +               ret = security_check_compact_filled_xattrs(new_xattrs,
> > +                                                          blob_sizes.lbs_xattr,
> > +                                                          &num_filled_xattrs);
> > +               if (ret < 0) {
> > +                       ret = -ENOMEM;
> > +                       goto out;
> > +               }
> > +       }
> > +
> > +       if (!num_filled_xattrs)
> >                 goto out;
> >  
> > -       evm_xattr = lsm_xattr + 1;
> > -       ret = evm_inode_init_security(inode, lsm_xattr, evm_xattr);
> > +       ret = evm_inode_init_security(inode, new_xattrs,
> > +                                     new_xattrs + num_filled_xattrs);
> >         if (ret)
> >                 goto out;
> >         ret = initxattrs(inode, new_xattrs, fs_data);
> >  out:
> >         for (xattr = new_xattrs; xattr->value != NULL; xattr++)
> >                 kfree(xattr->value);
> > +       kfree(new_xattrs);
> >         return (ret == -EOPNOTSUPP) ? 0 : ret;
> >  }
> b

