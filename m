From: Nick Piggin <npiggin@suse.de>
Subject: Re: [patch 1/2] vfs: add/use update_page_accounting
Date: Wed, 18 Feb 2009 15:06:26 +0100
Message-ID: <20090218140626.GA13362@wotan.suse.de>
References: <1234530519.6519.46.camel@twins> <49957C43.7050701@gmail.com> <1234534150.6519.101.camel@twins> <18838.49922.215481.399653@edward.zelnet.ru> <1234645893.4695.8.camel@laptop> <18841.60432.329341.514726@edward.zelnet.ru> <20090217143506.f6899342.akpm@linux-foundation.org> <499B55A8.50103@gmail.com> <20090217163820.48a2ce68.akpm@linux-foundation.org> <18844.3238.965571.619560@edward.zelnet.ru>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <18844.3238.965571.619560@edward.zelnet.ru>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, peterz@infradead.org, rmh3093@gmail.com, randy.dunlap@oracle.com, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Wed, Feb 18, 2009 at 04:27:02PM +0300, Edward Shishkin wrote:
>  > > Maybe it makes sense to add comments with warnings
>  > > in all such places, or create a header file with a static inline
>  > > function update_page_accounting() ?
>  > 
>  > Could just uninline the helper function I guess - if you look, those
>  > four statements already involve doing a heck of a lot of stuff.
>  > 
>  > Try it, see how it looks?
>  > 
> 
> Done.
> Please, review.
> 
> Add/use a helper function update_page_accounting().

Fine patch, except the name I don't like. account_set_page_dirty, or
account_page_dirtied, or something to hint it is for accounting
dirty.

 
> Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>
> ---
>  fs/buffer.c         |    9 +--------
>  include/linux/mm.h  |    1 +
>  mm/page-writeback.c |   22 +++++++++++++++-------
>  3 files changed, 17 insertions(+), 15 deletions(-)
> 
> --- mmotm.orig/fs/buffer.c
> +++ mmotm/fs/buffer.c
> @@ -803,14 +803,7 @@ static int __set_page_dirty(struct page 
>  	spin_lock_irq(&mapping->tree_lock);
>  	if (page->mapping) {	/* Race with truncate? */
>  		WARN_ON_ONCE(warn && !PageUptodate(page));
> -
> -		if (mapping_cap_account_dirty(mapping)) {
> -			__inc_zone_page_state(page, NR_FILE_DIRTY);
> -			__inc_bdi_stat(mapping->backing_dev_info,
> -					BDI_RECLAIMABLE);
> -			task_dirty_inc(current);
> -			task_io_account_write(PAGE_CACHE_SIZE);
> -		}
> +		update_page_accounting(page, mapping);
>  		radix_tree_tag_set(&mapping->page_tree,
>  				page_index(page), PAGECACHE_TAG_DIRTY);
>  	}
> --- mmotm.orig/include/linux/mm.h
> +++ mmotm/include/linux/mm.h
> @@ -839,6 +839,7 @@ int __set_page_dirty_nobuffers(struct pa
>  int __set_page_dirty_no_writeback(struct page *page);
>  int redirty_page_for_writepage(struct writeback_control *wbc,
>  				struct page *page);
> +void update_page_accounting(struct page *page, struct address_space *mapping);
>  int set_page_dirty(struct page *page);
>  int set_page_dirty_lock(struct page *page);
>  int clear_page_dirty_for_io(struct page *page);
> --- mmotm.orig/mm/page-writeback.c
> +++ mmotm/mm/page-writeback.c
> @@ -1198,6 +1198,20 @@ int __set_page_dirty_no_writeback(struct
>  }
>  
>  /*
> + * Helper function for set_page_dirty family.
> + * NOTE: This relies on being atomic wrt interrupts.
> + */
> +void update_page_accounting(struct page *page, struct address_space *mapping)
> +{
> +	if (mapping_cap_account_dirty(mapping)) {
> +		__inc_zone_page_state(page, NR_FILE_DIRTY);
> +		__inc_bdi_stat(mapping->backing_dev_info, BDI_RECLAIMABLE);
> +		task_dirty_inc(current);
> +		task_io_account_write(PAGE_CACHE_SIZE);
> +	}
> +}
> +
> +/*
>   * For address_spaces which do not use buffers.  Just tag the page as dirty in
>   * its radix tree.
>   *
> @@ -1226,13 +1240,7 @@ int __set_page_dirty_nobuffers(struct pa
>  		if (mapping2) { /* Race with truncate? */
>  			BUG_ON(mapping2 != mapping);
>  			WARN_ON_ONCE(!PagePrivate(page) && !PageUptodate(page));
> -			if (mapping_cap_account_dirty(mapping)) {
> -				__inc_zone_page_state(page, NR_FILE_DIRTY);
> -				__inc_bdi_stat(mapping->backing_dev_info,
> -						BDI_RECLAIMABLE);
> -				task_dirty_inc(current);
> -				task_io_account_write(PAGE_CACHE_SIZE);
> -			}
> +			update_page_accounting(page, mapping);
>  			radix_tree_tag_set(&mapping->page_tree,
>  				page_index(page), PAGECACHE_TAG_DIRTY);
>  		}
