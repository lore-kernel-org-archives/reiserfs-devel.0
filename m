From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck 3.6.8 + corrupted filesystem
Date: Wed, 2 Jul 2003 22:31:36 +0400
Message-ID: <200307022231.36007.vitaly@namesys.com>
References: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14805-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <pan.2003.07.02.13.31.41.846811.20132@umail.hungrycats.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Hi, 

On Wednesday 02 July 2003 21:31, Zygo Blaxell wrote:
> I've been running reiserfsck over a corrupted filesystem (IDE disks, dead
> fans, overheating embedded controller RAM, smoke...you get the picture).
> The messages are...interesting.
>
> What is the meaning of the message "The problem has occurred looks like
> a hardware problem (perhaps memory)."?  Is that referring to the memory
> of reiserfsck, or is it suggesting there is some kind of data consistency
> issue on the disk, or is it suggesting that the corruption it is seeing
> on the disk might have been the result of bad memory some time in the
> past?

Hardware problem means a problem with your hardware, not software.
Perhaps you want to run memtest and check your memory, perhaps smth
else but fsck data built in memory on pass0 turned out to be wrong on 
pass1. 

> I've been running reiserfsck --rebuild-tree in a while loop until it fixes
> the FS.  It seems that each time through it gets a little further along,
> then near the end of pass 1, reiserfsck complains that something wasn't
> done in pass 0 and aborts.  Pass 0 runs again, and some additional changes
> are made which fix whatever pass 1 was complaining about.  Pass 1 runs
> again, gets a little further than it did the previous run, then aborts
> a few thousand blocks later.  The most recent run suggests that this
> might continue in pass 2 (complaining about things not done by both pass
> 1 and 0), but I've never gotten to pass 2 yet to find out.
>
> Here are parts of the three reiserfsck runs so far (actually I did some
> more earlier, but those were 3.6.6 not 3.6.8).  Note I've left out
> several thousand lines of pass0 output, most of which involves deleting
> invalidly formatted nodes, directories with bad types, wrong order
> entries in directories...basically what you'd expect if one disk out of
> a RAID array was randomly corrupted.
>
> I realize that there is huge data loss here, but IMHO reiserfsck should at
> least salvage the FS without calling abort() on itself.

fsck should not abort if in memory data on pass1 (which were built on pass0 
of fsck) match what they should be. Otherwise it looks like hardware problem 
with memory or smth like that. 

> I also realize that these log sections are useless as a bug report.

Actually, these log sections were intended to explain that smth unexpected 
happened what does not look like an fsck problem. So you should check all 
your hardware (the hint about what should be checked first is given) and do 
not continue unless you are sure it is working properly. And only if the 
problem occured again in the same place -- this already looks like an fsck
problem -- report about it. 

-- 
Thanks,
Vitaly Fertman
