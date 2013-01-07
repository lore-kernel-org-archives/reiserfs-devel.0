From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Kernel config option which causes reiser4 to be instable
Date: Mon, 07 Jan 2013 01:06:36 +0100
Message-ID: <50EA118C.7010102@gmail.com>
References: <CADW=+3n+rKECWNSmzcMeTQaPZrtA3Sr04=yO1cqsd0j09Y43Ww@mail.gmail.com> <4846951.qvq7k6WC3K@intelfx-laptop> <50DE3850.8020304@gmail.com> <3248106.Mt7OvaDhna@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=PkLjalodnZidvc+vWEDCo25/9Ac8xiDrByZay0bfA84=;
        b=mR4eu2XgPP2BhLV2309vEThwTfuaLz2bV4iBHiSTmtZdhjpDuS6AMnb2JROkz85K+n
         n+Rdy8Xd49uSoef7YG31+mEDHalvLEyvvQrgCaO9HI2/KzVgzPtrbuyTBDUCSG+9l35d
         5NVzRPuGcTc4DCIOz5ZL3oxMrNhiDUkISsyyi7vjTltTtxtnzZzNrTEmpYPr4lgZ/N0h
         bGylTHvNqCTHjx7fXbDgrUY4YYGT5e1GYobQ9jNiqB7LiI4jYVVCbpXfUEWvsBWxipMc
         wynPYsr7l3jKLA56+VPxyytnpxyRJS2UaYdHKlV2buvF6kpJZrywDNgb+EKWdKr1Sn64
         am7Q==
