From: berthiaume_wayne@emc.com
Subject: RE: Reiserfs oops
Date: Wed, 23 Apr 2003 17:08:58 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D007AA844A@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13787-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: green@namesys.com
Cc: reiserfs-list@namesys.com

	Hi Oleg!
	Sorry for the delay. I've been on a long needed holiday.

> -----Original Message-----
> From: Oleg Drokin [mailto:green@namesys.com]
> Sent: Thursday, April 10, 2003 2:09 PM
> To: berthiaume_wayne@emc.com
> Cc: reiserfs-list@namesys.com
> Subject: Re: Reiserfs oops
> 
> 
> Hello!
> 
> On Thu, Apr 10, 2003 at 01:56:05PM -0400, 
> berthiaume_wayne@emc.com wrote:
> 
> >         Oleg, I'm seeing the attached oops's when a hard 
> drive failure is
> > encountered. There are four drives in RAID 1. Is it normal 
> for reiserfs to
> > oops when a drive fails?
> 
> Hm, You mean that all four drives have a bad block in the same place?

	Only one drive has the bad block. md() doesn't break the mirror and
drop the drive.

> I thought that the whole idea of RAID1 is that when
> one hard drive fails, other will deliver necessary data.
> 
> reiserfs does not handle io errors (especially in journal 
> area) very gracefully
> and should just panic (not dereference something bad like in 
> your case which
> is something very suspicious). Jeff Mahoney of SuSE is 
> working on having more
> redundancy in such cases.
> 
> > Attached oops file...
> 
> Hm, this one is certainly looking very strange.
> I will comment more on it tomorrow. Do you have any extra 
> reiserfs patches

	They are 1 thru 13 off the Namesys ftp site for 2.4.19.

> on top of your 2.4.19 kernel?
> 
> Bye,
>     Oleg
> 
