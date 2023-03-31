From: Roberto Sassu <roberto.sassu@huaweicloud.com>
Subject: Re: [PATCH v9 1/4] reiserfs: Add security prefix to xattr name in
 reiserfs_security_write()
Date: Fri, 31 Mar 2023 09:02:52 +0200
Message-ID: <27ee02c2f6a01bf5ffd5cb2b29148721cd27c892.camel@huaweicloud.com>
References: <20230329130415.2312521-1-roberto.sassu@huaweicloud.com>
         <20230329130415.2312521-2-roberto.sassu@huaweicloud.com>
         <CAHC9VhRg7twUWXLH0xTaWc2MeSFExkGr9tJztYopzD0JEM-npw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAHC9VhRg7twUWXLH0xTaWc2MeSFExkGr9tJztYopzD0JEM-npw@mail.gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Paul Moore <paul@paul-moore.com>
Cc: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com, stephen.smalley.work@gmail.com, eparis@parisplace.org, casey@schaufler-ca.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, selinux@vger.kernel.org, bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org, nicolas.bouchinet@clip-os.org, Roberto Sassu <roberto.sassu@huawei.com>, stable@vger.kernel.org

On Thu, 2023-03-30 at 17:15 -0400, Paul Moore wrote:
> On Wed, Mar 29, 2023 at 9:05=E2=80=AFAM Roberto Sassu
> <roberto.sassu@huaweicloud.com> wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> >=20
> > Reiserfs sets a security xattr at inode creation time in two stages: fi=
rst,
> > it calls reiserfs_security_init() to obtain the xattr from active LSMs;
> > then, it calls reiserfs_security_write() to actually write that xattr.
> >=20
> > Unfortunately, it seems there is a wrong expectation that LSMs provide =
the
> > full xattr name in the form 'security.<suffix>'. However, LSMs always
> > provided just the suffix, causing reiserfs to not write the xattr at all
> > (if the suffix is shorter than the prefix), or to write an xattr with t=
he
> > wrong name.
> >=20
> > Add a temporary buffer in reiserfs_security_write(), and write to it the
> > full xattr name, before passing it to reiserfs_xattr_set_handle().
> >=20
> > Since the 'security.' prefix is always prepended, remove the name length
> > check.
> >=20
> > Cc: stable@vger.kernel.org # v2.6.x
> > Fixes: 57fe60df6241 ("reiserfs: add atomic addition of selinux attribut=
es during inode creation")
> > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> > ---
> >  fs/reiserfs/xattr_security.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
> > index 6bffdf9a4fd..b0c354ab113 100644
> > --- a/fs/reiserfs/xattr_security.c
> > +++ b/fs/reiserfs/xattr_security.c
> > @@ -95,11 +95,13 @@ int reiserfs_security_write(struct reiserfs_transac=
tion_handle *th,
> >                             struct inode *inode,
> >                             struct reiserfs_security_handle *sec)
> >  {
> > +       char xattr_name[XATTR_NAME_MAX + 1];
> >         int error;
> > -       if (strlen(sec->name) < sizeof(XATTR_SECURITY_PREFIX))
> > -               return -EINVAL;
>=20
> If one really wanted to be paranoid they could verify that
> 'XATTR_SECURITY_PREFIX_LEN + strlen(sec->name) <=3D XATTR_NAME_MAX' and
> return EINVAL, but that really shouldn't be an issue and if the
> concatenation does result in a xattr name that is too big, the
> snprintf() will safely truncate/managle it.

Ok, I could do it.

Thanks

Roberto

> Regardless, this patch is fine with me, but it would be nice if at
> least of the reiserfs/VFS folks could provide an ACK/Reviewed-by tag,
> although I think we can still move forward on this without one of
> those.
>=20
> > -       error =3D reiserfs_xattr_set_handle(th, inode, sec->name, sec->=
value,
> > +       snprintf(xattr_name, sizeof(xattr_name), "%s%s", XATTR_SECURITY=
_PREFIX,
> > +                sec->name);
> > +
> > +       error =3D reiserfs_xattr_set_handle(th, inode, xattr_name, sec-=
>value,
> >                                           sec->length, XATTR_CREATE);
> >         if (error =3D=3D -ENODATA || error =3D=3D -EOPNOTSUPP)
> >                 error =3D 0;
> > --
> > 2.25.1

