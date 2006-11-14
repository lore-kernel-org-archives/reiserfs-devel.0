From: Christopher Chan <chrisfz@netvigator.com>
Subject: Re: Which version will be merged into mainline kernel?
Date: Tue, 14 Nov 2006 13:51:06 +0800
Message-ID: <4559594A.1090602@netvigator.com>
References: <194f62550610160250u265ef120lee3cf9a17266939f@mail.gmail.com>	<454A596F.8070909@namesys.com>	<194f62550611072321j1cd34205u55f3c121dcac7aac@mail.gmail.com>	<200611081015.14320.biscani@pd.astro.it>	<20061108102136.GS6012@schatzie.adilger.int> <ej4pca$tft$1@sea.gmane.org>	<200611111928.kABJSgre030118@turing-police.cc.vt.edu> <ejanvb$dgm$2@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30156-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <ejanvb$dgm$2@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: danny.milo@scratchpost.org, reiserfs-list@namesys.com


> While we are at it:
> 
> I take it that this is the reason journalling support is only picking up
> now: the disks are so big that even in the unlikely event that some of the
> hardware failsafes fail, one just cannot fsck all the disks completely
> anymore, ever.

Only picking up now??

reiserfs was the first filesystem available for Linux with journaling 
support. NTFS for Windows had it a long time ago. Other Unix's had 
journaling a long time ago too.

FreeBSD, Solaris and the other BSD's had another theory for file system 
reliability and speed implemented under softupdates a long time ago too.

journaling support has been late on Linux. Everything seems to be late 
on Linux. Real-time support, preemptive support...

> 
> So the choice is really 'borked once, borked forever' / 'journal it and at
> least somehow get it back online without fscking /
> copying-to-new-disks-if-at-all-possible for 5 days straight'.

No. Choices are: sync only (no write caching), turn on softupdates if 
supported, turn on various degrees of journaling if supported or async 
only (who cares?)

If you have fsync/fsyncdata available, databases, mtas and other 
software should not care less how the filesystem is mounted.
