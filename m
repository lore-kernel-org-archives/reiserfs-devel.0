From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [patch 2/4] vfs: add set_page_dirty_notag
Date: Tue, 17 Feb 2009 10:09:41 +0100
Message-ID: <1234861781.4744.21.camel@laptop>
References: <18837.24581.181196.569183@edward.zelnet.ru>
	 <1234530519.6519.46.camel@twins> <49957C43.7050701@gmail.com>
	 <1234534150.6519.101.camel@twins>
	 <18838.49922.215481.399653@edward.zelnet.ru>
	 <1234645893.4695.8.camel@laptop>
	 <18841.60432.329341.514726@edward.zelnet.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <18841.60432.329341.514726@edward.zelnet.ru>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@suse.de>, Ryan Hope <rmh3093@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

On Tue, 2009-02-17 at 01:43 +0300, Edward Shishkin wrote:

>  > How much performance gain do you see by avoiding that radix tree op? 
>  > 
> 
> Nop. We want to use it with extended semantics.
> All dirty pages are divided into 2 categories:
> 
> A) tagged in the radix tree (with PAGECACHE_TAG_DIRTY).
> B) captured by atoms (usual linked lists).
> 
> reiser4_writepages() looks for pages of "A" in the radix tree
> and moves them to "B". set_page_dirty_notag(), introduced by
> my patch, is needed for pages of "B".
> 
> If "B" is empty, then we get the traditional semantics with
> regular ->writepages().
> 
> That's all!

Ah, indeed. I had not considered such a scheme.

> Add set_page_dirty_notag() to the core library to enable
> extended functionality of radix tree attached to inode->i_mapping.
> 
> Signed-off-by: Edward Shishkin<edward.shishkin@gmail.com>

Looks good to me

Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>

> ---
>  include/linux/mm.h  |    1 +
>  mm/page-writeback.c |   36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> --- mmotm.orig/include/linux/mm.h
> +++ mmotm/include/linux/mm.h
> @@ -841,6 +841,7 @@ int redirty_page_for_writepage(struct wr
>  				struct page *page);
>  int set_page_dirty(struct page *page);
>  int set_page_dirty_lock(struct page *page);
> +int set_page_dirty_notag(struct page *page);
>  int clear_page_dirty_for_io(struct page *page);
>  
>  extern unsigned long move_page_tables(struct vm_area_struct *vma,
> --- mmotm.orig/mm/page-writeback.c
> +++ mmotm/mm/page-writeback.c
> @@ -1248,6 +1248,42 @@ int __set_page_dirty_nobuffers(struct pa
>  EXPORT_SYMBOL(__set_page_dirty_nobuffers);
>  
>  /*
> + * set_page_dirty_notag() -- similar to __set_page_dirty_nobuffers()
> + * except it doesn't tag the page dirty in the page-cache radix tree.
> + * This means that the address space using this cannot use the regular
> + * filemap ->writepages() helpers and must provide its own means of
> + * tracking and finding non-tagged dirty pages.
> + *
> + * NOTE: furthermore, this version also doesn't handle truncate races.
> + */
> +int set_page_dirty_notag(struct page *page)
> +{
> +	struct address_space *mapping = page->mapping;
> +
> +	if (!TestSetPageDirty(page)) {
> +		WARN_ON_ONCE(!PagePrivate(page) && !PageUptodate(page));
> +		if (mapping_cap_account_dirty(mapping)) {
> +		        /*
> +			 * The accounting functions rely on
> +			 * being atomic wrt interrupts.
> +			 */
> +		        unsigned long flags;
> +			local_irq_save(flags);
> +			__inc_zone_page_state(page, NR_FILE_DIRTY);
> +			__inc_bdi_stat(mapping->backing_dev_info,
> +				       BDI_RECLAIMABLE);
> +			task_dirty_inc(current);
> +			task_io_account_write(PAGE_CACHE_SIZE);
> +			local_irq_restore(flags);
> +		}
> +		__mark_inode_dirty(mapping->host, I_DIRTY_PAGES);
> +		return 1;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(set_page_dirty_notag);
> +
> +/*
>   * When a writepage implementation decides that it doesn't want to write this
>   * page for some reason, it should redirty the locked page via
>   * redirty_page_for_writepage() and it should then unlock the page and return 0

