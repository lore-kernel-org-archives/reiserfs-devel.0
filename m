From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiserfsck 1300Gig failed with following error
Date: Wed, 1 Jun 2005 15:12:59 +0400
Message-ID: <200506011513.00397.vitaly@namesys.com>
References: <1117392967.29669.ezmlm@namesys.com> <200506011406.57415.vitaly@namesys.com> <429D949B.5@mh.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24259-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429D949B.5@mh.be>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Matthias Barremaecker <info@mh.be>, Dan Oglesby <doglesby@teleformix.com>, Valdis.Kletnieks@vt.edu

On Wednesday 01 June 2005 14:57, Matthias Barremaecker wrote:
> Hi,
> 
> > the key (which is in the tree already and supposed to be correct) is 
> > completely corrupted, no one key component is correct. data could be 
> > corrupted in the memory or on read/write -- bad cable, controller, 
> > dying harddrive, etc. 
> > 
> > 
> >>Anyone any suggestions ?
> > 
> > 
> > running fsck with the list of bad blocks is useful when you have the 
> > known fixed number of bad blocks, you know that the number will not 
> > change soon, in other words other blocks are relable. 
> > 
> > first of all you even have not complete badblocks run, so you cannot 
> > be sure you know the full bad block list. 
> > 
> > and the second, if your hardware is dying you need to fix it before 
> > running fsck on it.
> 
> How do you sugest I swap a hd in a LVM raid with already data on it ?

dd_rescue hd to a relable one & change lvm according to the change.
if you need our assistance please use our www.namesys.com/support.html 
service.

-- 
Thanks,
Vitaly Fertman
