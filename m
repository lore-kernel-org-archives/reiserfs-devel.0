From: Sander <sander@humilis.net>
Subject: errors with very large reiserfs partition (was: Re: Software Raid0 problem (Update))
Date: Wed, 17 Mar 2004 22:30:06 +0100
Message-ID: <20040317213006.GB5080@favonius>
References: <87ish46lq3.fsf@freeze.oslo.dnmi.no> <001701c40c27$1e4c6f00$4a64000a@aztechsolutions.com> <20040317201821.GB1869726@ilia.ncsa.uiuc.edu>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17287-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040317201821.GB1869726@ilia.ncsa.uiuc.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart Levy <slevy@ncsa.uiuc.edu>
Cc: reiserfs-list@namesys.com

Hi Stuart,

I hope you don't mind that I inform the reiserfs team about your tests
and the resulting error for reiserfs by cc'ing them.


Stuart Levy wrote (ao):
> On Wed, Mar 17, 2004 at 07:52:41AM -0600, Max Kipness wrote:
> > > 
> > >     >> Anybody know what might be wrong with adding the 3rd drive? Is
> > >     >> there a limit on TB in 2.6?
> > > 
> > >     Joshua> According to <http://www.kniggit.net/wwol26.html>, you
> > >     Joshua> should be able to do 16TB on x86.  I wonder if there isn't
> > >     Joshua> some limit in the md layer that you're hitting, or maybe
> > >     Joshua> something in userland in FC1 that's limiting you.  You may
> > >     Joshua> want to ask in linux-raid, fedora-list, or even
> > >     Joshua> linux-kernel.
> > > 
> > > I'd suggest mailing the LVM and/or EVMS mailing lists. 
> > > Certainly, EVMS, which I've been running at home for a while, 
> > > has been very impressive.
> > 
> > Hmmm...I might give EVMS a try. I have received no other information
> > anywhere on what the problem might be. I'm pretty sure that Windows 2003
> > Storage Server can do this but you only NAS OEMs are able to get a hold
> > of it.
> 
> I've been doing some experiments.  Don't have a 5TB disk array lying around,
> but it was easy to make a 5TB holey UNIX file and run mke2fs and mkfs.xfs on it,
> on a 2.4.25-pre6 kernel with RH8 tools and XFS patches.
> 
> Result: I'll bet the logical-volume stuff is working perfectly and giving you
> a 5TB partition; it's the filesystem tools that are limiting what you get.
> 
> RH8's mke2fs seems to wrap the partition size modulo 4TB.  
> If I tell it the number of 4K blocks explicitly (e.g. 1310720000
> for my 5368709120000-byte file) it warns that I'm giving it a size
> larger than the amount of space actually available.
> 
> mkfs.xfs (from xfsprogs-2.3.5-1), on the other hand, happily does create
> a 5TB filesystem, and correctly detects its size -- it does use
> 1310720000 4K blocks.  However, I can't 'mount -o loop' the
> resulting filesystem; the kernel reports:
>    XFS: File system is too large to be mounted on this system.
> 
> This turns out to come from a test in fs/xfs/xfs_mount.c:
> 
> #if !XFS_BIG_BLKNOS
>         if (unlikely(
>             (sbp->sb_dblocks << (__uint64_t)(sbp->sb_blocklog - BBSHIFT))
>                 > UINT_MAX ||
>             (sbp->sb_rblocks << (__uint64_t)(sbp->sb_blocklog - BBSHIFT))
>                 > UINT_MAX)) {
>                 cmn_err(CE_WARN,
>         "XFS: File system is too large to be mounted on this system.");
>                 return XFS_ERROR(E2BIG);
>         }
> #endif
> 
> And, XFS_BIG_BLKNOS is indeed false; fs/xfs/linux/xfs_linux.h #define's it to 0,
> with the comment
>      * Some types are conditional depending on the target system.
>      * XFS_BIG_BLKNOS needs block layer disk addresses to be 64 bits.
> 
> 
> mkreiserfs was willing to create a large filesystem too,
> but got errors when I tried to mount and use it.  For example:
>     07:00: rw=0, want=2146566148, limit=947912704
>     attempt to access beyond end of device
> 
> 
> > We tried Fedora Core 2 Beta and had the same results of 800Gb total
> > instead of 5TB. I can't believe linux has this barrier.
> 
> Doesn't Fedora Core 2 have a 2.6 kernel?
> 
> If so, try mkfs.xfs rather than mke2fs (which is probably what you get
> when you just "mkfs" by default).  I don't have a 2.6 system to try this on,
> but ISTR they have enlarged the size of disk block addresses.
> Clearly the XFS user-level tools already deal with big filesystems,
> probably correctly; if the kernel code does too, you might be in good shape.
> 
> Happy pioneering,
> 
>    Stuart

-- 
Humilis IT Services and Solutions
http://www.humilis.net
