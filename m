From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: discard support
Date: Fri, 02 May 2014 20:10:16 +0200
Message-ID: <5363DF88.7060904@gmail.com>
References: <1496741.djsd6PJ1Ae@intelfx-laptop> <3402083.oAjQiz7CVk@intelfx-laptop> <5363A699.90108@gmail.com> <4594794.KsdUPSo0Ac@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=1CbX43oi8SGb/2Qm2olxEHaFZbtUzB3njUnSwwDXd/Q=;
        b=UJlf4Bnz9Pou9vGCkubKBICPAR2PjU6JVXbIfsAKSG9knibrb0BbZLrGW8+EF4Sci4
         M8kMbszTVY5yTqfpTWQWFRxm3kCrkTAU+Hi9LodEb/HqBayqcR519sQkf5irwZZNfgTa
         zYzvrF48daPB5f66y8WYGjjWFwPE6bVMjb+4pL0lqlQ4KWkH3Xl+ob7F5CQ865zX6Cg3
         qG1pXGEif8mKnHHA68XxRMAHdP7V4TWI6Gbo6e/kc6uhX/HCDMLD621UYNh3AtVJsHwo
         XmQOL25CsGlKuP1awLWymireUV57G8mkv6zuMTHsYuVFlbUb/uN0UEeknh4xGaEVNjuj
         dD+g==
In-Reply-To: <4594794.KsdUPSo0Ac@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/02/2014 04:32 PM, Ivan Shapovalov wrote:
> On Friday 02 May 2014 at 16:07:21, Edward Shishkin wrote:	
>> On 05/02/2014 03:36 PM, Ivan Shapovalov wrote:
>>> On Friday 02 May 2014 at 13:48:28, Edward Shishkin wrote:
>>>> On 05/02/2014 01:51 AM, Ivan Shapovalov wrote:
>>>>> On Wednesday 30 April 2014 at 19:51:03, Edward Shishkin wrote:
>>>>>> On 04/30/2014 05:04 PM, Ivan Shapovalov wrote:
>>>>>> [...]
>>>>>>
>>>>>>>> There is a ready implementation of rb-trees in the kernel (see
>>>>>>>> ./lib/rbtree.c,
>>>>>>>> ./lib/rbtree_test.c). Could you please take a look at this?
>>>>>>> I've checked it already. Well, in case of trees:
>>>>>>> - combined extent insertion+adjacent extent merge complexity is
>>>>>>> O(n*log(n))
>>>>>> Actually, this is:
>>>>>>
>>>>>> 1) Add n extents one-by-one to empty tree:
>>>>>> log(1) + log(2) + ... + log(n-1)
>>>>>>
>>>>>> 2) Merge 2 trees of n extents:
>>>>>> log(n) + log(n+1) + ... + log(2n-1)
>>>>>>
>>>>>> Total: log(1*2*...*2n-1) = log((2n-1)!)
>>>>>>
>>>>>> in accordance with Stirling's formula:
>>>>>>
>>>>>> log((2n)!) = log(((2n)^(1/2))*(2n/e)^n) =
>>>>>> = (1/2)*log(2n) + n*log(2n/e) < n + n*log(n)
>>>>> Hm.
>>>>>
>>>>> Consider we fill two data structures with N extents each, then merge
>>>>> these
>>>>> two data structures and prepare the resulting one for traversal (for
>>>>> lists it will be sorting, for trees that's no-op).
>>>>>
>>>>> For trees:
>>>>> 1) Adding
>>>>> 2*log((n-1)!)
>>>> Why "2*" ?
>>>> I suppose they are filled in parallel...
>>>> Total complexity (when everything is serialized) is not interesting ;)
>>> Oh why? Everything is still serialized by the physical CPU, for that
>>> matter. So less complexity -> less CPU time...
>> We can perfectly populate different "discard trees" in parallel on
>> different CPUs.
>> As to sorting the list: I don't know how to perform it in parallel :)
>> Default assumptions, that everything is serialized, usually lead to various
>> bad-scalable solutions...
> Ah, now I understand what do you mean. If that's about doing less work under
> the tmgr mutex,


