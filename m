From: PFC <lists@peufeu.com>
Subject: Re: reiserfs performance on ssd
Date: Fri, 28 Apr 2006 09:07:21 +0200
Message-ID: <op.s8ph2jz5cigqcu@apollo13>
References: <20060427151655.8b771812.pegasus@nerv.eu.org> <20060427134702.GA8202@favonius> <e692861c0604270728p2aa4a4e0i70d1ad43a3da2fcf@mail.gmail.com> <BAYC1-PASMTP050C1EF12709BADAABFDBEBFBD0@CEZ.ICE> <e692861c0604271025t8b60d9cn9aa47d68de55df5a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28539-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0604271025t8b60d9cn9aa47d68de55df5a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


	While I like the idea, the iram implementation is horrible for various  
reasons :

	- no ECC
	- It uses SATA hence only a very little part of the RAM speed is used,  
and large latencies are introduced.
	- I wouldn't trust it for critical data.

	Then, it would be faster to just add the RAM on the motherboard and  
create a ramdisk...

	Also : THE PCI BUS MUST DIE !

	It's no wonder reiserfs is slower on this thing ; reiserfs is optimized  
for hard disks which have high seek latencies.
	For RAM storage, things like hash tables are a lot better than trees,  
because you don't care about sequential scanning and locality of  
reference... (as long as the items are a bit larger than a cache line,  
which is obviously the case here).
	A filesystem that pauses and thinks for 0.5 ms of CPU time to avoid a 5  
ms HDD seek time is a good thing, but for SSD storage you want a FS that  
doesn't think at all.
	Using ReiserFS on this is like hitting a nail with a screwdriver.

	Try tmpfs, I'm curious about the results.

	Crazy idea :
	- Ask the motherboard manufacturer to stick a battery on the mobo so that  
the contents of RAM survive reboot
	- Tweak the BIOS so that RAM isn't cleared at boot
	- Teach the Kernel to be cautious while booting and not overwrite the  
previous RAMDISK
	- You have persistent ramdisk. Stick your reiserfs journal on it, enjoy.
