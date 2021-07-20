From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Subject: Re: [PATCH] reiserfs: check directry items on read from disk
Date: Tue, 20 Jul 2021 13:01:25 +0530
Message-ID: <YPZ7zUVAedCkx3IQ@fedora>
References: <20210709152929.766363-1-chouhan.shreyansh630@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gUHafvxPwffprBDYSwA9wJOKwLPsSD3F5l3zpE9j23w=;
        b=TLIfURQuaAwET7qHx0eINAHcT6VgTFPGuK1mPbLHdOkC6Ub8DYvVNHLxW8LYhsoyEI
         JK9+c/b6pbiHiphOWE58UgnCm5isMU3X2OtkTIvHpl12n0I+UQLkIb3L7GOKEfqfG2Wg
         5zW+tcfWcNBmzaQUSSLvJfuxNaADOaux4+oWc/h49SMk1HSynpe6pYTICvcr20oRwCBl
         hx/Pq79rvGmWyK7ePuppPX/0nbECiiXYgipeDYdy5PKj/Bw5xMMcx19DWncN6UlpoJ0n
         rU4C7Eue5gN9anBxKIIZs1aPaB7cd6DqcUKRO2uiNAagaTyzbnVI/ro9rmr7Ctjux/4i
         97VA==
Content-Disposition: inline
In-Reply-To: <20210709152929.766363-1-chouhan.shreyansh630@gmail.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rkovhaev@gmail.com, jack@suse.cz
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com

Hi,

Just a ping for reviews/merge since there has been no activity on this patch.

Thank you,
Shreyansh Chouhan

On Fri, Jul 09, 2021 at 08:59:29PM +0530, Shreyansh Chouhan wrote:
> 
> While verifying the leaf item that we read from the disk, reiserfs
> doesn't check the directory items, this could cause a crash when we
> read a directory item from the disk that has an invalid deh_location.
> 
> This patch adds a check to the directory items read from the disk that
> does a bounds check on deh_location for the directory entries. Any
> directory entry header with a directory entry offset greater than the
> item length is considered invalid.
> 
> Reported-by: syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com
> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> ---
>  fs/reiserfs/stree.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index 476a7ff49482..ef42729216d1 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -387,6 +387,24 @@ void pathrelse(struct treepath *search_path)
>  	search_path->path_length = ILLEGAL_PATH_ELEMENT_OFFSET;
>  }
>  
> +static int has_valid_deh_location(struct buffer_head *bh, struct item_head *ih)
> +{
> +	struct reiserfs_de_head *deh;
> +	int i;
> +
> +	deh = B_I_DEH(bh, ih);
> +	for (i = 0; i < ih_entry_count(ih); i++) {
> +		if (deh_location(&deh[i]) > ih_item_len(ih)) {
> +			reiserfs_warning(NULL, "reiserfs-5094",
> +					 "directory entry location seems wrong %h",
> +					 &deh[i]);
> +			return 0;
> +		}
> +	}
> +
> +	return 1;
> +}
> +
>  static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
>  {
>  	struct block_head *blkh;
> @@ -454,11 +472,14 @@ static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
>  					 "(second one): %h", ih);
>  			return 0;
>  		}
> -		if (is_direntry_le_ih(ih) && (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE))) {
> -			reiserfs_warning(NULL, "reiserfs-5093",
> -					 "item entry count seems wrong %h",
> -					 ih);
> -			return 0;
> +		if (is_direntry_le_ih(ih)) {
> +			if (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE)) {
> +				reiserfs_warning(NULL, "reiserfs-5093",
> +						 "item entry count seems wrong %h",
> +						 ih);
> +				return 0;
> +			}
> +			return has_valid_deh_location(bh, ih);
>  		}
>  		prev_location = ih_location(ih);
>  	}
> -- 
> 2.31.1
> 
