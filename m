From: Bernd Schubert <bernd-schubert@web.de>
Subject: Re: nfsd-fh: found a name that I didn't expect
Date: Sat, 29 Mar 2003 15:09:23 +0100
Message-ID: <200303291509.23681.bernd-schubert@web.de>
References: <200303281828.55093.bernd-schubert@web.de> <200303291254.02498.bernd-schubert@web.de> <20030329145920.B28628@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13431-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030329145920.B28628@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hello,

> > > Does reiserfsck have found anything?
> >
> > As I said, the backup script runs a reiserfsck itself and found no
> > problems, I hope there is no corruption after a simple boot, but I will
> > check this later on this day.
>
> Ok, let us know of the results.

As I expected, 'reiserfsck --check' didn't find any problems.

>
> > > We do not yet understand on how to reproduce that locally, because this
> > > message indicates pretty strange conditions.
> >
> > Is there anything I can do to debug this, when I observe this phenomena
> > the next time  (e.g. enabling nfs-debugging via proc, etc) ?
>
> Please try to reboot the server not changing fs, if the problem still
> persists, then take FS metadata snapshot (debugreiserfs -p /dev/device |
> bzip2 -9c >metadata.bz2, use recent reiserfsprogs please) and make it
> available for us to download, please.
>

As noted in my other e-email, /usr/sbin/logrotate was also affected. I don't 
like it to say, but after rebooting everything was fine, so those messages 
doesn't  appear any longer. 
Does this mean memory problems again ? We even have loaded the 
ecc-kernel-module since last week, to be able to problems befor the 
filesystem is affected, but it didn't show any memory-problem on this 
machine.
Or could it be that we have 3GB RAM and the vanilla kernel is not suitable for 
this (I read something like this in the LKML, but can't remember the 
details).


Thanks,
	Bernd
