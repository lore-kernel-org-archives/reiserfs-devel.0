From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sat, 12 Oct 2002 16:02:03 -0700 (PDT)
Message-ID: <200210122302.g9CN23BD000383@sirius.cs.pdx.edu>
References: <200210121052.22603.bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11668-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210121052.22603.bofh@coker.com.au> from "Russell Coker" at Oct 12, 2002 10:52:22 AM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bofh@coker.com.au
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

> From: Russell Coker <bofh@coker.com.au>
> On Fri, 11 Oct 2002 22:00, Hans Reiser wrote:
> > except that WAFL (at least it was in 1996 when I last benchmarked one)
> > is memory bandwidth bound, not disk or CPU bound, when configured with
> > 14 disk drives.  They do a nice job of zero-copy optimizing from what I
> > understand.
> 
> Hmm, I wonder what the difference in memory bandwidth between a P4 and a 
> NetApp device is.  Maybe the P4 has 3 times the memory bandwidth of the 
> NetApp...

As of early last year, the low-end NetApps used a P3; so a factor of 4 on
their processor bus. They were using a combination of PCI bus(es), so the
I/O wasn't that much better on the low-end.

> Also most people seem to run into a limit of PCI bus bandwidth first.  Then 
> after surmounting that by using two PCI buses with hardware RAID controllers 
> and running software RAID across them the next issue becomes cable tangle.
> 
> S-ATA should solve the cable issue.  PCI-X should solve the PCI bottleneck.  
> Then it'll be interesting to see what the bottleneck is.

<cough>  <cough>         (about PCI-X) Yeah riiiight.

I believe PCI-X is still 64-bits wide (I haven't seen anything mention
this so I assume it is unchanged) and up to 133MHz, so theoretical
bandwidth of 1066MBps. So 7 Serial ATA drives, perhaps 10 drives if you
take into account the real performance of drives.

Then you've got to add network, gigabit ethernet is 250MBps (total, full
duplex). There is ten gigabit coming in the near future which half duplex
is 1250MBps, I guess you're going to need a second PCI-X bus just to
handle /most/ of the network bandwidth.

What astonishes me is that 66MHz 64-bit PCI is *still* confined
exclusively to high end motherboards, when even the low-end motherboards
are struggling against the bandwidth monster.

> > I should also mention that actually most of these fileservers are disk
> > space bound not performance bound for most of their users, at least that
> > was true when I was a sysadmin back in the old days....
> 
> I think that's about to change (if it hasn't already).  3ware sells RAID 
> controllers that do 8 or 12 drives.  200G ATA drives are now on sale, and 
> 320G drives will be available soon.
> 
> 12 * 320G should solve the disk space issue for most people...

For now, but I'm sure either games or something else will expand the
storage space used by people. People are now storing zillions of songs on
hard drives because compression (MPEG-1 layer 3) and storage are up to
the challenge, quite possibly it will be high resolution video tommorrow.

Then there is the challenge of backups. I kind of like the idea of a
DVD-R drive that takes whole spools of disks, but those are still
expensive and are still losing the race with hard drives.


-- 
|\__/|\__/|\______          --=> 8-) EHM <=--          ______/|\__/|\__/|
\    |    |       | EHeM@cs.pdx.edu      PGP 8881EF59 |       |    |    /
  \   \   | ______| -O #include <stddisclaimer.h> O-  |______ |   /   /
    \___\_|/82 04 A1 3C C7 B1 37 2A   E3 6E 84 DA 97 4C 40 E6\|_/___/


