From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: r4 v. ext3, quick speed vs. cpu experiments
Date: Tue, 5 Aug 2003 23:08:31 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0308052251530.6739-100000@divine.city.tvnet.hu>
References: <3F302A54.2050204@mrs.umn.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15162-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F302A54.2050204@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com


How much memory you have? How big is mozilla-1.5a.tar? Did you include
'sync' in the tests? It seems reiser4 numbers are mostly in-memory
operations and not all data flushed to disk while this is apparently not
true for ext3. BTW, XFS numbers would be also/more interesting, ext[23] is
pretty outdated.

BTW, from your numbers it seems ext3 gives better overall performance.

	Szaka

On Tue, 5 Aug 2003, Grant Miner wrote:

> "mozilla-1.5a.tar" is mozilla 1.5alpha source tar, uncompressed.
> Partition mkfs.ext3 or mkfs.reiser4 --keys=SHORT is run before each run.
> Linux is 2.6.0-test2.
>
> untar mozilla-1.5a.tar (file is on a reiser3 partition):
> ext3: 17.64s 28% cpu
> reiser4: 10.79s 67% cpu
> sum: reiser4 0.61x time, 2.39x cpu
>
> cp -a mozilla-src mozilla-src-copy, same partition:
> ext3: 0:56.35sec 11% cpu
> reiser4: 0:16.50 55% cpu
> sum: reiser4 0.29x time, 5x cpu
>
> tar c mozilla-src > mozilla.tar, same partition:
> ext3: 0:36.47sec 10%cpu
> reiser4: 0:16.90sec 25%cpu
> sum: reiser4 0.46x time, 2.5x cpu
>
> i'm impressed!