In-Reply-To: <3248106.Mt7OvaDhna@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 12/29/2012 07:47 PM, Ivan Shapovalov wrote:
> On 29 December 2012 01:24:48 Edward Shishkin wrote:
>> On 12/26/2012 05:22 PM, Ivan Shapovalov wrote:
>>> Hello Edward,
>>
>> Hi Ivan,
>>
>>> I've apparently managed to get a working implementation of
>>> ->migratepage().
>>>
>>> I'm attaching a patch; it seems stable, but I'm worried somewhat because
>>> the destination pages (parameter newpage) sometimes (pretty often) have a
>>> non-NULL private field.
>>>
>>> Currently I've put there a warning and a set_page_private(newpage, 0) - it
>>> seems to work, but well...
>>> I'm continuing to test it and will report if that actually has bad
>>> consequences.
>>>
>>> - Ivan
>>>
>>>>>   Edward.
>>>>>
>>>>>>   >   Thanks,
>>>>>>   >   Ivan.
>>>>>>   >
>>>>>>>   >>   Also before the release I'll try to take a look at this:
>>>>>>>   >>   http://marc.info/?l=reiserfs-devel&m=135402207623711&w=2
>>>>>>>   >>
>>>>>>>   >>   This failed path might indicate that we adjusted to fs-writeback
>>>>>>>   >>   incorrectly.
>>>>>>>   >>
>>>>>>>   >>   Edward.
>>>>>>>   >>
>>>>>>>>   >>>   Regards,
>>>>>>>>   >>>   Ivan.
>>>>>>>>   >>>
>>>>>>>>>>>>   >>>>>>>         on kernel
>>>>>>>>>>>>   >>>>>>>
>>>>>>>>>>>>   >>>>>>>   3.6.10, and everything seems to be OK so far (so the
>>>>>>>>>>>>   >>>>>>>   workaround is
>>>>>>>>>>>>   >>>>>>>   version-
>>>>>>>>>>>>   >>>>>>>   agnostic).
>>>>>>>>>>>>   >>>>>>>
>>>>>>>>>>>>   >>>>>>>   Edward, are there any guesses on what can make reiser4
>>>>>>>>>>>>   >>>>>>>   choke on
>>>>>>>>>>>>   >>>>>>>   hugepages/compaction/migration?
>>>>>>>>>>>   >>>>>>
>>>>>>>>>>>   >>>>>>   TBH, no ideas. They (hugepages) are_transparent_.
>>>>>>>>>>>   >>>>>>   It means we shouldn't suffer in theory;)
>>>>>>>>>>>   >>>>>>
>>>>>>>>>>>>   >>>>>>>         I'm not even barely familiar with the kernel
>>>>>>>>>>>>   >>>>>>>
>>>>>>>>>>>>   >>>>>>>   internals.
>>>>>>>>>>>>   >>>>>>>
>>>>>>>>>>>>   >>>>>>>   Thanks,
>>>>>>>>>>>>   >>>>>>>   Ivan.
>>>
>>> reiser4-migratepage.patch
>>>
>>>
>>> diff --git a/fs/reiser4/as_ops.c b/fs/reiser4/as_ops.c
>>> index 8d8a37d..20006fc 100644
>>> --- a/fs/reiser4/as_ops.c
>>> +++ b/fs/reiser4/as_ops.c
>>> @@ -43,6 +43,7 @@
>>>
>>>    #include<linux/backing-dev.h>
>>>    #include<linux/quotaops.h>
>>>    #include<linux/security.h>
>>>
>>> +#include<linux/migrate.h>
>>>
>>>    /* address space operations */
>>>
>>> @@ -304,6 +305,98 @@ int reiser4_releasepage(struct page *page, gfp_t gfp
>>> UNUSED_ARG)>
>>>    	}
>>>
>>>    }
>>>
>>> +int reiser4_migratepage(struct address_space *mapping, struct page
>>> *newpage, +			struct page *page, enum migrate_mode mode)
>>> +{
>>> +	jnode *node;
>>> +	int result;
>>> +
>>> +	assert("???-1", PageLocked(page));
>>> +	assert("???-2", !PageWriteback(page));
>>> +	assert("???-3", reiser4_schedulable());
>>> +
>>> +	if (PageDirty(page)) {
>>> +		/*
>>> +		 * Logic from migrate.c:fallback_migrate_page()
>>> +		 * Only writeback pages in full synchronous migration
>>> +		 */
>>> +		if (mode != MIGRATE_SYNC)
>>> +			return -EBUSY;
>>> +		return write_one_page(page, true)<   0 ? -EIO : -EAGAIN;
>>
>> Why? The migrate.c's writeout() doesn't work?
>> I see it performs some cleanups..
>
> Hi,
>
> Because it's static. :)
> But OK, I exported writeout() and used it.
>
>>
>>> +	}
>>> +
>>> +	assert("???-4", !PageDirty(page));
>>> +
>>> +	assert("???-5", page->mapping != NULL);
>>> +	assert("???-6", page->mapping->host != NULL);
>>> +
>>> +	/*
>>> +	 * Iteration 1: release page before default migration by migrate_page().
>>> +	 * Iteration 2: check if the page is releasable; if true, directly
>>> replace +	 *              jnode's page pointer instead of releasing, then
>>> migrate using +	 *              default migrate_page().
>>> +	 */
>>> +
>>> +	/* -- comment taken from mm/migrate.c:migrate_page_move_mapping() --
>>> +	 * The number of remaining references must be:
>>> +	 * 1 for anonymous pages without a mapping
>>> +	 * 2 for pages with a mapping
>>> +	 * 3 for pages with a mapping and PagePrivate/PagePrivate2 set.
>>> +	 */
>>> +
>>> +	if (page_count(page)>   (PagePrivate(page) ? 3 : 2))
>>
>> OK
>>
>>> +		return -EIO;
>>
>> -EAGAIN would be better (like fallback_migrate_page() returns in
>> the case of "non-releasable")
>
> Fixed.
>
>>
>>> +
>>> +	/*
>>> +	 * Non-referenced non-PagePrivate pages are e. g. anonymous pages.
>>
>> "vfs-anonymous" are pages with page->mapping == NULL;
>>
>> "reiser4-anonymous" are pages which are dirtied via ->mmap(),
>> but not yet captured by reiser4 transaction manager.
>>
>> Note, that none of those cases takes place at this point.
>
> Hm, indeed that's an insane comment. Fixed.
>
>>
>>> +	 * If any, just migrate them using default routine.
>>> +	 */
>>> +
>>> +	if (!PagePrivate(page))
>>> +		return migrate_page(mapping, newpage, page, mode);
>>
>> OK
>>
>>> +
>>> +	node = jnode_by_page(page);
>>> +	assert("???-7", node != NULL);
>>> +
>>> +	/* releasable() needs jnode lock, because it looks at the jnode fields
>>> +	 * and we need jload_lock here to avoid races with jload(). */
>>> +	spin_lock_jnode(node);
>>> +	spin_lock(&(node->load));
>>> +	if (jnode_is_releasable(node)) {
>>> +		jref(node);
>>
>> OK
>>
>>> +
>>> +		/* there is no need to synchronize against
>>> +		 * jnode_extent_write() here, because pages seen by
>>> +		 * jnode_extent_write() are !releasable(). */
>>> +		page_clear_jnode(page, node);
>>> +
>>> +		if(jprivate(newpage)) {
>>
>> Hmm, strange: the newpage is freshly allocated and locked..
>> Somebody doesn't clean up after himself ???  Don't have other
>> ideas..
>
> Yes, apparently. There are no calls to set_page_private() in compaction.c or
> migrate.c (actually, in last file there are some, but they do not get called
> in observed pathes).
>
>>
>>> +			// FIXME: warning or what? happens on a regular basis, behavior is
>>> unaffected. +			warning("???-10", "Migration destination page has a
>>> non-NULL private field (%x) - resetting it", page_private(newpage));
>> Does it look like a pointer, which can be dereferenced?
>> (print it better in %p format). If so, try to detect a
>> jnode at this address by jnode's magic (JMAGIC 0x52654973,
>> present only when debug is on). To make sure we are not
>> the culprit..
>
> Cannot be dereferenced. Proved by a handful of oopses...
> The addresses (as printed by %p) look like "ffffea0002419800" and then
> I get pagefault oopses for addresses like "0000000000001010".


This is compaction manager, who provides pages with not cleared
private info. Lustre had the same problem. I've discussed with VS,
and here is his original explanation:

Vladimir Saveliev wrote:
 > migrate_pages() used to allocate new pages with a function passed as a
 > parameter.
 >
 > int migrate_pages(struct list_head *from,
 > new_page_t get_new_page, unsigned long private, bool offlining,
 > bool sync)
 >
 > In most cases allocating function passed to migrate_pages() ends up
 > with __alloc_pages() which calls get_page_from_freelist()
 > ->..-> prep_new_page() which sets page->private to 0.
 >
 > There is one exception however. In case of compact_zone() (introduced
 > in rhel6 kernels) allocating function is compaction_alloc().
 >
 > This function seems to avoid traditional page allocation path, it
 > takes free pages from isolated free lists and page->private does not
 > get set to 0.
 >
 > Then migrate_page_move_mapping() puts that new page into mapping's
 > page tree where lustre's ll_read_ahead_page() finds nonprivate page
 > with page->private != 0 and oops-es.


>
>>
>>> +			set_page_private(newpage, 0ul);
>>> +		}
>>> +
>>> +		result = migrate_page(mapping, newpage, page, mode);
>>> +		if (unlikely(result)) {
>>> +			jnode_attach_page(node, page); /* migration failed - reattach the old
>>> page */ +		} else {
>>> +			jnode_attach_page(node, newpage);
>>> +		}
>>> +
>>> +		jput(node);
>>> +
>>> +		spin_unlock(&(node->load));
>>> +		spin_unlock_jnode(node);
>>> +		assert("???-9", reiser4_schedulable());
>>> +		return result;
>>> +	} else {
>>> +		spin_unlock(&(node->load));
>>> +		spin_unlock_jnode(node);
>>> +		assert("???-8", reiser4_schedulable());
>>> +		return -EIO;
>>
>> -EAGAIN
>
> Fixed.
>
>>
>>> +	}
>>> +}
>>> +
>>
>> So simply releasing the page (by default migration routine) doesn't
>> work, while such transfer of the relationship (page, jnode) to
>> another pair (newpage, jnode) does work? Can not understand this..
>>
>> E.g. vmscanner (vmscan.c), which also releases releasable page, but
>> doesn't provide a newpage instead (in contrast with migration) works
>> perfectly..
>
> /me just looked at vmscan.c, which also skips ->releasepage() when there is
> no private data on page, and wonders how did that ever work with reiser4.


