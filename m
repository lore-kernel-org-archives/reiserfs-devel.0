From: Hans Reiser <reiser@namesys.com>
Subject: Re: new credit printing mechanism now present in reiserfsprogs
Date: Wed, 23 Jul 2003 13:01:48 +0400
Message-ID: <3F1E4EFC.1020505@namesys.com>
References: <3F1E3D05.3090309@namesys.com>	 <20030723041553.791f4115.david@eelf.ddts.net> <1058949658.13913.2.camel@haron.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15001-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1058949658.13913.2.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Yury Umanets <umka@namesys.com>
Cc: David B Harris <david@eelf.ddts.net>, mason <mason@namesys.com>, reiserfs mailing list <reiserfs-list@namesys.com>, Debian Development <debian-devel@lists.debian.org>

Yury Umanets wrote:

>On Wed, 2003-07-23 at 12:15, David B Harris wrote:
>  
>
>>(That's a really long recipient list - does this need only go to
>>reiserfs-list@namesys.com and debian-devel@lists.debian.org?)
>>
>>On Wed, 23 Jul 2003 11:45:09 +0400
>>Hans Reiser <reiser@namesys.com> wrote:
>>    
>>
>>>it now prints two random credits rather than all of them, and credits 
>>>for the developers are in place.  suggestions about how to improve this 
>>>while preserving the credits (e.g. printing them at a different stage of 
>>>mkreiserfs, etc.) are welcome.
>>>      
>>>
>>If mkreiserfs was slower, I would suggest printing them at the start of
>>the program. It gives people something to read while they're waiting for
>>it to finish. (They would probably be more likely to read it, too.)
>>
>>    
>>
>
>  
>
>>It takes less than 4 seconds on a regular file of 410M here, though, so
>>that's not a whole lot of time. Does it take longer on bigger
>>filesystems? Lots of people are making many-gigabyte filesystems these
>>days, so perhaps that really is a good idea.
>>    
>>
>
>mkreiserfs creates bitmaps, and bitmap count depends on partition size,
>so it will take longer time on bigger partitions.
>
>  
>
Let's try it David's way.  Change it and upload it to the website.

-- 
Hans


