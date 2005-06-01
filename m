From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiserfsck 1300Gig failed with following error
Date: Wed, 1 Jun 2005 16:52:29 +0400
Message-ID: <200506011652.29577.vitaly@namesys.com>
References: <1117392967.29669.ezmlm@namesys.com> <200506011513.00397.vitaly@namesys.com> <429DA9EB.9010402@mh.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24262-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429DA9EB.9010402@mh.be>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthias Barremaecker <info@mh.be>
Cc: reiserfs-list@namesys.com, Dan Oglesby <doglesby@teleformix.com>, Valdis.Kletnieks@vt.edu

On Wednesday 01 June 2005 16:28, Matthias Barremaecker wrote:
> >>How do you sugest I swap a hd in a LVM raid with already data on it ?
> > 
> > 
> > dd_rescue hd to a relable one & change lvm according to the change.
> > if you need our assistance please use our www.namesys.com/support.html 
> > service.
> 
> I start to find that answer super funny.:)) I'm willing to pay if you 
> fix my problem. Maybe you can start saying if the problem is fixable.
> 
> Situation :
> 
> LVM with reiserfs
> 
> 2 onboard IDE controllers => 8 disks
> 
> I can't connect another disk fysicly

perform dd_rescue'ing on another computer.

or alternatively you can pull out a working disk out, put a 
new one, dd_rescue the broken one to a new one, put the new 
one instead of the broken one and put the pulled out disk back 
to its own place.

> system boots from a scsi disk, that has nothing to do with the LVM 
> except booting and mounting it .
>
> What should I do before I pay you to work out a solution.
> 
> thanx.
> 
> kind regardes,
> 
> 
> Matthias.
> 
> 
> 

-- 
Thanks,
Vitaly Fertman
