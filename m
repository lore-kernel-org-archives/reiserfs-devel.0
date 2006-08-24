From: PFC <lists@peufeu.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
Date: Thu, 24 Aug 2006 18:11:14 +0200
Message-ID: <op.tespw0sacigqcu@apollo13>
References: <BAY19-F195F80B4801CAB6EEB6C46944F0@phx.gbl> <44E24563.1040900@namesys.com> <e692861c0608151814x3e704156j32c2b34b8637a943@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29682-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0608151814x3e704156j32c2b34b8637a943@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


> Seperated FS and redundancy layers are an antiquated concept.. The
> FS's job is to provide reliable storage, fully stop.  It's shocking to
> see that a dinosaur like SUN has figured this out but the free
> software community still fights against it.

	I so totally agree.

	Some random points :

	- Modern harddisks use elaborate error correction schemes, so when a  
sector has an uncorrectable error, it won't be a bit flip, but rather  
something akin to a full sector worth of random bits, or at least enough  
wrong bits that the sector is pretty useless.

	- RAID could be used to detect errors, but it would be quite slow to do  
this, as all mirrors or parity disks would have to be read and checked for  
equality / zero XOR sum on each read. It is a lot more interesting  
performance-wise to send reads in parallel to all disks.

	- Checksums are needed to catch silent errors. The checksum needs to be  
long enough and strong enough (ie. not a 32 bit CRC).

	- The ZFS approach of integrating FS, redundancy and checks seems good to  
me, because there needs to be some communication between the FS and the  
redundancy layer : re-reading bad blocks and especially making all writes  
full stripe.

	- Harddisks are cheap. Would it be possible to store the FS log on a disk  
and the FS data itself on another disk ? The log disk would only hit  
sequential writes ; the data disk would sync as seldom as possible. Both  
"disks" could be raid mirrors pairs ; or the log disk could be solid-state  
in a few years when a version of the ram harddisk with ECC and decent  
bandwidth appears.


