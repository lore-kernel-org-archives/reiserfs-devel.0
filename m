From: Ookhoi <ookhoi@humilis.net>
Subject: Re: core dump on reiserfsck --rebuildtree
Date: Wed, 24 Sep 2003 01:04:10 +0200
Message-ID: <20030923230410.GB15072@favonius>
References: <65047.80.5.156.133.1064000151.squirrel@blanark.dyndns.org> <200309221102.08476.alistair@inrevo.com> <200309221438.41949.vitaly@namesys.com> <200309232310.37438.alistair@inrevo.com>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200309232310.37438.alistair@inrevo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alistair McDonald <alistair@inrevo.com>
Cc: reiserfs-list@namesys.com

Alistair McDonald wrote (ao):
> So, I suspect that if I'd had DMA turned on when my machine booted
> after the power outage, I'd have never had any problems, and never had
> to run reiserfsck, let alone with rebuild-tree. That's fustrating, and
> I now set dma on in the startup scripts.

But now you discovered the bad blocks, which you might have not if you
didn't stumble over it.

> Anyway, my hard drive is bad. I bet no-one will be suprised if I tell
> you it's an IBM Deskstar. 

:-)

> It is under warrany, but to replace I have to send it away and THEN
> receive a replacement. So I lose my data, which I'd really like to
> preserve, well, as much as I can. 

Besides, you'll get a replacement deskstar, and not sleep any better
right?

> Moving on to replacements, of all the 120Gb drives on the market, the
> IBM is the biggest. So any replacement drives (I will not buy another
> 2 deskstars) will be smaller, by about 3%. (120 gigs seems the best
> bang for the buck; I could buy a 160 and allocate the first 241254720
> sectors I suppose.) 

FWIW, I'm very happy with two 200GB maxtor disks.

> I would like to stick to using lvm, so if I create a new logical
> volume, will copying the current /dev/lvm1/data to a new logical
> volume with dd work? The copy will fail at the damaged area of the
> disk, and hang, I suspect, but am I right in saying that the first 97%
> would be copied (in theory; in practice it will stop at the bad
> sector(s)) and I could then run rebuild-tree on this copy and get some
> data back? 

I have no experience with lvm, but do have with bad disks. You'll want
to use dd_rescue instead of dd:
http://www.garloff.de/kurt/linux/ddrescue

Good luck.
