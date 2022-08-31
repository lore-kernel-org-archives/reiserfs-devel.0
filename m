From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 13/14] ext2: replace bh_submit_read() helper with
 bh_read_locked()
Date: Wed, 31 Aug 2022 13:15:51 +0200
Message-ID: <20220831111551.pjrcx2ld6wm5trct@quack3>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
 <20220831072111.3569680-14-yi.zhang@huawei.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1661944551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oXzaBEvTVV7dbi9myeynRQQFCXVdxVJKtZqX81xMy8k=;
        b=mPbi7U2qKIanPKYVB8sPf2stChvWwJ1COvVr00O/9AJRZvghUomaQbB0KyXkUy4pMnVLKr
        w/6h+8ghNadTMJGE7oK3ErbM4mfCpj2CGsMQK4AHXb36lCPabynaouGuZ/Z5Agk4IDg2j4
        pSdrP2QZlF517bgBQJnIFu8gpi74cQg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1661944551;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oXzaBEvTVV7dbi9myeynRQQFCXVdxVJKtZqX81xMy8k=;
        b=+8l5+Kxjd5pNwOzZL5ohw7iQDKbEQCrFZuuYixoYezrMKq3W4lXTV40FstJ3qPyZO5S3mg
        Ln5047YJolJZx8Dg==
Content-Disposition: inline
In-Reply-To: <20220831072111.3569680-14-yi.zhang@huawei.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Yi <yi.zhang@huawei.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, cluster-devel@redhat.com, ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu, akpm@linux-foundation.org, axboe@kernel.dk, viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com, almaz.alexandrovich@paragon-software.com, mark@fasheh.com, dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com, yukuai3@huawei.com

On Wed 31-08-22 15:21:10, Zhang Yi wrote:
> bh_submit_read() is almost the same as bh_read_locked(), switch to use
> bh_read_locked() in read_block_bitmap(), prepare remove the old one.
> 
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
...
> diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
> index c17ccc19b938..548a1d607f5a 100644
> --- a/fs/ext2/balloc.c
> +++ b/fs/ext2/balloc.c
> @@ -142,7 +142,7 @@ read_block_bitmap(struct super_block *sb, unsigned int block_group)
>  	if (likely(bh_uptodate_or_lock(bh)))
>  		return bh;
>  
> -	if (bh_submit_read(bh) < 0) {
> +	if (bh_read_locked(bh, 0) < 0) {

I would just use bh_read() here and thus remove a bit more of the
boilerplate code (like the bh_uptodate_or_lock() checking).

							Honza

>  		brelse(bh);
>  		ext2_error(sb, __func__,
>  			    "Cannot read block bitmap - "
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
