From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS problems
Date: Thu, 07 Aug 2003 17:03:02 +0400
Message-ID: <3F324E06.2080805@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806191806.A31496@bitwizard.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030806191806.A31496@bitwizard.nl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

Rogier Wolff wrote:

>>In fact this is not exactly true, it only switches to other "block
>>group" if you are creating new file. Why do you think this is a
>>problem?  (of course I am speaking of 2.4.20+ kernels).
>>    
>>
>
>Well we were recovering data into 1G files, but performance of adding
>a new block was horrible. It was doing this for every block. Either it
>was doing a fruitless search on every block-add or it was actually
>adding the block to another block group. Anyway, performance dropped
>-=*A LOT*=- when this happened.
>
>I think you're describing the way it should be, or "is now", but there
>was a bug that caused it to behave differently.
>
>	Roger. 
>
>
>  
>

Can you help Oleg investigate this more closely by providing an exact 
account of what to do to replicate it?  Oleg, replicate this and observe 
what happens.

-- 
Hans


