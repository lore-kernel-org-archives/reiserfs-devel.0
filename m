From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard implementation, pass 2: allocation issues
Date: Sun, 15 Jun 2014 23:49:59 +0200
Message-ID: <539E1507.4070503@gmail.com>
References: <3401431.jj87z7i0xD@intelfx-laptop> <539DD985.4010304@gmail.com> <1427799.NLW5IsuhQY@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=gWg5i3KrB7rjuW4YcejCwJ6VttKSpIb6hCNwCLTUbZM=;
        b=RbiZ20ipk0PGoCmeRX0oE8p0ZH4Yqm9vLD2YqwwZ5AVMxOO9sehFC11uMPgPHyjmBM
         uK+YIjucFTGisi07c9NRSuVHcIM/QVaJsZ4pVfW/ShlWkPWcbkJP50Zrmjj2M45hxVNH
         xa3wd5QwCjEloAe8Km80DtyaBSnR9PyiE9vivjR3qSdLzCIXReHX/fSGLvB57b3CXDbu
         gHu1+4pqk2B1kKhFLiWHvxuYeCcljW99D3ax1Q0idbtt+v52O/RiZq9JHkHUU469CFgv
         ttbyAbCuqbOcalrRWFvJZhwxWNnoZDF410DLCuu39k0PUil5I9w1eRzgGXmmbSUKsWz9
         Bv4w==
In-Reply-To: <1427799.NLW5IsuhQY@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org


