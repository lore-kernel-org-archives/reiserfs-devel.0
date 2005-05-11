From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Reiserfsck fails. Out of disk space on pass 2
Date: Wed, 11 May 2005 14:13:17 +0400
Message-ID: <200505111413.18149.vitaly@namesys.com>
References: <10784.217.76.138.66.1115805721.squirrel@mail.arsystel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24039-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <10784.217.76.138.66.1115805721.squirrel@mail.arsystel.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: maherrero@arsystel.com

On Wednesday 11 May 2005 14:02, maherrero@arsystel.com wrote:
> Hello guys!
> I wonder if you can help me.
> A couple of days ago my system failed: a big-big-BIG kernel dump on the
> screen and system hang, so I rebooted. The first time my debian couldn't
> start x.org because there was not enough free space "Uh?, Okay, let's
> check the partition" So I rebooted again and started a second installation
> I have in a different partition for these situations.
> I logged in and started normally, checked my original root partition (on
> /dev/hda3) and at pass 2 it aborted
> 
> Not enough allocable blocks, checking bitmap...there are 0 allocable
> blocks , btw
> 
> out of disk space

how did you run reiserfsck?

what version of reiserfsprogs do you use? 
you should use the latest, it is 3.6.19 now.

> After that it is impossible to recover the partition. Obviously I cannot
> mount it either. I have repeated it several times and always the same
> fail.
> I have tried giving this partition more space but no success. Gparted
> doesn't work and reports 2.00 Tb of data in a 19 Gb partition!
> Any idea of what am I doing wrong (because I suppose that this problem can
> be solved but I don't know how)
> I have googled but no similar incident has been reported.
> 
> Thank in advance
> 
> 
> M. A. Herrero.
> 
> 
> 

-- 
Thanks,
Vitaly Fertman
