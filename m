From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs bug
Date: Thu, 01 Jul 2004 11:10:55 +0400
Message-ID: <40E3B8FF.8090500@namesys.com>
References: <20040701060924.11587.qmail@web11202.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19473-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040701060924.11587.qmail@web11202.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hongwei Li <hwli98@yahoo.com>, reiserfs-list@namesys.com

Hello

Hongwei Li wrote:
> Hi:
> My machine am running linux-2.4.25, it crash in the
> reiser_panic.
> I looked at the oops and find out the followings:
> check_leaf_block_head pass the 0 as "sb" value, and
> cause reiser_panic crash.
> Any fix for this?
> 

Actually, reiserfs_panic would panic even correct sb value were passed 
into it.
You seem to get reiserfs node corruption. Reiserfs used to return -EIO 
in such cases. Unfortunately, it is not doing that correctly everywhere. 
We will fix that.
You should reiserfsck your filesystem. It is very likely that you will 
have to reiserfsck --rebuild-tree it.
Please get fresh reiserfsprogs 
(ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.17.tar.gz)
and let us know whether it did its job

> static void check_leaf_block_head (struct buffer_head
> * bh)
> {
>   struct block_head * blkh;
>   int nr;
> 
>   blkh = B_BLK_HEAD (bh);
>   nr = blkh_nr_item(blkh);
>   if ( nr > (bh->b_size - BLKH_SIZE) / IH_SIZE)
>     reiserfs_panic (0, "vs-6010:
> check_leaf_block_head: invalid item number %z", bh);
>   if ( blkh_free_space(blkh) > 
>       bh->b_size - BLKH_SIZE - IH_SIZE * nr )
>     reiserfs_panic (0, "vs-6020:
> check_leaf_block_head: invalid free space %z", bh);
>     
> }
> 
> void reiserfs_panic (struct super_block * sb, const
> char * fmt, ...)
> {
>   show_reiserfs_locks() ;
>   do_reiserfs_warning(fmt);
>   printk ( KERN_EMERG "%s (device %s)\n", error_buf,
> bdevname(sb->s_dev));
>   BUG ();
> 
>   /* this is not actually called, but makes
> reiserfs_panic() "noreturn" */
>   panic ("REISERFS: panic (device %s): %s\n",
> 	 sb ? kdevname(sb->s_dev) : "sb == 0", error_buf);
> }
> 
> Li Hongwei
> 
> 
> 	
> 		
> __________________________________
> Do you Yahoo!?
> New and Improved Yahoo! Mail - 100MB free storage!
> http://promotions.yahoo.com/new_mail 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 


