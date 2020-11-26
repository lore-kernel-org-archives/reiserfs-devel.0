From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] reiserfs: add check for an invalid ih_entry_count
Date: Thu, 26 Nov 2020 16:57:54 +0100
Message-ID: <20201126155754.GK422@quack2.suse.cz>
References: <20201101140958.3650143-1-rkovhaev@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20201101140958.3650143-1-rkovhaev@gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rustam Kovhaev <rkovhaev@gmail.com>
Cc: alex.shi@linux.alibaba.com, jack@suse.cz, akpm@linux-foundation.org, yeyunfeng@huawei.com, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org

On Sun 01-11-20 06:09:58, Rustam Kovhaev wrote:
> when directory item has an invalid value set for ih_entry_count it might
> trigger use-after-free or out-of-bounds read in bin_search_in_dir_item()
> 
> ih_entry_count * IH_SIZE for directory item should not be larger than
> ih_item_len
> 
> Reported-and-tested-by: syzbot+83b6f7cf9922cae5c4d7@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=83b6f7cf9922cae5c4d7
> Signed-off-by: Rustam Kovhaev <rkovhaev@gmail.com>

Thanks! I've added the patch to my tree and will push it to Linus.

								Honza

> ---
>  fs/reiserfs/stree.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index 8bf88d690729..476a7ff49482 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -454,6 +454,12 @@ static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
>  					 "(second one): %h", ih);
>  			return 0;
>  		}
> +		if (is_direntry_le_ih(ih) && (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE))) {
> +			reiserfs_warning(NULL, "reiserfs-5093",
> +					 "item entry count seems wrong %h",
> +					 ih);
> +			return 0;
> +		}
>  		prev_location = ih_location(ih);
>  	}
>  
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
