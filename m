From: Hans Reiser <reiser@namesys.com>
Subject: Re: Multiple data streams...
Date: Fri, 04 Apr 2003 01:53:27 +0400
Message-ID: <3E8CAD57.50800@namesys.com>
References: <6167696812.20030402112847@tnonline.net> <200304030732.31133.russell@coker.com.au> <3E8C84D9.3000401@namesys.com> <200304040557.56832.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13562-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304040557.56832.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <russell@coker.com.au>
Cc: reiserfs-list@namesys.com

Russell Coker wrote:

>On Fri, 4 Apr 2003 05:00, Hans Reiser wrote:
>  
>
>>>OS/2 used EA's for icons and description text in 1992.  There's no reason
>>>why EAs can't be used for this purpose today as well.
>>>      
>>>
>>Implement inherited stat data, hidden directory entries, and files and
>>directories and you don't need EAs.... yes?
>>    
>>
>
>That sounds like EAs the hard way...
>
>  
>
It is the difference between architecting and incrementally evolving in 
response to each separate feature request.

Sharing stat data and hiding directory entries are useful for a lot more 
than streams.

Atomic transactions are also useful for a lot more than EAs.....

I work by carefully defining easily recombinable primitives.  Others 
work by asking what does Unix have and copying it.

This is why it took far longer for us in the beginning, and why over the 
next 30 years we will develop faster than other filesystems.  That is 
why ext2 currently has more market share --- a lot of people benefited 
from them getting something out quick that was usable...

-- 
Hans


