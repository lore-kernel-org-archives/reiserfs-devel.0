From: The Amazing Dragon (Elliott Mitchell) <ehem@cs.pdx.edu>
Subject: Re: Reiserfs with Samba vs NetApp Filer
Date: Sat, 12 Oct 2002 23:52:54 -0700 (PDT)
Message-ID: <200210130652.g9D6qsgL025266@sirius.cs.pdx.edu>
References: <200210130127.32489.bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11673-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200210130127.32489.bofh@coker.com.au> from "Russell Coker" at Oct 13, 2002 01:27:32 AM
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bofh@coker.com.au
Cc: The Amazing Dragon Elliott Mitchell <ehem@cs.pdx.edu>, Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

> From: Russell Coker <bofh@coker.com.au>
> On Sun, 13 Oct 2002 01:02, The Amazing Dragon (Elliott Mitchell) wrote:
> > Then you've got to add network, gigabit ethernet is 250MBps (total, full
> > duplex). There is ten gigabit coming in the near future which half duplex
> > is 1250MBps, I guess you're going to need a second PCI-X bus just to
> > handle /most/ of the network bandwidth.
> 
> I still haven't heard of anyone getting more than 50% throughput out of 1Gb 
> Ethernet, I doubt that a PC will use any portion of 10Gb Ethernet at any time 
> in the near future.

Depending upon the machine and task, that is not surprising. For low end
hardware 50% utilization is impressive since with PCI doing 133MBps, your
bus is *completly* used. Higher end hardware should do better (and then
you start running into the speed of the network code).

I've been pondering how well doing cache-coherency in software over
(gigabit/multiple-100) ethernet would work. That would likely be able to
severely chew on even 10G ether (but this is wandering away from
storage).

> > What astonishes me is that 66MHz 64-bit PCI is *still* confined
> > exclusively to high end motherboards, when even the low-end motherboards
> > are struggling against the bandwidth monster.
> 
> Yes, that sucks!  It seems that they think that we only want performance for 
> graphics (which AGP satisfies).  Maybe we need a RAID controller that plugs 
> into an AGP port?  ;)

I've pondered that idea myself. AGP is plain 66MHz/32bit, 1x was single
data rate (266MB/s), 2x went for double data rate (both clock edges,
533MB/s), 4x went for quadruple data rate (1066MB/s), 8x multiplies the
clock by 8 (2166MB/s). So 8x will beat PCI-X by a factor of two, but then
how many motherboards have you seen that feature dual AGP slots (I'd been
wondering why nobody had done that with everyone dreaming of dual head
and nVidia's GeForce 3 only had a single output)?

Interestingly even as AGP has gotten faster, the original need (textures)
has been alleviated because the graphics chips have gotten so damn fast
even AGP8x isn't anywhere near enough to satisfy the bandwidth demands
for textures (Radeon 9700 has 128MB of memory with bandwidth of 20GB/s).
If OpenGL 2.1 was to introduce a display list processor, it could even
return to the point where plain vanilla 33MHz/32bit PCI would be quite
usable again.


-- 
|\__/|\__/|\______          --=> 8-) EHM <=--          ______/|\__/|\__/|
\    |    |       | EHeM@cs.pdx.edu      PGP 8881EF59 |       |    |    /
  \   \   | ______| -O #include <stddisclaimer.h> O-  |______ |   /   /
    \___\_|/82 04 A1 3C C7 B1 37 2A   E3 6E 84 DA 97 4C 40 E6\|_/___/


