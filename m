From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 12:07:27 +0200
Message-ID: <1054807646.14700.9.camel@localhost>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <1054806353.558.16.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14423-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1054806353.558.16.camel@chtephan.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 2003-06-05 at 11:45, Christophe Saout wrote:

> > - I plan to build a system with IDE 250GB drives. 7 of them for raid 5
> > and one hot spare. The OS will be on separate hardware raid 1 on smaller
> > disks. Does anybody have experience with IDE controlers for the big
> > disks? Is it better to use hardware raid oder software raid
> > (performance)?
> 
> I'm successfully running a bunch of servers with Promise
> Ultra100/Ultra133 controllers and software raid on it (and LVM but
> that's another story).

iiiieeeek! I don't know how you get them running stably but here two
ultra tx2 only caused trouble and were quickly thrown away.
so the message is KEEP AWAY FROM PROMISE CONTROLLERS.

> The only problem you'll probably run into is that the PCI slots get full
> because you should only have one hard disk per cable to get the best
> performance.

well 6 pci slots gives you 12 disks with el cheapo controllers (hpt37x
based ones etc...) so that is not the problem, BUT pci bus speed. I have
a software raid5 running here with only 5 disks and on heavy disk io
nothing else works on the PCI bus... (e.g. watching tv via pci-tv card
is impossible then).

> The only problem with that solution is that when one disk fails you'll
> have to turn of the machine and exchange the disk, and after turning it
> on fdisk it (I love the raid autodetection) and raidhotadd that disk
> manually.

or use a spare and do it at night :-)

> I don't have enough hard disks here to play with them now, but on a raid
> 10 configuration here (striping over two raid1 pairs of 200 GB 7200 rpm
> disks that can do about 50MB/sec each) a cp -al takes about one minute
> over 80.000 files/directories.

the raid5 has about the same speed... reading/writing is 40-50M/s.
rebuilding a 5*80G raid takes about an hour.

Another solution would be to take these transtec external raids which
are ide intern scsi extern. I have one (1.2TB) here and it is althoug a
bit slower pretty reliable so far...

I've had no bad experience with reiserfs on x86 hardware so far and it
gets pretty intensively used...

Soeren.