No. This is about minimizing real time.
We don't know about mutexes. We want to decide, what is preferable:
populating trees, or sorting the list. There is a chance that the first will
be faster in systems with many CPUs, so I suggest to use trees.
That's all!


>   then yes, trees are better than lists.
>
> BTW, I've seen that reiser4 releases atom lock before allocating another node
> for a blocknr_set, and that leads to a "do { } while (ret == -E_REPEAT)" loop
> around the blocknr_set_add_extent() calls. Is this the preferred way of
> attaching a dynamic data structure to an atom?


TBH, I have never looked at the deallocation paths in reiser4: everything
worked fine there.. BTW, why not to use atom's delete_set to discard things?
Could you please take a look?


>>>>> 2) Merging
>>>>> log((2n-1)!/(n-1)!)
>>>>>
>>>>> 3) Sorting
>>>>> none
>>>>>
>>>>> Total:
>>>>> log((2n-1)!) + log((n-1)!)
>>>>>
>>>>> For lists:
>>>>> 1) Adding
>>>>> 2N
>>>>>
>>>>> 2) Merging
>>>>> constant
>>>>>
>>>>> 3) Sorting
>>>>> 2N*log(2N)
>>>>>
>>>>> Total:
>>>>> 2N+2N*log(2N)
>>>>>
>>>>> Quick testing in WolframAlpha shows that, if these estimations are
>>>>> correct,
>>>>> lists tend to have lesser complexity starting with approx. N=160.
>>>>>
>>>>>> Since atoms can be merged in parallel, we have that
>>>>>> trees work better than lists. Also tree of extents has
>>>>>> better memory consumption because of merging extents.
>>>>>>
>>>>>>>     against O(n+n*log(n)) in lists;
>>>>>>>
>>>>>>> - joining two trees is not less than O(log(n)) against O(1) in lists.
>>>>>>>
>>>>>>> So I can't see any benefit in using trees, and join performance is a
>>>>>>> downside of these. Am I missing something?
>>>>>> [...]
>>>>>>
>>>>>>> Why after reiser4_invalidate_list()? I thought that it should be
>>>>>>> called between reiser4_write_logs(), but before
>>>>>>> reiser4_invalidate_list().
>>>>>> OK, insert before. I think, it doesn't matter, since we don't look
>>>>>> at this list when issuing discard requests, no? :)
>>>>> I just don't understand what implications does that function have. It
>>>>> seems to mess with jnodes, and I can imagine that this leads to races
>>>>> with somebody modifying the bitmaps while issue_discard_requests() tries
>>>>> to read them to check discard extents...
>>>> "somebody modifying the bitmaps" will wait for commit_mutex.
>>>> Have you found where the bitmaps are modified? This is
>>>> pre_commit_hook_bitmap().
>>> Yes, but I was not sure this is the only place where the bitmaps are
>>> touched...
>>>
>>>>>     Again, for me, internals of reiser4 still mostly look
>>>>>
>>>>> like heavy wizardry. :)
>>>> This is because the technical level of reiser4 is very high.
>>>> Many very strong scientists contributed to reiser4.
>>>>
>>>> I also don't understand in details how some reiser4 subsystems work.
>>>> Once I need details, I open the respective code and read it with the
>>>> comments.
>>>> The most important thing is general understanding of how it works.
>>>> Nobody is able to grok this only by reading reiser4 code before
>>>> sleeping. You need to implement at least one feature by your hands.
>>>> Yes, it is not easy, and not for everyone. Like every high-level research
>>>> in the science...
>>>>
>>>> Edward.
>>> ...and nobody to this point had written an explanation of that, or some
>>> piece of documentation except the design document...
>> what explanation do you mean?
>>
>> Edward.
> A general explanation of how does it work :)


I think this is because of historical reasons.
Such good explanation costs a lot of time and efforts.
Namesys was a small company, we couldn't afford to have a technical writer.
Hans insisted on good comments in the source code..


