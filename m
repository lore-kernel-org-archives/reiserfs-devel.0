From: grobe@gmx.net
Subject: Re: corrupted fs: bitmap does not match to the correct one....
Date: Wed, 15 May 2002 17:56:49 +0200 (MEST)
Message-ID: <10725.1021478209@www24.gmx.net>
References: <20020515180609.A2073@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10312-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Hi!

> > May 15 12:54:01 Zeus kernel:  I/O error: dev 08:11, sector 211045693
> > [... a lot of these ...]
> 
> Ah, failing hardware.

That's funny. As I mentioned, we use a Serveraid 4m Raid Controller. So, if
a disk fails, the controller switches it off, sends me a warning messages and
downgrades from RAID5 to RAID0. But the controller tells me that there are
no errors. It seams to be something in the driver-kernel-lvm-chain.

> > > What version of reiserfsprogs was used?
> > 3.x.0j

I just installed 3.1b, with reiserfsck being about 8times faster. I also
upgraded lvm to 1.0.4, as I had an old pre-1-version installed (it was running
w/o problems so far, so I didn't change this before).

> Hm. So you read corrupted on-disk infortmation with reiserfsck, then wrote
> it back. That'd going to hurt for sure.

> I'd say you'd better stay using your backups (on a different hard
> drive(s)).

> Also you probably want to ask whoever sold you the failing harddrive to
> replace it.

As I wrote, the "harddrive" is a logical volume on a raid 5 array, attached
to a serveraid 4 m - so I would have to bring an entire server if I want to
replace the failing hardware ;-)

The new reiserfsck --rebuild-tree gives me

pass 0: reading block (xxxx) failed

Is this REALLY only possible with bad hardware, or also with lvm-problems,
raid-driver problems etc...?

Thanks and CU, Lars.

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net

