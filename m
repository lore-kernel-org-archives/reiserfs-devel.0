From: Oleg Drokin <green@namesys.com>
Subject: Re: reiser4 and 2.5.60
Date: Tue, 18 Feb 2003 13:05:44 +0300
Message-ID: <20030218130544.A31947@namesys.com>
References: <20030215160033.A3570@humilis> <20030218121257.A27125@namesys.com> <20030218103151.B19634@humilis> <20030218124236.A31148@namesys.com> <20030218105247.D20771@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12806-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030218105247.D20771@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Feb 18, 2003 at 10:52:47AM +0100, Ookhoi wrote:
> > On Tue, Feb 18, 2003 at 10:31:51AM +0100, Ookhoi wrote:
> > > Sure. It is a P-MMX, 200MHz, with 512MB ram, and a 4GB scsi disk.
> > Hm. That must be real slow, is it? (just because not all of the RAM is
> > covered by L2 cache, I mean. Or do you have some sensible chipset in
> > there?).
> It is slow, but I am not aware of issues with too little L2 cache. A

Well, some common chipsets of that time could only cache limited amounts of RAM
(64Mb for TX or VX chipsets, 256Mb for some other chipsets I dont remember about).
Accesses to RAM regions that are not cached are awfully slow.
But these accesses are still faster than hitting HDD ;)
So the "slram" driver was developed that allowed to use
non-cached memory as a RAM-disk for swap usage.

> quick look at dmesg didn't give me more clue. Can you please explain a
> bit, or give some google keywords?

There is some sensible (from a quick look) article at
http://www.computerwriter.com/archives/1998/cw050798.htm

> It is only 200MHz, so I expect it to be slow, but if I can make it
> faster that would be nice (without removing the ram if possible ;-)

Well, try to remove the ram, first to make it to be only 256M then
64M and see if the system becomes faster at trivial non-memory hungry
stuff.
If this is indeed the case, consider changing motherboard/increasing L2
cache size (hard to do nowadays, when you cannot buy even P3 equipment
easily ;) ).
Nothing else comes to mind.

> > <joke>Because it is already perfect, nothing to improve</joke> ;)
> Goody :-)  Well, let me know if you want me to test something. I'll let
> you know what happens with reiser4 on a partition.

Thank you.

Bye,
    Oleg
