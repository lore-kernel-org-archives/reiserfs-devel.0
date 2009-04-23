From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiserfs: remove stray unlock_super in reiserfs_resize
Date: Thu, 23 Apr 2009 21:34:05 +0200
Message-ID: <49F0C2AD.6070502@gmail.com>
References: <20090423192512.GA22819@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090423192512.GA22819@lst.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@lst.de>
Cc: reiserfs-devel@vger.kernel.org

Christoph Hellwig wrote:
> Reiserfs doesn't use lock_super anywhere internally, and ->remount_fs
> which calls reiserfs_resize does have it currently but also expects it
> to be held on return, so there's no business for the unlock_super here.
>
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
>   

Acked by Edward Shishkin <edward.shishkin@gmail.com>


> Index: linux-2.6/fs/reiserfs/resize.c
> ===================================================================
> --- linux-2.6.orig/fs/reiserfs/resize.c	2009-04-23 21:23:25.631074621 +0200
> +++ linux-2.6/fs/reiserfs/resize.c	2009-04-23 21:23:29.435949732 +0200
> @@ -82,7 +82,6 @@ int reiserfs_resize(struct super_block *
>  		if (reiserfs_allocate_list_bitmaps(s, jbitmap, bmap_nr_new) < 0) {
>  			printk
>  			    ("reiserfs_resize: unable to allocate memory for journal bitmaps\n");
> -			unlock_super(s);
>  			return -ENOMEM;
>  		}
>  		/* the new journal bitmaps are zero filled, now we copy in the bitmap
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

