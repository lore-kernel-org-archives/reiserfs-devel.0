From: Heinz-Josef Claes <hjclaes@web.de>
Subject: Re: How to build a big file server
Date: 05 Jun 2003 10:42:55 +0200
Message-ID: <1054802574.1995.26.camel@wusel.schnulli.de>
References: <1054800852.1997.15.camel@wusel.schnulli.de>
	 <20030605083301.GB4849@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14408-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030605083301.GB4849@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ragnar =?ISO-8859-1?Q?Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: reiserfs-list@namesys.com

Am Don, 2003-06-05 um 10.33 schrieb Ragnar Kj=F8rstad:
> On Thu, Jun 05, 2003 at 10:14:13AM +0200, Heinz-Josef Claes wrote:
> > Here are some questions:
> >=20
> > - I plan to build a system with IDE 250GB drives. 7 of them for raid 5
> > and one hot spare. The OS will be on separate hardware raid 1 on smaller
> > disks. Does anybody have experience with IDE controlers for the big
> > disks? Is it better to use hardware raid oder software raid
> > (performance)?
>=20
> Some controllers will be limited by the 127 GB IDE limitation.
>=20
> For read-performance, software-raid will be just fine. (it could in
> fact be better than some crappy controllers).
>=20
> For write-performance, you need a hardware RAID-controller with
> battery-backed writeback-cache. A hardware RAID-controller that
> doesn't use writeback-cache is not likely to be faster than
> software-RAID.
>=20
We used a cheap 3Com IDE RAID controler (sorry, don't know which one)
one and a half year ago (without writeback-cache, in another company).
It was terribly slow when writing with hardware RAID. With software
RAID, it was much faster - that's the reason for my question. Do you
know a useful IDE RAID controler which runs with linux? (For your
information: the machines are not mission critical, only for having an
(additional) online backup for about 5000 users).

> Writeback-cache is not very common on PCI/IDE-controllers, but more
> common on SCSI/IDE and FC/IDE external RAIDs. External RAIDs also
> has managability-advantages, but of course they are more expensive.
>=20
> > - At this time, we plan to use reiserfs. What are the advantages /
> > disadvantages of using the raid 1 for journaling for the (big) raid 5
> > (performance, recovery)? The system will be heavily used with
> > storebackup (www.sf.net/projects/storebackup) witch means that lots of
> > hard links have to be created as fast as possible.
>=20
> Tricky question.
>=20
> Without writeback-cache on your RAID5, lots of tiny syncronous writes
> is surely going to kill performance.
>=20
> The writes to the actual filesystem should be async, so they should be
> less of a problem. And there is nothing you can do about it anyway :-/
>=20
> My guess is that the writes to the journal _would_ be a problem, and
> that writing them to a seperate (RAID1)-device would help significantly.
>=20
> I would be curious to see a benchmark on this though.

