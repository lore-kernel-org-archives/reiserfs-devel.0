From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH (resend)] reiserfs: update reiserfs_xattrs_initialized()
 condition
Date: Mon, 15 Mar 2021 09:44:21 +0900
Message-ID: <a05b4603-c2ee-7e11-6616-9c5f99324108@i-love.sakura.ne.jp>
References: <000000000000f5be7f05afcf862a@google.com>
 <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Can somebody review and pick up this trivial patch?
This bug is currently 6th top crasher for syzbot.

On 2021/03/05 15:31, Tetsuo Handa wrote:
> syzbot is reporting NULL pointer dereference at reiserfs_security_init()
> [1], for commit ab17c4f02156c4f7 ("reiserfs: fixup xattr_root caching") is
> assuming that REISERFS_SB(s)->xattr_root != NULL in
> reiserfs_xattr_jcreate_nblocks() despite that commit made
> REISERFS_SB(sb)->priv_root != NULL && REISERFS_SB(s)->xattr_root == NULL
> case possible.
> 
> I guess that commit 6cb4aff0a77cc0e6 ("reiserfs: fix oops while creating
> privroot with selinux enabled") wanted to check xattr_root != NULL before
> reiserfs_xattr_jcreate_nblocks(), for the changelog is talking about the
> xattr root.
> 
>  The issue is that while creating the privroot during mount
>  reiserfs_security_init calls reiserfs_xattr_jcreate_nblocks which
>  dereferences the xattr root.  The xattr root doesn't exist, so we get an
>  oops.
> 
> Therefore, update reiserfs_xattrs_initialized() to check both the privroot
> and the xattr root.
> 
> [1] https://syzkaller.appspot.com/bug?id=8abaedbdeb32c861dc5340544284167dd0e46cde
> 
> Reported-and-tested-by: syzbot <syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Fixes: 6cb4aff0a77cc0e6 ("reiserfs: fix oops while creating privroot with selinux enabled")
> ---
>  fs/reiserfs/xattr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/reiserfs/xattr.h b/fs/reiserfs/xattr.h
> index c764352447ba..81bec2c80b25 100644
> --- a/fs/reiserfs/xattr.h
> +++ b/fs/reiserfs/xattr.h
> @@ -43,7 +43,7 @@ void reiserfs_security_free(struct reiserfs_security_handle *sec);
>  
>  static inline int reiserfs_xattrs_initialized(struct super_block *sb)
>  {
> -	return REISERFS_SB(sb)->priv_root != NULL;
> +	return REISERFS_SB(sb)->priv_root && REISERFS_SB(sb)->xattr_root;
>  }
>  
>  #define xattr_size(size) ((size) + sizeof(struct reiserfs_xattr_header))
> 

