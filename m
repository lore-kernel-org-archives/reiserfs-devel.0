From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] reiserfs: use open_bdev_excl
Date: Tue, 29 Apr 2008 20:13:22 +0200
Message-ID: <20080429181322.GA21741@lst.de>
References: <20071226153101.GA2428@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20071226153101.GA2428@lst.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chris.mason@oracle.com, akpm@osdl.org
Cc: linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Wed, Dec 26, 2007 at 04:31:01PM +0100, Christoph Hellwig wrote:
> Use the proper helper to open a blockdevice by name for filesystem
> use, this makes sure it's properly claimed (also added for open-by-number)
> and gets rid of the struct file abuse.
> 
> Tested by mounting a reiserfs filesystem with external journal.

Any reason this still didn't get sent to Linus?

> 
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Index: linux-2.6-xfs/fs/reiserfs/journal.c
> ===================================================================
> --- linux-2.6-xfs.orig/fs/reiserfs/journal.c	2007-12-13 18:55:40.000000000 +0100
> +++ linux-2.6-xfs/fs/reiserfs/journal.c	2007-12-26 15:13:22.000000000 +0100
> @@ -2574,11 +2574,9 @@ static int release_journal_dev(struct su
>  
>  	result = 0;
>  
> -	if (journal->j_dev_file != NULL) {
> -		result = filp_close(journal->j_dev_file, NULL);
> -		journal->j_dev_file = NULL;
> -		journal->j_dev_bd = NULL;
> -	} else if (journal->j_dev_bd != NULL) {
> +	if (journal->j_dev_bd != NULL) {
> +		if (journal->j_dev_bd->bd_dev != super->s_dev)
> +			bd_release(journal->j_dev_bd);
>  		result = blkdev_put(journal->j_dev_bd);
>  		journal->j_dev_bd = NULL;
>  	}
> @@ -2603,7 +2601,6 @@ static int journal_init_dev(struct super
>  	result = 0;
>  
>  	journal->j_dev_bd = NULL;
> -	journal->j_dev_file = NULL;
>  	jdev = SB_ONDISK_JOURNAL_DEVICE(super) ?
>  	    new_decode_dev(SB_ONDISK_JOURNAL_DEVICE(super)) : super->s_dev;
>  
> @@ -2620,35 +2617,34 @@ static int journal_init_dev(struct super
>  					 "cannot init journal device '%s': %i",
>  					 __bdevname(jdev, b), result);
>  			return result;
> -		} else if (jdev != super->s_dev)
> +		} else if (jdev != super->s_dev) {
> +			result = bd_claim(journal->j_dev_bd, journal);
> +			if (result) {
> +				blkdev_put(journal->j_dev_bd);
> +				return result;
> +			}
> +
>  			set_blocksize(journal->j_dev_bd, super->s_blocksize);
> +		}
> +
>  		return 0;
>  	}
>  
> -	journal->j_dev_file = filp_open(jdev_name, 0, 0);
> -	if (!IS_ERR(journal->j_dev_file)) {
> -		struct inode *jdev_inode = journal->j_dev_file->f_mapping->host;
> -		if (!S_ISBLK(jdev_inode->i_mode)) {
> -			reiserfs_warning(super, "journal_init_dev: '%s' is "
> -					 "not a block device", jdev_name);
> -			result = -ENOTBLK;
> -			release_journal_dev(super, journal);
> -		} else {
> -			/* ok */
> -			journal->j_dev_bd = I_BDEV(jdev_inode);
> -			set_blocksize(journal->j_dev_bd, super->s_blocksize);
> -			reiserfs_info(super,
> -				      "journal_init_dev: journal device: %s\n",
> -				      bdevname(journal->j_dev_bd, b));
> -		}
> -	} else {
> -		result = PTR_ERR(journal->j_dev_file);
> -		journal->j_dev_file = NULL;
> +	journal->j_dev_bd = open_bdev_excl(jdev_name, 0, journal);
> +	if (IS_ERR(journal->j_dev_bd)) {
> +		result = PTR_ERR(journal->j_dev_bd);
> +		journal->j_dev_bd = NULL;
>  		reiserfs_warning(super,
>  				 "journal_init_dev: Cannot open '%s': %i",
>  				 jdev_name, result);
> +		return result;
>  	}
> -	return result;
> +
> +	set_blocksize(journal->j_dev_bd, super->s_blocksize);
> +	reiserfs_info(super,
> +		      "journal_init_dev: journal device: %s\n",
> +		      bdevname(journal->j_dev_bd, b));
> +	return 0;
>  }
>  
>  /**
> Index: linux-2.6-xfs/include/linux/reiserfs_fs_sb.h
> ===================================================================
> --- linux-2.6-xfs.orig/include/linux/reiserfs_fs_sb.h	2007-12-13 19:06:58.000000000 +0100
> +++ linux-2.6-xfs/include/linux/reiserfs_fs_sb.h	2007-12-26 15:13:22.000000000 +0100
> @@ -177,7 +177,6 @@ struct reiserfs_journal {
>  	struct reiserfs_journal_cnode *j_last;	/* newest journal block */
>  	struct reiserfs_journal_cnode *j_first;	/*  oldest journal block.  start here for traverse */
>  
> -	struct file *j_dev_file;
>  	struct block_device *j_dev_bd;
>  	int j_1st_reserved_block;	/* first block on s_dev of reserved area journal */
>  
---end quoted text---
