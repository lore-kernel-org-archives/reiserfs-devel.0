From: Marc-Christian Petersen <m.c.p@kernel.linux-systeme.com>
Subject: Re: [PATCH] reiserfs v3 fixes and features
Date: Fri, 16 Apr 2004 22:06:50 +0200
Message-ID: <200404162206.50654@WOLK>
References: <1081274618.30828.30.camel@watt.suse.com> <1082141666.27614.1448.camel@watt.suse.com> <200404162147.16846@WOLK>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18008-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404162147.16846@WOLK>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org, Chris Mason <mason@suse.com>

On Friday 16 April 2004 21:47, Marc-Christian Petersen wrote:

Hi again,

> > ftp.suse.com/pub/people/mason/patches/reiserfs/2.6.5-mm6
> > Only reiserfs-group-alloc-9 has changed.

> hmm, does not apply to 2.6.5-mm6 (applied all from series.mm) before for
> sure.

Somewhen in the near future I'll forget my name ;(

This time with patch output:

root@codeman:[/usr/src/linux-2.6.5-mm6] # patch -p1 --dry-run < 
reiserfs-group-alloc-9.patch 
patching file fs/reiserfs/bitmap.c
Hunk #6 succeeded at 358 with fuzz 1.
Hunk #17 FAILED at 943.
1 out of 17 hunks FAILED -- saving rejects to file fs/reiserfs/bitmap.c.rej
patching file fs/reiserfs/file.c
Hunk #1 FAILED at 176.
Hunk #2 succeeded at 467 (offset -1 lines).
Hunk #3 succeeded at 1253 (offset -1 lines).
1 out of 3 hunks FAILED -- saving rejects to file fs/reiserfs/file.c.rej
patching file fs/reiserfs/inode.c
Hunk #1 succeeded at 1660 (offset 1 line).
Hunk #2 succeeded at 1729 (offset 1 line).
patching file fs/reiserfs/super.c
Hunk #2 succeeded at 650 (offset -4 lines).
Hunk #3 succeeded at 1345 (offset -21 lines).
patching file include/linux/reiserfs_fs.h
Hunk #2 succeeded at 2149 (offset 9 lines).

Freshly patched 2.6.5 vanilla with 2.6.5-mm6.

ciao, Marc
