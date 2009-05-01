From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 5/6] kill-the-BKL/reiserfs: release the write lock
	inside reiserfs_read_bitmap_block()
Date: Fri, 1 May 2009 07:47:34 +0200
Message-ID: <20090501054734.GE5983@elte.hu>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com> <1241145862-21700-6-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1241145862-21700-6-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>


* Frederic Weisbecker <fweisbec@gmail.com> wrote:

> reiserfs_read_bitmap_block() uses sb_bread() to read the bitmap block. This
> helper might sleep.
> 
> Then, when the bkl was used, it was released at this point. We can then
> relax the write lock too here.
> 
> [ Impact: release the reiserfs write lock when it is not needed ]
> 
> Cc: Jeff Mahoney <jeffm@suse.com>
> Cc: Chris Mason <chris.mason@oracle.com>
> Cc: Alexander Beregalov <a.beregalov@gmail.com>
> Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
> ---
>  fs/reiserfs/bitmap.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
> index 1470334..6854957 100644
> --- a/fs/reiserfs/bitmap.c
> +++ b/fs/reiserfs/bitmap.c
> @@ -1249,7 +1249,9 @@ struct buffer_head *reiserfs_read_bitmap_block(struct super_block *sb,
>  	else if (bitmap == 0)
>  		block = (REISERFS_DISK_OFFSET_IN_BYTES >> sb->s_blocksize_bits) + 1;
>  
> +	reiserfs_write_unlock(sb);
>  	bh = sb_bread(sb, block);
> +	reiserfs_write_lock(sb);
>  	if (bh == NULL)
>  		reiserfs_warning(sb, "sh-2029: %s: bitmap block (#%u) "
>  		                 "reading failed", __func__, block);

Note, there's a side-effect here: the access to sb->b_blocksize is 
moved outside of the lock. Previously it was accessed via the BKL. 
On a mounted filesystem sb->b_blocksize is not supposed to change, 
so it's probably not an issue - but wanted to mention it.

	Ingo
