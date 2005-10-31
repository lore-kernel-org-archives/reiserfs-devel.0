From: Alexander Zarochentsev <zam@namesys.com>
Subject: Re: Reiser4 SCSI Bug?
Date: Mon, 31 Oct 2005 11:42:33 +0400
Message-ID: <200510311042.33297.zam@namesys.com>
References: <2066.130.215.239.65.1130521750.squirrel@webmail.WPI.EDU> <43640228.7080807@wpi.edu> <200510310924.26782.zam@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26742-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510310924.26782.zam@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Isaac Chanin <chanin@wpi.edu>
Cc: Hans Reiser <reiser@namesys.com>, Steve Olivieri <steve86@wpi.edu>, reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>

On Monday 31 October 2005 09:24, Alexander Zarochentsev wrote:
> Hi,
>
> On Sunday 30 October 2005 02:13, Isaac Chanin wrote:
> > Hi Hans,
> >
> > I don't think it's a device driver problem.  My fix derived simply from
> > noticing that the function where the problem originates is bvec_alloc_bs
> > in fs/bio.c.
> >
> > To trace, the problem goes something like:
> > (fs/reiser4/wander.c) write_jnodes_to_disk_extent -> (fs/bio.c)
> > bio_alloc -> bio_alloc_bioset -> bvec_alloc_bs
> >
> > In any case, BIO_MAX_PAGES is defined to be 256 in include/linux/bio.h,
> > thus bvec_alloc_bs returns null, likewise bio_alloc_bioset does the
> > same, as does bio_alloc.  And thus the error in wander.c.
> >
> > Looking at the problem from the other direction, the max_blocks check
> > that was already in wander.c looks like:
> >
> > max_blocks = bdev_get_queue(super->s_bdev)->max_sectors >>
> > (super->s_blocksize_bits - 9);
> >
> > I'd look into the construction of the super block around
> > s_blocksize_bits, or however max_sectors is derived, to see if there're
> > any problems there (I suppose a device driver very well could be giving
> > a bad value that gets used somewhere in that code), but I really don't
> > know the reiser4 code well enough to do so.  In any case, as a temporary
> > (or perhaps permanent, as it seems that the limit is hardcoded in the
> > kernel anyways) solution it would probably be better to put the min(256,
> > ...) check around where max_blocks is set rather than around nr_blocks
> > inside the while loop.
>
> fs/mpage.c  uses bio.h:bio_get_nr_vecs() as below:
> ...
> alloc_new:
> 	if (bio == NULL) {
> 		bio = mpage_alloc(bdev, blocks[0] << (blkbits - 9),
> 			  	min_t(int, nr_pages, bio_get_nr_vecs(bdev)),
> 				GFP_KERNEL);
> 		if (bio == NULL)
> 			goto confused;
> 	}
> ...
>
> would you please check whether the following patch helps as your one does:
>
> -----------------------------------------
> diff --git a/wander.c b/wander.c
> index 4038000..b606063 100644
> --- a/wander.c
> +++ b/wander.c
> @@ -731,9 +731,7 @@ static int write_jnodes_to_disk_extent(
>  	assert("zam-570", nr > 0);
>
>  	block = *block_p;
> -	max_blocks =
> -		bdev_get_queue(super->s_bdev)->max_sectors >>
> -		(super-> s_blocksize_bits - 9);
> +	max_blocks = bio_get_nr_vecs(super->s_bdev);
>
>  	while (nr > 0) {
>  		struct bio *bio;
> ======================

I understood, mpage_writepages() has no such a problem because it 
submits not more than PAGEVEC_SIZE pages by one BIO.  It does not need to 
limit bio size by BIO_MAX_PAGES but reiser4 does.

Thanks a lot, Isaac.

I agree with Hans that we should use a constant from the public bio interface 
rather than a number.

-------------------------------------------
--- a/wander.c
+++ b/wander.c
@@ -731,9 +731,7 @@ static int write_jnodes_to_disk_extent(
        assert("zam-570", nr > 0);

        block = *block_p;
-       max_blocks =
-               bdev_get_queue(super->s_bdev)->max_sectors >>
-               (super-> s_blocksize_bits - 9);
+       max_blocks = min(bio_get_nr_vecs(super->s_bdev), BIO_MAX_PAGES);

        while (nr > 0) {
                struct bio *bio;

=======================

-- 
Alex.
