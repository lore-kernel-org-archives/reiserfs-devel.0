From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Thu, 14 Aug 2003 14:58:28 +0100
Message-ID: <1060869508.4803.35.camel@passion.cambridge.redhat.com>
References: <Pine.LNX.3.96.1030813160910.12417A-100000@gatekeeper.tmr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15308-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.3.96.1030813160910.12417A-100000@gatekeeper.tmr.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Bill Davidsen <davidsen@tmr.com>
Cc: Yury Umanets <umka@namesys.com>, Daniel Egger <degger@fhm.edu>, Hans Reiser <reiser@namesys.com>, Nikita Danilov <Nikita@namesys.com>, Linux Kernel Mailinglist <linux-kernel@vger.kernel.org>, reiserfs mailing list <reiserfs-list@namesys.com>

On Wed, 2003-08-13 at 21:12, Bill Davidsen wrote:
> The driver should do the logical to physical mapping, but the portability
> vanishes if the filesystem to physical mapping is not the same for all
> machines and operating systems. For pluggable devices this is important.

The portability also vanishes if the file system layout is not the same
for all machines and operating systems... what's your point?

Just like there are standard file systems, there are also standard
'translation layers' -- pseudofilesystems which are used to emulate a
hard drive on flash storage -- and some of these are implemented for
Linux.

Take a PCMCIA flash card (real flash, not CF) with FTL and FAT on it,
and it'll work just fine under both Windows and Linux, because they both
use the standard FTL and FAT formats.

FTL provides the logical<->physical mapping and the wear levelling, FAT
is just normal FAT.=20

> The leveling seems to be done by JFFs2 in a portable way, and that's as i=
t
> should be.=20

You seem to be very confused here. JFFS2 works on flash directly;
nothing's pretending to be a block device. It doesn't seem to be at all
relevant to this discussion.

JFFS2 does its own wear levelling and flash management, because it works
directly on the flash.=20

FAT can't do that -- it needs some other code (like the FTL code) to
emulate a normal hard drive for it, providing wear levelling and
logical<->physical translation for it.=20

See http://www.infradead.org/~dwmw2/mtd-upper-layers.jpeg

Wear levelling is not done in the driver -- the driver just drives the
flash, and in fact is below the bottom of the diagram since it's largely
irrelevant. It just gives you read/write/erase functions for the raw
flash.

Wear levelling is done either in the file system which works directly on
the flash (JFFS2, YAFFS), or in the 'translation layer' which uses the
flash to pretend to be a block device (FTL, NFTL, INFTL, SMTL). (In the
case of the extremely na=C3=AFve 'mtdblock' translation layer, no translati=
on
and no wear levelling is done at all.)

> If the leveling were in the driver I don't believe even FAT
> would work.

I think that by 'driver' you actually mean the 'translation layer' or
the combination of translation layer and underlying hardware driver, in
which case you would be incorrect to say that it wouldn't work. That
_is_ how it works, portably.


--=20
dwmw2

