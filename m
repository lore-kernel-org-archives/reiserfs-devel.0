From: Christian <evilninja@gmx.net>
Subject: Re: vs-4080 & more corruptions
Date: Wed, 26 Jun 2002 14:03:16 +0200 (CEST)
Message-ID: <Pine.LNX.4.44.0206261354100.20586-100000@sheep.fluffy.housecafe.de>
References: <20020626090515.B5198@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10853-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020626090515.B5198@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

> > mark_block_used: (130815) used already
> > Aborted.
> > -------
> > --> Aborted !? so for now i can't mount the partition:
>
> So far we came to conclusion that this abort is a clear sign of bad memory or
> something damaging data that is coming out of your HDD.
> It is easily verifiable. Just run reiserfsck --rebuild-tree again
> if it progresses to next passes (means you are lucky and nothing
> was damaged this time) or fails with different blocknumber "being in use",
> you will know that you need to replace some of your hardware.
> (may be something as simple as replacing IDE cable).

yes, this time it was

"mark_block_usesd: (131069) used already"

but the run aborted again after this. but i don't think that it is bad
memory, because i raun this memory for 1 year now, and problems while
compiling things or running for days at high load or something like that.
always stable. but i will change the ide-cable and place the disk in a
different machine and i will tell you my progress.

> It is impossible to have bad hardware and high stability at the same time
> at this level of technology.

yes, of course, you are right. but i would prefer a failing network card
or a failing power supply again but a failing harddisk/fs is real a bad
thing. and i don't know why always the reiserfs disk are failing. my whole
rootfs is on ext2 (was too lazy to reformat), and no errors in there.
hm, i hope it's the ide-cable.

Thank you very much,
Christian.

-- 
c_kujau@web.de
evilninja@gmx.net

