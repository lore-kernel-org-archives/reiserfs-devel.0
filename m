From: Hans Reiser <reiser@namesys.com>
Subject: Re: Object Oriented FS
Date: Mon, 27 Oct 2003 22:01:12 +0300
Message-ID: <3F9D6B78.2090001@namesys.com>
References: <200310271843.KAA08513@amber.he.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15905-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310271843.KAA08513@amber.he.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Young <myoung@wildernessvoice.com>
Cc: 'darren' <teodarren@myrealbox.com>, reiserfs-list@namesys.com

Mike Young wrote:

>Hans,
>
>Do you believe this is just a marketing convention to refer to a file-system
>as an object oriented one? 
>
No.  Also, note that they aren't saying the fs is object oriented, they 
are saying the storage system is not a block device but an object server.

> Bear in mind that Microsoft is supposed to
>enrich their NTFS with object support from SQL Server in their next OS.
>
Reiser4 and MS are talking about different layers than Panassas when we 
talk about being object oriented.  MS objects and Reiser4 plugins might 
be similar notions, I am not an NTFS expert.....

>  The
>code name for this is Longhorn.
>
>I really can't tell what this means to a file system in terms of support.
>It sounds like it's intended to provide support for really large numbers of
>files in a single directory
>
Uh, reiser4 does that without objects having anything to do with it.  
Large numbers of files in a single directory means one should use trees 
not linear searches.....

> vs. nested ones.  But I'm just not sure.  Do you
>see a limitation, going forward, with Reiser4 and large numbers of files?
>  
>
We have trouble with more than 2^60 files in the filesystem. 

;-)

An interesting question though is at how many files in a directory being 
read does dcache start to croak and sys_reiser4 becomes a performance 
necessity....?  Maybe in a few weeks Mr. Demidov can measure that.

>Thanks,
>
>Mike
>
>-----Original Message-----
>From: Hans Reiser [mailto:reiser@namesys.com] 
>Sent: Monday, October 27, 2003 10:23 AM
>To: darren
>Cc: reiserfs-list@namesys.com
>Subject: Re: Object Oriented FS
>
>darren wrote:
>
>  
>
>>allows very high
>>throughput by scaling
>>
>>
>>
>> 
>>
>>    
>>
>Do you know what that  means?  (Seriously, I don't....)
>
>  
>


-- 
Hans


