From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 17:16:56 +0200
Message-ID: <200307111716.56823.Dieter.Nuetzel@hamburg.de>
References: <20030710052931.GA17957@namesys.com> <200307111635.27904.Dieter.Nuetzel@hamburg.de> <20030711144943.GE17180@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030711144943.GE17180@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Am Freitag, 11. Juli 2003 16:49 schrieb Oleg Drokin:
> Hello!
>
> On Fri, Jul 11, 2003 at 04:35:27PM +0200, Dieter N?tzel wrote:
> > daul Athlon MP 1900+
> > U160
> > Argh! ---I can't kill it!
> > No CNTL-C or '"killall -9 dd" or under "top".
> > Even as root;-(
>
> Yup. It spins in kernel mode not listening to signals busy doing balancing
> for lots of zeroes, one at a time.
>
> > 2.4.21-jam1 (aa1) plus all data-logging
> > SOURCE/dri-trunk> time dd if=/dev/zero of=sparse bs=1 seek=200G count=1
> > 0.000u 362.760s 8:26.34 71.6%   0+0k 0+0io 124pf+0w
> > It was runinng with a paralell C++ (-j20) compilation.
> > Is the mentioned patch needed?
>
> Yes, patch is needed for any system that does not contain it.

2.4.21-jam1 (2.4.21aa1):

SunWave1 src/linux# patch -p1 -E -N 
<../patches/2.4.21-data-logging/ftruncate.patch
patching file fs/reiserfs/do_balan.c
Hunk #1 FAILED at 304.
Hunk #2 FAILED at 326.
Hunk #3 FAILED at 435.
Hunk #4 FAILED at 525.
Hunk #5 FAILED at 553.
Hunk #6 FAILED at 566.
Hunk #7 FAILED at 574.
Hunk #8 FAILED at 691.
Hunk #9 FAILED at 725.
Hunk #10 FAILED at 769.
Hunk #11 FAILED at 846.
Hunk #12 succeeded at 847 with fuzz 2 (offset -8 lines).
Hunk #13 FAILED at 857.
Hunk #14 FAILED at 984.
Hunk #15 FAILED at 1037.
Hunk #16 FAILED at 1133.
15 out of 16 hunks FAILED -- saving rejects to file fs/reiserfs/do_balan.c.rej
patching file fs/reiserfs/inode.c
Hunk #1 FAILED at 798.
Hunk #2 FAILED at 811.
2 out of 2 hunks FAILED -- saving rejects to file fs/reiserfs/inode.c.rej
patching file fs/reiserfs/tail_conversion.c
Hunk #1 FAILED at 30.
Hunk #2 succeeded at 59 with fuzz 1.
1 out of 2 hunks FAILED -- saving rejects to file 
fs/reiserfs/tail_conversion.c.rej
patching file include/linux/reiserfs_fs.h
Hunk #1 succeeded at 1289 (offset 131 lines).

OK some "hand work"...

Maybe it _IS_ time for this _AND_ all the other data-logging patches?
2.4.22-pre5?

Thanks,
	Dieter

