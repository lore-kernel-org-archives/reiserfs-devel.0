From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 3/3][reiser4] dont get radix-tree dirty tagging out of
 sync
Date: Tue, 12 Aug 2008 16:56:16 +0400
Message-ID: <48A18870.6070500@gmail.com>
References: <48A0BFC9.40502@gmail.com> <200808121236.51599.nickpiggin@yahoo.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200808121236.51599.nickpiggin@yahoo.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Piggin <nickpiggin@yahoo.com.au>, Ryan Hope <rmh3093@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>, Vladimir Saveliev <Vladimir.Saveliev@sun.com>

Nick Piggin wrote:
> On Tuesday 12 August 2008 08:40, Ryan Hope wrote:
>   
>> This was item #14 on the todo list for reiser4 inclusion in mainline:
>>     

No. This patch is a nonsense.
Where did you see  radix-tree dirty tagging here?


>> diff --git a/fs/reiser4/page_cache.c b/fs/reiser4/page_cache.c
>> index fe71368..a662c25 100644
>> --- a/fs/reiser4/page_cache.c
>> +++ b/fs/reiser4/page_cache.c
>> @@ -467,15 +467,14 @@ int reiser4_set_page_dirty_internal(struct page
>> *page) BUG_ON(mapping == NULL);
>>
>>   	if (!TestSetPageDirty(page)) {
>> +		spin_lock_irq(&mapping->tree_lock);
>>   		if (mapping_cap_account_dirty(mapping))
>>   			inc_zone_page_state(page, NR_FILE_DIRTY);
>> -
>> +		radix_tree_tag_set(&mapping->page_tree,
>> +			page_index(page), PAGECACHE_TAG_DIRTY);
>>   		__mark_inode_dirty(mapping->host, I_DIRTY_PAGES);
>> +		spin_unlock_irq(&mapping->tree_lock);
>>   	}
>> -
>> -	/* znode must be dirty ? */
>> -	if (mapping->host == reiser4_get_super_fake(mapping->host->i_sb))
>> -		assert("", JF_ISSET(jprivate(page), JNODE_DIRTY));
>>   	return 0;
>>   }
>>     
>
> Any reason why this can't use a generic function such as
> __set_page_dirty_nobuffers? 

Currently reiser4 is working around "anonymous" pages dirtied
outside of reiser4 context (e.g. via mmap), where some reiser4
specific work (jnode creation, capturing by an atom) can not
be done.

> There are accounting changes gone in
> there now which I suspetc may be wrong now in reiser4 (eg. task
> io accounting).
>   

Yes, this is definitely wrong. Thanks for pointing this out.
Such poking around vfs internals should be fixed, otherwise we'll
have permanent problems.

I have cc-ed Vladimir: maybe he has some hints. At least, I know
that he looked at this problem..

Thanks,
Edward.

> Actually every site that does a radix_tree_operation there should
> be reviewed to try to use core functoins.
>
>   

