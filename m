From: Christophe Saout <christophe@saout.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 11:45:53 +0200
Message-ID: <1054806353.558.16.camel@chtephan.cs.pocnet.net>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14419-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1054800852.1997.15.camel@wusel.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Heinz-Josef Claes <hjclaes@web.de>
Cc: reiserfs-list@namesys.com

Hi!

> I plan to build a big fileserver for Deutscher Bundestag (German
> Parliament) who is converting to linux on the server side. In the
> beginning it will be used in a testing environment and later multiple of
> them in production use.

Great. :-)

> - I plan to build a system with IDE 250GB drives. 7 of them for raid 5
> and one hot spare. The OS will be on separate hardware raid 1 on smaller
> disks. Does anybody have experience with IDE controlers for the big
> disks? Is it better to use hardware raid oder software raid
> (performance)?

I'm successfully running a bunch of servers with Promise
Ultra100/Ultra133 controllers and software raid on it (and LVM but
that's another story).

The only problem you'll probably run into is that the PCI slots get full
because you should only have one hard disk per cable to get the best
performance.

Also you should try use an APIC to not run into trouble with interrupts
(I think it should work somewhat better though I cannot prove this).

The only problem with that solution is that when one disk fails you'll
have to turn of the machine and exchange the disk, and after turning it
on fdisk it (I love the raid autodetection) and raidhotadd that disk
manually.

And I've never used software raid5, only striping over several raid1
pairs. The cpu has to calculate the checksums. But when doing heavy disk
IO the machines usually only use five percent of the CPU time or
something so I don't think that should be too much of a bottleneck if
it's a fast machine.

> - At this time, we plan to use reiserfs. What are the advantages /
> disadvantages of using the raid 1 for journaling for the (big) raid 5
> (performance, recovery)? The system will be heavily used with
> storebackup (www.sf.net/projects/storebackup) witch means that lots of
> hard links have to be created as fast as possible.

I haven't tested separate journals yet, but reiserfs is very fast in
dealing with lots of files. You probably should just try it out.

I don't have enough hard disks here to play with them now, but on a raid
10 configuration here (striping over two raid1 pairs of 200 GB 7200 rpm
disks that can do about 50MB/sec each) a cp -al takes about one minute
over 80.000 files/directories.

-- 
Christophe Saout <christophe@saout.de>

