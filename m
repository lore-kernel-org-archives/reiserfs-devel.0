From: Hans Reiser <reiser@namesys.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Fri, 23 May 2003 02:48:05 +0400
Message-ID: <3ECD53A5.40801@namesys.com>
References: <26734079117-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14215-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <26734079117-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

Alexander G. M. Smith wrote:

>Hans Reiser wrote on Thu, 22 May 2003 21:16:15 +0400:
>  
>
>>Alexander G. M. Smith wrote:
>>    
>>
>>>Only on the average, at least in the original skip list algorithm.  The
>>>height is determined randomly when the node is created; there is no
>>>rebalancing.  The random distribution is defined as you would expect,
>>>50% of the nodes have 1 level, 25% have 2 levels, ... 0.5**n of the
>>>nodes have n levels.  Surprisingly, this works fairly well.
>>>      
>>>
>>To have a level means to be on that level or lower?
>>    
>>
>
>Yes, at least for skip lists.  A level n node has n next pointers
>(or maybe n+1 if you are counting starting at zero) in the skip list.
>All nodes have level 0 next node pointers (same as an ordinary linked
>list).  Half of them have level 0 and level 1 pointers (level 1 pointers
>point to the next node that is level 1 or higher, skipping past level 0
>nodes - that's why it's a "skip list").  A quarter have level 2, 1, and 0
>pointers.  In general, when you create a node, randomly determine its
>level (rarely is infinite :-), allocate an array of pointers that big,
>and thread it into the 0 to n different parallel level lists.  Of course,
>the list head/tail endpoints have to have all n levels.
>
>- Alex
>
>
>  
>
Do nodes contain both pointers and data?

-- 
Hans