On 06/15/2014 08:07 PM, Ivan Shapovalov wrote:
> On Sunday 15 June 2014 at 19:36:05, Edward Shishkin wrote:	
>> On 06/13/2014 10:28 PM, Ivan Shapovalov wrote:
>>> Here is my "analysis" of what happens in reiser4 during a transaction's
>>> lifetime wrt. block allocation and deallocation.
>>>
>>>
>>> THE EFFECTS (SEMANTICS) OF RELATED FUNCTIONS
>>> reiser4_alloc_blocks_bitmap(): allocates in WORKING BITMAP
>> Yes.
>>
>>> reiser4_dealloc_blocks_bitmap(!BA_DEFER): deallocates from WORKING BITMAP
>>> reiser4_dealloc_blocks_bitmap(BA_DEFER): stores to ->delete_set
>> This is correct for the middle-level allocator (without suffix "bitmap").
>> The low-level one frees blocks only in WORKING BITMAP.
> Yes, this was a wording mistake. I've noticed it shortly after sending...
>
>>> reiser4_pre_commit_hook_bitmap(): allocates all relocated nodes in COMMIT BITMAP
>> "Relocated" is bad term here: nodes with new data also get the flag
>> JNODE_RELOC. So, I would rather say, that it applies freshly allocated
>> nodes of the atom to COMMIT BITMAP.
>>
>>
>>>                                     deallocates ->delete_set from COMMIT BITMAP
>> applies the atom's delete_set to COMMIT BITMAP
> I've meant exactly this.
>
>>> reiser4_post_commit_hook(): deallocates ->delete_set using !BA_DEFER
>>>                                                      (i. e. from WORKING BITMAP)
>> applies the atom's delete_set to WORKING BITMAP.
> ditto
>
>> I would also mention a function of the middle-level block allocator
>> reiser4_alloc_blocks(): allocates blocks in WORKING  BITMAP.
> Yes, sure.
>
>
>> Note that the middle-level block allocator (block_alloc.c) actually
>> manipulates
>> with abstract space maps. Currently in reiser4 they are represented only by
>> bitmaps (plugin/space/bitmap.c). We can also implement another
>> representation -
>> extent tree (like in XFS). I don't see any needs for now, though.
> Extent trees seem to be interesting.. They claim that they are more efficient -
> is the difference that huge?
>
>>> TIMELINE OF ALLOCATIONS FOR "USUAL" NODES, AND TIMELINE OF TRANSACTION COMMIT
>>> - nodes are allocated using reiser4_alloc_blocks() and setting JNODE_RELOC,
>>>     so WORKING BITMAP ensures that two nodes cannot get the same block;
>>> - nodes are deallocated using reiser4_dealloc_blocks(BA_DEFER),
>>>     so their deallocation is not immediately reflected in WORKING BITMAP;
>>> (the relocate set is written here)
>>> - reiser4_pre_commit_hook_bitmap() uses 1) JNODE_RELOC flag and 2) ->delete_set
>>>     to convey effective bitmap changes into COMMIT BITMAP;
>>> (the journal and overwrite set are written here)
>>> - reiser4_post_commit_hook() uses ->delete_set to convey deallocations
>>>     from step 2 to WORKING BITMAP.
>>> (the discard happens here)
>>>
>>>
>>> TIMELINE OF ALLOCATIONS FOR WANDERED JOURNAL BLOCKS
>>> - at commit time, blocks are allocated using reiser4_alloc_blocks(), so they
>>>     are allocated in WORKING BITMAP and do not interfere with any "usual" blocks;
>>> - after writing wandered blocks, they are deallocated using
>>>     reiser4_dealloc_blocks(!BA_DEFER), i. e. from the WORKING BITMAP.
>>
>> So, the system of working and commit bitmaps plus the delete set seems
>> to be redundant? I think this is because of performance reasons: block
>> allocation is critical thing...
> Seems like it is -- for performance and simplicity (== robustness).
>
>>> CONCLUSION
>>> At possible transaction replay time, journal blocks are not allocated in any
>>> of the bitmaps. However, because the journal is read and replayed before a
>>> transaction has a chance to commit, this fact does not matter.
>>> What matters is that wandered journal blocks never hit COMMIT BITMAP.
>>>
>>> So, if I've got all this correct (which I highly doubt), the disk space leak
>>> (as you pointed it out) does not exist.
>> It seems, you are right..
>>
>>> What exists is a rather different problem with my idea of "log every
>>> deallocated block". Current implementation logs every block regardless of
>>> BA_DEFER flag presence or absence, so non-wandered blocks are logged twice.
>>>
>>> We could just use ->delete_set, but we would lose wandered blocks then.
>>> Or we could only log !BA_DEFER requests, which would do the right thing
>>> (wandered blocks + deallocations from reiser4_post_commit_hook()), but
>>> the reasoning behind this decision would not be obvious for a casual
>>> code reader.
>> I think that a good comment will save the situation..
>>
>>> Or we could log only wandered blocks (in addition to ->delete_set)
>>> at discard time, but this is messy and requires us to merge the discard log
>>> with ->delete_set at discard time.
>> what is the difference with the previous "we could.."?
> The previous option is to log all !BA_DEFER requests in addition to
> ->delete_set, so those two block sets would be partially overlapping.


Hmm.. Are they really overlapped?

reiser4_dealloc_blocks() looks like the following:
{
if (flags & BA_DEFER)
         log in the delete_set;
else
         deallocate in working bitmap
...
}

so (!BA_DEFER) requests and the delete_set look disjoint,
or, I missed something?

> And this option is to log only those !BA_DEFER requests which are not in
> ->delete_set, so no block will be stored twice. Thus we will have to consider
> both ->delete_set and this hypothetical ->discard_set at discard time.
>
>>> Or we could log wandered blocks straight into ->delete_set and do something in
>>> reiser4_post_commit_hook() to separate these entries, but this is super messy.
>>>
>>> I'm preferring the second way... Edward, please proof-read all this.
>> BTW, what about your current implementation? Does it work for you?
> Yes, it apparently does (no massive corruptions).
>
> I get batches of "orphan cluster" errors from time to time (from offset 0 till
> the supposed end of file),


this is fsck complaints?


>   but 1) I do not see which files get corrupted,
> 2) this could be due to txmod=wa, 3) my machine is pretty crashy now due to
> some driver issues, so I don't know what exactly causes this.
>
> Thanks for proof-reading. What do you think about all this?


I think that not bad for the beginning! I have purchased an SSD card,
hope to test the discard stuff in the near future.

Thanks,
Edward.
