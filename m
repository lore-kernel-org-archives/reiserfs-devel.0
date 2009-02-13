From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch 2/4] vfs: add set_page_dirty_notag
Date: Fri, 13 Feb 2009 16:57:23 +0300
Message-ID: <49957C43.7050701@gmail.com>
References: <18837.24581.181196.569183@edward.zelnet.ru> <1234530519.6519.46.camel@twins>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1234530519.6519.46.camel@twins>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@suse.de>, Ryan Hope <rmh3093@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, linux-kernel@vger.kernel.org, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Peter Zijlstra wrote:
> On Fri, 2009-02-13 at 14:56 +0300, Edward Shishkin wrote:
>
>   
>> ---
>>  include/linux/mm.h  |    1 +
>>  mm/page-writeback.c |   28 ++++++++++++++++++++++++++++
>>  2 files changed, 29 insertions(+)
>>
>> --- mmotm.orig/include/linux/mm.h
>> +++ mmotm/include/linux/mm.h
>> @@ -841,6 +841,7 @@ int redirty_page_for_writepage(struct wr
>>  				struct page *page);
>>  int set_page_dirty(struct page *page);
>>  int set_page_dirty_lock(struct page *page);
>> +int set_page_dirty_notag(struct page *page);
>>  int clear_page_dirty_for_io(struct page *page);
>>  
>>  extern unsigned long move_page_tables(struct vm_area_struct *vma,
>> --- mmotm.orig/mm/page-writeback.c
>> +++ mmotm/mm/page-writeback.c
>> @@ -1248,6 +1248,34 @@ int __set_page_dirty_nobuffers(struct pa
>>  EXPORT_SYMBOL(__set_page_dirty_nobuffers);
>>  
>>  /*
>> + * The same as __set_page_dirty_nobuffers, but this function
>> + * 1) doesn't tag the page in its radix tree;
>> + * 2) makes an assumption that there is no races with truncate.
>> + * 3) is not for anonymous or swap pages.
>> + */
>> +int set_page_dirty_notag(struct page *page)
>> +{
>> +	struct address_space *mapping = page->mapping;
>> +
>> +	if (!TestSetPageDirty(page)) {
>> +		WARN_ON_ONCE(!PagePrivate(page) && !PageUptodate(page));
>> +		if (mapping_cap_account_dirty(mapping)) {
>> +			preempt_disable();
>> +			__inc_zone_page_state(page, NR_FILE_DIRTY);
>> +			__inc_bdi_stat(mapping->backing_dev_info,
>> +				       BDI_RECLAIMABLE);
>> +			task_dirty_inc(current);
>> +			task_io_account_write(PAGE_CACHE_SIZE);
>> +			preempt_enable();
>> +		}
>> +		__mark_inode_dirty(mapping->host, I_DIRTY_PAGES);
>> +		return 1;
>> +	}
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(set_page_dirty_notag);
>> +
>>     
>
> Eew, so reiser4 will totally side-step the regular vm inode writeback
> paths -- or is this fixed by a more elaborate than usual
> a_ops->writepages() ?
>   
The second.

reiser4_writepages() catches the anonymous  (tagged)
pages, captures them mandatory, then commits all atoms
of the file.
