From: Bret Towe <btowe@gbis.com>
Subject: Re: raid0 and rfs4
Date: Tue, 13 Jan 2004 11:04:53 -0800
Message-ID: <1074020693.21511.5.camel@mail.vox.net>
References: <1073970028.20855.18.camel@www.vox.net>
	 <16387.62653.376361.586638@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16485-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16387.62653.376361.586638@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@Namesys.COM

ok i tried the below patch the kernel no longer blows up
but it still spews forth the raid0_make_request stuff
only 7 of em this time too (256k chunks btw) the file it 
should be trying to write is 51mb
and if you want i can still do a gdb i think on the old kernel
i still have the old bzImage on cd
btw if you think this is going to take a while to debug let me know
i dont mind trying but i need to setup another comp to try on
this one i have to burn a cd for every try :\

On Tue, 2004-01-13 at 05:38, Nikita Danilov wrote:
> Bret Towe writes:
>  > i recently tried reiser4 on a raid0 setup and well it didnt go so well
>  > :\
>  > 
>  > what i got from dmesg was the following
>  > dmesg was full up when i finally looked of the raid_make_request
>  > all of those lines looked about the same cept the last 2 numbers
>  > 
>  > raid0_make_request bug: can't convert block across chunks or bigger than
>  > 512k 356200 124
>  > raid0_make_request bug: can't convert block across chunks or bigger than 512k 357352 124
>  > raid0_make_request bug: can't convert block across chunks or bigger than 512k 358344 60
> 
> Please try with the following patch applied:
> ----------------------------------------------------------------------
> ===== page_cache.c 1.265 vs edited =====
> --- 1.265/page_cache.c	Wed Dec 24 17:57:42 2003
> +++ edited/page_cache.c	Tue Jan 13 15:48:58 2004
> @@ -499,17 +499,18 @@
>  		assert("nikita-2275", blocknr != (reiser4_block_nr) 0);
>  		assert("nikita-2276", !blocknr_is_fake(&blocknr));
>  
> -		bio->bi_sector = blocknr * (blksz >> 9);
>  		bio->bi_bdev = super->s_bdev;
> -		bio->bi_io_vec[0].bv_page = page;
> -		bio->bi_io_vec[0].bv_len = blksz;
> -		bio->bi_io_vec[0].bv_offset = 0;
>  
> -		bio->bi_vcnt = 1;
> -		/* bio -> bi_idx is filled by bio_init() */
> -		bio->bi_size = blksz;
> +		if (!bio_add_page(bio, page, blksz, 0)) {
> +			warning("nikita-3452",
> +				"Single page bio cannot be constructed");
> +			return ERR_PTR(RETERR(-EINVAL));
> +		}
>  
> -		bio->bi_end_io = (rw == READ) ? end_bio_single_page_read : end_bio_single_page_write;
> +		bio->bi_sector = blocknr * (blksz >> 9);
> +		/* bio -> bi_idx is filled by bio_init() */
> +		bio->bi_end_io = (rw == READ) ?
> +			end_bio_single_page_read : end_bio_single_page_write;
>  
>  		return bio;
>  	} else
> ===== wander.c 1.229 vs edited =====
> --- 1.229/wander.c	Tue Jan 13 14:02:11 2004
> +++ edited/wander.c	Tue Jan 13 16:18:31 2004
> @@ -527,6 +527,26 @@
>  	return ret;
>  }
>  
> +static void
> +undo_bio(struct bio *bio)
> +{
> +	int i;
> +
> +	for (i = 0; i < bio->bi_vcnt; ++i) {
> +		struct page *pg;
> +		jnode *node;
> +
> +		pg = bio->bi_io_vec[i].bv_page;
> +		ClearPageWriteback(pg);
> +		node = jprivate(pg);
> +		LOCK_JNODE(node);
> +		JF_CLR(node, JNODE_WRITEBACK);
> +		JF_SET(node, JNODE_DIRTY);
> +		UNLOCK_JNODE(node);
> +	}
> +	bio_put(bio);
> +}
> +
>  #if REISER4_COPY_ON_CAPTURE
>  
>  extern spinlock_t scan_lock;
> @@ -715,11 +735,7 @@
>  	ON_TRACE (TRACE_IO_W, "write of %d blocks starting from %llu\n",
>  		  nr, (unsigned long long)block);
>  
> -#if REISER4_USER_LEVEL_SIMULATION
> -	max_blocks = nr;
> -#else
>  	max_blocks = bdev_get_queue(super->s_bdev)->max_sectors >> (super->s_blocksize_bits - 9);
> -#endif
>  
>  	while (nr > 0) {
>  		struct bio *bio;
> @@ -731,6 +747,7 @@
>  		if (!bio)
>  			return RETERR(-ENOMEM);
>  
> +		bio->bi_bdev = super->s_bdev;
>  		for (nr_used = 0, i = 0; i < nr_blocks; i++) {
>  			struct page *pg;
>  			ON_DEBUG(int jnode_is_releasable(jnode *));
> @@ -749,18 +766,27 @@
>  			if (!JF_ISSET(cur, JNODE_WRITEBACK)) {
>  				assert("zam-912", !JF_ISSET(cur, JNODE_WRITEBACK));
>  				assert("nikita-3165", !jnode_is_releasable(cur));
> +				UNLOCK_JNODE(cur);
> +				if (!bio_add_page(bio,
> +						  pg, super->s_blocksize, 0))
> +					/*
> +					 * underlying device is satiated. Stop
> +					 * adding pages to the bio.
> +					 */
> +					break;
> +
> +				LOCK_JNODE(cur);
>  				JF_SET(cur, JNODE_WRITEBACK);
>  				JF_CLR(cur, JNODE_DIRTY);
>  				UNLOCK_JNODE(cur);
>  
>  				SetPageWriteback(pg);
> -				
> +
>  				spin_lock(&pg->mapping->page_lock);
>  
> -#if REISER4_STATS
> -				if (!PageDirty(pg))
> +				if (REISER4_STATS && !PageDirty(pg))
>  					reiser4_stat_inc(pages_clean);
> -#endif
> +
>  				/* don't check return value: submit page even if
>  				   it wasn't dirty. */		
>  				test_clear_page_dirty(pg);
> @@ -771,10 +797,7 @@
>  				spin_unlock(&pg->mapping->page_lock);
>  				
>  				unlock_page(pg);
> -				
> -				bio->bi_io_vec[nr_used].bv_page = pg;
> -				bio->bi_io_vec[nr_used].bv_len = super->s_blocksize;
> -				bio->bi_io_vec[nr_used].bv_offset = 0;
> +				nr_used ++;
>  			} else {
>  				/* jnode being WRITEBACK might be replaced on
>  				   ovrwr_nodes list with jnode CC. We just
> @@ -790,31 +813,18 @@
>  			cur = capture_list_next(cur);
>  			if (!capture_list_end(head, cur))
>  				JF_SET(cur, JNODE_SCANNED);
> -			else {
> -				/* end of overwrite list reached */
> -				assert("", i == nr_blocks - 1);
> -				assert("", nr_used + 1 == nr);
> -			}
>  			spin_unlock(&scan_lock);
> -			nr_used ++;
>  		}
>  		if (nr_used > 0) {
>  			bio->bi_sector = block * (super->s_blocksize >> 9);
> -			bio->bi_bdev = super->s_bdev;
> -			bio->bi_size = super->s_blocksize * nr_used;
> -			bio->bi_vcnt = nr_used;
> +			assert("nikita-3455",
> +			       bio->bi_size = super->s_blocksize * nr_used);
> +			assert("nikita-3456", bio->bi_vcnt == nr_used);
>  
>  			/* Check if we are allowed to write at all */
> -			if ( super->s_flags & MS_RDONLY ) {
> -				int i;
> -				for ( i = 0; i < nr_used ; i++) {
> -					struct page *pg = bio->bi_io_vec[i].bv_page;
> -					ClearPageWriteback(pg);
> -					JF_CLR((jnode *)pg->private, JNODE_WRITEBACK);
> -					JF_SET((jnode *)pg->private, JNODE_DIRTY);
> -				}
> -				bio_put(bio);
> -			} else {
> +			if (super->s_flags & MS_RDONLY)
> +				undo_bio(bio);
> +			else {
>  				add_fq_to_bio(fq, bio);
>  				reiser4_submit_bio(WRITE, bio);
>  			}
> @@ -1142,11 +1152,7 @@
>  	ON_TRACE (TRACE_IO_W, "write of %d blocks starting from %llu\n",
>  		  nr, (unsigned long long)block);
>  
> -#if REISER4_USER_LEVEL_SIMULATION
> -	max_blocks = nr;
> -#else
>  	max_blocks = bdev_get_queue(super->s_bdev)->max_sectors >> (super->s_blocksize_bits - 9);
> -#endif
>  
>  	while (nr > 0) {
>  		struct bio *bio;
> @@ -1158,6 +1164,7 @@
>  		if (!bio)
>  			return RETERR(-ENOMEM);
>  
> +		bio->bi_bdev = super->s_bdev;
>  		for (nr_used = 0, i = 0; i < nr_blocks; i++) {
>  			struct page *pg;
>  			ON_DEBUG(int jnode_is_releasable(jnode *));
> @@ -1169,6 +1176,13 @@
>  
>  			lock_and_wait_page_writeback(pg);
>  
> +			if (!bio_add_page(bio, pg, super->s_blocksize, 0))
> +				/*
> +				 * underlying device is satiated. Stop adding
> +				 * pages to the bio.
> +				 */
> +				break;
> +
>  			LOCK_JNODE(cur);
>  			ON_DEBUG_MODIFY(znode_set_checksum(cur, 1));
>  			assert("nikita-3166",
> @@ -1183,10 +1197,9 @@
>  
>  			spin_lock(&pg->mapping->page_lock);
>  
> -#if REISER4_STATS
> -			if (!PageDirty(pg))
> +			if (REISER4_STATS && !PageDirty(pg))
>  				reiser4_stat_inc(pages_clean);
> -#endif
> +
>  			/* don't check return value: submit page even if it
>  			   wasn't dirty. */		
>  			test_clear_page_dirty(pg);
> @@ -1198,34 +1211,19 @@
>  
>  			unlock_page(pg);
>  
> -			bio->bi_io_vec[nr_used].bv_page = pg;
> -			bio->bi_io_vec[nr_used].bv_len = super->s_blocksize;
> -			bio->bi_io_vec[nr_used].bv_offset = 0;
> -
>  			cur = capture_list_next(cur);
>  			nr_used ++;
>  		}
>  		if (nr_used > 0) {
>  			bio->bi_sector = block * (super->s_blocksize >> 9);
> -			bio->bi_bdev = super->s_bdev;
> -			bio->bi_size = super->s_blocksize * nr_used;
> -			bio->bi_vcnt = nr_used;
> +			assert("nikita-3453",
> +			       bio->bi_size == super->s_blocksize * nr_used);
> +			assert("nikita-3454", bio->bi_vcnt == nr_used);
>  
>  			/* Check if we are allowed to write at all */
> -			if ( super->s_flags & MS_RDONLY ) {
> -				int i;
> -				for ( i = 0; i < nr_used ; i++) {
> -					struct page *pg = bio->bi_io_vec[i].bv_page;
> -					struct jnode *j;
> -
> -					j = jprivate(pg);
> -					ClearPageWriteback(pg);
> -					JF_CLR(j, JNODE_WRITEBACK);
> -					ON_DEBUG_MODIFY(znode_set_checksum(j, 1));
> -					JF_SET(j, JNODE_DIRTY);
> -				}
> -				bio_put(bio);
> -			} else {
> +			if (super->s_flags & MS_RDONLY)
> +				undo_bio(bio);
> +			else {
>  				add_fq_to_bio(fq, bio);
>  				reiser4_submit_bio(WRITE, bio);
>  			}
> ----------------------------------------------------------------------
> I gave it only light testing.
> 
>  > Unable to handle kernel NULL pointer dereference at virtual address 00000004
> 
> Nikita.
> 

