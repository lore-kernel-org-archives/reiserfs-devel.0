From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] fs: reiserfs/xattr.c: Make reiserfs_xattr_handlers
 static
Date: Thu, 23 Aug 2012 17:24:06 +0200
Message-ID: <20120823152406.GA24985@quack.suse.cz>
References: <1343902157-2267-1-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHxctU7NqrW9HZh55=1ehxiWHDC243XrG0kT_UX05AdS9w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK9yfHxctU7NqrW9HZh55=1ehxiWHDC243XrG0kT_UX05AdS9w@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: reiserfs-devel@vger.kernel.org, jack@suse.cz, viro@zeniv.linux.org.uk, patches@linaro.org

On Thu 23-08-12 20:08:55, Sachin Kamat wrote:
> Hi Jan,
> 
> Please pick this patch if it looks ok.
  The patch looks OK. I see that Al didn't pick it up in his tree yet so
I'll take the patch to my tree and push it in the next merge window.

								Honza
> 
> On 2 August 2012 15:39, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> > Silences the following sparse warning:
> > fs/reiserfs/xattr.c:899:28: warning:
> > symbol 'reiserfs_xattr_handlers' was not declared. Should it be static?
> >
> > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > ---
> >  fs/reiserfs/xattr.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> > index d319963..c196369 100644
> > --- a/fs/reiserfs/xattr.c
> > +++ b/fs/reiserfs/xattr.c
> > @@ -896,7 +896,7 @@ static int create_privroot(struct dentry *dentry) { return 0; }
> >  #endif
> >
> >  /* Actual operations that are exported to VFS-land */
> > -const struct xattr_handler *reiserfs_xattr_handlers[] = {
> > +static const struct xattr_handler *reiserfs_xattr_handlers[] = {
> >  #ifdef CONFIG_REISERFS_FS_XATTR
> >         &reiserfs_xattr_user_handler,
> >         &reiserfs_xattr_trusted_handler,
> > --
> > 1.7.4.1
> >
> 
> 
> 
> -- 
> With warm regards,
> Sachin
