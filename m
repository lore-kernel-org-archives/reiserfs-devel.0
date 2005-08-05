From: Rudy Zijlstra <rudy@edsons.demon.nl>
Subject: Re: recovering from "rm -rf"
Date: Sat, 06 Aug 2005 00:59:03 +0200
Message-ID: <42F3EF37.3090705@edsons.demon.nl>
References: <42F3A08A.30102@planet.nl> <42F3A16D.6090306@namesys.com> <42F3C73B.9040808@slaphack.com> <b14e81f0050805135739c94933@mail.gmail.com> <42F3D760.7090008@slaphack.com> <op.su10y3q7th1vuj@localhost> <42F3E7F1.1030205@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42F3E7F1.1030205@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: PFC <lists@boutiquenumerique.com>, michael chang <thenewme91@gmail.com>, reiserfs-list@namesys.com

David Masover wrote:

>PFC wrote:
>  
>
>>>Drive A is a 500 gig striped RAID.  Drive B is a 200 gig IDE drive.  I
>>>mv'ed all my data (about 100 gigs) from drive A to drive B.  Drive B
>>>then had its power plug fall out (don't ask me how I managed that), I
>>>plugged it back in (stupid!) -- there was a spark -- drive B now won't
>>>spin up, and drive A is essentially "rm -rf"ed.
>>>      
>>>
>>    You probably fried the electronics... if the heads are still OK,
>>you  could recover your data by exchanging the PCB from a brand new
>>drive, with  the fried PCB of the old drive. You need some electronics
>>skillz, but a  friend of mine did this (it was an adventure, as he had
>>to find the same  drive as he had, from ebay, etc) and it worked for
>>him... if something  that's not on the PCB is dead, well, you need a
>>recovery company.
>>    
>>
>
>Seems kind of a waste to buy a whole new drive, if it does end up being
>that simple.  I wonder if I couldn't ship this back to the manufacturer
>and have them do it?  I'm sure they have extras...
>
>  
>
forget that idea, the extra's are bough by the recovery companies...

In other words, its not cost effective for the manufacturers to keep 
spare parts around.

/Kick in open door
The thing you *should* have done is keep good backups, especially 
considering the amount you are willing to pay to recover...
No matter how you do it, no matter what type of RAID level you run, 
nothing beats a backup on a separate medium, with an automated script to 
make it every night (or more often if needed).
Kick in open door/

With respect to pricing, your cheapest option is likely to get a similar 
drive from Ebay. Lots cheaper than spare parts from the manufacturer 
(which i do not expect them to have). Even buying a similar drive new 
from a shop will be cheaper than spare parts.

What you can do is ask the manufacturer which drives are using the same 
PCBs. You might get lucky.

Cheers,

Rudy
