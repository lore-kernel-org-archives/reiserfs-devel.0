From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Filesystem Tests
Date: Sat, 9 Aug 2003 11:18:03 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0308091028150.19108-100000@divine.city.tvnet.hu>
References: <20030809093337.GA28566@mail.jlokier.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15260-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030809093337.GA28566@mail.jlokier.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Andrew Morton <akpm@osdl.org>, Grant Miner <mine0057@mrs.umn.edu>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com


On Sat, 9 Aug 2003, Jamie Lokier wrote:
> reiser4 is using approximately twice the CPU percentage, but completes
> in approximately half the time, therefore it uses about the same
> amount of CPU time at the others.
>
> Therefore on a loaded system, with a load carefully chosen to make the
> test CPU bound rather than I/O bound, one could expect reiser4 to
> complete in approximately the same time as the others, _not_ slowest.

Depends how you define approximation, margins. I dropped them and
calculated reiser4 needs the most CPU time. Hans wrote it's worked on.

However guessing performance on a whatever carefully chosen loaded system
from results on an unloaded system is exactly that, guess, not fact.

> That's why it's misleading to draw conclusions from the CPU percentage alone.

I've never wrote I made my guesses from the CPU percentage alone, you
explained correctly why. I encourage you too to calculate yourself how
much more CPU time reiser4 needs.

	Szaka

