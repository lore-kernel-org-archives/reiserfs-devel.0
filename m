From: Hans Reiser <reiser@namesys.com>
Subject: Re: Promise raid controller writes to disk, anybody know where?
Date: Wed, 16 Apr 2003 20:46:51 +0400
Message-ID: <3E9D88FB.6090109@namesys.com>
References: <Pine.LNX.4.44.0304161239010.24595-100000@dragon.inside.ntisys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13681-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0304161239010.24595-100000@dragon.inside.ntisys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bscott@ntisys.com
Cc: ReiserFS Mailing List <Reiserfs-List@namesys.com>

bscott@ntisys.com wrote:

>On Wed, 16 Apr 2003, at 8:24pm, reiser@namesys.com wrote:
>  
>
>>I just bought this motherboard with a promise raid controller builtin
>>whose manual mentions that it writes information to disk (volume and
>>config info I believe).
>>    
>>
>
>  Some RAID controllers write information to the disk, but never expose it
>to the host OS.  For example, say the RAID controller writes information to
>the last block in the disk.  The disk it then presents to the host OS will
>be one block shorter.  I don't know if your Promise "RAID controller" is 
>one of those.
>
>  I put "RAID controller" in quotes because most Promise "RAID controllers"  
>are simply a more-or-less standard IDE interface, with RAID done in software
>on the host (the software either comes from the BIOS, or the device driver).  
>You're likely better off using your OS's native software RAID in that event.
>
>  Also, AFAIK, support for Promise RAID controllers under Linux (I assume
>you're running Linux) is poor at best.  You way want to avoid using it at
>all.
>
>  
>
Ok, I'll not use it then.  I was thinking of mirroring, but I was 
assuming it was all done in hardware....

-- 
Hans


