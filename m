From: Jose Alberto Guzman <jose@iteso.mx>
Subject: Re: LVM(1|2) vs EVMS
Date: Fri, 15 Aug 2003 13:38:16 -0500
Message-ID: <3F3D2898.20803@iteso.mx>
References: <3F3C0FDE.4000900@iteso.mx> <20030815121721.GB20698@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15330-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030815121721.GB20698@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Oleg Drokin wrote:
> Hello!
> 
> On Thu, Aug 14, 2003 at 05:40:30PM -0500, Jose Alberto Guzman wrote:
> 
>> What would be the recommended volume management system for an smp 
>>production server running oracle 8i (later 9i) on 2.4.20 or 2.4.21 
>>debian gnu/linux with reiserfs: lvm1, lvm2 or evms ??
>> Solid stability under heavy load and snapshots are the main needed 
>>features.
>> What would you suggest?
> 
> 
> LVM1 is part of the kernel for a lot of time and is greatly tested,
> so I guess it will be the best choice in your case.
> 
> Bye,
>     Oleg

Thanks for your suggestion Oleg, (and Thunder who replied personally).


  I suppose that the patches at:

ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.20-pending

  would make a 2.4.20 box more stable with lvm 1 ??   are there any 
other recommended patches around??



  Thanks

