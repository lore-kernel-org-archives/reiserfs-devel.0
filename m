From: Hans Reiser <reiser@namesys.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Thu, 22 May 2003 21:16:15 +0400
Message-ID: <3ECD05DF.8090107@namesys.com>
References: <11604422062-BeMail@cr593174-a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14208-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <11604422062-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander G. M. Smith" <agmsmith@rogers.com>
Cc: reiserfs-list@namesys.com

Alexander G. M. Smith wrote:

>Hans Reiser wrote on Thu, 22 May 2003 19:30:16 +0400:
>  
>
>>Forgive me for asking some bonehead questions.....
>>
>>Are skip lists height balanced?  (All paths to the leaves are equal?)
>>    
>>
>
>Only on the average, at least in the original skip list algorithm.  The
>height is determined randomly when the node is created; there is no
>rebalancing.  The random distribution is defined as you would expect,
>50% of the nodes have 1 level, 25% have 2 levels, ... 0.5**n of the
>nodes have n levels.  Surprisingly, this works fairly well.
>
>- Alex
>
>
>  
>
To have a level means to be on that level or lower?

-- 
Hans


