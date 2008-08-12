From: "Ryan Hope" <rmh3093@gmail.com>
Subject: Re: [PATCH 3/3][reiser4] dont get radix-tree dirty tagging out of sync
Date: Tue, 12 Aug 2008 00:12:21 -0400
Message-ID: <48f7fe350808112112k5e92330epa8345cbe4eb4c1b5@mail.gmail.com>
References: <48A0BFC9.40502@gmail.com>
	 <200808121236.51599.nickpiggin@yahoo.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=9CVc74gP/rvqe03IxmyEGUR1wfVMV8xXs3EqZ6AFUyo=;
        b=syy5mBE6YWBA0o8cZl/XsR4j0YomeibKuaPOjwJlB7dRDh5AqVEqB/KrWyXH27MIP9
         IjKywTvs/ByujXL3L/QIRNZjvfPbrDYD59NZCC1EWCdXf0dOaWv2Lk11tykb2oXEmUQ9
         bUuE2QQ3a8oEDtm8HH+lW1htJjVCUgmPwCYBk=
In-Reply-To: <200808121236.51599.nickpiggin@yahoo.com.au>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nick Piggin <nickpiggin@yahoo.com.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Edward Shishkin <edward.shishkin@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

I tried just using __set_page_dirty_nobuffers but that caused issues
with ext3/ext4 (i can send a bug trace later if needed).

                                __inc_bdi_stat(mapping->backing_dev_info,
                                                BDI_RECLAIMABLE);
                                task_io_account_write(PAGE_CACHE_SIZE);

^^^ the above code in __set_page_dirty_nobuffers causes an issue with
do_writepages in ext3/4 when I use something like the code below:

int reiser4_set_page_dirty_internal(struct page *page)
{
     return __set_page_dirty_nobuffers(page);
}

On Mon, Aug 11, 2008 at 10:36 PM, Nick Piggin <nickpiggin@yahoo.com.au> wrote:
> On Tuesday 12 August 2008 08:40, Ryan Hope wrote:
>> This was item #14 on the todo list for reiser4 inclusion in mainline:
>>
>> diff --git a/fs/reiser4/page_cache.c b/fs/reiser4/page_cache.c
>> index fe71368..a662c25 100644
>> --- a/fs/reiser4/page_cache.c
>> +++ b/fs/reiser4/page_cache.c
>> @@ -467,15 +467,14 @@ int reiser4_set_page_dirty_internal(struct page
>> *page) BUG_ON(mapping == NULL);
>>
>>       if (!TestSetPageDirty(page)) {
>> +             spin_lock_irq(&mapping->tree_lock);
>>               if (mapping_cap_account_dirty(mapping))
>>                       inc_zone_page_state(page, NR_FILE_DIRTY);
>> -
>> +             radix_tree_tag_set(&mapping->page_tree,
>> +                     page_index(page), PAGECACHE_TAG_DIRTY);
>>               __mark_inode_dirty(mapping->host, I_DIRTY_PAGES);
>> +             spin_unlock_irq(&mapping->tree_lock);
>>       }
>> -
>> -     /* znode must be dirty ? */
>> -     if (mapping->host == reiser4_get_super_fake(mapping->host->i_sb))
>> -             assert("", JF_ISSET(jprivate(page), JNODE_DIRTY));
>>       return 0;
>>   }
>
> Any reason why this can't use a generic function such as
> __set_page_dirty_nobuffers? There are accounting changes gone in
> there now which I suspetc may be wrong now in reiser4 (eg. task
> io accounting).
>
> Actually every site that does a radix_tree_operation there should
> be reviewed to try to use core functoins.
>
