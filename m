From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: i/o error (lost+found) with reiser4
Date: Mon, 23 Feb 2004 17:59:45 +0100
Message-ID: <200402231758.33089.henning-04@die.informatik.uni-siegen.de>
References: <200402222338.23623.henning-04@die.informatik.uni-siegen.de> <20040223170017.GC1712@backtop.namesys.com> <20040223172330.GD1712@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16898-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040223172330.GD1712@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alex Zarochentsev <zam@namesys.com>

On Monday 23 February 2004 18:23, Alex Zarochentsev wrote:
> > If there was no fs activity (file creation/deletion) after "build-sb",
> > you can erase blocks ##19, 20 on the fs:
> >
> > backup:
> > dd if=/dev/hdd8 skip=19 bs=4096 count=2 of=hdd8.19-20x4k.dat
> >
> > erase:
> > dd if=/dev/zero of=/dev/hdd8 seek=19 bs=4096 count=2 conv=notrunc
>
> Those blocks are journal header and footer, they may contain nr_files, last
> used object id and free_blocks counters which are different from the super
> block values.  It is due to a journalling optimization.  The fsck
> --build-fs should have invalidated the duplicated info in the journal
> footer but it hasn't.
>
> So, the command above invalidates the data by erasing all journal control
> blocks content, and completes the fsck --build-fs run.

There was much activity on the fs after the "build-fs", but this procedure
seems to fix my problem! Thank you very much.

Henning
