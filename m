From: Mirar <mirar-yg@mirar.org>
Subject: Re: power loss -> corruption
Date: 15 May 2003 17:17:49 +0200
Sender: mirar@orchid.mirar.org
Message-ID: <m1n0ho5jdu.fsf@orchid.mirar.org>
References: <m1k7d11yaz.fsf@orchid.mirar.org>
	<200305081531.13964.Dieter.Nuetzel@hamburg.de>
	<m1r87061sv.fsf@orchid.mirar.org>
	<200305151323.36129.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14119-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305151323.36129.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

> In short, DON'T DO THAT without "suspend kernel patches". *nix is
> NOT designed for "disk power management" in the first place. But it
> evolves...;-)

Never had a trouble with it before. :)

I have them regularly spin down using hdparm -S, and never had a
problem before... This time I was tracking down a noise, which turned
out to be air in the waterpump.

> HPT ("small" IDE/ATA "RAID") controllers are not that good
> (supported) as they seems. Apart that they are "cheap".

Nope. It's always been a headache. Never behaved *this* bad though.
I only have my spare data disks (80+120Gb) on it though.

> > Not in the same way as previously (just a block), though. It was
> > completely filled with binary data.
> 
> Sounds like another problem (hardware, see above).

Not the same controller. The root/home disk is on the main IDE controller 
(whatever's on VIA KT266). So it seems like a sync issue of some sort.

/Mirar
