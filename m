From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: r4 v. ext3, quick speed vs. cpu experiments
Date: Wed, 06 Aug 2003 22:30:55 +0200
Message-ID: <m3u18usf40.fsf@merlin.emma.line.org>
References: <Pine.LNX.4.30.0308052329440.6739-100000@divine.city.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15203-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.30.0308052329440.6739-100000@divine.city.tvnet.hu> (Szakacsits
 Szabolcs's message of "Tue, 5 Aug 2003 23:35:12 +0200 (MEST)")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Szakacsits Szabolcs <szaka@sienet.hu>
Cc: Brandon Low <lostlogic@gentoo.org>, Grant Miner <mine0057@mrs.umn.edu>, reiserfs-list@namesys.com

Szakacsits Szabolcs <szaka@sienet.hu> writes:

> Yes, if you have enough CPU capacity (aka you don't run anything else, just
> bechmarking filesystems). Otherwise it seems to be slower. That's I was
> refering to.

This has been the situation with reiserfs 3.5/3.6 before, and it got
resolved, or so it appears. I haven't ext3-vs-reiserfs3.6 figures at
hand, but I'm not aware of CPU bottlenecks in reiserfs3.6 code. Just
wait a couple of months until the reiserfs gurus got their reiserfs4
beast stable and debugged and can focus on tuning.

To a previous post about code size and execution speed: it's not
generally true that larger code is also slower. It depends how that code
is arranged. If you have many abstractions, then maybe it's slower. If
you have many specialized functions in an otherwise flat profile, it can
be a good deal faster than a simpler (less complex) code.

-- 
Matthias Andree
