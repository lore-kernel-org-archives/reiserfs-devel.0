From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Fri, 14 Mar 2003 21:59:26 +0300
Message-ID: <3E72268E.8060801@namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com>	 <20030311194205.A4493@namesys.com>	 <1047499021.8219.604.camel@tiny.suse.com>  <3E6F9DE3.2070902@namesys.com>	 <1047571151.8219.956.camel@tiny.suse.com>  <3E711F34.4060309@namesys.com>	 <1047605662.8215.1068.camel@tiny.suse.com>  <3E71AE72.3090107@namesys.com> <1047649898.8218.1095.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13257-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1047649898.8218.1095.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Fri, 2003-03-14 at 05:26, Hans Reiser wrote:
>
>  
>
>>>That would mean the parent directory counter would have to be updated
>>>every time we allocated a block in any sub directory.  Plus the counter
>>>would have to be inherited down the chain in deep directory structures. 
>>>More importantly, I'd rather not waste space in the stat data to store
>>>the information when we can get it during a search ;-)
>>>
>>>      
>>>
>>The space usage is trivial.
>>
>>    
>>
>
>Grin, who are you and what have you done with the real hans ;-) 
>
You don't need it for every file, you need it for every directory.

> It's
>two fields, one for the counter and one to point up the chain to the
>real owner.  It's yet another field to maintain as objects are deleted
>and created, 
>
or written to or truncated, yes, the cost of lots of updates to this are 
worrying.    It might be better done in the repacker than dynamically, 
in fact I just convinced myself of that, how about you.....?

>a minor format change since old filesystem stat data won't
>have the field, and requires support from fsck.
>
Nobody will mind if we change reiser4 format now....

>
>All of which is a lot of work when we can get similar info directly from
>the tree.
>
>  
>
>>>>How big are your packing localities tending to be?
>>>>        
>>>>
>>>Not more than can be pointed to by the leaf level and the level directly
>>>above it.  I know that's not very specific, but it varies by the
>>>dataset.  packed tails and long directory names lead to more packing
>>>localities per MB.
>>>
>>>      
>>>
>>Which is why it is the wrong measure, yes?
>>
>>    
>>
>
>Well, yes and no.  The packing locality groups tree objects, and so the
>idea behind the patch is to group all tree objects when they are part of
>a directory tree that isn't very large.  A smart block allocator for the
>tree nodes can use this information too.
>
>In other words, my hope is this patch also makes btree searches more
>efficient while walking a given directory tree, since we aren't jumping
>all over the btree for each subdirectory.
>
>-chris
>
>
>
>
>  
>


-- 
Hans


