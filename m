From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] fs: reiserfs/xattr.c: Make reiserfs_xattr_handlers static
Date: Thu, 23 Aug 2012 20:08:55 +0530
Message-ID: <CAK9yfHxctU7NqrW9HZh55=1ehxiWHDC243XrG0kT_UX05AdS9w@mail.gmail.com>
References: <1343902157-2267-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1343902157-2267-1-git-send-email-sachin.kamat@linaro.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org, jack@suse.cz
Cc: viro@zeniv.linux.org.uk, sachin.kamat@linaro.org, patches@linaro.org

Hi Jan,

Please pick this patch if it looks ok.

On 2 August 2012 15:39, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Silences the following sparse warning:
> fs/reiserfs/xattr.c:899:28: warning:
> symbol 'reiserfs_xattr_handlers' was not declared. Should it be static?
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  fs/reiserfs/xattr.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> index d319963..c196369 100644
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -896,7 +896,7 @@ static int create_privroot(struct dentry *dentry) { return 0; }
>  #endif
>
>  /* Actual operations that are exported to VFS-land */
> -const struct xattr_handler *reiserfs_xattr_handlers[] = {
> +static const struct xattr_handler *reiserfs_xattr_handlers[] = {
>  #ifdef CONFIG_REISERFS_FS_XATTR
>         &reiserfs_xattr_user_handler,
>         &reiserfs_xattr_trusted_handler,
> --
> 1.7.4.1
>



-- 
With warm regards,
Sachin
