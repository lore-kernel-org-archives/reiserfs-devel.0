From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] new data logging and quota patches available
Date: 23 Feb 2003 09:50:08 -0500
Message-ID: <1046011807.16042.397.camel@tiny.suse.com>
References: <1045870331.16048.325.camel@tiny.suse.com>
	 <200302221341.23799.Dieter.Nuetzel@hamburg.de>
	 <1045926958.16042.366.camel@tiny.suse.com>
	 <1045930351.16042.377.camel@tiny.suse.com>
	 <3E581AD7.30000@mb.tu-ilmenau.de>  <3E581E07.3050407@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12872-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E581E07.3050407@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: Chris Mason <mason@namesys.com>, reiserfs-list <reiserfs-list@namesys.com>

On Sat, 2003-02-22 at 20:04, Manuel Krause wrote:
> On 02/23/2003 01:50 AM, Manuel Krause wrote:
> > On 02/22/2003 05:12 PM, Chris Mason wrote:
> > 
> >> And here's one more patch for those of you that want to experiment a
> >> little.  reiserfs_dirty_inode gets called to log the inode every time
> >> the vfs layer does an atime/mtime/ctime update, which is one of hte
> >> reasons mounting with -o noatime and -o nodiratime makes things 
> >> faster. We had to do this because otherwise kswapd can end up trying 
> >> to write
> >> inodes, which can lead to deadlock as he tries to wait on the log.
> >>
> >> One of the patches in my data logging directory is kinoded-8, which
> >> changes things so a new kinoded does all inode writeback instead of
> >> kswapd.
> >>
> >> That means that if you apply up to 05-data-logging-36 and then apply
> >> 09-kinoded-8 (you won't need any of the other quota patches), you can
> >> also apply this patch.  It changes reiserfs to leave inodes dirty, which
> >> saves us lots of time on atime/mtime updates.
> >>
> >> I'l upload this after it gets a little additional testing, but wanted to
> >> include it here in case anyone else was interested in benchmarking.
> >>
> >> [11.dirty-inodes-for-kinoded.diff]
> > 
> > Hi Chris!
> > 
> > At least I'm not able to copy through my partition via "cp -a ..." with 
> > the last supposed setup + preempt without quota ...
> > 
> > When umounting the destination partition it says "device is busy".
> > 
> > I don't know what is gone for now on my repository partition, but I know 
> > from earlier times this should not happen.
> 
> Sorry, I was incomplete with my report, at least with the following: 
> After thinking over the remount strategy for some minutes with a pizza 
> the partition was umountable again. I don't have exact values but it was 
> under about 15 minutes max. with 3.5GB copied previously.

Hmmm, I think I need to changed around kinoded slightly.  Thanks for
giving it a try...

-chris


