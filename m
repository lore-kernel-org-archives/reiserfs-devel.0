From: Hans Reiser <reiser@namesys.com>
Subject: Re: vpf-10680, minor corruptions
Date: Mon, 23 Jun 2003 13:28:31 +0400
Message-ID: <3EF6C83F.6060702@namesys.com>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com> <3EF6AE67.5090502@namesys.com> <20030623090258.GA12259@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14667-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030623090258.GA12259@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Christian Kujau <evil@g-house.de>, ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Mon, Jun 23, 2003 at 11:38:15AM +0400, Hans Reiser wrote:
>  
>
>>>Well, normally reiserfs is caring about consistency.
>>>There are two noticeable omissions, though:
>>>1. if the unexpected shutdown was because of power loss and you have write 
>>>cache enabled
>>> and your write reorders write requests, then it is possible invalid data 
>>> gets
>>> written to disk, before "transaction is finished" mark is written to the 
>>> drive.
>>> (there is a way to avoid this with some drives, by explicitly flushing
>>>  drive cache in some cases, but this method seems to create some problems
>>>  on itself. So this is not yet merged in any mainstream kernel).
>>>      
>>>
>>Can you provide details on this not being merged?
>>    
>>
>
>It was never submitted to inclusion into mainstream kernel. Hence it was never merged.
>I saw that Jens Axboe (I think) posted the code for public review/verification, but that's it.
>
>Bye,
>    Oleg
>
>
>  
>
Please pursue the matter with Jens and Chris.

-- 
Hans


