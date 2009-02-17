From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [patch 2/4] vfs: add set_page_dirty_notag
Date: Tue, 17 Feb 2009 14:35:06 -0800
Message-ID: <20090217143506.f6899342.akpm@linux-foundation.org>
References: <18837.24581.181196.569183@edward.zelnet.ru>
	<1234530519.6519.46.camel@twins>
	<49957C43.7050701@gmail.com>
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
Cc: peterz@infradead.org, edward.shishkin@gmail.com, npiggin@suse.de, rmh3093@gmail.com, randy.dunlap@oracle.com, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Tue, 17 Feb 2009 01:43:28 +0300
Edward Shishkin <edward.shishkin@gmail.com> wrote:

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

I'll maintain this in -mm, alongside the resier4 patches which need it.

Of course, this rather obviates the purpose - if someone changes, say,
__set_page_dirty_nobuffers() then they won't similarly update
set_page_dirty_notag().  Oh well.

This problem would fix itself if those two functions were to
substantially share code.  And I think we can do that - something like

static void
update_page_accounting(struct page *page, struct address_space *mapping)
{
	__inc_zone_page_state(page, NR_FILE_DIRTY);
	__inc_bdi_stat(mapping->backing_dev_info, BDI_RECLAIMABLE);
	task_dirty_inc(current);
	task_io_account_write(PAGE_CACHE_SIZE);
}

maybe?

We could do that as a separate patch and merge it into mainline - it
should have zero impact on code generation if gcc does the right thing
(please check this).

