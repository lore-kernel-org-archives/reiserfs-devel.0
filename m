From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard support
Date: Wed, 07 May 2014 23:04:10 +0200
Message-ID: <536A9FCA.9060907@gmail.com>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <2562062.LWrRe7vaEB@intelfx-laptop> <5368A44D.5090607@gmail.com> <9209978.Zaz5Vcsz4S@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=dl31fzoFB6ZRuV8lK/y8+xWXbGYKb30x0DeKOPexQ0g=;
        b=p8PdnY0weUjh7Vtjcd6X/6wgUMfxKJtWeHHup2mPW2dkDMvhLbD6APnjD/BEnA3md+
         K1fiqwZih678083J2V8/iQUlhszVTKd6VBT8T186WlW//2GclaZaT/d2pKLvbu6coEX+
         YIw5bCeRUiLCNMZs+J5Sj6wjs2Xbm2M8i/57kbSamsjjMfJm4ZwvpGeStrt3j9IVwW0r
         YagZOWOuStpisvndqb6mCjlJpE4qLxWnq6Mz4fvSVsYB2ejM11HMnn9sT8ECw7/eOwtt
         OK5rskAGexgX5qCH4xAM8t0mNy5uG91odKynInIV+W34RCYiI6rp04kuWQsmjnboQOA0
         Gmnw==
In-Reply-To: <9209978.Zaz5Vcsz4S@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/07/2014 09:35 AM, Ivan Shapovalov wrote:
> On Tuesday 06 May 2014 at 10:58:53, Edward Shishkin wrote:	
>> On 05/03/2014 10:32 PM, Ivan Shapovalov wrote:
>>> On Saturday 03 May 2014 at 22:21:58, Edward Shishkin wrote:
>>>
>>> TBH, I have never looked at the deallocation paths in reiser4: everything
>>> worked fine there.. BTW, why not to use atom's delete_set to discard
>>> things? Could you please take a look?
>> [...]
>>
>>>>> Blocks used for the journal (wander.c) are deallocated without BA_DEFER
>>>>> set
>>>>> and thus they never hit delete_set. However, we want to discard these.
>>>> This happens in error paths. Don't be so scrupulous ;)
>>> I don't think so:
>>> - wander.c:485
>>>
>>>     dealloc_tx_list() <- reiser4_write_logs()
>>>
>>> - wander.c:505
>>>
>>>     dealloc_wmap_actor() <- dealloc_wmap() <- reiser4_write_logs()
>> Yep, indeed.
>> I don't completely understand this special case of wandered blocks.
>  From what I've been able to understand, delete_set is not used there just
> because the deallocations are done directly to the bitmaps: we already hold
> the tmgr mutex at that time.
>
>> Also I don't see where wandered blocks are deallocated after journal
>> replay (as journal is not needed any more): it can be a possible leak
>> of disk space after system crashes..
> Maybe the bitmap version submitted to disk does not have these blocks
> allocated? I don't really understand what's going on wrt. disk write-out, and
> I don't even understand the difference between COMMIT BITMAP and WORKING
> BITMAP...


I'll try to find the original zam's design document.
It is horribly written and obsolete, but it contains some hints about 
who is who..


>
>> Once we understand it, I think we'll able to re-use the delete_set for
>> discard needs.
>>
>> Edward.
> We can get any benefits from re-using delete_set only if we replace it with a
> list/rbtree. Current implementation (blocknr_set) seems to be inherently
> unordered and can't be trivially modified (extent merge etc), so if we want to
> use delete_set as-is, we still need to copy the extents into a better data
> structure at commit time.
>

