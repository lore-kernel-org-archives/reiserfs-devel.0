From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v4 3/5] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Fri, 18 Nov 2022 10:10:14 -0500
Message-ID: <3ffb9bb4ab203b5e0459c3892ded4ae0cd80458b.camel@linux.ibm.com>
References: <20221110094639.3086409-1-roberto.sassu@huaweicloud.com>
         <20221110094639.3086409-4-roberto.sassu@huaweicloud.com>
         <4c1349f670dc3c23214a5a5036e43ddaa0a7bc89.camel@linux.ibm.com>
         <fe16a03a-102e-b3e1-cc3f-5bad3c28fad7@huaweicloud.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Y2UvQmjEHBmBO9sNhKQBGwJHhJnDxOWzhbaj8DgVzWw=;
 b=nZRkLhWL+tNLuHdi1AtjFYR7UbvP8nnPXuv9JxAhmDbRRe6pqEFFb1Ou4J6hUD4KZ/Et
 Bvowt7EgaMvEnGCCDQ+I8MRdGNIgrcsodwdZj/136UfH2Kp74s9gm0hedfhspRzMOLDS
 7+y+joXnS52fQ2KSN04oK/jJPNnuMG69hGPxmvW8pvMsKnFO5Le80no1gh80zLAC4pVR
 p6ntQtu4RrQQUyWsWyQzPdaXI2UxpcWIxQUxggygr6GrGO8DPbcKx23Evx/uSOQaNa0I
 kaixdBbC6FcwXAUCAXDj8tUJGXssvUMaqOUwh1Rnp3km9tLMi6Bu4yZXulaO0UBbk/f9 ew== 
In-Reply-To: <fe16a03a-102e-b3e1-cc3f-5bad3c28fad7@huaweicloud.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, dmitry.kasatkin@gmail.com, paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Fri, 2022-11-18 at 10:14 +0100, Roberto Sassu wrote:
> >> +static int security_check_compact_xattrs(struct xattr *xattrs,
> >> +                                     int num_xattrs, int *checked_xattrs)
> > 
> > Perhaps the variable naming is off, making it difficult to read.   So
> > although this is a static function, which normally doesn't require a
> > comment, it's definitely needs one.
> 
> Ok, will improve it.
> 
> >> +{
> >> +    int i;
> >> +
> >> +    for (i = *checked_xattrs; i < num_xattrs; i++) {
> > 
> > If the number of "checked" xattrs was kept up to date, removing the
> > empty xattr gaps wouldn't require a loop.  Is the purpose of this loop
> > to support multiple per LSM xattrs?
> 
> An LSM might reserve one or more xattrs, but not set it/them (for 
> example because it is not initialized). In this case, removing the gaps 
> is needed for all subsequent LSMs.

Including this sort of info in the function description or as a comment
in the code would definitely simplify review.

security_check_compact_xattrs() is called in the loop after getting
each LSM's xattr(s).  Only the current LSMs xattrs need to be
compressed, yet the loop goes to the maximum number of xattrs each
time. Just wondering if there is a way of improving it.

-- 
thanks,

Mimi

