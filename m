From: Russell Coker <bofh@coker.com.au>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sun, 13 Oct 2002 01:27:32 +0200
Message-ID: <200210130127.32489.bofh@coker.com.au>
References: <200210122302.g9CN23BD000383@sirius.cs.pdx.edu>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11669-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210122302.g9CN23BD000383@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "The Amazing Dragon (Elliott Mitchell)" <ehem@cs.pdx.edu>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On Sun, 13 Oct 2002 01:02, The Amazing Dragon (Elliott Mitchell) wrote:
> > S-ATA should solve the cable issue.  PCI-X should solve the PCI
> > bottleneck. Then it'll be interesting to see what the bottleneck is.
>
> <cough>  <cough>         (about PCI-X) Yeah riiiight.
>
> I believe PCI-X is still 64-bits wide (I haven't seen anything mention
> this so I assume it is unchanged) and up to 133MHz, so theoretical
> bandwidth of 1066MBps. So 7 Serial ATA drives, perhaps 10 drives if you
> take into account the real performance of drives.

Currently people who are using 3ware RAID controllers are finding that PCI is 
a serious bottleneck.  PCI-X is apparently twice as fast as PCI which helps.  
Then you can have multiple PCI-X buses (as high end motherboards now have 
multiple PCI buses).

> Then you've got to add network, gigabit ethernet is 250MBps (total, full
> duplex). There is ten gigabit coming in the near future which half duplex
> is 1250MBps, I guess you're going to need a second PCI-X bus just to
> handle /most/ of the network bandwidth.

I still haven't heard of anyone getting more than 50% throughput out of 1Gb 
Ethernet, I doubt that a PC will use any portion of 10Gb Ethernet at any time 
in the near future.

> What astonishes me is that 66MHz 64-bit PCI is *still* confined
> exclusively to high end motherboards, when even the low-end motherboards
> are struggling against the bandwidth monster.

Yes, that sucks!  It seems that they think that we only want performance for 
graphics (which AGP satisfies).  Maybe we need a RAID controller that plugs 
into an AGP port?  ;)

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

