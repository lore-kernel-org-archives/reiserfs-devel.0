From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 10:33:01 +0200
Message-ID: <20030605083301.GB4849@vestdata.no>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14407-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1054800852.1997.15.camel@wusel.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Heinz-Josef Claes <hjclaes@web.de>
Cc: reiserfs-list@namesys.com

On Thu, Jun 05, 2003 at 10:14:13AM +0200, Heinz-Josef Claes wrote:
> Here are some questions:
>=20
> - I plan to build a system with IDE 250GB drives. 7 of them for raid 5
> and one hot spare. The OS will be on separate hardware raid 1 on smaller
> disks. Does anybody have experience with IDE controlers for the big
> disks? Is it better to use hardware raid oder software raid
> (performance)?

Some controllers will be limited by the 127 GB IDE limitation.

For read-performance, software-raid will be just fine. (it could in
fact be better than some crappy controllers).

For write-performance, you need a hardware RAID-controller with
battery-backed writeback-cache. A hardware RAID-controller that
doesn't use writeback-cache is not likely to be faster than
software-RAID.

Writeback-cache is not very common on PCI/IDE-controllers, but more
common on SCSI/IDE and FC/IDE external RAIDs. External RAIDs also
has managability-advantages, but of course they are more expensive.

> - At this time, we plan to use reiserfs. What are the advantages /
> disadvantages of using the raid 1 for journaling for the (big) raid 5
> (performance, recovery)? The system will be heavily used with
> storebackup (www.sf.net/projects/storebackup) witch means that lots of
> hard links have to be created as fast as possible.

Tricky question.

Without writeback-cache on your RAID5, lots of tiny syncronous writes
is surely going to kill performance.

The writes to the actual filesystem should be async, so they should be
less of a problem. And there is nothing you can do about it anyway :-/

My guess is that the writes to the journal _would_ be a problem, and
that writing them to a seperate (RAID1)-device would help significantly.

I would be curious to see a benchmark on this though.

--=20
Ragnar Kj=F8rstad
Zet.no
