From: Hans Reiser <reiser@namesys.com>
Subject: Re: Error message - vs-13070
Date: Mon, 17 Feb 2003 16:36:09 +0300
Message-ID: <3E50E549.8060307@namesys.com>
References: <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home> <5.2.0.9.0.20030215000534.018ed008@mail.bogus.home> <5.2.0.9.0.20030216203350.018dd7d8@mail.bogus.home> <20030216153359.GA28622@mrball.net> <20030217091552.A20096@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12787-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030217091552.A20096@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Sun, Feb 16, 2003 at 07:33:59AM -0800, Todd Lyons wrote:
>  
>
>>>hda: dma_intr: status=0x51 { DriveReady SeekComplete Error }
>>>hda: dma_intr: error=0x40 { UncorrectableError }, LBAsect=6599945, 
>>>sector=4286584
>>>end_request: I/O error, dev 03:03 (hda), sector 4286584
>>>These errors look to me like a hardware problem (bad sector on the drive).
>>>Definately not a reiserfs problem, thanks for the reply Oleg.
>>>      
>>>
>>Depends, is 4286584 beyond the end of what really exists, or is that in
>>the middle of your valid sectors?
>>    
>>
>
>Reads/writes beyond end of device emit different messages.
>
>Bye,
>    Oleg
>
>
>  
>
how about defining that in our faq.

-- 
Hans


