From: Russell Coker <russell@coker.com.au>
Subject: Re: ReiserFS is not suitable for a root FS.
Date: Sat, 17 May 2003 21:25:59 +1000
Message-ID: <200305172125.59713.russell@coker.com.au>
References: <200305172030.58775.russell@coker.com.au> <3EC61987.5000402@gmx.net>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14139-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EC61987.5000402@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: ReiserFS <reiserfs-list@namesys.com>

On Sat, 17 May 2003 21:14, Carl-Daniel Hailfinger wrote:
> Russell Coker wrote:
> > With a ReiserFS file system you can't FSCK a file system that is mounted
> > read-only.  This means that when a root file system needs to be FSCK'd
> > you need to boot from installation media (or convert the swap space into
> > a temporary root file system).
>
> I take this as a feature request. Right? It would certainly be nice to
> have.

Yes.

> > It seems that the kernel drivers in 2.4.20 have some bugs whereby a
> > corrupted file system can cause an immediate reboot, a system lock
> > (caps-lock doesn't change the keyboard led), or a kernel Oops.  Ext2/3
> > does not appear to have such problems.
>
> Could you please provide a metadata dump of the affected filesystem? The
> behaviour you describe is not supposed to happen. Do you have a decoded
> Oops for us to see what happened?

Unfortunately not.  It seems to happen to machines that have important 
production uses and which have little spare disk space.

> You surely mean ext3? Ext2 would not be a fair comparison because it has
> no journaling. And if you're hunting for size, try jffs or jffs2.

True, I meant ext3.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

