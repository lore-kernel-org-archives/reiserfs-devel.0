From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fsck.reiser4 segfaults
Date: Thu, 15 Jul 2004 16:21:44 +0400
Message-ID: <200407151621.44263.vitaly@namesys.com>
References: <200407151559.41256.kos@supportwizard.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19628-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407151559.41256.kos@supportwizard.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Konstantin Sobolev <kos@supportwizard.com>, reiserfs-list@namesys.com

Hello,

On Thursday 15 July 2004 15:59, Konstantin Sobolev wrote:
> Hi all,
>
> I have 2 computers running reiser4 partitions. Once I decided to check them
> for errors, and on both machines fsck reported that SB is corrupted. I
> suppose that's because partitions were formatted by older versions of
> reiser4progs. --build-sb worked OK. Then fsck reported about some
> corruptions that were successfully repaired with --build-fs on the first
> machine. However, on the second one fsck segfaults on attempt to do a
> repair.
>
> The output is:
> [skip]
> ***** Semantic Traverse Pass: reiser4 semantic tree checking.
> FSCK: Node (1260442), item (0), [29:0:2a] (stat40): needs pset member (3)
> set to (smart). Added.
> FSCK: Node (1260442), item (0), [29:0:2a] (stat40): needs pset member (4)
> set to (r5_hash). Added.
> FSCK: Node (1260442), item (0), [29:0:2a] (stat40): needs pset member (5)
> set to (dot_o_fibre). Added.
> FSCK: Node (1260442), item (0), [29:0:2a] (stat40): needs pset member (6)
> set to (stat40). Added.
> FSCK: Node (1260442), item (0), [29:0:2a] (stat40): needs pset member (7)
> set to (cde40). Added.
> Segmentation fault
>
> fsck version is fsck.reiser4 0.5.5, kernel is 2.6.4 with latest stable
> reiser4 snapshot

would you try the latest reiser4progs from 
www.namesys.com/snapshots/2004.07.13-internal.testing/

> I've packed fs metadata with debugfs.reiser4 -P /dev/hda6 | bzip2 -c >
> hda6debug.bz2, it can be downloaded from
> http://www.prokhorov.org/hda6debug.bz2 , 38Mb

if the new fsck fails we will debug it with your metadata.

> Partition still can be mounted but I don't know if it is risky to work with
> it, I don't want to loose it completely.

-- 
Thanks,
Vitaly Fertman

