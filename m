From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiserfs Data Recovery
Date: Tue, 09 Mar 2004 18:45:18 +0300
Message-ID: <404DE68E.3080706@namesys.com>
References: <404C81B9.4050504@nsanity.com> <20040308184124.GE5817@dbz.icequake.net> <404CC8AA.9020405@nsanity.com> <20040308215919.GB11093@dbz.icequake.net> <404DAC43.6070501@namesys.com> <404DD7CD.6030004@nsanity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17139-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <404DD7CD.6030004@nsanity.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nick Vahalik <nick@nsanity.com>
Cc: reiserfs-list@namesys.com

Nick Vahalik wrote:

> Hans Reiser wrote:
>
>> Ryan Underwood wrote:
>>
>>>
>>> Running Hardware Raid1 on top of a highpoint 37x2 raid controller
>>> 2x80 GB Drives
>>> ----------------
>>>
>>>
>> I had really bad experiences with highpoint.
>>
> Actually, I messed up... It should have been raid 0 instead of raid 1. 
> But I haven't had any problems so far. I did test the memory of my 
> system and memtest didn't give any errors. I will, however run the IBM 
> DFT tool and see if it can detect any error with the drives.
>
>
My bad experience was with getting their drivers to work with 2.6, and I 
tried to use raid 1..., and I figured out that it wasn't really hardware 
raid because it needed a software driver that wasn't in 2.6 and it was 
work to figure out that it was missing and they don't provide telephone 
support and, oh, I just hated them by the end of the experience....  I 
ended up just using each drive as a separate device and their hardware 
as a dumb ide controller.

-- 
Hans


