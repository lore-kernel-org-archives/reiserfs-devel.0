From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v4 3/5] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Mon, 21 Nov 2022 15:58:05 -0500
Message-ID: <5e88d4bfae90d642fcf84a0c0937a9e4359ef4b2.camel@linux.ibm.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
         <20221110094639.3086409-4-roberto.sassu@huaweicloud.com>
         <4c1349f670dc3c23214a5a5036e43ddaa0a7bc89.camel@linux.ibm.com>
         <fe16a03a-102e-b3e1-cc3f-5bad3c28fad7@huaweicloud.com>
         <3ffb9bb4ab203b5e0459c3892ded4ae0cd80458b.camel@linux.ibm.com>
         <fb3f423a-a56e-b6ed-d1e7-476605d607f8@schaufler-ca.com>
         <ad7bfa59a3a89ccad52574e2f9fb8965dbaa1620.camel@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=yYc1UjR/X0mjO1Si4MpoQ9ZWzXiCM44IGVCFBM9HksM=;
 b=fHjSzlbvKCNmzvyWRhEFoCgf2kFmVcWJXPbWqTecv0fMIK82bWxcZ9T60FGJ4Kge14LT
 uNry1lRdag0s7wKlV2WF8JJ5HfaS6Tu7xpFOUUp9cip3XNY8DxOw9oURAPFQrXK5lSo/
 AubsE6A5VF9XJHCbKC8vcmx3Ij0aAaqbNYx58HGVpy8NcLGrNeq3s3m5rFp7ldkSO1In
 0kg4FW+6KBVcM0nfU2wi56MUsGg7jb/sDSBadvye/M5FUEgQM67EK7RJ7jjOMyh8vdP9
 iq58VqneeuRBHSqO6BAdBZwMAM3FEqTV41b7nF3zBAEzSLk4ukHsjyBRoONYc49L0yv5 3A== 
In-Reply-To: <ad7bfa59a3a89ccad52574e2f9fb8965dbaa1620.camel@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, Casey Schaufler <casey@schaufler-ca.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Mon, 2022-11-21 at 14:29 +0100, Roberto Sassu wrote:
> On Fri, 2022-11-18 at 09:31 -0800, Casey Schaufler wrote:
> > On 11/18/2022 7:10 AM, Mimi Zohar wrote:
> > > On Fri, 2022-11-18 at 10:14 +0100, Roberto Sassu wrote:
> > > > > > +static int security_check_compact_xattrs(struct xattr *xattrs,
> > > > > > +                                     int num_xattrs, int *checked_xattrs)
> > > > > Perhaps the variable naming is off, making it difficult to read.   So
> > > > > although this is a static function, which normally doesn't require a
> > > > > comment, it's definitely needs one.
> > > > Ok, will improve it.
> > > > 
> > > > > > +{
> > > > > > +    int i;
> > > > > > +
> > > > > > +    for (i = *checked_xattrs; i < num_xattrs; i++) {
> > > > > If the number of "checked" xattrs was kept up to date, removing the
> > > > > empty xattr gaps wouldn't require a loop.  Is the purpose of this loop
> > > > > to support multiple per LSM xattrs?
> > > > An LSM might reserve one or more xattrs, but not set it/them (for 
> > > > example because it is not initialized). In this case, removing the gaps 
> > > > is needed for all subsequent LSMs.
> > > Including this sort of info in the function description or as a comment
> > > in the code would definitely simplify review.
> > > 
> > > security_check_compact_xattrs() is called in the loop after getting
> > > each LSM's xattr(s).  Only the current LSMs xattrs need to be
> > > compressed, yet the loop goes to the maximum number of xattrs each
> > > time. Just wondering if there is a way of improving it.
> > 
> > At security module registration each module could identify how
> > many xattrs it uses. That number could be used to limit the range
> > of the loop. I have to do similar things for the forthcoming LSM
> > syscalls and module stacking beyond that.
> 
> Yes, blob_sizes.lbs_xattr contains the total number of xattrs requested
> by LSMs. To stop the loop earlier, at the offset of the next LSM, we
> would need to search the LSM's lsm_info, using the LSM name in
> the security_hook_list structure. Although it is not optimal, not doing
> it makes the code simpler. I could do that, if preferred.

Either way is fine, as long as the code is readable.  At minimum add a
comment.

-- 
thanks,

Mimi




