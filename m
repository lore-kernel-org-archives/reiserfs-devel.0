From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Sun, 13 Jul 2003 17:00:12 +0400
Message-ID: <20030713130012.GC6061@namesys.com>
References: <Pine.LNX.4.30.0307120213080.30730-100000@divine.city.tvnet.hu> <200307121605.27404.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14920-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307121605.27404.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Szakacsits Szabolcs <szaka@sienet.hu>, Chris Mason <mason@suse.com>, Marc-Christian Petersen <m.c.p@gmx.net>, reiserfs-list@namesys.com, Philippe Gramoull? <philippe.gramoulle@mmania.com>

Hello!

On Sat, Jul 12, 2003 at 04:05:27PM +0200, Dieter N?tzel wrote:
> > Footnotes:
> > (*) So disk shouldn't matter because the other filesystems use only 4kB to
> >     store this 200GB sparse file. ReiserFS wastes 201MB!
> No. Exactly 8192 bytes (8 KibiBytes)

No, he is right.
Space usage is ~ holesize>>10 (for 4k blocksize)
Empty tree pointers take this space.

Bye,
    Oleg
