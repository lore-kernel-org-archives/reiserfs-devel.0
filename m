From: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] reiserfs: Initialize sec->length in reiserfs_security_init().
Date: Sat, 20 May 2023 15:47:03 -0400
Message-ID: <CAHC9VhSEd5BK=ROaN7wMB4WtGMZ=vXz7gQk=xjjn1-mbp_RWSQ@mail.gmail.com>
References: <000000000000d368dd05fb5dd7d3@google.com> <a800496b-cae9-81bf-c79e-d8342418c5be@I-love.SAKURA.ne.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1684612034; x=1687204034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ue7/cVqXgfA7kNhmyGLtkRQz93W3e/8NXAw0hFFNEc=;
        b=EKM8LbVJ8GwlUQJKb8kSEWKvl/Y3bVBhzHr9a6f3ZaoSou91MibiqYCFMlODRo7jas
         45I+9RQNUhElZgHYD+OzSsLZRLMkdeytpKkSIkQNUzpIJNsFxMyvNRm1pZ7RIlH9FPkz
         braS+fSGZmX+jTylltN6Iws1WIh5kwNAJjF+u1NCrhn89UamcoEwiRyyBFkDHSF9Nv8s
         2lnQ6RxMZt++jZLr0bod3bVekOktBgDImXSp/8f3u0J+HVFSz3P46cpi57IAPxLyxcvg
         mLjIAkFhRsSYeZ2pgTyN5dQxE/mwLil1TjYwghRYsciJIBBY2CCehvaMIwtw7UQ/sPWo
         W6sA==
In-Reply-To: <a800496b-cae9-81bf-c79e-d8342418c5be@I-love.SAKURA.ne.jp>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: syzbot <syzbot+00a3779539a23cbee38c@syzkaller.appspotmail.com>, syzkaller-bugs@googlegroups.com, Roberto Sassu <roberto.sassu@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>, Casey Schaufler <casey@schaufler-ca.com>, reiserfs-devel@vger.kernel.org, glider@google.com, linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org

On Thu, May 11, 2023 at 10:49=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> syzbot is reporting that sec->length is not initialized.
>
> Since security_inode_init_security() returns 0 when initxattrs is provide=
d
> but call_int_hook(inode_init_security) returned -EOPNOTSUPP, control will
> reach to "if (sec->length && ...) {" without initializing sec->length.
>
> Reported-by: syzbot <syzbot+00a3779539a23cbee38c@syzkaller.appspotmail.co=
m>
> Closes: https://syzkaller.appspot.com/bug?extid=3D00a3779539a23cbee38c
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Fixes: 52ca4b6435a4 ("reiserfs: Switch to security_inode_init_security()"=
)
> ---
>  fs/reiserfs/xattr_security.c | 1 +
>  1 file changed, 1 insertion(+)

Adding the LSM list to the CC line.

> diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
> index 6e0a099dd788..078dd8cc312f 100644
> --- a/fs/reiserfs/xattr_security.c
> +++ b/fs/reiserfs/xattr_security.c
> @@ -67,6 +67,7 @@ int reiserfs_security_init(struct inode *dir, struct in=
ode *inode,
>
>         sec->name =3D NULL;
>         sec->value =3D NULL;
> +       sec->length =3D 0;
>
>         /* Don't add selinux attributes on xattrs - they'll never get use=
d */
>         if (IS_PRIVATE(dir))
> --
> 2.18.4

--=20
paul-moore.com
