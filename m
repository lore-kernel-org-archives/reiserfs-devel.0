From: Hans Reiser <reiser@namesys.com>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Wed, 09 Oct 2002 15:24:09 +0400
Message-ID: <3DA411D9.9010104@namesys.com>
References: <Pine.LNX.4.44.0210082331110.10033-100000@fii.fi.tartu.ee> <20021009094215.B11954@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11626-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Robert Tiismus <robert@fi.tartu.ee>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Tue, Oct 08, 2002 at 11:55:42PM +0300, Robert Tiismus wrote:
>  
>
>>malfunction with the new hardware. I think that when closing the side
>>panel, I misaligned the scsi cable from the connector and disk access
>>malfunctioned. Then, after rebooting the system, everything seemed ok, besides
>>this unfortunate inident with three mailboxes :(
>>    
>>
>
>Behaviour of hardware is unpredicatble on bad wiring and that kind of stuff.
>
>  
>
>>Is it possible, that VBT happened during following reboot?
>>    
>>
>
>If the wiring was already ok, then this is very unlikely.
>
>Also you probably want to run reiserfsck on that disk to make sure
>no other damage happened.
>
>Bye,
>    Oleg
>
>
>  
>
Robert's problem sounds like the disadvantage of metadata journaling in 
action.  He can avoid this in the future by using write ordering and 
chris's datalogging patches, or v4 when that ships.

Hans


