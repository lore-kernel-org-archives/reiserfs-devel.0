From: Hans Reiser <reiser@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Wed, 12 Mar 2003 14:12:53 +0300
Message-ID: <3E6F1635.2010305@namesys.com>
References: <1047400482.8215.312.camel@tiny.suse.com>	 <20030311194205.A4493@namesys.com>	 <1047403968.8219.337.camel@tiny.suse.com>  <3E6E584D.4080809@namesys.com>	 <1047421551.8219.448.camel@tiny.suse.com>  <3E6E674E.4040305@namesys.com> <1047433739.8215.487.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13217-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1047433739.8215.487.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Tue, 2003-03-11 at 17:46, Hans Reiser wrote:
>  
>
>>Chris Mason wrote:
>>
>>    
>>
>>>On Tue, 2003-03-11 at 16:42, Hans Reiser wrote:
>>>
>>> 
>>>
>>>      
>>>
>>>>Chris, don't you think the right answer would be to take zam's resizer 
>>>>and make a defragmenter out of it?
>>>>   
>>>>
>>>>        
>>>>
>>>Yes and no, for a defrag program to fix things we'd have to agree on an
>>>optimal layout ;-)  Also it assumes the machine has idle time when a
>>>defragment cycle is possible. 
>>>
>>>      
>>>
>>No, it assumes that 80% of files don't move during the course of a week, 
>>so if defrag takes a week, it still adds value.
>>
>>    
>>
>I ran a number of systems where this wasn't true.  Spool files are
>constantly appended to or deleted by pop/imap servers.  Idle time is
>important, between normal operations and backups it is almost impossible
>to find a time when big servers have disk bandwidth to spare.
>
>I like the idea of a dynamic in-kernel fragmentation tool though, you
>mark a file as being in need of reallocation, and it happens before io
>or something (hand waving is fun).
>
You mean you like the allocate on flush we do in reiser4?

Perhaps I should say only that for 80% of machines 80% of the files 
never move during the course of a week.;-)

allocate on flush will improve a lot of the cases, and an online 
repacker will improve a lot of the ones that allocate on flush does not 
improve.

-- 
Hans


