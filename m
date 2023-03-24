From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v8 4/6] security: Allow all LSMs to provide xattrs for
 inode_init_security hook
Date: Fri, 24 Mar 2023 10:17:09 -0400
Message-ID: <CAHC9VhRxsY6B3dL7db4b8bfznEz6rK2qiaDug4Hc_ywvU3vB5A@mail.gmail.com>
References: <20230314081720.4158676-1-roberto.sassu@huaweicloud.com>
 <20230314081720.4158676-5-roberto.sassu@huaweicloud.com> <CAHC9VhTD3EyDiJs9+NQrgp84JcUs_sx8WONtRk2YYH4m1C8nVw@mail.gmail.com>
 <5d8d802a-7664-fdf0-52ef-5817634d870d@schaufler-ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1679667440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyz70q0exwlxpG0yMPJfrMAVsSG+06PVBNztaJhtJqo=;
        b=AOQvr9b4IDlun2P9WBqyFgYrZnRMnWkZbi7nKD1h77svDtysp3k2+svumSz94wRohI
         DHZZwnayCvXPboUZHbIPyaInyWGXe1MZU80EoiXvTGptGU5x9ycbCOmJQPEv5+ToeKhI
         M28EIQd9BR39cjtGdwuyZiW6Z7sHOCN3XEb/+rDt/zaSbv28B5BeAQweq/nnqcNzKhfQ
         8dNPfrfNpTMGHcndWQbl5qRBpRC+A5GBdNdTaoP1dpsA4MjG2imDAtn4mnZCDF0V7zF9
         v0rIKu1s/EOQIUsfRTFmsVupWgV2UUt+PQt8qEAWmu6B4mKm/O6meI3joa44DP3+Dbq0
         WgiQ==
In-Reply-To: <5d8d802a-7664-fdf0-52ef-5817634d870d@schaufler-ca.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>, mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>

On Thu, Mar 23, 2023 at 9:01=E2=80=AFPM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
> On 3/23/2023 5:09 PM, Paul Moore wrote:
> > On Tue, Mar 14, 2023 at 4:19=E2=80=AFAM Roberto Sassu
> > <roberto.sassu@huaweicloud.com> wrote:

...

> >> diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
> >> index c2be66c669a..75a2f85b49d 100644
> >> --- a/include/linux/lsm_hooks.h
> >> +++ b/include/linux/lsm_hooks.h
> >> @@ -63,6 +63,7 @@ struct lsm_blob_sizes {
> >>         int     lbs_ipc;
> >>         int     lbs_msg_msg;
> >>         int     lbs_task;
> >> +       int     lbs_xattr; /* number of xattr slots in new_xattrs arra=
y */
> >
> > No need for the comment, we don't do it for the other fields.
>
> I asked for the comment. lbs_xattr is the number of entries, which is
> different from the other fields. The other fields contain blob sizes in
> bytes. Inconsistent behavior should be noted.

Fair enough.  Since that's the case, let's encode something in the
field name itself so that every user has a slight reminder that it is
a count and not a size.  How about 'lbs_xattr_count' or similar?

--=20
paul-moore.com
