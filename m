From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS problems
Date: Thu, 07 Aug 2003 17:22:44 +0400
Message-ID: <3F3252A4.4010104@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806191806.A31496@bitwizard.nl> <20030806172834.GA15024@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806172834.GA15024@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

Oleg Drokin wrote:

>  
>
>>>>datarecovery company. We probably don't have any current
>>>>datarecoveries of people with Reiserfs on their disk. But if we had a
>>>>disk-image with a valid (or not) Reiserfs on it, would it link that
>>>>into our filesytem?
>>>>        
>>>>
>>>yes it will.
>>>So basically speaking you do not want to run rebuild-tree operation on the 
>>>FS that contains files with reiserfs metadata embedded in them in clear.
>>>This is also explained in our FAQ.
>>>      
>>>
>>Oh, great. It provably corrupts our filesystem which is only fixed by
>>running a rebuilt-tree, but if we have certain data (which we actually
>>are likely to have!) then we simply can't. 
>>    
>>
>
>Well. This is actually unfortunate, I agree. In such a case you'd better
>move your reiserfs images to some other place for the time of reiserfsck --rebuild-tree run.
>
or compress them.

>
>  
>
>>WOW it's documented. So it's not a bug. OK. Fine. 
>>    
>>
>
>This does not make it less annoying, though.
>But we cannot do much about it. Really.
>
we fixed it in v4.....

>
>  
>
>>>>We've noticed horrible slowdowns when the filesystem is > 90% full. It
>>>>turns out that when a block group is more than 90% full reiserfs will
>>>>prefer a different block group. i.e. it is ALWAYS switching block
>>>>groups when the whole disk is > 90% full. Something like that. When we
>>>>report something like that it's always: Ah, yes, that's an old bug
>>>>we've fixed it. Use patch.....
>>>>        
>>>>
>>>In fact this is not exactly true, it only switches to other "block
>>>group" if you are creating new file. Why do you think this is a
>>>problem?  (of course I am speaking of 2.4.20+ kernels).
>>>      
>>>
>>Well we were recovering data into 1G files, but performance of adding
>>a new block was horrible. It was doing this for every block. Either it
>>    
>>
>
>This is really strange. Unless you are having horrible fragmentation, that should
>not happen.
>
try replicating it instead of telling him it cannot happen.


-- 
Hans


