From: Michael Gaughen <mgaughen@polyserve.com>
Subject: Re: BUG in reiserfs_write_full_page().
Date: Mon, 21 Jul 2003 14:24:44 -0700
Message-ID: <3F1C5A1C.4070607@polyserve.com>
References: <3F1712F6.7080204@polyserve.com>	 <1058477610.4012.333.camel@tiny.suse.com> <3F171ABF.6080601@polyserve.com>	 <1058534583.7878.351.camel@tiny.suse.com>	 <16151.63980.766223.769053@laputa.namesys.com> <1058536844.7878.371.camel@tiny.suse.com> <3F183F99.7080405@polyserve.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14985-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F183F99.7080405@polyserve.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Michael Gaughen <mgaughen@polyserve.com>, reiserfs-list@namesys.com

Michael Gaughen wrote:

> Chris Mason wrote:
>
>> On Fri, 2003-07-18 at 09:45, Nikita Danilov wrote:
>>  
>>
>>> > > But, we shouldn't have to.  Other parts of the OS should be 
>>> protecting
>>> > us from a writepage being called at this time, which is why the 
>>> bug is
>>> > there.  Someone did a non GFP_NOFS allocation with a transaction
>>>
>>> __bread()->__getblk()->__find_get_block()->find_get_page() allocates
>>> page with bdev->bd_inode->i_mapping->gfp_flags, which is GFP_USER, that
>>> includes GFP_FS.
>>>   
>>
>>
>> You're in 2.5 land ;-)  There seem to be a few problems there, I've got
>> an oops in find_inode and a deadlock under load, but I still need to
>> read the (huge) sysrq-t to figure things out.
>>
>
> But, in 2.4, the page fault handling code also gets the gfp_mask from 
> the inode's
> address_space gfp_mask (in ->page_cache_read()->page_cache_alloc()).  
> It looks
> like clean_inode() sets the gfp_mask to GFP_HIGHUSER, which also includes
> GFP_FS, and unless I am missing something, I don't see that GFP_FS is 
> ever
> cleared in this case. 


And to take this a step further (if what I described is indeed the 
problem),
GFP_NOFS could be cleared, in inode->i_mapping->gfp_mask, inside of
reiserfs_read_inode2() and reiserfs_new_inode().  Then you don't have to
rely on the core kernel for protection, and you truly guarantee that write-
page will not be called in this case.  Does that sound reasonable?

-Mike

