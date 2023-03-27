From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v8 4/6] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Mon, 27 Mar 2023 09:29:54 +0200
Message-ID: <8b63d00d8ac3f686e51889ea4fc8d83f8ecb300d.camel@huaweicloud.com>
References: <20230314081720.4158676-1-roberto.sassu@huaweicloud.com>
         <20230314081720.4158676-5-roberto.sassu@huaweicloud.com>
         <CAHC9VhTD3EyDiJs9+NQrgp84JcUs_sx8WONtRk2YYH4m1C8nVw@mail.gmail.com>
         <939e6c88662ad90b963993c4cc1b702083e74a7a.camel@huaweicloud.com>
         <ffc86b3907f7b87d3c568ae62bea3cdb3275be4e.camel@huaweicloud.com>
         <CAHC9VhRNjvjMOF5KLM6BoGfk=QpEBs_ur_CgRdGL5R1bA-JAwg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhRNjvjMOF5KLM6BoGfk=QpEBs_ur_CgRdGL5R1bA-JAwg@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Paul Moore <paul@paul-moore.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Fri, 2023-03-24 at 17:39 -0400, Paul Moore wrote:
> On Fri, Mar 24, 2023 at 9:26 AM Roberto Sassu
> <roberto.sassu@huaweicloud.com> wrote:
> > On Fri, 2023-03-24 at 11:18 +0100, Roberto Sassu wrote:
> > > On Thu, 2023-03-23 at 20:09 -0400, Paul Moore wrote:
> > > > On Tue, Mar 14, 2023 at 4:19 AM Roberto Sassu
> > > > <roberto.sassu@huaweicloud.com> wrote:
> > > > > From: Roberto Sassu <roberto.sassu@huawei.com>
> > > > > 
> > > > > Currently, security_inode_init_security() supports only one LSM providing
> > > > > an xattr and EVM calculating the HMAC on that xattr, plus other inode
> > > > > metadata.
> > > > > 
> > > > > Allow all LSMs to provide one or multiple xattrs, by extending the security
> > > > > blob reservation mechanism. Introduce the new lbs_xattr field of the
> > > > > lsm_blob_sizes structure, so that each LSM can specify how many xattrs it
> > > > > needs, and the LSM infrastructure knows how many xattr slots it should
> > > > > allocate.
> > > > > 
> > > > > Dynamically allocate the xattrs array to be populated by LSMs with the
> > > > > inode_init_security hook, and pass it to the latter instead of the
> > > > > name/value/len triple. Update the documentation accordingly, and fix the
> > > > > description of the xattr name, as it is not allocated anymore.
> > > > > 
> > > > > Since the LSM infrastructure, at initialization time, updates the number of
> > > > > the requested xattrs provided by each LSM with a corresponding offset in
> > > > > the security blob (in this case the xattr array), it makes straightforward
> > > > > for an LSM to access the right position in the xattr array.
> > > > > 
> > > > > There is still the issue that an LSM might not fill the xattr, even if it
> > > > > requests it (legitimate case, for example it might have been loaded but not
> > > > > initialized with a policy). Since users of the xattr array (e.g. the
> > > > > initxattrs() callbacks) detect the end of the xattr array by checking if
> > > > > the xattr name is NULL, not filling an xattr would cause those users to
> > > > > stop scanning xattrs prematurely.
> > > > > 
> > > > > Solve that issue by introducing security_check_compact_filled_xattrs(),
> > > > > which does a basic check of the xattr array (if the xattr name is filled,
> > > > > the xattr value should be too, and viceversa), and compacts the xattr array
> > > > > by removing the holes.
> > > > > 
> > > > > An alternative solution would be to let users of the xattr array know the
> > > > > number of elements of that array, so that they don't have to check the
> > > > > termination. However, this seems more invasive, compared to a simple move
> > > > > of few array elements.
> > > > > 
> > > > > security_check_compact_filled_xattrs() also determines how many xattrs in
> > > > > the xattr array have been filled. If there is none, skip
> > > > > evm_inode_init_security() and initxattrs(). Skipping the former also avoids
> > > > > EVM to crash the kernel, as it is expecting a filled xattr.
> > > > > 
> > > > > Finally, adapt both SELinux and Smack to use the new definition of the
> > > > > inode_init_security hook, and to correctly fill the designated slots in the
> > > > > xattr array. For Smack, reserve space for the other defined xattrs although
> > > > > they are not set yet in smack_inode_init_security().
> > > > > 
> > > > > Reported-by: Nicolas Bouchinet <nicolas.bouchinet@clip-os.org> (EVM crash)
> > > > > Link: https://lore.kernel.org/linux-integrity/Y1FTSIo+1x+4X0LS@archlinux/
> > > > > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > > > > Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> > > > > Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> > > > > ---
> > > > >  include/linux/lsm_hook_defs.h |   3 +-
> > > > >  include/linux/lsm_hooks.h     |   1 +
> > > > >  security/security.c           | 119 +++++++++++++++++++++++++++++-----
> > > > >  security/selinux/hooks.c      |  19 ++++--
> > > > >  security/smack/smack_lsm.c    |  33 ++++++----
> > > > >  5 files changed, 137 insertions(+), 38 deletions(-)
> 
> ...
> 
> > > > > @@ -1604,33 +1654,66 @@ int security_inode_init_security(struct inode *inode, struct inode *dir,
> > > > >                                  const struct qstr *qstr,
> > > > >                                  const initxattrs initxattrs, void *fs_data)
> > > > >  {
> > > > > -       struct xattr new_xattrs[MAX_LSM_EVM_XATTR + 1];
> > > > > -       struct xattr *lsm_xattr, *evm_xattr, *xattr;
> > > > > -       int ret;
> > > > > +       struct security_hook_list *P;
> > > > > +       struct xattr *new_xattrs;
> > > > > +       struct xattr *xattr;
> > > > > +       int ret = -EOPNOTSUPP, num_filled_xattrs = 0;
> > > > > 
> > > > >         if (unlikely(IS_PRIVATE(inode)))
> > > > >                 return 0;
> > > > > 
> > > > > +       if (!blob_sizes.lbs_xattr)
> > > > > +               return 0;
> > > > > +
> > > > >         if (!initxattrs)
> > > > >                 return call_int_hook(inode_init_security, -EOPNOTSUPP, inode,
> > > > > -                                    dir, qstr, NULL, NULL, NULL);
> > > > > -       memset(new_xattrs, 0, sizeof(new_xattrs));
> > > > > -       lsm_xattr = new_xattrs;
> > > > > -       ret = call_int_hook(inode_init_security, -EOPNOTSUPP, inode, dir, qstr,
> > > > > -                           &lsm_xattr->name,
> > > > > -                           &lsm_xattr->value,
> > > > > -                           &lsm_xattr->value_len);
> > > > > -       if (ret)
> > > > > +                                   dir, qstr, NULL);
> > > > > +       /* Allocate +1 for EVM and +1 as terminator. */
> > > > > +       new_xattrs = kcalloc(blob_sizes.lbs_xattr + 2, sizeof(*new_xattrs),
> > > > > +                            GFP_NOFS);
> > > > > +       if (!new_xattrs)
> > > > > +               return -ENOMEM;
> > > > > +
> > > > > +       hlist_for_each_entry(P, &security_hook_heads.inode_init_security,
> > > > > +                            list) {
> > > > > +               ret = P->hook.inode_init_security(inode, dir, qstr, new_xattrs);
> > > > > +               if (ret && ret != -EOPNOTSUPP)
> > > > > +                       goto out;
> > > > > +               /*
> > > > > +                * As documented in lsm_hooks.h, -EOPNOTSUPP in this context
> > > > > +                * means that the LSM is not willing to provide an xattr, not
> > > > > +                * that it wants to signal an error. Thus, continue to invoke
> > > > > +                * the remaining LSMs.
> > > > > +                */
> > > > > +               if (ret == -EOPNOTSUPP)
> > > > > +                       continue;
> > > > > +               /*
> > > > > +                * As the number of xattrs reserved by LSMs is not directly
> > > > > +                * available, directly use the total number blob_sizes.lbs_xattr
> > > > > +                * to keep the code simple, while being not the most efficient
> > > > > +                * way.
> > > > > +                */
> > > > 
> > > > Is there a good reason why the LSM can't return the number of xattrs
> > > > it is adding to the xattr array?  It seems like it should be fairly
> > > > trivial for the individual LSMs to determine and it could save a lot
> > > > of work.  However, given we're at v8 on this patchset I'm sure I'm
> > > > missing something obvious, can you help me understand why the idea
> > > > above is crazy stupid? ;)
> > 
> > Much simple answer. Yes, LSMs could return the number of xattrs set,
> > but security_check_compact_filled_xattrs() also needs to know from
> > which offset (the lbs_xattr of each LSM) it should start compacting.
> > 
> > Example: suppose that you have three LSMs with:
> > 
> > LSM#1: lbs_xattr 1
> > LSM#2: lbs_xattr 2 (disabled)
> > LSM#3: lbs_xattr 1
> > 
> > The current compaction interval is: already compacted xattrs - end of
> > new_xattr array.
> > 
> > When the security_inode_init_security() loop calls LSM#3, the
> > compaction interval is: 1 - 2 (LSM#2 returns 0), which clearly isn't
> > right. The correct compaction interval should be: 3 - 4.
> > 
> > Going to the end of new_xattrs is an approximation, but it ensures
> > that security_check_compact_filled_xattrs() reaches the xattr set by
> > LSM#3.
> > 
> > The alternative I was mentioning of passing num_filled_xattrs to LSMs
> > goes again in the direction of doing on-the-fly compaction, while LSMs
> > are more familiar with using the lbs_* fields.
> 
> I guess I was thinking of the case where the LSM layer, i.e.
> security_inode_init_security(), allocates an xattr array like it does
> now based on the maximum number of xattrs possible using the
> lsm_blob_sizes values and passes a pointer to the individual LSMs
> which is incremented based on how many xattrs are created by the
> individual LSMs.  Here is some *very* rough pseudo code:
> 
> int security_inode_init_security(...)
> {
> 
>   /* allocate an xattr array */
>   xattrs = kcalloc(blob_sizes, sizeof(*xattrs), GFP_BLAH);
> 
>   /* loop on the lsms */
>   xa_cnt = 0;
>   while (lsm_hooks) {
>     rc = call_hook(lsm_hook, &xattrs[xa_cnt]);
>     if (rc > 0)
>       xa_cnt += rc;
>   }
> 
>   /* evm magic */
>   evm_inode_init_security(...)
> }
> 
> Does that work?  Am I missing something?

Oh, unfortunately not. EVM needs to see all xattrs (when it is moved to
the LSM infrastructure).

Thanks

Roberto

