From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: reiserfs performance on ssd
Date: Fri, 28 Apr 2006 02:20:02 -0600
Message-ID: <20060428082002.GG6075@schatzie.adilger.int>
References: <20060427151655.8b771812.pegasus@nerv.eu.org> <20060427134702.GA8202@favonius> <e692861c0604270728p2aa4a4e0i70d1ad43a3da2fcf@mail.gmail.com> <BAYC1-PASMTP050C1EF12709BADAABFDBEBFBD0@CEZ.ICE> <e692861c0604271025t8b60d9cn9aa47d68de55df5a@mail.gmail.com> <op.s8ph2jz5cigqcu@apollo13>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <op.s8ph2jz5cigqcu@apollo13>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: PFC <lists@peufeu.com>
Cc: reiserfs-list@namesys.com

On Apr 28, 2006  09:07 +0200, PFC wrote:
> 	While I like the idea, the iram implementation is horrible for 
> 	various  reasons :
> 
> 	- no ECC

I don't know why people are so keen on ECC RAM.  Why not just put an extra
socket on the board and run the RAM in "RAIM" (RAID for Memory) mode?
The incremental cost of ECC vs. regular RAM is FAR more than the cost
of just getting the extra stick of RAM.  Also, with RAIM you could even
hot-swap a failing DIMM, while with ECC you have to take an outage to
get back to redundancy.

> 	- It uses SATA hence only a very little part of the RAM speed is 
> 	used,  and large latencies are introduced.

Ah, but if you can connect the RAM to multiple machines, you could at
least have the hope of hot failover for the storage to another server.
That isn't something you can do with a bus-attached device.

Even the chance of any recovery is far better with such a setup (i.e.
plug into another system after motherboard dies), since you can at
least get access from another machine.

Cheers, Andreas
--
Andreas Dilger
Principal Software Engineer
Cluster File Systems, Inc.

