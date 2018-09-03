From: Jann Horn <jannh@google.com>
Subject: Re: [PATCH] reiserfs: propagate errors from fill_with_dentries properly
Date: Mon, 3 Sep 2018 18:04:08 +0200
Message-ID: <CAG48ez1eD=govPAZcO0C3Q8VCS0SqqsZFNpV72OvvxouhZt9eQ@mail.gmail.com>
References: <20180802163335.83312-1-jannh@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KtUjP5ObZzzXIgXiAmw4XLtRO+8ysTLyMdkscW0oDWQ=;
        b=dJ2cWVJrkUiPNtJhK4/t6ZST1Wtia/dlZcFVctHQ1Zpqc88dm76PDCh3tjC6SS07JH
         EYvfa+hym65uBjIi/oCIvdUFV6tz+MT5pTMMG+RbmXUjQZFEgnMTeFMr7285Xp+SKNKV
         dksgB5DWWdYjMb4bu6ar4t85b4N+OdfpJJXbUb756xaucA1kmiArLq372e+q53tte2tP
         RpUCs1TQjRmySrcDgjIuf/pAS+0KEW9anKurpfRl8Uzuv3BQaptoFMepNN1CMpnh8Gqx
         NstVSZfbO+KiTnhcN3UF/lAoia8WE+Qq2U3+eBTP0zA0RmufKpCHefIsuQKfoKx1opoR
         nbKA==
In-Reply-To: <20180802163335.83312-1-jannh@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel list <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Eric Biggers <ebiggers@google.com>, Al Viro <viro@zeniv.linux.org.uk>

On Thu, Aug 2, 2018 at 6:33 PM Jann Horn <jannh@google.com> wrote:
>
> fill_with_dentries() failed to propagate errors up to
> reiserfs_for_each_xattr() properly. Plumb them through.
>
> Note that reiserfs_for_each_xattr() is only used by
> reiserfs_delete_xattrs() and reiserfs_chown_xattrs().
> The result of reiserfs_delete_xattrs() is discarded anyway, the only
> difference there is whether a warning is printed to dmesg.
> The result of reiserfs_chown_xattrs() does matter because it can block
> chowning of the file to which the xattrs belong; but either way, the
> resulting state can have misaligned ownership, so my patch doesn't improve
> things greatly.
>
> Credit for making me look at this code goes to Al Viro, who pointed
> out that the ->actor calling convention is suboptimal and should be
> changed.
>
> Signed-off-by: Jann Horn <jannh@google.com>

Ping.

> ---
> I have tested this by manually patching error injection into
> fill_with_dentries().
>
> Opinions? Is this a sensible change?
>
> Because the changes in this patch are more superficial than the changes
> in the other one, I split this out so that the security patch is a
> clean change that obviously belongs in stable and can hopefully go in
> quickly.
>
> After the cases I can see where errors are returned improperly are
> cleaned up, I plan to change the calling convention for ->actor as
> suggested by Al Viro.
>
>  fs/reiserfs/xattr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> index ff94fad477e4..ae4a28410dbd 100644
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -185,6 +185,7 @@ struct reiserfs_dentry_buf {
>         struct dir_context ctx;
>         struct dentry *xadir;
>         int count;
> +       int err;
>         struct dentry *dentries[8];
>  };
>
> @@ -207,6 +208,7 @@ fill_with_dentries(struct dir_context *ctx, const char *name, int namelen,
>
>         dentry = lookup_one_len(name, dbuf->xadir, namelen);
>         if (IS_ERR(dentry)) {
> +               dbuf->err = PTR_ERR(dentry);
>                 return PTR_ERR(dentry);
>         } else if (d_really_is_negative(dentry)) {
>                 /* A directory entry exists, but no file? */
> @@ -215,6 +217,7 @@ fill_with_dentries(struct dir_context *ctx, const char *name, int namelen,
>                                "not found for file %pd.\n",
>                                dentry, dbuf->xadir);
>                 dput(dentry);
> +               dbuf->err = -EIO;
>                 return -EIO;
>         }
>
> @@ -262,6 +265,10 @@ static int reiserfs_for_each_xattr(struct inode *inode,
>                 err = reiserfs_readdir_inode(d_inode(dir), &buf.ctx);
>                 if (err)
>                         break;
> +               if (buf.err) {
> +                       err = buf.err;
> +                       break;
> +               }
>                 if (!buf.count)
>                         break;
>                 for (i = 0; !err && i < buf.count && buf.dentries[i]; i++) {
> --
> 2.18.0.597.ga71716f1ad-goog
>
