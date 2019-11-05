From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: replace open-coded atomic_dec_and_mutex_lock()
Date: Tue, 5 Nov 2019 12:25:18 +0100
Message-ID: <20191105112518.GM22379@quack2.suse.cz>
References: <20191103094431.GA18576-nikitas.angelinas@gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191103094431.GA18576-nikitas.angelinas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikitas Angelinas <nikitas.angelinas@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, zhengbin@vostro.suse.de, zhengbin13@huawei.com, Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun 03-11-19 01:44:54, Nikitas Angelinas wrote:
> Replace the open-coded logic of atomic_dec_and_mutex_lock() in
> reiserfs_file_release().
> 
> Signed-off-by: Nikitas Angelinas <nikitas.angelinas@gmail.com>

Thanks! The patch looks good to me. I've added it to my tree.

								Honza

> ---
>  fs/reiserfs/file.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/reiserfs/file.c b/fs/reiserfs/file.c
> index 843aadc..84cf8bd 100644
> --- a/fs/reiserfs/file.c
> +++ b/fs/reiserfs/file.c
> @@ -38,16 +38,10 @@ static int reiserfs_file_release(struct inode *inode, struct file *filp)
>  
>  	BUG_ON(!S_ISREG(inode->i_mode));
>  
> -        if (atomic_add_unless(&REISERFS_I(inode)->openers, -1, 1))
> +	if (!atomic_dec_and_mutex_lock(&REISERFS_I(inode)->openers,
> +				       &REISERFS_I(inode)->tailpack))
>  		return 0;
>  
> -	mutex_lock(&REISERFS_I(inode)->tailpack);
> -
> -        if (!atomic_dec_and_test(&REISERFS_I(inode)->openers)) {
> -		mutex_unlock(&REISERFS_I(inode)->tailpack);
> -		return 0;
> -	}
> -
>  	/* fast out for when nothing needs to be done */
>  	if ((!(REISERFS_I(inode)->i_flags & i_pack_on_close_mask) ||
>  	     !tail_has_to_be_packed(inode)) &&
> -- 
> 2.10.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
