From: "Rudy L. Zijlstra" <rudy@edsons.demon.nl>
Subject: Re: Crash --> ReiserFS screwed up
Date: Sun, 14 Mar 2004 02:08:17 +0100
Message-ID: <4053B081.5090808@edsons.demon.nl>
References: <1079213300.3827.13.camel@tims-pc> <200403140159.25966.bernd-schubert@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17199-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403140159.25966.bernd-schubert@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bernd Schubert <bernd-schubert@web.de>
Cc: tim.hussein@uni-dortmund.de, reiserfs-list@namesys.com

Bernd Schubert wrote:

>On Saturday 13 March 2004 22:28, Tim Hussein wrote:
>  
>
>>Hi,
>>
>>I was told to ask this list for help. Perhaps someone can help me:
>>
>>After I had to hard-reboot my gentoo linux based pc, my kernel does not
>>boot my root disk. I wrote down the whole story:
>>
>>http://forums.gentoo.org/viewtopic.php?t=148110
>>
>>Does anybody have an idea what to do?
>>
>>
>>Tim
>>    
>>
>
>Er, didn't you say in de.comp.os.unix.misc that your harddrive is o.k.? I 
>really don't think a hanging badblocks implies a good harddrive, does it? I 
>mean if even badblocks hangs, what do you expect from other tools? As Rudy 
>said, check your syslogs and post relevant information.
>
>Cheers,
>	Bernd
>  
>
Also,

I meant the syslogs from the system you moved the disk *too*. Thats 
where badlocks hung, wasn't it?
Usually that results in some messages in the logs.

Rudy
