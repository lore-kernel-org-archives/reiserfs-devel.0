From: JON C WADE <jwade@siue.edu>
Subject: Re: OT: NAS solution, Netapp vs EMC
Date: Thu, 16 Oct 2003 21:59:21 -0500 (CDT)
Message-ID: <Pine.SO4.4.05.10310162148430.25665-100000@cougar.isg.siue.edu>
References: <200310161330.h9GDUgRs004592@northgate.starhub.net.sg>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310161330.h9GDUgRs004592@northgate.starhub.net.sg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: darren <teodarren@myrealbox.com>
Cc: slugnet@lists.lugs.org.sg, reiserfs-list@namesys.com

Hi

Where I work (ECE Dept at SIUE) We have a NetApp NAS setup with about .5
TB of storage.  The speed is good, probably not great, but good.  

However I can say quite a bit about it's reliability.  We've had it now
for a little under three years and never lost any data, and we've had only
one hour of forced downtime.  There customer service is great.  Once I
showed up to work and we had a large shipment from NetApp.  I opened it
up, and it contained a drive shelf.  We called netapp to see why they
shipped us a shelf and there responce was "Your netapp shelf had a power
supply falure, but the backup kicked in.  Your F720 phoned home (via
network) and told us about it, so we shipped you a new one".  That night,
we shut it down, moved the drives over to the new shelf, and turned it
back on.  It only took 15 minutes or so...  We never even knew that the
power supply failed, it just switched over and kept running without
interruption.

I don't have any expearance with EMC so I couldn't say anything about
them.

Later

Cris

P.S. NetApp's snapshot capability is a god send....


On Thu, 16 Oct 2003, darren wrote:

> Hi all,
> 
> I am looking for a NAS server to work over NFS for 15-20 pieces of my linux
> servers.
> 
> These servers will be involved in heavy reading and writing (about 30Mbps up
> and down each server) of experimental data collected from a network of
> probes.
> 
> I am thinking of using a NAS solution (I have got a GigE LAN already) from
> either NetApp (F825) or EMC (Celerra) as centralized storaged for all the
> servers.
> 
> I am concerned about the following:
> 
> 1)	Fast read and write performance for consistant stream of small files
> 2)	Ability to store LARGE (> 10million per 200GB) amount of small files
> 3)	Reliability...should not crash or go down when under consistent
> heavy load.
> 
> Any comments about their performance?
> 
> 

-----BEGIN GEEK CODE BLOCK-----
Version: 3.12
GCS/E d- s+: a-- C++>$ UL+++ P+ L+++(++++) E--- @W++ !N ?o ?K w--- ?K ?O
@?M ?V @PS+ PE Y+ PGP @t+ 5 X !R tv+ b++ !DI D G e h! r-- !y+
------END GEEK CODE BLOCK------

<see http://www.geekcode.com/geek.html for translation>


