From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: Horrible ftruncate performance
Date: Thu, 10 Jul 2003 09:30:46 +0200 (MEST)
Message-ID: <Pine.LNX.4.30.0307100851120.26018-100000@divine.city.tvnet.hu>
References: <20030710052931.GA17957@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14860-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030710052931.GA17957@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


On Thu, 10 Jul 2003, Oleg Drokin wrote:
> On Thu, Jul 10, 2003 at 05:23:39AM +0200, Szakacsits Szabolcs wrote:
>
> > I've noticed very long "hangs" using reiserfs and they were always at
> > ftruncate(2). I made a comparision between different filesystems. SuSE 8.2
>
> Yes, this is known "feature".

OK, I've searched all relevant archives, namesys web pages and found
nothing relevant.

> > (same bad performance on older SuSE versions as well), same partitition,
> > default mkfs.*. Let's create a 200GB sparse file:
> > 	dd if=/dev/zero of=sparse bs=1 seek=200G count=1
> > Results:
> > 	ext3	    0.00 sec
> > 	XFS         0.00 sec
> > 	JFS         0.00 sec
> > 	reiserfs  874.27 sec (all spent in the kernel)
>
> See the patch below.
> It is merged into 2.4.22-pre3

Excellent, I can see
http://www.kernel.org/pub/linux/kernel/v2.4/testing/patch-2.4.22.log
Oleg Drokin <green@angband.namesys.com>:
	reiserfs: speed up large file holes creation

> Speeds up large holes creation in ~ 1000 times

How long does it take for you the above dd command _and_ how fast is your
CPU?

> (on 4k blocksize)

AFAIK, reiserfs supports only 4 kB blocksizes. At least the
'man mkreiserfs' said always so.

> > Is there a faster way to create big sparse files on reiserfs?
>
> Use the patch. (should apply to 2.4.18,2.4.19,2.4.20,2.4.21)
> (I am unsure if you can apply it to the kernel from SuSE 8.2, though).

Thanks but it's only indirectly my problem (I use XFS, there are other
problems with reiserfs for my needs): before further work on ntfsresize,
NTFS I wrote a util, ntfsclone. It efficiently saves all data or only
metadata to a device, stdout or sparse file, so the clone is an exact copy
and always mountable. Good for backup, debug, development and the extremely
well compressable metadata-only clone can be transfered through the net
(e.g. a 200GB NTFS with only a few GB data ends up between a few hundred kB
or max a couple of MB).

The problem is when one uses it on reiserfs. For the users it "hangs". E.g.
in the above case creating a metadata only clone takes 2-3 sec for all the
other filesystems and 15 minutes for reiserfs.

So apparently my only chance is to document the issue and detect if the fs
is reiserfs and warn the user it will take a very long time (unless kernel
is at least 2.4.22 and your speed up works).

Thanks again,

	Szaka

