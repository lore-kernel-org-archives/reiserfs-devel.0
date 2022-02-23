From: Dave Chinner <david@fromorbit.com>
Subject: Re: [PATCH] reiserfs: Deprecate reiserfs
Date: Thu, 24 Feb 2022 08:31:27 +1100
Message-ID: <20220223213127.GI3061737@dread.disaster.area>
References: <20220223142653.22388-1-jack@suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220223142653.22388-1-jack@suse.cz>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Edward Shishkin <edward.shishkin@gmail.com>

On Wed, Feb 23, 2022 at 03:26:53PM +0100, Jan Kara wrote:
> Reiserfs is relatively old filesystem and its development has ceased
> quite some years ago. Linux distributions moved away from it towards
> other filesystems such as btrfs, xfs, or ext4. To reduce maintenance
> burden on cross filesystem changes (such as new mount API, iomap, folios
> ...) let's add a deprecation notice when the filesystem is mounted and
> schedule its removal to 2024.

Two years might be considered "short notice" for a filesystem, but I
guess that people running it because it is stable will most likely
also linger on stable kernels where it will live "maintained" for
many years after it has been removed from the upstream code base.

> Signed-off-by: Jan Kara <jack@suse.cz>
> ---
>  fs/reiserfs/Kconfig | 10 +++++++---
>  fs/reiserfs/super.c |  2 ++
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> Here's my suggestion for deprecating reiserfs. If nobody has reasons against
> this, I'll send the patch to Linus during the next merge window.

Is there a deprecation/removal schedule somewhere that documents
stuff like this? We documented in the XFS section of the kernel
admin guide (where we also document mount option and
sysctl deprecation and removal schedules), but I don't think
anything like that exists for reiserfs or for filesystems in
general.

Other than that, the patch looks good.

Cheers,

Dave.

> 
> diff --git a/fs/reiserfs/Kconfig b/fs/reiserfs/Kconfig
> index 8fd54ed8f844..eafee53ddabc 100644
> --- a/fs/reiserfs/Kconfig
> +++ b/fs/reiserfs/Kconfig
> @@ -1,10 +1,14 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config REISERFS_FS
> -	tristate "Reiserfs support"
> +	tristate "Reiserfs support (deprecated)"
>  	select CRC32
>  	help
> -	  Stores not just filenames but the files themselves in a balanced
> -	  tree.  Uses journalling.
> +	  Reiserfs is deprecated and scheduled to be removed from the kernel
> +	  in 2024. If you are still using it, please migrate to another
> +	  filesystem or tell us your usecase for reiserfs.
> +
> +	  Reiserfs stores not just filenames but the files themselves in a
> +	  balanced tree.  Uses journalling.
>  
>  	  Balanced trees are more efficient than traditional file system
>  	  architectural foundations.
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index 82e09901462e..74c1cda3bc3e 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -1652,6 +1652,8 @@ static int read_super_block(struct super_block *s, int offset)
>  		return 1;
>  	}
>  
> +	reiserfs_warning(NULL, "", "reiserfs filesystem is deprecated and "
> +		"scheduled to be removed from the kernel in 2024");
>  	SB_BUFFER_WITH_SB(s) = bh;
>  	SB_DISK_SUPER_BLOCK(s) = rs;
>  
> -- 
> 2.31.1
> 
> 

-- 
Dave Chinner
david@fromorbit.com