It does right things: ->releasepage() is only to free all resources
related to private info. Moreover, being called with zeroed private,
->releasepage() will oops.

Sorry for confusion: I was unhappy that default migratepage doesn't
check reference counter. Actually, it does: migrate_page() calls
migrate_page_move_mapping(), which checks if the counter is
2 + page_has_private(page).

I think that default migratepage (fallback_migrate_page) must work for
all file systems. For some of them it can be suboptimal, so migration
developers provided possibility to supply an optimal one via
->migratepage asop. I am sure we'll eventually understand why default
migratepage doesn't work for reiser4..


>
> So I'd say there is nothing strange in that the fallback_migrate_page() does not work
> while our custom one works (it's all about remembering about non-PagePrivate pages);
> instead, it is strange that the vmscanner works while fallback_migrate_page() does not.
>
> Maybe vmscanner finds out that the page is used by some other means?..
>
>>
>> Did you stress it well enough?
>
> Yes, I think so. Parallel building + various git operations + databases + virtual machines.
>
>>
>> I think we'll release reiser4-for-3.7 with fail_migrate_page (to fix
>> a stability point), and continue to play with migration..
>
> Maybe.. What are the next targets to play?


It depends on your preferences. What do you want?
Resolve performance issues? Add new features? Let me know and
I'll shed more light to the specified item...

Thanks,
Edward.
