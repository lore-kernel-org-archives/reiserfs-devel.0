From: Hans Reiser <reiser@namesys.com>
Subject: Re: Some more questions about Reiser4 ;)
Date: Sat, 10 May 2003 22:36:49 +0400
Message-ID: <3EBD46C1.9080801@namesys.com>
References: <001e01c313fd$975e7730$9900a8c0@xpstation> <3EBB9121.5060304@namesys.com> <007201c31709$4f36c5c0$9900a8c0@xpstation> <3EBD2427.4000806@namesys.com> <000201c31721$3aca6c50$9900a8c0@xpstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14059-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000201c31721$3aca6c50$9900a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com

Fred -- Speed Up -- wrote:

>
>  
>
>>>When you're speaking of a graph used by the semantic layer, would it be
>>>      
>>>
>part
>  
>
>>>of the VFS caching process ?
>>>      
>>>
>>Probably you mean dentry cache?
>>    
>>
>Should be ;)
>VFS seems to be very intrusive (I mean, it does a lot of the file-handling
>process) ... doesn't it limit your initiatives in implementing new
>structures ?\
>
Yes.  We manage somehow though.

>
>  
>
>>>Another thing I could hardly understand : does Reiser4 keep directories
>>>apart from files so that path can be cached or are they kept with the
>>>      
>>>
>same
>  
>
>>>status normal files got ?
>>>      
>>>
>>I can't understand you.
>>    
>>
>The reason why I asked this was because I didn't knew that VFS was the one
>and only responsible for the path resolving ;)
>
That is too strong a statement.  VFS delegates parts of the task to us, 
particularly directory lookup.

>
>  
>
>>>I didn't noticed the difference, thank you for pointing this out. I
>>>understand the "balancing" process, which is documented on your website,
>>>meaning packing dirty memory items on flushing, but I don't understand
>>>      
>>>
>what
>  
>
>>>you mean by "tree should not be singular" :
>>>does this mean a twig should
>>>contain more than one item ?
>>>      
>>>
>>This means, that tree is as minimal height as possible. Suppose we have
>>tree of height 3. Root level (3) contains one item and 2 sevel has  one
>>item. This tree is singular. That it is because,  we need only two
>>levels in this case. Tree like this is possible in balancing time. Flush
>>will care about that in its time.
>>    
>>
>OK, now how do you balance the tree when items are deleted, or added ? This
>operation must be very complex, 
>
yes, it is.

>as you don't have enough time to rebalance
>the whole tree on every commit considering performance issues. I read tree
>balancing (I mean keeping it consistent ;)) was done periodically, you're
>saying it's done at flush time, but how can you achieve such a complex
>operation in short enough time not to affect performance ?
>
we only squeeze what is being flushed to disk.  The CPU is faster than 
the disk drive, so it works.

>
>  
>
>>>The really interesting thing (the mysterious one :-D) is the
>>>consistency-keeping process. I didn't really understood the
>>>      
>>>
>left-delimiting
>  
>
>>>key concept, I guess it's something like a path in the storage tree
>>>      
>>>
>>You are right :)
>>    
>>
>You can't guess how happy I am ||:-D
>
>  
>
>>>In a consistent tree, do all the inodes got the same left-delimiting
>>>key depth ?
>>>
>>>      
>>>
>>We do not have inodes in storage tree. We have nodes instead.
>>
>>Left delimiting key means,  that if node pointer item in the index part
>>of tree (levels from tree height through to 2) points to some node, then
>>node pointer item key equal to leftmost key of the node node pointer
>>points to.
>>    
>>
>All right ;)
>
>
>Thank you,
>Fred
>
>
>
>  
>


-- 
Hans


