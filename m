From: "Vitezslav T. Se'm" <travis@inway.cz>
Subject: Re: How to build a big file server
Date: Fri, 06 Jun 2003 13:16:35 +0200
Message-ID: <3EE07813.3000104@inway.cz>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <200306060143.13516.sam@vilain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14472-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sam Vilain <sam@vilain.net>
Cc: Heinz-Josef Claes <hjclaes@web.de>, reiserfs-list@namesys.com

Hi.

Sam Vilain wrote:

 >On Thu, 05 Jun 2003 20:14, Heinz-Josef Claes wrote:
 >
 >
 >>- I plan to build a system with IDE 250GB drives. 7 of them for raid 5
 >>and one hot spare. The OS will be on separate hardware raid 1 on smaller
 >>disks. Does anybody have experience with IDE controlers for the big
 >>disks? Is it better to use hardware raid oder software raid
 >>(performance)?
 >>
 >>
 >
 >Yes, if massive disk space at virtually no cost is what you're after,
 >it has to be IDE.  But, you don't have to give up the benefits of a
 >servicable data centre.  Check out http://www.acme-technology.co.uk/
 >for some fairly snazzy hot swap IDE rack mount enclosures, cases and
 >more.  There must be other vendors out there, too.  If you've got that
 >many disks, you NEED hot swap!
 >
 >As for the software RAID vs hardware RAID, my experience is that
 >software RAID 1 can deliver the same amount of disk space as hardware
 >RAID 5 for less total cost, factoring in the price of the RAID
 >controller.  Of course, your storage density is worse for RAID 1, but
 >you could probably still fit your 10TB into a single rack, assuming
 >you can get 8 disks in a 3U chassis.  RAID 1 in any form will *always*
 >outperform RAID 5, especially in the event of a failure.  RAID 1
 >arrays hardly notice, RAID 5 arrays slow to a crawl.
 >
 >btw, I wouldn't necessarily be too worried about stacking too many
 >devices on a single chain.  Benchmark heavily all configurations with
 >a workload and close to the real workload of the device before buying
 >dozens of controllers, or settling on one plan recommended by some
 >self-professed `expert' trolling the reiserfs-list.  Your bottleneck
 >may not be where you think.
 >

This is not about performace mostly, but about reliability. When U have
2 disks on one ribon, there is a serious problem, when one of them
crash, because in 99% cases, the other disk stops responding to. This is
IDE, not SCSI.

Travis

 >I'd also strongly suggest getting a motherboard with 64 bit and/or
 >66MHz PCI bus.  The Tyan ThunderK7 is pretty good - a dual capable
 >Athlon board that's stable as hell, and you can run the OpenBIOS
 >project on it - manage your servers with a serial terminal server (eg,
 >a PC with a serial breakout card) instead of a dumbass KVM switch.
 >
 >Then, you'd have something that's almost as good as a commerical UNIX
 >platform, but not really.  Personally, I'd get a quote for the arrays
 >running on Sparc hardware from http://www.anysystem.com/ (used Sun
 >parts peddlers) and offer that as a comparison.
 >
 >Running LVM to allocate a large RAID volume works exceedingly well
 >from a system administration standpoint, especially with reiserfs.
 >It's online resizing support is second to none
 >

-- 

"Byval jsem krotitelem zvirat... Vetsinou tech nejnebezpecnejsich.
- Krotitelem zvirat?
Jo. Je to logicky pokracovani po tom, co jsem byl ucitelem... jenomze se
nemusis starat o rodice."




