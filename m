From: Hans Reiser <reiser@namesys.com>
Subject: Re: Performance improvements to key comparison functions
Date: Tue, 13 Jul 2004 23:59:32 -0700
Message-ID: <40F4D9D4.8050306@namesys.com>
References: <20040713195957.4FB4515CD0@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19607-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040713195957.4FB4515CD0@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com

David Dabbs wrote:

>>Please let me know the results of your further testing and refinements.
>>Thanks for your contribution to our work.
>>
>>mongo is my preferred benchmark, it has a lot of settings that allow you
>>to define the file set, and I encourage you to play with them.   If you
>>call me, I'd enjoy talking with you about your work.
>>
>>+1 510 482-2483, or cell phone of +1 510 435-9758
>>
>>Hans
>>    
>>
>
>You're welcome! Thanks for your encouragement and for your and your team's
>vision and great work. Since you've opened the door, I thought I'd mention
>some ideas that I've been considering. 
>
>Level-Segregated znode Cache
>The cache scanning walks the cache and calls znode_contains_key_strict if
>cached_node->level == search_key->level. If the scan tests some nodes not at
>the same level as the in-cache node it will ultimately find, does it make
>sense to segregate the cache by level?
>
Please forgive me for not having read this code in a year, can you say 
this in more detail?

> True, this is a simple int
>comparison, but it really only needs to be done once. The most
>straightforward approach might be a static array of pointers to cbk_cache
>list heads of size REISER4_MAXTREELEVEL (256). If each level cache uses the
>same cache structure/#slots (16) as today, then the overhead would be
>limited to the static array storage and the additional list members (16
>versus (256 pointers + num_filled_slots > 16)) versus the current fixed max
>of 16. Cache misses should incur no penalty, as each cache would contain no
>more than the current max slots. If a statically-sized cache array is
>odious, then one could use a level-keyed skip list, though the extra
>structure might not be worth the storage savings. The cost to walk the skip
>list to find the level cache list might net out with comparing levels for
>each cached node scanned. Another benefit could be a reduction in cache
>contention, as each scanning thread would only lock the level cache specific
>to the key being sought. 
>  
>
Is your point that a list structure is inferior to an array, when it is 
used for a fixed size cache?

>Lock-Free Data Structures
>I've recently been reading research regarding lock-, wait-, and
>obstruction-free concurrent data structures. Here are some relevant links:
>
>	http://www.cs.yorku.ca/~ruppert/papers/lfll.pdf
>	http://www.cl.cam.ac.uk/Research/SRG/netos/lock-free/
>	http://research.sun.com/scalable/pubs/index.html
>
>To the degree that these approaches do not require architecture-specific
>atomic primitives, their use could increase performance and possibly
>simplify things in some cases. Assuming they are portable, the place to
>apply them might be the cache linked-list(s).
>  
>
Please let me know your thoughts on this once you have had a chance to 
pick a suggestion you like the most.  I will print these and put them in 
my queue, sigh.

>All in good time. I first need to finish my keycmp changes, thoroughly test
>them before even thinking about anything else.
>
>
>David
>
>
>
>
>  
>

