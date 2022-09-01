From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v2 07/14] ntfs3: replace ll_rw_block()
Date: Thu, 1 Sep 2022 17:47:38 +0200
Message-ID: <20220901154738.6b5gti2w2y2f4see@quack3>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-8-yi.zhang@huawei.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1662047258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=peOjY+qH/acfnYJmHx1YRVDMdJv9R64hwm8Pmaa0lFE=;
        b=rc5JraMEONNabeyE/eWQdGR9l2bhyHcEvaCTH7da6qgpRryhdZ2horY0ZO0nbPl5wR5apB
        LSadiiEXMpz7u7e4vw2MEK+FRq2D7vgplUwdcjEUFBc58CCNwxP82cjZQqVyGNOwQPGKgH
        ENrRcNH86XZQxwpAwSZsss0tIdOUB5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1662047258;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=peOjY+qH/acfnYJmHx1YRVDMdJv9R64hwm8Pmaa0lFE=;
        b=lHHvX7qWz+dxQf+Jx4+FQrtDcN8aJLRk0wdWYaGsd477gh8eQUeNBFBoy60w0LGTBaLHrS
        1r+WjBl4PQh8QmBQ==
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-8-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com

On Thu 01-09-22 21:34:58, Zhang Yi wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that submitting read IO if the buffer has been locked. We
> could get false positive EIO after wait_on_buffer() if the buffer has
> been locked by others. So stop using ll_rw_block() in
> ntfs_get_block_vbo().
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ntfs3/inode.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index 51363d4e8636..cadbfa111539 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -630,12 +630,9 @@ static noinline int ntfs_get_block_vbo(struct inode *inode, u64 vbo,
>  			bh->b_size = block_size;
>  			off = vbo & (PAGE_SIZE - 1);
>  			set_bh_page(bh, page, off);
> -			ll_rw_block(REQ_OP_READ, 1, &bh);
> -			wait_on_buffer(bh);
> -			if (!buffer_uptodate(bh)) {
> -				err = -EIO;
> +			err = bh_read(bh, 0);
> +			if (err < 0)
>  				goto out;
> -			}
>  			zero_user_segment(page, off + voff, off + block_size);
>  		}
>  	}
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
