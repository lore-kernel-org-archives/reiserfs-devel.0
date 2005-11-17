From: PFC <lists@boutiquenumerique.com>
Subject: Re: More Slowdown
Date: Thu, 17 Nov 2005 10:36:46 +0100
Message-ID: <op.s0dozkscth1vuj@localhost>
References: <200511111359.39715.jgilmore@glycou.com> <200511120906.39109.jgilmore@glycou.com> <1131997263.10816.56.camel@teratron.lan.etheus.net> <200511142147.07787.chrivers@iversen-net.dk> <1132064829.8002.9.camel@teratron.lan.etheus.net> <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26973-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00511161908k30ed471esbc12b284842b8078@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>, Craig Shelley <craig@microtron.org.uk>
Cc: reiserfs-list@namesys.com


	Just a few words about this "slowdown" thing.

	I use linux-2.6.11-cko1-swsusp2 with reiser4 included. I won't upgrade to  
a new version until Hans says the current one is at least as stable as it  
was before starting the merge...

	I get the "slowdown" once in a while, usually for 2-5 seconds, it's not  
that annoying.

	However :

	If I understand well, when memory is needed (memory pressure), reiser4  
triggers a flush and writes dirty pages to the disk in large quantities.
	This has many advantages like not writing at all the temporary files  
which already have been deleted, deferred allocation, etc, it's really  
cool.

	However when "memory pressure" (ie. need to free some RAM) occurs, it is  
usually that I am doing something interactively, like opening a document  
or starting some software. Or it might mean that the database server just  
received a big query which needs some sorting space in RAM for instance.
	Thus, "memory pressure" almost always means "I need memory NOW and  
someone is waiting in front of their screen for it"...
	And it is at this very moment that reiser4 has to flush (to free memory).
	Thus the "flush storm", by nature, always happens when you don't want it  
to happen. It almost never happens when you are away from the computer  
taking a leak, for instance.

	This is analogous to the problem caused to postgres by checkpointing...  
the postgres guys implemented a background writer to solve this.
	I wonder if reiser4 could do the same, ie. trickle down dirty pages to  
free up memory before it is actually needed, to improve reactivity. There  
is a balance to be found, of course, between flushing as late as possible  
(to benefit from all the nifty reiser4 features) and flushing earlier (to  
avoid triggering the "flush storm").
	Maybe this could be set via a few controls...
		- tell reiser4 to try to keep X amount of RAM immediately available  
without flush
		- when the CPU is idle, and/or when the disk is idle, start flushing,  
but stop doing it as soon as some CPU is needed, or a key is hit...
		- just do frequent, small partial flushes which will keep good locality  
of reference while being small
		- do it at a lower priority so that the keyboard does not stop  
responding !!!

	Huh, well, that's it... what do you think ?



> When fsyncing, Reiser4, to my understanding, isn't allowed to put
> stuff in it's memory cache - it must put it to disk right away.  And

	This is the whole point of fsync, yes.
	Now, it's pretty stupid for evlolution to issue a fsync() on every pixel  
move or whatever.
	fsync() is for databases or things which must survive a hard system  
crash...
	evolution could as well have used fflush() and everything would have been  
alright. Dumb.

> For comparative purposes, I hear of consumer systems with 2 or 4 GB of
> ram, and I know of brand new PC hard disks which have a throughput of
> less than 5 MB/s (my hard disk maxees out at 20 MB/s on my PC.)  Do
> you know the throughputs of your drives, and the size of the memory in
> your machines?

	Hum. A crap laptop harddrive will do 15 MBytes/s and a recent normal  
desktop drive (7200rpm ATA or SATA) will do 50 MBytes/s or more...
	If you get a lot less (like, 5 MB/s), you have a problem (DMA disabled,  
etc)


