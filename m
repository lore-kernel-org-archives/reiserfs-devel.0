From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: r4 v. ext3, quick speed vs. cpu experiments
Date: Tue, 5 Aug 2003 23:35:12 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0308052329440.6739-100000@divine.city.tvnet.hu>
References: <20030805224909.GA26180@lostlogicx.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030805224909.GA26180@lostlogicx.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brandon Low <lostlogic@gentoo.org>
Cc: Grant Miner <mine0057@mrs.umn.edu>, reiserfs-list@namesys.com


On Tue, 5 Aug 2003, Brandon Low wrote:
> On Tue, 08/05/03 at 23:08:31 +0200, Szakacsits Szabolcs wrote:
> > BTW, from your numbers it seems ext3 gives better overall performance.
> >
> That is an incorrect statement.  Reiserfs is KNOWN to be heavier on CPU
> than other filesystems, it's benefit is not there, it's benefit is in
> speed of operation, and efficiency of disk accesses.  It would be near
> impossible for a filesystem with 4x (unsure of this figure) the code of
> ext3 to execute in the same CPU time, but the fact that it is
> consistently a LOT faster on the total run time is very impressive.

Yes, if you have enough CPU capacity (aka you don't run anything else, just
bechmarking filesystems). Otherwise it seems to be slower. That's I was
refering to.

	Szaka

