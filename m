From: Jens Axboe <axboe@suse.de>
Subject: Re: [PATCH] Fix of quota deadlock on pagelock
Date: Sun, 21 Nov 2004 17:02:54 +0100
Message-ID: <20041121160251.GH26240@suse.de>
References: <20041119095515.GD15189@atrey.karlin.mff.cuni.cz> <20041119100951.GG15189@atrey.karlin.mff.cuni.cz> <20041119150227.072c676a.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22465-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041119150227.072c676a.akpm@osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

On Fri, Nov 19 2004, Andrew Morton wrote:
> Jan Kara <jack@suse.cz> wrote:
> >
> > +static ssize_t ext2_quota_write(struct super_block *sb, int type,
> > +				const char *data, size_t len, loff_t off)
> > +{
> > +	struct inode *inode = sb_dqopt(sb)->files[type];
> > +	unsigned long blk = off >> EXT2_BLOCK_SIZE_BITS(sb);
> > +	int err = 0, offset = off & (sb->s_blocksize - 1), tocopy;
> > +	size_t towrite = len;
> > +	struct buffer_head tmp_bh, *bh;
> > +
> > +	down(&inode->i_sem);
> > +	while (towrite > 0) {
> > +		tocopy = sb->s_blocksize - offset < towrite ?
> > +				sb->s_blocksize - offset : towrite;
> > +
> > +		tmp_bh.b_state = 0;
> > +		err = ext2_get_block(inode, blk, &tmp_bh, 1);
> > +		if (err)
> > +			goto out;
> > +		if (offset || tocopy != EXT2_BLOCK_SIZE(sb))
> > +			bh = sb_bread(sb, tmp_bh.b_blocknr);
> > +		else
> > +			bh = sb_getblk(sb, tmp_bh.b_blocknr);
> > +		if (!bh) {
> > +			err = -EIO;
> > +			goto out;
> > +		}
> > +		memcpy(bh->b_data+offset, data, tocopy);
> 
> It is possible to mmap block devices, so we should do a flush_dcache_page()
> after the memset here.
> 
> Also, we should lock the buffer.  Because a concurrent read of the blockdev
> would cause the disk DMA transfer to stomp all over the data whihc you just
> wrote.  Say, someone is doing `cp /dev/hda1 /dev/null' at the same time.
> 
> So my accumulated patch against this one is:
> 
> 
> diff -puN fs/ext2/super.c~fix-of-quota-deadlock-on-pagelock-ext2-tweaks fs/ext2/super.c
> --- 25/fs/ext2/super.c~fix-of-quota-deadlock-on-pagelock-ext2-tweaks	Fri Nov 19 14:54:47 2004
> +++ 25-akpm/fs/ext2/super.c	Fri Nov 19 15:00:59 2004
> @@ -1020,10 +1020,13 @@ static ssize_t ext2_quota_read(struct su
>  			       size_t len, loff_t off)
>  {
>  	struct inode *inode = sb_dqopt(sb)->files[type];
> -	unsigned long blk = off >> EXT2_BLOCK_SIZE_BITS(sb);
> -	int err = 0, offset = off & (sb->s_blocksize - 1), tocopy;
> +	sector_t blk = off >> EXT2_BLOCK_SIZE_BITS(sb);
> +	int err = 0;
> +	int offset = off & (sb->s_blocksize - 1);
> +	int tocopy;
>  	size_t toread;
> -	struct buffer_head tmp_bh, *bh;
> +	struct buffer_head tmp_bh;
> +	struct buffer_head *bh;
>  	loff_t i_size = i_size_read(inode);
>  
>  	if (off > i_size)
> @@ -1061,10 +1064,13 @@ static ssize_t ext2_quota_write(struct s
>  				const char *data, size_t len, loff_t off)
>  {
>  	struct inode *inode = sb_dqopt(sb)->files[type];
> -	unsigned long blk = off >> EXT2_BLOCK_SIZE_BITS(sb);
> -	int err = 0, offset = off & (sb->s_blocksize - 1), tocopy;
> +	sector_t blk = off >> EXT2_BLOCK_SIZE_BITS(sb);
> +	int err = 0;
> +	int offset = off & (sb->s_blocksize - 1);
> +	int tocopy;
>  	size_t towrite = len;
> -	struct buffer_head tmp_bh, *bh;
> +	struct buffer_head tmp_bh;
> +	struct buffer_head *bh;
>  
>  	down(&inode->i_sem);
>  	while (towrite > 0) {
> @@ -1083,9 +1089,12 @@ static ssize_t ext2_quota_write(struct s
>  			err = -EIO;
>  			goto out;
>  		}
> +		lock_buffer(bh);
>  		memcpy(bh->b_data+offset, data, tocopy);
> +		flush_dcache_page(&bh->b_page);
                                  ^^^

bh->b_page

-- 
Jens Axboe

