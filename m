From: Andrew Morton <akpm@osdl.org>
Subject: Re: [PATCH] Fix of quota deadlock on pagelock
Date: Fri, 19 Nov 2004 14:53:09 -0800
Message-ID: <20041119145309.4acccadc.akpm@osdl.org>
References: <20041119095515.GD15189@atrey.karlin.mff.cuni.cz>
	<20041119100951.GG15189@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22439-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041119100951.GG15189@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Jan Kara <jack@suse.cz> wrote:
>
> +static ssize_t ext2_quota_read(struct super_block *sb, int type, char *data,
> +			       size_t len, loff_t off)
> +{
> +	struct inode *inode = sb_dqopt(sb)->files[type];
> +	unsigned long blk = off >> EXT2_BLOCK_SIZE_BITS(sb);

`blk' should have sector_t type.

> +	int err = 0, offset = off & (sb->s_blocksize - 1), tocopy;

Please do

	int err = 0;
	int offset = off & (sb->s_blocksize - 1);
	int tocopy;

I'll make the above changes.
